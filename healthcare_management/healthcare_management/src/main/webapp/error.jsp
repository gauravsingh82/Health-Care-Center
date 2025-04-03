<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
}

.main {
	place-content: center;
	display: grid;
	height: 100vh;
}

#back {
	padding: 10px;
	color: white;
	background-color: green;
	text-decoration: none;
	text-align: center;
	border-radius: 100px;
	margin: 23px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="main">
		<h1>404 Page Not Found</h1>
		<a href="index.jsp" id="back">Back To Home</a>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>