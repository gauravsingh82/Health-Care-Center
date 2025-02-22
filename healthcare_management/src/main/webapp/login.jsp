<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
/* Reset default styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.main {
	background-image: url("images/background1.jpg");
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 84vh;
	width: 100vw;
}

.container {
	margin-top: 20px;
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

input[type="email"], input[type="password"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	color: #333;
}

.submit-btn {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
}

.submit-btn:hover {
	background-color: #45a049;
}

.form-footer {
	text-align: center;
	margin-top: 20px;
}

.form-footer a, p {
	margin-bottom: 10px;
}

.form-footer a {
	color: #4CAF50;
	text-decoration: none;
}

.form-footer a:hover {
	text-decoration: underline;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.container {
		padding: 20px;
	}
	input, select, .submit-btn {
		font-size: 16px;
	}
}

/* Error styling */
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
			<h2>Login</h2>
			<form action="#" method="POST" id="login-form">
				<!-- Email -->
				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" placeholder="Enter your email" required>
					<div class="error" id="email-error"></div>
				</div>

				<!-- Password -->
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" placeholder="Enter your password"
						required>
					<div class="error" id="password-error"></div>
				</div>

				<!-- Role Selection Dropdown -->
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
				<button type="submit" class="submit-btn">Login</button>
			</form>

			<div class="form-footer">
				<p>
					Don't have an account? <a href="signup.jsp">Sign Up</a>
				</p>
				<p>
					Forget password? <a href="forgetpassword.jsp">ForgetPassword</a>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.html"%>
	<script>
        // Validation script to display error messages
        document.getElementById('login-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission to check validation

            // Clear previous errors
            let errors = document.querySelectorAll('.error');
            errors.forEach(error => error.textContent = '');

            let valid = true;

            // Email validation
            const email = document.getElementById('email').value;
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailRegex.test(email)) {
                document.getElementById('email-error').textContent = 'Please enter a valid email address.';
                valid = false;
            }

            // Password validation
            const password = document.getElementById('password').value;
            if (password.length < 6) {
                document.getElementById('password-error').textContent = 'Password must be at least 6 characters long.';
                valid = false;
            }

            // Role selection validation
            const role = document.getElementById('role').value;
            if (!role) {
                document.getElementById('role-error').textContent = 'Please select your role.';
                valid = false;
            }

            // Submit the form if valid
            if (valid) {
            // Set the form's action attribute before submitting
            const form = document.getElementById('login-form');
            form.action = 'loginservlet'; // Specify your form action URL here

            // Submit the form
            form.submit(); // Manually submit the form
            }
        }
        );
        
    </script>
</body>
</html>
