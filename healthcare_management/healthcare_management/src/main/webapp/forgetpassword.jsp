<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.main {
	height: 84vh;
	background-image: url("images/background1.jpg");
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background-color: azure;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 100%;
	max-width: 400px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

label {
	font-size: 14px;
	color: #555;
	margin-bottom: 5px;
	display: block;
}

input[type="text"], input[type="number"], input[type="email"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	color: #333;
}

.submit-btn, .back-btn {
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
	margin-bottom: 10px;
}

.submit-btn {
	background-color: #4CAF50;
	color: white;
}

.submit-btn:hover {
	background-color: #45a049;
}

.back-btn {
	background-color: #ccc;
	color: black;
}

.back-btn:hover {
	background-color: #bbb;
}

.form-footer {
	text-align: center;
	margin-top: 20px;
}

.msg {
	width: 100%;
	color: red;
	text-align: center;
	margin-bottom: 10px;
	font-size: 1.3rem;
}

@media ( max-width {
	@media ( max-width : 768px) {
		.container {
			padding: 20px;
		}
		input, .submit-btn, .back-btn {
			font-size: 16px;
		}
	}
}

.error {
	color: red;
	font-size: 12px;
	margin-top: -10px;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="main">
		<div class="container">
			<%
			if (request.getAttribute("password") != null) {
				String password = (String) request.getAttribute("password");
			%>
			<div class="msg">
				<%="Your Password : " + password%>
			</div>
			<%
			}
			%>
			<h2>Forgot Password</h2>
			<form action="#" method="POST" id="forgot-password-form">
				<!-- Name -->
				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" placeholder="Enter your email" required>
					<div class="error" id="email-error"></div>
				</div>

				<!-- Age -->
				<div class="form-group">
					<label for="age">Age</label> <input type="number" id="age"
						name="age" placeholder="Enter your age" required>
					<div class="error" id="age-error"></div>
				</div>

				<!-- Mobile -->
				<div class="form-group">
					<label for="mobile">Mobile No.</label> <input type="number"
						id="mobile" name="mobile" placeholder="Enter your mobile number"
						required>
					<div class="error" id="mobile-error"></div>
				</div>

				<div class="form-group">
					<label for="role">Select Role</label> <select id="role" name="role"
						required>
						<option value="" disabled selected>Select your role</option>
						<option value="patient">Paient</option>
						<option value="doctor">Doctor</option>
						<option value="admin">Admin</option>
					</select>
					<div class="error" id="role-error"></div>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="submit-btn">Submit</button>

				<!-- Back Button -->
				<button type="button" class="back-btn"
					onclick="window.location.href='login.jsp'">Back to Login</button>
			</form>
		</div>
	</div>
	<%@ include file="footer.html"%>
	<script>
        // Validation script to display error messages
        document.getElementById('forgot-password-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission to check validation

            // Clear previous errors
            let errors = document.querySelectorAll('.error');
            errors.forEach(error => error.textContent = '');

            let valid = true;

            const email = document.getElementById('email').value;
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailRegex.test(email)) {
                document.getElementById('email-error').textContent = 'Please enter a valid email address.';
                valid = false;
            }

            // Age validation
            const age = document.getElementById('age').value;
            if (age < 18 || age > 100) {
                document.getElementById('age-error').textContent = 'Please enter a valid age (18-100).';
                valid = false;
            }

            // Mobile validation
            const mobile = document.getElementById('mobile').value;
            if (mobile.length !== 10) {
                document.getElementById('mobile-error').textContent = 'Please enter a valid 10-digit mobile number.';
                valid = false;
            }

            // Submit the form if valid
            if (valid) {
            // Set the form's action attribute before submitting
            const form = document.getElementById('forgot-password-form');
            form.action = 'forgetpassword'; // Specify your form action URL here

            // Submit the form
            form.submit(); // Manually submit the form
            }
        });
    </script>
</body>
</html>
