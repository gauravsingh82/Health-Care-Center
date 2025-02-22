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
	padding-left: 1%;
}

.center {
	margin-top: 41px;
	margin-bottom: auto;
	display: grid;
	place-content: center;
	width: 50%;
}

.details {
	font-size: 1.2rem;
	text-align: justify;
}

.details label {
	display: table;
	margin-bottom: -10px;
}

.img img {
	height: 100%;
	width: 100%;
	border: 1px solid balck;
}

.img {
	margin: 37px 10px 17px 15px;
	width: 418px;
	height: 400px;
}

.button {
	padding-bottom: 65px;
	margin: 23px 0px 10px 0px;
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
	<%@ include file="patient_navbar.jsp"%>

	<%
	ResultSet resultSet = new AdminDaoImpl().findDoctors(Integer.parseInt(request.getParameter("doctor_id")));
	if (resultSet.next()) {
		String name = resultSet.getString(2);
		int age = Integer.parseInt(resultSet.getString(3));
		String gender = resultSet.getString(4);
		String phone = resultSet.getString(5);
		String email = resultSet.getString(6);
		String address = resultSet.getString(8);
	%>

	<div class="main">

		<h2 id="heading">
			Details
			<%=": Dr. " + name.toUpperCase()%>
		</h2>

		<div class="child">
			<div class="img">
				<img alt="no image" src="../myimages?id=<%=resultSet.getInt(1)%>">
			</div>
			<div class="center">
				<div class="details">
					<label><b>Name :</b> <%=name%></label><br> <label><b>Age
							:</b> <%=age%></label><br> <label><b>Gender :</b> <%=gender%></label><br>
					<label><b>Contact : </b> <%=phone%></label><br> <label><b>Email
							Id :</b> <%=email%></label><br> <label><b>Address : </b><%=address%></label><br>
					<div class="button">
						<a
							href="bookappointments.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>&&doctor_name=<%=resultSet.getString(2)%>&&doctor_id=<%=request.getParameter("doctor_id")%>">Book
							Appointment</a> <a
							href="View_doctors.jsp?patient_name=<%=request.getParameter("patient_name")%>&&patient_id=<%=request.getParameter("patient_id")%>">Back</a>
					</div>
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
