<!DOCTYPE html>
<%@page import="com.dao.AdminDaoImpl"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">
* {
	margin: 0;
}

body {
	width: inherit;
	height: 100vh;
}

.main {
	height: 83.99%;
	background-image: url("../images/background1.jpg");
}

.center {
	height: 98%;
	display: grid;
	align-content: center;
}

table {
	margin-left: 20px;
	width: 96%;
	margin-bottom: 50px;
}

table, th, td {
	border: 2px solid darkcyan;
	border-collapse: collapse;
}

#table_image {
	width: 60px;
	height: 60px;
}

td {
	padding: 2px;
}

tr {
	height: 55px;
}

.tdcenter {
	text-align: center;
	padding-left: 0px;
}

table img {
	margin-bottom: -4px;
	width: 100%;
	height: 100%;
	padding: 0;
}

table a {
	display: flex;
	place-content: center;
	text-decoration: none;
}

.address {
	width: 100px;
}

.tbox {
	display: block;
	overflow-y: auto;
	text-align: center;
}

.scrollable {
	width: auto;
	height: 61px;
	display: block;
	overflow-y: auto;
	max-height: 60px;
	text-align: center;
	border: none;
	border-bottom: 2px solid darkcyan;
}

table thead {
	background-color: aliceblue;
	color: rebeccapurple;
	position: sticky;
	top: -1px;
}

}
h1 {
	padding-left: 50px;
}

.tbox::-webkit-scrollbar {
	display: none;
}

.scrollable::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="patient_navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>All Doctors</h1>
			<div class="tbox ">
				<table>
					<thead>
						<tr style="height: 50px; border: 2px solid #ddd;">
							<th>No</th>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Phone No.</th>
							<th>Email</th>
							<th>Details</th>
							<th>Book Appointment</th>
						</tr>
					</thead>
					<%
					ResultSet resultSet = new AdminDaoImpl().allDoctors();
					int count = 0;
					while (resultSet.next()) {
						count++;
					%>
					<tbody>
						<tr>
							<td class="tdcenter"><%=count%></td>
							<td class="tdcenter"
								style="text-align: left; padding-left: 10px;"><%=resultSet.getString(2)%></td>
							<td class="tdcenter"><%=resultSet.getInt(3)%></td>
							<td class="tdcenter"><%=resultSet.getString(4)%></td>
							<td class="tdcenter"><%=resultSet.getString(7)%></td>
							<td style="text-align: left; padding-left: 10px;"><%=resultSet.getString(6)%></td>
							<td><a
								href="doctor_details.jsp?doctor_id=<%=resultSet.getInt(1)%>&&patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">More
									Details</a></td>
							<td><a
								href="bookappointments.jsp?doctor_id=<%=resultSet.getInt(1)%>&&doctor_name=<%=resultSet.getString(2)%>&&patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Book</a></td>
						</tr>
					</tbody>
					<%
					}
					%>
					<tr>
						<th colspan="10" style="text-align: left;">Total Doctors : <%=count%></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>