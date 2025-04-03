<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<style type="text/css">
* {
	margin: 0;
}

.main {
	background-image: url("images/background1.jpg");
	display: flex;
	place-content: space-between;
	height: 84.2vh;
}

img {
	height: 547px;
	width: 550px;
}

.center {
	padding: 10px;
	height: 200px;
	width: 560px;
	background-color: lightblue;
	position: relative;
	left: 90px;
	top: 120px;
}

h1 {
	font-size: 45px;
}

h2 {
	margin-top: 10px;
}

p {
	margin-top: 10px;
	font-size: 18px;
}

.login {
	position: relative;
	left: 43%;
	align-items: center;
	margin-top: 30px;
}

.login a {
	margin-right: 13px;
	text-align: center;
	display: inline-block;
	width: 91px;
	text-decoration: none;
	border: solid green;
	border-radius: 50px;
	font-size: 1.3rem;
	font-family: math;
	padding: 7px;
	color: white;
	background-color: green;
}

.login a:hover {
	background-color: darkgreen;
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>Welcome to Health Care</h1>
			<h2>Get Better Care for Your Health</h2>
			<p>Start your journey with Health Care</p>
			<div class="login">
				<a href="signup.jsp">SignUp</a> <a href="login.jsp">Login</a>
			</div>
		</div>
		<div class="img">
			<img alt="No img" src="images/home.png">
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>