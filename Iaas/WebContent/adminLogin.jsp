<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  
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
    border:50px;
    padding:50px;
     }

   header, footer {
   color:blue;
   padding:1em;
   clear:left;
   text-align:center;
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
  <h2>Admin login</h2> 
  <br>
  <form >
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>  

	 <div class="btn-group">
     <a href="adminDashBoard.jsp" class="btn btn-primary">Login</a>
     </div>
            
  </form>
       
        <!-- -<div class="row"> <div class="col-xs-12 col-sm-6 col-md-6">   -->
     
       <!-- - <div class="form-group">  <h4><a href="adminDashBoard.jsp">LOGIN</a></h4>  </div> -->
     
      <!--  </div> </div>     --> 
    
</div>

</div><br><br>


</body>
</html>
