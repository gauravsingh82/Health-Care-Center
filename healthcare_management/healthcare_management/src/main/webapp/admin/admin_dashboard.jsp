<!DOCTYPE html>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">
* {
	margin: 0;
}

.main {
	background-image: url("../images/background1.jpg");
	display: flex;
	place-content: space-between;
	height: 84.2vh;
}

img {
	height: 547px;
	width: 550px;
}

.center {
	padding: 10px;
	height: 200px;
	position: relative;
	left: 22px;
	top: 73px;
}

.center p {
	width: 700px;
	padding-left: 20px;
	font-size: 1.3rem;
	margin-top: 10px;
	margin-left: 10px;
}

.links {
	position: relative;
	left: 43%;
	align-items: center;
	margin-top: 30px;
}

.links a {
	margin-right: 13px;
	text-align: center;
	display: inline-block;
	width: 170px;
	text-decoration: none;
	border: solid green;
	border-radius: 50px;
	font-size: 1.3rem;
	font-family: math;
	padding: 7px;
	color: white;
	background-color: green;
}

.links a:hover {
	background-color: darkgreen;
}
</style>
</head>
<body>
	<%@ include file="admin_navbar.jsp"%>
	<div class="main">
		<%
		if (!request.getParameter("admin_name").equals("") && !request.getParameter("admin_name").equals(null)) {
			String admin_name = request.getParameter("admin_name");
		%>
		<div class="center">
			<h1>
				Welcome
				<%=admin_name%></h1>
			<p>This section is designed to help you streamline the management
				of patient records, appointments, and other essential administrative
				tasks. Here, you'll find the tools and resources to ensure that our
				healthcare services run smoothly and efficiently.</p>
			<div class="links">
				<a href="view_all_doctors.jsp?admin_name=<%=admin_name%>">All
					Doctors</a> <a href="viewappointments.jsp?admin_name=<%=admin_name%>">view
					Appointment</a>
			</div>
		</div>
		<%
		} else
		response.sendRedirect("../error.jsp?error=true");
		%>
		<div class="img">
			<img alt="No img" src="../images/admin_bg.png">
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>