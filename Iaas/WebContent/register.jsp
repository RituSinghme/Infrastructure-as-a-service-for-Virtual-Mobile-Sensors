<%@page import="com.Iaas.Servlets.Register"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import= "com.Iaas.*"%>
<%@ page import ="java.io.IOException.*" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
<title>User Registration</title>
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
	
</head>
<body id="pageBody">

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

			</div>
		</div> <br><br><br>
		
<div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

    <div class="divPanel notop nobottom">
            
<div id="signup"  class="container spacer about" align="center">
	<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="" method="post">
			<br>
			<h2 align="center">Welcome to the MSIaaS!!</h2> <br>
			
			<%
			Register reg = new Register();
   			Boolean success = reg.filldetails(request);  //System.out.println(success);
   				if(request.getAttribute("err_msg")!=null && request.getAttribute("err_msg").toString().length()!=0)
   				{
   					%>
   					
   					<h3>Email id already registered..Please Login..!!</h3>
   					<%	
   				session.removeAttribute("err_msg");	
   				}
 
   				%>  
                	<div class="form-group" >
                		<input type="text" name="name" id="name" class="form-control input-lg" placeholder="Name" tabindex="1" required="required">
                	</div>         
                	
                    <div class="form-group">
                    	<input type="text" name="username" id="username" class="form-control input-lg" placeholder="Username" tabindex="2" required="required" >
                    </div>              
                                 
                <fieldset>
                	<div class="form-group">
                    	<input type="text" name="phone_no" id="phone_no" class="form-control input-lg" placeholder="Contact Number" tabindex="3" required="required">
                    </div>
                </fieldset>
                <fieldset>
                	<div class="form-group">
                    	<input type="email" name="email_id" id="email_id" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control input-lg" placeholder="Email Id" tabindex="3" required="required">
                    </div>
                </fieldset>
                
                 <fieldset>
                	<div class="form-group">
                    	<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="3" required="required">
                    </div>
                </fieldset>
                                 
                <fieldset>
                    <div class="form-group">
                        <input type="text" name="name_on_card" id="name_on_card" class="form-control input-lg" placeholder="Name on Card" tabindex="4" required="required">
                   	</div>
                    <span id="result"></span>
                </fieldset>
                                    
                <div class="form-group">
                	<input type="text" name="card_number" id="card_number" class="form-control input-lg" placeholder="Card Number" tabindex="5" required="required">
               	</div>
                            
                <div class="form-group">
                    <input type="text" name="cvv" id="cvv"  class="form-control input-lg" placeholder="CVV" tabindex="6" required="required">
                </div>
                            
                            
                <hr class="colorgraph">
                <div class="row">
                
                
                <div class="col-xs-6 col-sm-6 col-md-6" align="center"> <div class="form-group"><input type="submit" name="register" value="Register User" class="btn btn-primary btn-medium" tabindex="9"></div>
                </div>
                  
                </div>                              
   
   
   
	   <%

	   if (success) { 
   	           response.sendRedirect("Login.jsp");
                
                 }

	  
	//}
%>                         

		</form>
	</div>
	</div>
</div>              
            <!--End Main Content-->
            </div>

        </div>
   



</body>
</html>