<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import= "com.Iaas.*"%>
<%@ page import ="java.io.IOException.*" %>


<!DOCTYPE html>

<html>
<head>
  <title>User Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  
       <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.min.js"></script>
      <script src="Chart.js"></script>
      <script src="http://code.highcharts.com/highcharts.js"></script>

<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	
  <style>
 div.container {
    width: 100%;
     }

   header, footer {
   color:blue;
   padding:1em;
   clear:left;
   }
   
   header{text-align:right; colour:white;}
   footer{text-align:center;}
   
   div.col-md-2 col-sm-4 col-xs-6 tile_stats_count{
    width: 10%;
    border:5px;
    padding:1px;
    background-color :grey;
   
   }
   
   div.count{color: Red;}  
   .count_top {color:Blue;}
   .count_bottom{color:Green;}
   .col-sm-4{Padding: 1em; text-align:center;}
   .col-sm-8{Padding: 1em; text-align:center;}
   
a:link    {color:blue; background-color:transparent; text-decoration:none}
a:visited {color:green; background-color:transparent; text-decoration:none}
a:hover   {color:red; background-color:transparent; text-decoration:underline}
a:active  {color:yellow; background-color:transparent; text-decoration:underline}

table, th , td {
            border: 1px solid grey;
            border-collapse: collapse;
            padding: 5px;
         }
         
         table tr:nth-child(odd) {
            background-color: #f2f2f2;
         }
         
         table tr:nth-child(even) {
            background-color: #ffffff;
         }
   
</style>

</head>
<body>

<!-- <header>Welcome User! <a href="Index.html" class="btn btn-info" role="button"><span style = "color:blue">Log Out</span> </a></header> - -->
<div id="wrapper">
<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="adjust-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".sidebar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img
						src="assets/img/logo.png" />

					</a>

				</div>

				<span class="logout-spn"> <a href="logout.jsp" style="color: #fff;">LOGOUT</a>

				</span>
			</div>
		</div>
		<!-- /. NAV TOP  -->
				<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">


<li >
                        <a href="userDashBoard.jsp" ><i class="fa fa-desktop "></i>Dashboard </a>
                    </li>
                   

                    <li>
                        <a href="viewProfile.jsp"><i class="fa fa-table "></i>View My Profile</a>
                    </li>
                    <li class="active-link">
                        <a href="userDashBoard.jsp"><i class="table "></i></a>
                    </li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		

<br>
<div class="container">
<div class="jumbotron text-center">
  <h1>User Dashboard </h1>
</div> 
<br><br>

<% Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://team18-instance1.c2s2dfvr9r2j.us-west-1.rds.amazonaws.com:3306/team18dB1?useSSL=false",
			"team18user", "team18pass");
	
	Statement st = con.createStatement();
	Statement dt = con.createStatement();
	Statement us = con.createStatement();
	Statement cs = con.createStatement();
	Statement ts = con.createStatement();
	ResultSet od;
	ResultSet dte;
	ResultSet usg;
	ResultSet cst;
	ResultSet tsr;
	
	Statement ab = con.createStatement();
	Statement tp = con.createStatement();
	ResultSet rs;
	ResultSet type;
	
	Statement xz = con.createStatement();
	Statement ct = con.createStatement();
	ResultSet ps;
	ResultSet city;
	
	Statement gp = con.createStatement();
	ResultSet gh;
	
	Statement pe = con.createStatement();
	ResultSet pc;
	
	Statement tb = con.createStatement();
	Statement tbc = con.createStatement();
	ResultSet tbl;
	ResultSet tblc;
	%>
    
<script src="http://code.highcharts.com/highcharts.js"></script>

<script type='text/javascript'>

$(function () {
	
	<%
	usg = us.executeQuery("select sum(hour(timediff(IFNULL(str_to_date(end_time,'%m/%d/%Y %h:%i %p'), current_timestamp()), str_to_date(start_time,'%m/%d/%Y %h:%i %p'))) ) as sum from user_sensor where user_id= " +session.getAttribute("userId")+ "  group by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')); ");	
	if (usg.next() == true)
	{
	String us_id ;
	String usage = "";
	
	do
    { //out.println(od.next());
	us_id = (usg.getString("sum"));
	usage = usage + us_id + ",";
	}while(usg.next());
    System.out.println(usage);
   // System.out.println(date);
	%>
	
	<%
	dte = dt.executeQuery("select date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')) as date from user_sensor where user_id= " + session.getAttribute("userId")+  "  group by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')) order by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p'));");
	//System.out.println(dte.next());
    if (dte.next() == true)
	{
	String dt_id ;
	String date = "";
	
	do
    { //out.println(od.next());
	dt_id = (dte.getString("date"));
	date = date + "'";
	date = date + dt_id + "',";
	}while(dte.next());
    System.out.println(date);
	%>
	
	<%
	od = st.executeQuery("select count(sensor_id) as total from user_sensor where user_id= "+ session.getAttribute("userId")+ " group by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')) order by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p'));");
	//out.println(od.next());
	System.out.println(session.getAttribute("userId"));
	if (od.next() == true)
	{
	String ph_id ;
	String ph = "";
	
	do
    { 
	ph_id = (od.getString("total"));
	ph = ph + ph_id + ",";
	}while(od.next());
    System.out.println(ph);
    //System.out.println(date);
	%>

	
    $('#container').highcharts({

        credits: {
            enabled: false
        },
        
        title: {
            text: 'Usage & Payment History'
        },
        
        xAxis: {
            categories: [<%out.println(date);%>]
        },

        series: [{
            data: [<%out.println(ph);%>],
            name: 'Total Sensors Created'
        }, {
        data: [<%out.println(usage);%>],
        name: 'Total Usage Hours'
        }
        
        
        ]        
    });
    
    <% } 
    
    else out.println(od.next());
	} else out.println(dte.next()); 
	} else out.println(usg.next());%>
});
</script>
<div id="container" style="height: 400px"></div>  
    </div>    
    
<br><br>

<div class="container">
   <div class="col-sm-4">
   <h3 float:center> View the comparative graphs in perspective of Sensor, Locations and Usage here</h3></div>
    <div class="col-sm-4">
    <h4> Sensor Types vs Count </h4>
    <br>
      <canvas id="myChart" width="10" height="10"></canvas>
<script>
var ctx = document.getElementById("myChart");

<% type = tp.executeQuery("select type from sensor s join user_sensor u  on s.location_id = u.location_id where user_id = " + session.getAttribute("userId")+ " group by type ;");
//out.println(od.next());
if (type.next() == true)
{
String tp_id ;
String type1 = "";

do
{ //out.println(od.next());
tp_id = (type.getString("type"));
type1 = type1 +  "\"";
type1 = type1 + tp_id + "\",";
}while(type.next());
System.out.println(type1);
%>


<% rs = ab.executeQuery("select count(sensor_id) as total from sensor s join user_sensor u  on s.location_id = u.location_id where user_id = " +session.getAttribute("userId")+  " group by type ;");
//out.println(od.next());
if (rs.next() == true)
{
String ph_id ;
String ph = "";

do
{ //out.println(od.next());
ph_id = (rs.getString("total"));
ph = ph + ph_id + ",";
//System.out.println(ph);
}while(rs.next());
//ph = ph + ph_id; 
System.out.println(ph);
%>

var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<%out.println(type1);%>],
        datasets: [{
            label: 'Sensors types',
            data: [<%out.println(ph);%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.8)',
                'rgba(54, 162, 235, 0.8)',
                'rgba(255, 206, 86, 0.8)',
                'rgba(75, 192, 192, 0.8)',
                'rgba(153, 102, 255, 0.8)',
                'rgba(255, 159, 64, 0.8)'
                
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            
            hoverBackgroundColor: [
                "#80001c",
                "#093b5d",
                "#664900",
                "#1b4b4b",
                "#2a0080",
                "#804000"
            ],
            
            borderWidth: 5
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
}
<% }
else out.println(rs.next());
} 

else out.println(type.next()); %>
);
</script> 

    </div>
    
    <div class="col-sm-4">
      <h4>Sensor Locations & Count</h4>
      <canvas id="myPieChart" width="10" height="10"></canvas>
<script>
var ctx = document.getElementById("myPieChart");

<% ps = xz.executeQuery("select count(sensor_id) as total from sensor s join user_sensor u  on s.location_id = u.location_id where user_id = 7 group by city ;");
//out.println(od.next());
if (ps.next() == true)
{
String ph_id ;
String ph = "";

do
{ //out.println(od.next());
ph_id = (ps.getString("total"));
ph = ph + ph_id + ",";
//System.out.println(ph);
}while(ps.next());
System.out.println(ph);
%>

<% city = ct.executeQuery("select city from sensor s join user_sensor u  on s.location_id = u.location_id where user_id = 7 group by city ;");
//out.println(od.next());
if (city.next() == true)
{
String ct_id ;
String city1 = "";

do
{ 
ct_id = (city.getString("city"));
city1 = city1 + "\"";
city1 = city1 + ct_id +  "\",";
//System.out.println(ph);
}while(city.next());

System.out.println(city1);
System.out.println(session.getAttribute("userId"));
System.out.println(request.getAttribute("userId"));


%>

var myPieChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
    	labels: [<%out.println(city1);%> ],
        datasets: [
            {
                data: [<%out.println(ph);%>],
                backgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#9900cc",
                    "#009999",
                    "#6666ff",
                    "#808000",
                    "#e60073",
                    "#00cc00",
                    "#ff8533",
                    "#e600e6",
                    "#00ff00",
                    "#999900",
                    "#33ccff"                  
                ],
                hoverBackgroundColor: [
                    "#b30027",
                    "#0e598b",
                    "#4d0066",
                    "#004d4d",
                    "#0000b3",
                    "#333300",
                    "#660033",
                    "#004d00",
                    "#993d00",
                    "#800080",
                    "#006600",
                    "#666600",
                    "#007399"
                                      
                ]
            }]
    },
  
}
<% } 
else out.println(city.next()); 
} 
else out.println(ps.next());%>
);

</script> 
     
    </div>    
    
    </div>
      
      <br><br>
      
            <div class="container">

    <div class="col-sm-8">
    <h4> Sensor Data Input </h4>
    <br>
      <canvas id="myChart1" width="20" height="10"></canvas>
<script>
var ctx = document.getElementById("myChart1");

<% gh = gp.executeQuery("select sum(hour(timediff(IFNULL(str_to_date(end_time,'%m/%d/%Y %h:%i %p'), current_timestamp()), str_to_date(start_time,'%m/%d/%Y %h:%i %p'))) ) * 2000 as total_mb, date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')) as date from user_sensor where user_id= '" +session.getAttribute("userId").toString()+ "'  group by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p'));");
//out.println(od.next());
if (gh.next() == true)
{
String ph_id ;
String ph = "";
String dt_id;
String date ="";

do
{ //out.println(od.next());
ph_id = (gh.getString("total_mb"));
dt_id = (gh.getString("date"));
ph = ph + ph_id + ",";
date = date + "'";
date = date + dt_id + "',";

}while(gh.next());
//ph = ph + ph_id; 
System.out.println(ph);
System.out.println(date);
%>

var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [<%out.println(date);%>],
        datasets: [{
            label: 'Sensor Data Input (in mb)',
            data: [<%out.println(ph);%>],
            backgroundColor: "rgba(0, 64, 128,0.3)",
            pointHoverBackgroundColor: "rgba(115, 38, 38,0.8)",
            borderColor: [
                'rgba(232,99,132,1)'
            ],
            
            borderWidth: 5
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
}
<% } 
else out.println(gh.next()); %>
);
</script> 

    </div>
    
    <div class="col-sm-4">
      <h4>Running Instances vs Date</h4>
      <canvas id="myPieChart1" width="10" height="10"></canvas>
<script>
var ctx = document.getElementById("myPieChart1");

<% pc = pe.executeQuery("select count(sensor_id) as total, date(str_to_date(start_time,'%m/%d/%Y %h:%i %p')) as date from sensor s join user_sensor u  on s.location_id = u.location_id where  status='running' and user_id = " +session.getAttribute("userId")+ "  group by date(str_to_date(start_time,'%m/%d/%Y %h:%i %p'));");
//out.println(od.next());
if (pc.next() == true)
{
String ph_id ;
String ph = "";
String dt_id;
String date ="";

do
{ 
ph_id = (pc.getString("total"));
dt_id = (pc.getString("date"));
ph = ph + ph_id + ",";
date = date + "'";
date = date + dt_id + "',";

}while(pc.next());

%>

var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
    	labels: [<%out.println(date);%>        ],
        datasets: [
            {
                data: [<%out.println(ph);%>],
                backgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#9900cc",
                    "#009999",
                    "#ac3939",
                    "#00b300"
                ],
                hoverBackgroundColor: [
                    "#b30027",
                    "#0e598b",
                    "#4d0066",
                    "#004d4d",
                    "#602020",
                    "#004d00"
                    
                ]
            }]
    },
  
}
<% } 
else out.println(pc.next()); %>
);

</script> 
     
    </div>    
    
    </div> <br><br>
 
    
    <div class="container">
    
    <%
      int total=0;
      tbl = tb.executeQuery("select distinct sensor_id, start_time, type, city, status, ifnull(end_time, ' ') as end_time, ifnull(weather,' ') as weather , ifnull(pressure, ' ') as pressure, ifnull(temp_min, '') as temp_min, ifnull(temp_max,'') as temp_max , ifnull(humidity,'') as humidity, ifnull(wind_speed,'')  as wind_speed, ifnull(wind_degree,'') as wind_degree from user_sensor u join  sensor s on (u.location_id = s.location_id and user_id= " +session.getAttribute("userId")+ " ) left join sensor_data d on s.location_id = d.location_id group by sensor_id, start_time ;");   
      tblc = tbc.executeQuery("select count(distinct sensor_id, start_time) as total from user_sensor u join  sensor s on (u.location_id = s.location_id and user_id= " + session.getAttribute("userId")+ " ) left join sensor_data d on s.location_id = d.location_id ");        
      if (tblc.next()){total =tblc.getInt("Total");}
      if (total != 0){ %>
    
    	  <div align="center" id = 1>
	        
			<table border="1" cellpadding="5">
	            <caption><h2>Total Instances Created :<%out.print(tblc.getString("total")); %></h2></caption>
	            <tr>
	            	<th>Sensor_id</th>
	                <th>Type</th>
	                <th>City</th>
	                <th>Status</th>
	                <th>Start Time</th>
	                <th>End Time</th>
	           <!-- <th>Weather</th>  --> 
	                <th>Pressure</th>
	                <th>Min Temp</th>
	                <th>Max Temp</th>
	                <th>humidity</th>
	                <th>Wind Speed</th>
	                <th>Wind Degree</th>
	            </tr>
	        <%    
			while(tbl.next())
			{
					
			%>
			    <tr align = "center">
	                <td><% out.print(tbl.getString("sensor_id")); %></td>
	                <td><% out.print(tbl.getString("type")); %></td>
	                <td><% out.print(tbl.getString("city")); %></td>
	                <td><% out.print(tbl.getString("status")); %></td>
	                <td><% out.print(tbl.getString("start_time")); %></td>
	                <td><% out.print(tbl.getString("end_time")); %></td>
	        <!-- -  <td><% out.print(tbl.getString("weather")); %></td> --> 
	                <td><% out.print(tbl.getString("pressure")); %></td>
	                <td><% out.print(tbl.getString("temp_min")); %></td>
	                <td><% out.print(tbl.getString("temp_max")); %></td>
	                <td><% out.print(tbl.getString("humidity")); %></td>
	                <td><% out.print(tbl.getString("wind_speed")); %></td>
	                <td><% out.print(tbl.getString("wind_degree")); %></td>
	             </tr>
	            <% } 
	            
      } con.close();%>
	        </table>
	  </div>
	  </div>
 
 <br>

<!-- /. PAGE WRAPPER  -->
	</div>
	<div class="footer">


		<!-- <div class="row">
			<div class="col-lg-12">
				&copy; 2014 yourdomain.com | Design by: <a
					href="http://binarytheme.com" style="color: #fff;" target="_blank">www.binarytheme.com</a>
			</div>
		</div> -->
	</div>

	<!-- /. WRAPPER  -->


</body>
</html>
