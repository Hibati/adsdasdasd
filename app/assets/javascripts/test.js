
  // set your channel id here
  var channel_id =33;
  // set your channel's read api key here if necessary
  var api_key = '0HZ0QXSI02OR1XXW';
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
  
  function getData() {
    var tbxValue = document.getElementById('txtf1').value;
    var num = document.getElementById('num').value;
    if(num >= tbxValue){
      //document.bgColor = "pink";
      document.getElementById('ones').value=1;
      document.getElementById('txtf213').value="Open";
      document.getElementById('myimage').innerHTML='<img src="https://lh3.googleusercontent.com/-VccYhtHNaBw/ViXxneVna5I/AAAAAAAAARA/M5iLYAkgFPw/s512-Ic42/Ledopen.jpg" height="298" width="220"/>';
      document.getElementById('myimage_2').innerHTML='<img src="https://lh3.googleusercontent.com/-qJzUZpqthTM/VjHnQdELOvI/AAAAAAAAAVE/Y2mZHPbCQFI/s256-Ic42/door_open.png" height="256" width="256"/>';
      
      $.getJSON('http://iotser.iots.com.tw:3000/update?key=' + api_key + '&field3=1')
    }else {
      //document.bgColor = "white";
      document.getElementById('zero').value=0;
      document.getElementById('txtf213').value="Close";
      document.getElementById('myimage').innerHTML='<img src="https://lh3.googleusercontent.com/-b5wSdoSkw9A/ViXxncaMHXI/AAAAAAAAAQ8/2LEHOjPQ6pM/s512-Ic42/Ledclose.jpg" height="298" width="220"/>';
      
      document.getElementById('myimage_2').innerHTML='<img src="https://lh3.googleusercontent.com/-mVLs3Zlr8AA/VjHnQIx4COI/AAAAAAAAAVE/HzhbOMfa01c/s256-Ic42/door_close.png" height="256" width="256"/>';
       $.getJSON('http://iotser.iots.com.tw:3000/update?key=' + api_key + '&field3=0')
    }
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
       document.getElementById('num').value=p;
       var new_text = document.getElementById('txtf1').value;
       var new_num = document.getElementById('num').value;
       
       if(new_num >= new_text){
          //document.bgColor = "pink";
          document.getElementById('ones').value=1;
          document.getElementById('txtf213').value="Open";
          document.getElementById('myimage').innerHTML='<img src="https://lh3.googleusercontent.com/-VccYhtHNaBw/ViXxneVna5I/AAAAAAAAARA/M5iLYAkgFPw/s512-Ic42/Ledopen.jpg" height="298" width="220"/>';
         document.getElementById('myimage_2').innerHTML='<img src="https://lh3.googleusercontent.com/-qJzUZpqthTM/VjHnQdELOvI/AAAAAAAAAVE/Y2mZHPbCQFI/s256-Ic42/door_open.png" height="256" width="256"/>';
      
         $.getJSON('http://iotser.iots.com.tw:3000/update?key=' + api_key + '&field3=1')
       }else{
          //document.bgColor = "white";
          document.getElementById('zero').value=0;
          document.getElementById('txtf213').value="Close";
          document.getElementById('myimage').innerHTML='<img src="https://lh3.googleusercontent.com/-b5wSdoSkw9A/ViXxncaMHXI/AAAAAAAAAQ8/2LEHOjPQ6pM/s512-Ic42/Ledclose.jpg" height="298" width="220"/>';
         document.getElementById('myimage_2').innerHTML='<img src="https://lh3.googleusercontent.com/-mVLs3Zlr8AA/VjHnQIx4COI/AAAAAAAAAVE/HzhbOMfa01c/s256-Ic42/door_close.png" height="256" width="256"/>';
       
         $.getJSON('http://iotser.iots.com.tw:3000/update?key=' + api_key + '&field3=0')
         
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