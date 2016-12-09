<!DOCTYPE html>
<html lang="en">
<head>
  <title>MIaaS Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <style>
  div.container {
    width: 50%;
    border:50px;
    padding:50px;
     }
   body {background-color: powderblue;}
   header, footer {
   background-color: blue;
   color:white;
   padding:1em;
   clear:left;
   text-align:center;
   }
</style>
</head>
<body>
<header></header>
<div class="container">
  <h2>Admin login</h2> 
  <br>
  <form action="Login" method="post">
  <%if(request.getAttribute("adminerror")!=null){ %>
  	<h4><%out.print(request.getAttribute("adminerror").toString()); %></h4>
  <%} %>
    <div class="form-group">
      <label for="email">Name</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="adminname">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="adminpwd">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    
  
       <div class="row">
     <div class="col-xs-12 col-sm-6 col-md-6"> <div class="form-group">
     <input type="submit" name="adminLogin" class="btn btn-primary" value="Login">
    
     </div>
    </div>
 </div>  
 </form> 
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer><b>Group 18</b></footer>
</body>
</html>