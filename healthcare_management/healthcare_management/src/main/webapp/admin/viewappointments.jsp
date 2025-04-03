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
	height: 83.99%;
	background-image: url("../images/background1.jpg");
}

.center {
	height: 97%;
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

#status {
	font-size: 1.3rem;
	background-color: #a4ddddd1;
	color: #0029ff;
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
	max-width: 400px;
	height: 60px;
	display: block;
	overflow-y: auto;
	max-height: 91px;
	text-align: justify;
	border: none;
	border-bottom: 2px solid darkcyan;
}

.scrollable:hover {
	padding: 18px;
	background-color: #01434b;
	color: white;
	display: table-cell;
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
	<%@ include file="admin_navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>All Appointments</h1>
			<div class="tbox ">
				<table>
					<thead>
						<tr style="height: 50px; border: 2px solid #ddd;">
							<th>ID</th>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Date</th>
							<th>Phone No.</th>
							<th class="address">Description</th>
							<th>Doctor</th>
							<th>Status</th>
						</tr>
					</thead>
					<%
					ResultSet resultSet = Bookappointment.allAppointments();
					while (resultSet.next()) {

						// 						String name = resultSet.getString(1);
						// 						String gender = resultSet.getString(2);
						// 						String age = resultSet.getString(3);
						// 						String phone = resultSet.getString(4);
						// 						String date = resultSet.getString(5);
						// 						String description = resultSet.getString(6);
						// 						String id = resultSet.getString(7);
						// 						int appointment_id = Integer.parseInt(resultSet.getString(10));
						// 						String status = resultSet.getString(8);
						// 						String doctor = resultSet.getString(9);
					%>
					<tbody>
						<tr>
							<td class="tdcenter"><%=resultSet.getString(10)%></td>
							<td class="tdcenter"><%=resultSet.getString(1)%></td>
							<td class="tdcenter"><%=resultSet.getString(3)%></td>
							<td class="tdcenter"><%=resultSet.getString(2)%></td>
							<td class="tdcenter"><%=resultSet.getString(5)%></td>
							<td class="tdcenter"><%=resultSet.getString(4)%></td>
							<td class="scrollable"><div>
									<%=resultSet.getString(6)%>
								</div></td>
							<td class="tdcenter"><%=resultSet.getString(9)%></td>
							<td class="tdcenter" id="status"><%=resultSet.getString(8)%></td>
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