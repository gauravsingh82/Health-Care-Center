<!DOCTYPE html>
<%@page import="com.dao.Bookappointment"%>
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
	height: 84.2%;
	background-image: url("../images/background1.jpg");
}

.center {
	height: 97%;
	/* 	display: grid; */
	/* 	align-content: center; */
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

.tdcenter {
	text-align: center;
	padding: 10px;
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
	margin-right: 17px;
	display: block;
	overflow-y: auto;
	text-align: center;
}

.scrollable {
	max-width: 321px;
	height: 61px;
	display: block;
	overflow-y: auto;
	max-height: 60px;
	text-align: justify;
	border: none;
	border-bottom: 2px solid darkcyan;
}

#accept {
	background-color: transparent;
	font-size: 1.1rem;
	border: none;
	cursor: pointer;
	display: inline-block;
	text-align: center;
}

#reject {
	background-color: transparent;
	font-size: 1.1rem;
	border: none;
	cursor: pointer;
	display: inline-block;
	text-align: center;
}

table thead {
	background-color: aliceblue;
	color: rebeccapurple;
	position: sticky;
	top: -1px;
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

.accept-symbol {
	color: green;
}

.reject-symbol {
	color: red;
}

.accept:hover {
	background-color: #3ff03f;
}

.reject:hover {
	background-color: #f88a8a;
}

.accept-symbol:hover {
	color: darkgreen;
}

.reject-symbol:hover {
	color: darkred;
}
</style>
</head>
<body>
	<%@ include file="doctor_navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>Your Appointments</h1>
			<div class="tbox ">
				<table>
					<thead>
						<tr style="height: 50px; border: 2px solid #ddd;">
							<th>No</th>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Date</th>
							<th>Phone No.</th>
							<th class="address">Description</th>
							<th>Doctor</th>
							<th>Status</th>
							<th>Accept</th>
							<th>Reject</th>
							<th>View Details</th>
						</tr>
					</thead>
					<%
					ResultSet resultSet = Bookappointment.doctorAppointments(Integer.parseInt(request.getParameter("doctor_id")),
							request.getParameter("doctor_name"));
					int count = 0;
					while (resultSet.next()) {
						count++;
						// 						String name = resultSet.getString(1);
						// 						String gender = resultSet.getString(2);
						// 						String age = resultSet.getString(3);
						// 						String phone = resultSet.getString(4);
						// 						String date = resultSet.getString(5);
						// 						String description = resultSet.getString(6);
						// 						String id = resultSet.getString(7);
						// 						int appointment_id = Integer.parseInt(resultSet.getString(11));
						// 						String status = resultSet.getString(8);
						// 						String doctor = resultSet.getString(9);
					%>
					<tbody>
						<tr>
							<td class="tdcenter"><%=count%></td>
							<td class="tdcenter"><%=resultSet.getString(1)%></td>
							<td class="tdcenter"><%=resultSet.getString(3)%></td>
							<td class="tdcenter"><%=resultSet.getString(2)%></td>
							<td class="tdcenter"><%=resultSet.getString(5)%></td>
							<td class="tdcenter"><%=resultSet.getString(4)%></td>
							<td class="scrollable"><%=resultSet.getString(6)%></td>
							<td class="tdcenter"><%=resultSet.getString(9)%></td>
							<td class="tdcenter" id="status"><%=resultSet.getString(8)%></td>
							<td class="accept"><form action="../bookappointment"
									method="get">

									<!-- Doctor details -->
									<input type="text" name="doctor_id"
										value="<%=request.getParameter("doctor_id")%>" hidden="true">
									<input type="text" name="doctor_name"
										value="<%=request.getParameter("doctor_name")%>" hidden="true">

									<input type="text" name="status" value="Accepted" hidden="true">
									<input type="text" name="appointment_id"
										value="<%=Integer.parseInt(resultSet.getString(11))%>"
										hidden="true">
									<button type="submit" class="accept-symbol" id="accept">&#10004;
										Accept</button>
								</form></td>

							<td class="reject"><form action="../bookappointment"
									method="get">

									<!-- Doctor details -->
									<input type="text" name="doctor_id"
										value="<%=request.getParameter("doctor_id")%>" hidden="true">
									<input type="text" name="doctor_name"
										value="<%=request.getParameter("doctor_name")%>" hidden="true">

									<input type="text" name="status" value="Rejected" hidden="true">
									<input type="text" name="appointment_id"
										value="<%=Integer.parseInt(resultSet.getString(11))%>"
										hidden="true">
									<button type="submit" class="reject-symbol" id="reject">&#10008;
										Reject</button>
								</form></td>
							<td class="tdcenter"><a href="#">view...</a></td>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../footer.html"%>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var statusCells = document.querySelectorAll('.tdcenter#status');

			statusCells.forEach(function(cell) {
				var status = cell.innerText.trim();

				if (status === 'Rejected') {
					cell.style.backgroundColor = 'red';
					cell.style.color = 'white';
				} else if (status === 'Accepted') {
					cell.style.backgroundColor = 'green';
					cell.style.color = 'white';
				}
			});
		});
	</script>


</body>
</html>