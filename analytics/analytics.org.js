
// Initial Tracking Code
(function(i,s,o,g,r,a,m){
  i['GoogleAnalyticsObject']=r;
  i[r]=i[r] || 
    function(){
      (i[r].q=i[r].q||[]).push(arguments);
    },i[r].l=1*new Date();
    a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];
    a.async=1;
    a.src=g;
    m.parentNode.insertBefore(a,m);
})(window,document,'script',
   'https://www.google-analytics.com/analytics.js','ga');

// Set ID
ga('create', 'UA-105335783-2', 'auto');
ga('send', 'pageview');


$(document).ready(function() {
    
    // Tracking Button Categories
    $('#transcriptomicsBtn').on('click', function() {
        ga('send', 'event', 'geneBtn', 'geneBtn');
    });
    $('#proteomicsBtn').on('click', function() {
        ga('send', 'event', 'rnaBtn', 'rnaBtn');
    });
    $('#immunoassaysBtn').on('click', function() {
        ga('send', 'event', 'cytometryBtn', 'cytometryBtn');
    });
    $('#labBtn').on('click', function() {
        ga('send', 'event', 'labBtn', 'labBtn');
    });

    // Tracking Downloads
    $('#downloadPlot').on('click', function() {
        ga('send', 'event', 'downloadPlot', 'downloadPlot');
    });
    $('#downloadPlotData').on('click', function() {
        ga('send', 'event', 'downloadPlotData', 'downloadPlotData');
    });
    $('#downloadAllData').on('click', function() {
        ga('send', 'event', 'downloadAll', 'downloadAll');
    });

});
