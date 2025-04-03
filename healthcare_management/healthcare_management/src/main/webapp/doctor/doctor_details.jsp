<!DOCTYPE html>
<%@page import="com.dao.MyImages"%>
<%@page import="com.dao.AdminDaoImpl"%>
<%@page import="java.sql.ResultSet"%>
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

.child {
	display: flex;
}

#heading {
	padding: 10px;
	background-color: lightgray;
	width: fit-content;
	margin: 0px 0 4px 11px;
}

.center {
	width: 57%;
}

.details {
	font-size: 1.2rem;
}

.doctorname {
	padding: 8px 0 0 0;
}

.details label {
	display: table;
	margin-bottom: -10px;
	text-align: justify;
}

.img img {
	height: 100%;
	width: 100%;
}

.img {
	margin: 0px 22px 8px 11px;
	width: 418px;
	height: 400px;
}

.button {
	margin: 18px;
}

.button a {
	background-color: green;
	color: white;
	padding: 10px;
	border-radius: 10px;
	margin-left: 80px;
	text-decoration: none;
}
</style>

</head>
<body>
	<%@ include file="doctor_navbar.jsp"%>
	<%
	ResultSet resultSet = new AdminDaoImpl().findDoctors(Integer.parseInt(request.getParameter("doctor_id")));
	if (resultSet.next()) {
	%>

	<div class="main">
		<div class="doctorname">
			<h2 id="heading">
				Details
				<%=": Dr. " + resultSet.getString(2).toUpperCase()%>
			</h2>
		</div>
		<div class="child">
			<div class="img">
				<img alt="no image" src="../myimages?id=<%=resultSet.getInt(1)%>">
			</div>
			<div class="center">
				<div class="details">
					<label><b>Name :</b> <%=resultSet.getString(2)%></label><br> <label><b>Age
							:</b> <%=resultSet.getString(3)%></label><br> <label><b>Gender
							:</b> <%=resultSet.getString(4)%></label><br> <label><b>Contact
							: </b> <%=resultSet.getString(5)%></label><br> <label><b>Email
							Id :</b> <%=resultSet.getString(6)%></label><br> <label><b>Address
							:</b> <%=resultSet.getString(8)%></label><br>
				</div>
				<div class="button">
					<a
						href="update_doctor.jsp?id=<%=resultSet.getInt(1)%>&&
							name=<%=resultSet.getString(2)%>&&
							age=<%=resultSet.getInt(3)%>&&
							gender=<%=resultSet.getString(4)%>&&
							phone=<%=resultSet.getString(5)%>&&
							email=<%=resultSet.getString(6)%>&&
							adhar=<%=resultSet.getString(7)%>&&	
							address=<%=resultSet.getString(8)%>&&
							doctor_name=<%=request.getParameter("doctor_name")%>&&doctor_id=<%=resultSet.getInt(1)%>">Update
						Details</a> <a
						href="doctor_dashboard.jsp?doctor_id=<%=resultSet.getInt(1)%>&&doctor_name=<%=resultSet.getString(2)%>">Back</a>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>
