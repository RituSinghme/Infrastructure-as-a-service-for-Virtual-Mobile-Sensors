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
                   
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		
<div class="container">

<br><br>

<% Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://team18-instance1.c2s2dfvr9r2j.us-west-1.rds.amazonaws.com:3306/team18dB1?useSSL=false",
			"team18user", "team18pass");
	
	Statement tb = con.createStatement();
	Statement tbc = con.createStatement();
	ResultSet tbl;
	ResultSet tblc;
	%>
    
    
    <div class="container">
    
    <%
      String var;
      tbl = tb.executeQuery("select name, username, email_id, phone_no from user us join auth_table au on us.user_id = au.user_id where us.user_id= " +session.getAttribute("userId") + " ;");   
      tblc = tbc.executeQuery("select name_on_card, card_number, exp_date, cvv from card_details ca join user us on ca.user_id = us.user_id where us.user_id= " +session.getAttribute("userId") + " ;");        
     %>
    
    	  <div align="center" id = 1>
	        
			<table class="table" border="1" cellpadding="5">
	            <caption><h2>My Profile</h2></caption>
	            <tr class="info">
	            	<th>Name</th>
	                <th>Username</th>
	                <th>Email Id</th>
	                <th>Contact Number</th>
	            </tr>
	        <%    
			while(tbl.next())
			{
					
			%>
			    <tr align = "center">
	                <td><% out.print(tbl.getString("name")); %></td>
	                <td><% out.print(tbl.getString("username")); %></td>
	                <td><% out.print(tbl.getString("email_id")); %></td>
	                <td><% out.print(tbl.getString("phone_no")); %></td>
	             </tr>
	             
	            <% } %>
	            
	          <br><br><br>  <div align="center" id = 1>
	        
			<table class="table" border="1" cellpadding="5">
	            <caption><h2>My Card Details</h2></caption>
	            <tr class="info">
	            	<th>Name On Card</th>
	                <th>Card Number</th>
	                <th>Expiry Date</th>
	                <th>CVV</th>
	            </tr>
	        <%    
			while(tblc.next())
			{
					
			%>
			    <tr align = "center">
	                <td><% out.print(tblc.getString("name_on_card")); %></td>
	                <td><% out.print(tblc.getString("card_number")); %></td>
	                <td><% out.print(tblc.getString("exp_date")); %></td>
	                <td><% out.print(tblc.getString("cvv")); %></td>
	             </tr> 
	             
	    <%   }
	            
    con.close();%>
	        </table>
	  </div>
	  </div>
 
 <br><br>

<!-- /. PAGE WRAPPER  -->
	</div>


</body>
</html>
