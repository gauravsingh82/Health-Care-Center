<!DOCTYPE html>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">
* {
	margin: 0;
}

body {
	width: inherit;
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
	width: 100%;
	left: 22px;
	top: 73px;
	position: relative;
}

.center p {
	width: 700px;
	padding-left: 20px;
	font-size: 1.3rem;
	margin-top: 3px;
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
	<%@ include file="patient_navbar.jsp"%>
	<div class="main">
		<%
		String patient_name = request.getParameter("patient_name");
		%>
		<div class="center">
			<h1>
				Welcome
				<%=patient_name%>,
			</h1>
			<p>to HealthCare Center, where your health is our priority.
				Whether you're a new patient or have been with us for years, we are
				here to provide you with the best care, resources, and support. Our
				team of healthcare professionals is dedicated to helping you stay
				healthy, informed, and empowered to make the best decisions for your
				well-being.</p>
			<div class="links">
				<a
					href="View_doctors.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Book
					Appointment</a> <a
					href="appointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Appointments</a>
			</div>
		</div>
		<div class="img">
			<img alt="No img" src="../images/patient_bg.png">
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>