<!DOCTYPE html>
<html>
<head>
<title>Health Care Center</title>
<style type="text/css">
/* General styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.main {
	background-image: url("../images/background1.jpg");
	padding-bottom: 60px;
	padding-top: 65px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Center form container */
.center {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	width: 100%;
}

/* Title */
.main h1 {
	text-align: center;
	font-size: 2rem;
	color: #333;
	margin-bottom: 20px;
}

/* Form details */
.details {
	width: 96%;
	display: flex;
	flex-direction: column;
	gap: 11px;
}

/* Form labels and inputs */
.main label {
	font-size: 1rem;
	/* 	color: #333; */
}

.main input[type="text"], input[type="date"], input[type="number"],
	select, textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 1rem;
	/* 	color: #333; */
}

.gender {
	place-content: space-between;
	display: flex;
}

.main textarea {
	resize: vertical;
}

/* Submit button style */
.main button {
	border: none;
	display: inline-block;
	padding: 12px 20px;
	background-color: #4CAF50;
	color: #fff;
	text-align: center;
	text-decoration: none;
	border-radius: 4px;
	font-size: 1rem;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.main button:hover {
	background-color: #45a049;
}

/* Media query for responsiveness */
@media ( max-width : 768px) {
	.center {
		padding: 15px;
	}
	.main h1 {
		font-size: 1.5rem;
	}
	.main label {
		font-size: 0.9rem;
	}
	.main input[type="text"], input[type="date"], input[type="number"],
		select, textarea {
		font-size: 0.9rem;
		padding: 8px;
	}
	.main button {
		padding: 10px 15px;
	}
}

@media ( max-width : 480px) {
	.center {
		padding: 10px;
	}
	.main h1 {
		font-size: 1.2rem;
	}
	.main .details {
		gap: 12px;
	}
	.main label {
		font-size: 0.8rem;
	}
	.main input[type="text"], input[type="date"], input[type="number"],
		select, textarea {
		font-size: 0.85rem;
		padding: 6px;
	}
	.main button {
		font-size: 0.9rem;
		padding: 8px 12px;
	}
}
</style>
</head>
<body>
	<%@ include file="patient_navbar.jsp"%>
	<div class="main">
		<div class="center">
			<h1>Appointment book</h1>
			<form action="../bookappointment" method="post">
				<div class="details">
					<label for="name">Name</label> <input type="text" name="username"
						required placeholder="Full Name"
						value="<%=request.getParameter("patient_name")%>"> <label
						for="age">Age</label> <input type="number" name="age" required
						placeholder="Age">
					<div class="gender">
						<div>
							<label for="gender">Gender</label> <select name="gender" required>
								<option>Male</option>
								<option>Female</option>
							</select>
						</div>
						<div>
							<label for="date">Date</label> <input type="date" name="date"
								required>
						</div>
					</div>
					<label for="phone">Contact Number</label> <input type="number"
						name="phone" required> <label for="Disease">Disease
						Description</label>
					<textarea rows="5" cols="1" name="Disease"
						placeholder="Write Disease Details ..." required></textarea>
				</div>


				<input type="text" name="patient_name"
					value="<%=request.getParameter("patient_name")%>" hidden="true">

				<input type="text" name="patient_id"
					value="<%=request.getParameter("patient_id")%>" hidden="true">

				<input type="text" name="doctor_name"
					value="<%=request.getParameter("doctor_name")%>" hidden="true">

				<input type="text" name="doctor_id"
					value="<%=request.getParameter("doctor_id")%>" hidden="true">


				<div class="buttons">
					<button type="submit">Submit</button>
				</div>

			</form>
		</div>
	</div>
	<%@ include file="../footer.html"%>
</body>
</html>