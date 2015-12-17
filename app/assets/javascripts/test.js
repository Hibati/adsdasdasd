  // set your channel id here
  var channel_id = "<%= @channel.id %>";
  // set your channel's read api key here if necessary
  var api_key = "<%= @apikey %>";
  // name of the gauge
  var gauge_name = 'Temp';
  
  // load the google gauge visualization
  google.load('visualization', '1', {packages:['gauge']});
  google.setOnLoadCallback(initChart);

  // display the data
  function displayData(point) {
    data.setValue(0, 0, gauge_name);
    data.setValue(0, 1, point);
    chart.draw(data, options);
  }

  // load the data
  function loadData() {
    // variable for the data point
    var p;

    // get the data from thingspeak
     $.getJSON('http://iotser.iots.com.tw:3000/channels/' + channel_id + '/fields/1/last.json?api_key=' + api_key + '&timezone=Asia/Taipei', function(data) {
      // get the data point
      p = data.field1;
      // if there is a data point display it
      if (p) {
        displayData(p);
      }
    });
    
    var p2;
    
     // get the data from thingspeak
     $.getJSON('http://iotser.iots.com.tw:3000/channels/' + channel_id + '/fields/2/last.json?api_key=' + api_key + '&timezone=Asia/Taipei', function(data) {
      // get the data point
      p2 = data.field2;
      // if there is a data point display it
      if (p2) {
        displayData(p2);
      }
      if (p2 == 1){
      	document.getElementById('myimage').innerHTML = src = "<%= asset_path('Ledopen.png') %>";
      }else{
      	document.getElementById('myimage').innerHTML = src = "<%= asset_path('Ledclose.png') %>";
      }
    });
  }

  // initialize the chart
  function initChart() {
    data = new google.visualization.DataTable();
    data.addColumn('string', 'Label');
    data.addColumn('number', 'Value');
    data.addRows(1);

    chart = new google.visualization.Gauge(document.getElementById('gauge_div'));
    options = {width: 180, height: 180, max: 40, min: 0, minorTicks: 5};
    loadData();
    
    // load new data every 15 seconds
    setInterval('loadData()', 3000);
  }
  