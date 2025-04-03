<!DOCTYPE html>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.main {
	background-image: url("../images/background1.jpg");
}
</style>
</head>
<body>
	<%@ include file="doctor_navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>
				Welcome
				<%=request.getParameter("doctor_name")%></h1>
			<a
				href="viewappointments.jsp?doctor_id=<%=request.getParameter("doctor_id")%>&&doctor_name=<%=request.getParameter("doctor_name")%>">view
				Appointment</a> <br> 
<!-- 				<a -->
<%-- 				href="appointments.jsp?doctor_id=<%=request.getParameter("doctor_id")%>&&doctor_name=<%=request.getParameter("doctor_name")%>">Appointments</a> --%>
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>