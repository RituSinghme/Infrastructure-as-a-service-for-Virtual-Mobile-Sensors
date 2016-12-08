<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>View Sensors</title>
<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #fafafa;
}

table {
	color: #333;
	font-family: sans-serif;
	font-size: .9em;
	font-weight: 300;
	text-align: left;
	line-height: 50px;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px solid #98AFC7;
	width: 750px;
	margin: 50px auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, .16);
	border-radius: 2px;
}

thead tr:first-child {
	background: #98AFC7;
	color: #fff;
	border: none;
}

th {
	font-weight: bold;
}

th:first-child, td:first-child {
	padding: 0 15px 0 20px;
}

thead tr:last-child th {
	border-bottom: 3px solid #ADD8E6;
}

tbody tr:hover {
	background-color: rgba(23, 28, 238, .1);
}

tbody tr:last-child td {
	border: none;
}

tbody td {
	border-bottom: 1px solid #ADD8E6;
}

td:last-child {
	text-align: right;
	padding-right: 10px;
}

.button {
	color: #a #0000FF;
	cursor: pointer;
	vertical-align: middle;
}

.edit:hover {
	color: #0000FF;
}

.delete:hover {
	color: #0000FF;
}
</style>
</head>
<body>



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

				<span class="logout-spn"> <a href="index.jsp" style="color: #fff;">LOGOUT</a>

				</span>
			</div>
		</div>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">


					<li><a href="userDashBoard.jsp"><i class="fa fa-desktop "></i>Dashboard
					</a></li>


					<li><a href="userDashBoard.jsp"><i class="fa fa-table "></i>View
							My Profile</a></li>
					<li class="active-link"><a href="userDashBoard.jsp"><i
							class="fa fa-edit "></i>Edit Profile</a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>View Sensors</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<form name="sensorform" method="post">
					<input type="hidden" value="1" name="sensorId" id="sensorId">
					<table id="tableId">
						<thead>
							<tr>
								<td><b>No</b></td>
								<td><b>Sensor Id</b></td>
								<td><b>Sensor Type</b></td>
								<td><b>Location</b></td>
								<td><b>Status</b></td>
								<td><b>Start Time</b></td>
								<td><b>End Time</b></td>
								<td><b>View</b></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userSensorList}" var="sensor"
								varStatus="count">

								<input type="hidden" value=" ${sensor.sensorId}" id="sensorId"
									name="sensorId">
								<tr>
									<td>${count.count}</td>
									<td>${sensor.sensorId}</td>
									<td>${sensor.sensorType}</td>
									<td>${sensor.city}</td>
									<td>${sensor.status}</td>
									<td>${sensor.startTime}</td>
									<td>${sensor.endTime}</td>
									<td><i class="material-icons button edit"
										onclick="myView(this)">wb_cloudy</i></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</form>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<div class="footer">


		<div class="row"></div>
	</div>


	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
	<script>
		function myView(index) {
			var id = index.parentNode.parentNode.rowIndex;
			var row = document.getElementById("tableId").rows.item(id);
			var cell = row.cells.item(1).innerHTML;
			document.getElementById("sensorId").value = cell;
			document.forms["sensorform"].submit();
		}
	</script>
</body>
</html>
