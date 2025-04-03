<!DOCTYPE html>
<%@page import="com.dao.AdminDaoImpl"%>
<html>
<head>
<title>Health Care Center</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	int result = new AdminDaoImpl().deleteDoctors(id);
	if (result > 0) {
		response.sendRedirect("view_all_doctors.jsp?admin_name=" + request.getParameter("admin_name"));
	} else {
	%>
	<%="Record Not Deleted Error Occurs..."%>
	<%
	}
	%>
</body>
</html>