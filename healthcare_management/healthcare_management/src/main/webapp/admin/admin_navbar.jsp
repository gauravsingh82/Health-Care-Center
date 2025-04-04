<!DOCTYPE html>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">/* General Styles */
* {
	margin: 0;
	font-family: Arial, sans-serif;
}

.navbar {
	position: sticky;
	top: 0px;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
	background-color: #778a77;
	color: white;
	display: flex;
}

.navbar .logo a {
	color: white;
	font-size: 24px;
	text-decoration: none;
}

h1 {
	padding-left: 30px;
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
	font-size: 20px;
	cursor: pointer;
	padding-right: 50px;
}

/* Media Query for Mobile */
@media ( max-width : 978px) {
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
	<%
	if (request.getParameter("admin_name").equals("") && request.getParameter("admin_name").equals(null)) {
		response.sendRedirect("../error.jsp?error=true");
	} else {
	%>
	<!-- Navbar -->
	<nav class="navbar">
		<div class="logo">
			<a href="../index.jsp">Health Care Center</a>
		</div>
		<ul class="nav-links" id="navLinks">
			<li><a
				href="admin_dashboard.jsp?admin_name=<%=request.getParameter("admin_name")%>">Home</a></li>
			<li><a
				href="add_doctors.jsp?admin_name=<%=request.getParameter("admin_name")%>">Add
					Doctors</a></li>
			<li><a
				href="view_all_doctors.jsp?admin_name=<%=request.getParameter("admin_name")%>">View
					All Doctors</a></li>
			<li><a
				href="viewappointments.jsp?admin_name=<%=request.getParameter("admin_name")%>">view
					Appointments</a></li>
			<li><a
				href="view_all_patients.jsp?admin_name=<%=request.getParameter("admin_name")%>">Patients</a></li>
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
	<%
	}
	%>
</body>
</html>
