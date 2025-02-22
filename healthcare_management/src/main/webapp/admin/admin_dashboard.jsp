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
			<a href="viewappointments.jsp?admin_name=<%=admin_name%>">view
				Appointment</a> <a href="appointments.jsp?admin_name=<%=admin_name%>">Appointments</a>
		</div>
		<%
		} else
		response.sendRedirect("../error.jsp?error=true");
		%>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>