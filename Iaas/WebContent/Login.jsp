<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang='en'>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	
<style>
div.container {
	width: 50%;
	border: 50px;
	padding: 50px;
}


header, footer {
	color: blue;
	padding: 1em;
	clear: left;
	text-align: center;
}
</style>
</head>
<body>

    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="assets/img/logo.png" />
                    </a>
                </div>
              
                 <!-- <span class="logout-spn" >
                  <a href="Login.jsp" style="color:#fff;">LOGOUT</a>  

                </span> -->
            </div>
        </div>

	<div class="container">
		<h2>User login</h2>
		<br>
		<form action="Login" method="post">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="name">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="password">
			</div>
			<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div>
			
			
			<!-- - <input type="submit" name="action" class="btn btn-primary" value="Submit">
			<input type="submit" name="action" class="btn btn-primary" value="Register">
			
			<h4><a  href="adminLogin.jsp">Admin Login</a></h4> -->
			
			<br>
			<div class="btn-group ">
			<input type="submit" name="action" class="btn btn-primary" value="Submit">
			<a href="register.jsp" class="btn btn-primary">Admin Login</a>
            <a href="adminLogin.jsp" class="btn btn-primary">Admin Login</a>
            </div>
			
		</form>
	</div>
	</div> <br>

</body>
</html>
