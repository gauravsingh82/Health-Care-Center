<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Care Center</title>
<style type="text/css">/* General Styles */
* {
	margin: 0;
	font-family: Arial, sans-serif;
}

.navbar {
	position: sticky;
	top: 0px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
	background-color: #333;
	background-color: #778a77;
	color: white;
}

.navbar .logo a {
	color: white;
	font-size: 24px;
	text-decoration: none;
}

.nav-links {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	padding-right: 50px;
}

.nav-links li {
	margin-left: 20px;
}

.nav-links li a {
	color: white;
	text-decoration: none;
	font-size: 18px;
}

/* Hamburger menu for mobile */
.hamburger {
	display: none;
	font-size: 30px;
	cursor: pointer;
	padding-right: 50px;
}

/* Media Query for Mobile */
@media ( max-width : 768px) {
	.nav-links {
		display: none;
		width: 100%;
		text-align: center;
		position: absolute;
		top: 60px;
		left: 0;
		background-color: #333;
		padding: 20px;
	}
	.nav-links.active {
		display: block;
	}
	.nav-links li {
		margin: 15px 0;
	}
	.hamburger {
		display: block;
	}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar">
		<div class="logo">
			<a href="../index.jsp">Health Care Center</a>
		</div>
		<ul class="nav-links" id="navLinks">
			<li><a
				href="patient_dashboard.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Home</a></li>
			<li><a
				href="View_doctors.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Doctors</a></li>
			<%-- <li><a
				href="bookappointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Book
					Appointments</a></li> --%>
			<li><a
				href="appointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Appointments</a></li>
			<li><a href="../index.jsp">LogOut</a></li>
		</ul>
		<div class="hamburger" id="hamburger">&#9776;</div>
	</nav>

	<script>
		// Toggle the navigation menu for mobile view
		document.getElementById("hamburger").addEventListener(
				"click",
				function() {
					document.getElementById("navLinks").classList
							.toggle("active");
				});
	</script>
</body>
</html>
