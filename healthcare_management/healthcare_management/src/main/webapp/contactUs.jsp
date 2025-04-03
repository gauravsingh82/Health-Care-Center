<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<style type="text/css">
* {
	margin: 0;
}

.main {
	background-image: url("images/background1.jpg");
	height: 84.2vh;
	display: flex;
}

.center {
	width: 100%;
	padding: 10px;
	height: 200px;
	position: relative;
	left: 22px;
	top: 73px;
}

img {
	width: 84vh;
}

.center p {
	margin-top: 10px;
	width: 600px;
	font-size: 1.5rem;
}

.center h1 {
	font-size: 3rem;
	font-weight: bolder;
}

.appointment {
	position: relative;
	left: 58%;
	align-items: center;
	margin-top: 30px;
}

.appointment a {
	margin-right: 13px;
	text-align: center;
	display: inline-block;
	width: 200px;
	text-decoration: none;
	border: solid green;
	border-radius: 50px;
	font-size: 1.3rem;
	font-family: math;
	padding: 7px;
	color: white;
	background-color: green;
}

.appointment a:hover {
	background-color: darkgreen;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>Making Health</h1>
			<h1>Care Better Together</h1>
			<p>At HealthCare Center, we believe that communication is key to
				providing you with the best care. Whether you are seeking
				information, need assistance with a medical concern, or would like
				to book an appointment, we are always here to help. Our team is
				dedicated to making sure you have a smooth, positive experience when
				reaching out to us.</p>
			<div class="appointment">
				<a href="login.jsp">Make An Appointment</a>
			</div>
		</div>
		<div class="img">
			<img alt="No img" src="images/contactus.png">
		</div>
	</div>

	<%@ include file="footer.html"%>

</body>
</html>