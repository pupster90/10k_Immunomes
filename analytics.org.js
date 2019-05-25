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


// Idea 2

// Tracking Downloads
$('#downloadPlot').on('click', function() {
    ga('send', 'event', 'downloadPlot', 'downloadPlot');
});
$('#downloadPlotData').on('click', function() {
    ga('send', 'event', 'downloadPlotData', 'downloadPlotData');
});
$('#downloadZip').on('click', function() {
    ga('send', 'event', 'downloadZip', 'downloadZip');
});

// Tracking Action Buttons
$('#homeBtn').on('click', function() {
    ga('send', 'event', 'homeBtn', 'homeBtn');
});
$('#geneBtn').on('click', function() {
    ga('send', 'event', 'geneBtn', 'geneBtn');
});
$('#rnaBtn').on('click', function() {
    ga('send', 'event', 'rnaBtn', 'rnaBtn');
});
$('#cytometryBtn').on('click', function() {
    ga('send', 'event', 'cytometryBtn', 'cytometryBtn');
});
$('#labBtn').on('click', function() {
    ga('send', 'event', 'labBtn', 'labBtn');
});
$('#antibodyBtn').on('click', function() {
    ga('send', 'event', 'antibodyBtn', 'antibodyBtn');
});

// Idea 1
/*
// Tracking Downloads
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','downloadPlot');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','downloadPlotData');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','downloadZip');
});

// Tracking Action Buttons
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','homeBtn');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','geneBtn');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','rnaBtn');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','cytometryBtn');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','labBtn');
});
$(document).on('click', 'button', function() {
    ga('send', 'event', 'button','antibodyBtn');
});
*/