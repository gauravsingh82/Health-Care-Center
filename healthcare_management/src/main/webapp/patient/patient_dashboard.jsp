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
				<%=patient_name%></h1>
			<%-- <a
				href="bookappointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Book
				Appointment</a>  --%>
			<a
				href="appointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Appointments</a>
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>