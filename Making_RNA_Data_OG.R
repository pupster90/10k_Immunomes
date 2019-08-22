# Scratch Paper

####################################
###       Set Up File            ###
####################################

### Scratch Paper: ensambl -> count
# USEFUL LINK:
# https://support.bioconductor.org/p/105430/

library(BiocManager)
#BiocManager::install("DESeq2")
library( DESeq2 )
#org.Hs.eg.db
#BiocManager::install("org.Hs.eg.db")
#BiocManager::install("AnnotationDbi")
library( org.Hs.eg.db )



####################################
###       Create Map            ###
####################################


# Load counts data
counts = read.table( "/Users/elliott/Desktop/SD1412/ResultFiles/RNA_sequencing_result/RNA_P09_D0.725156.count", sep = "\t", stringsAsFactors=FALSE )
counts$V2 =  NULL 
names(counts) = c("ensembl")
# Creates map
hgnc_map = select(org.Hs.eg.db, counts$ensembl , c("SYMBOL"),"ENSEMBL")

# Get HGNC names for 1 dataset
hgnc_names = c()
for( i in 1:length(counts$ensembl) ){
  hgnc_match = which( hgnc_map$ENSEMBL == counts$ensembl[i] )[1]
  hgnc_names = c( hgnc_names,  hgnc_map$SYMBOL[hgnc_match] )
}
counts$hgnc = hgnc_names



####################################
### Read All Data as Table  ###
####################################

# Get list of files
files = list.files("/Users/elliott/Desktop/SD1412/ResultFiles/RNA_sequencing_result", pattern="*.count")
for( a_file in files ){
  # get data
  file_path = paste("/Users/elliott/Desktop/SD1412/ResultFiles/RNA_sequencing_result/",a_file,sep="")
  mini_counts = read.table( file_path, sep = "\t", stringsAsFactors=FALSE )
  names(mini_counts) = c("ensembl","counts")
  
  # check that data is in correct format
  if( length(mini_counts$ensembl)!=length(counts$ensembl) || !all(mini_counts$ensembl==counts$ensembl) ){
    print("something bad happend")
    break
  }
  
  # add data to counts
  col_name =  substr( a_file, start=5, stop=10 )
  counts[col_name] = mini_counts$counts
}



####################################
###         Clean Data           ###
####################################


# remove genes with super low expression
row_sums =  rowSums(counts[3:length(counts)])
counts2= counts[which(row_sums>30),]
# remove genes with no hgnc name
counts3= counts2[ which( !is.na(counts2$hgnc) ),  ] 




#######################################
###         Export to CSV          ###
#####################################

# Export file 
write.csv(counts3, file = "/Users/elliott/Desktop/Infants_RNA.csv",row.names=FALSE)

# check that it exported correctly
counts = read.table( "/Users/elliott/Desktop/Infants_RNA.csv",  stringsAsFactors=FALSE, header=TRUE,sep="," )
head(counts)
dim(counts)


#######################################
###          Make Graph            ###
#####################################
which(counts3$hgnc=="CD4")
# Get a row
counts3 = read.table( "/Users/elliott/Desktop/Infants_RNA.csv",  stringsAsFactors=FALSE, header=TRUE,sep="," )
num = 216

dim(counts3)

gene_name = counts3[216,2]
a_row = counts3[216,3:dim(counts3)[2]]

# Put data in data frame
cols = list()
to_graph= data.frame( counts = as.numeric(a_row) )

# groups data by age 
groups = c()
for( i in names(a_row) ){
  groups= c( groups, substr(i, start=nchar(i)-1, stop=nchar(i) )) 
}
to_graph$groups = as.factor( groups )

# create X variable for scatter
`%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
to_graph$X = rnorm( length(a_row) , mean = 0, sd = .15 )
to_graph$X[ grep("*D0", names(a_row))  ] %+=% 0
to_graph$X[ grep("*D1", names(a_row))  ] %+=% 1
to_graph$X[ grep("*D3", names(a_row))  ] %+=% 3
to_graph$X[ grep("*D7", names(a_row))  ] %+=% 7


# Plot it
library(ggplot2)
library(plotly)
library(ggthemes)
graph_og = ggplot( to_graph, aes(x=X, y=counts, color=groups) ) + 
  geom_point() +
  labs(x='Days Alive', y="Gene Expression (counts)", title=paste(gene_name," Expression in Infants"), fill = NULL, colour = NULL ) +
  theme_gdocs()
  )
          #axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)) ) +#,
          
          #panel.background = element_rect(fill = "white", colour = "gray"),
          #panel.grid.major = element_line(size = 0.2, linetype = 'solid',colour = "gray"),#+
   
  #ggtitle("Plot of length by dose") #+ 
  #theme(plot.title = element_text( size=16, face="bold.italic")) #+
graph_og
graph =  ggplotly(graph_og)
graph





