<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<style type="text/css">
* {
	margin: 0;
}

.main {
	background-image: url("images/background1.jpg");
	height: 84.11vh;
	display: flex;
}

.center {
	padding: 10px;
	height: 200px;
	width: 100%;
	position: relative;
	left: 22px;
	top: 73px;
}

img {
	margin-left: 65px;
	margin-top: 14%;
	width: 87vh;
}

.center p {
	font-size: 40px;
	font-weight: 900;
	padding-left: 10px;
}

#p1 {
	
}

#p2 {
	background-color: aliceblue;
	color: blue;
}

#p3 {
	background-color: aliceblue;
	color: blue;
}

#p4 {
	color: indigo;
	padding-top: 10px;
	font-weight: normal;
	font-size: 26px;
}

#p5 {
	color: indigo;
	padding-top: 8px;
	font-weight: normal;
	font-size: 20px;
}

.contact {
	position: relative;
	left: 67%;
	align-items: center;
	margin-top: 30px;
}

.contact a {
	margin-right: 13px;
	text-align: center;
	display: inline-block;
	width: 131px;
	text-decoration: none;
	border: solid green;
	border-radius: 50px;
	font-size: 1.3rem;
	font-family: math;
	padding: 7px;
	color: white;
	background-color: green;
}

.contact a:hover {
	background-color: darkgreen;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="main">
		<div class="center">
			<p id="p1">THE BEST DOCTOR</p>
			<p id="p2">GIVES THE LAST</p>
			<p id="p3">MEDICINES</p>
			<p id="p4">We believe health and well-being can be in reach for
				everyone</p>
			<p id="p5">So we collaborate with organizations and communities
				in Colorado to break down systemic inequalities that stand in the
				way of our health</p>
			<div class="contact">
				<a href="contactUs.jsp">Contact Us</a>
			</div>
		</div>

		<div class="img">
			<img alt="No img" src="images/aboutus.png">
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>