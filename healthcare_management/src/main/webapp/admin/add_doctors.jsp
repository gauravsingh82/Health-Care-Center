<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Care Center</title>
<style>
/* Reset some default styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.main {
	background-image: url("../images/background1.jpg");
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 15px;
	padding-bottom: 90px;
}

.container {
	margin-top: 80px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 100%;
	max-width: 500px;
	background-color: azure;
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

input[type="text"], input[type="email"], input[type="file"], input[type="password"],
	input[type="number"], input[type="tel"], textarea, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
}

.form-group input[type="radio"] {
	margin-right: 10px;
}

.submit-btn, .back-btn {
	background-color: #4CAF50;
	color: white;
	margin-top: 5px;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
}

.submit-btn a {
	text-decoration: none;
	color: inherit;
	width: inherit;
}

.submit-btn:hover {
	background-color: #45a049;
}

.form-footer {
	text-align: center;
	margin-top: 20px;
}

.back-btn {
	background-color: #ccc;
	color: black;
}

.back-btn:hover {
	background-color: #bbb;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.container {
		padding: 15px;
	}
	input, select, textarea {
		font-size: 16px;
	}
	.submit-btn {
		font-size: 14px;
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
	<%@ include file="admin_navbar.jsp"%>
	<div class="main">
		<%
		if (!request.getParameter("admin_name").equals("") && !request.getParameter("admin_name").equals(null)) {
		%>
		<div class="container">
			<h2>Add Doctor</h2>
			<form action=" " method="POST" id="signup-form"
				enctype="multipart/form-data">
				<!-- Name -->
				<div class="form-group">
					<label for="name">Full Name</label> <input type="text" id="name"
						name="username" placeholder="Enter your full name" required>
					<div class="error" id="name-error"></div>
				</div>

				<!-- Gender -->
				<div class="form-group">
					<label for="gender">Gender</label>
					<div>
						<input type="radio" id="male" name="gender" value="male" required>Male
						<input type="radio" id="female" name="gender" value="female"
							required> Female
					</div>
					<div class="error" id="gender-error"></div>
				</div>

				<!-- Age -->
				<div class="form-group">
					<label for="age">Age</label> <input type="number" id="age"
						name="age" placeholder="Enter your age" required min="18"
						max="100">
					<div class="error" id="age-error"></div>
				</div>

				<!-- Mobile No. -->
				<div class="form-group">
					<label for="mobile">Mobile No.</label> <input type="tel"
						id="mobile" name="contact_number"
						placeholder="Enter your mobile number" required>
					<div class="error" id="mobile-error"></div>
				</div>

				<!-- Aadhar No. -->
				<div class="form-group">
					<label for="adhar">Aadhar No.</label> <input type="number"
						id="adhar" name="adharno" placeholder="Enter Aadhar No." required>
					<div class="error" id="adhar-error"></div>
				</div>

				<!-- Address -->
				<div class="form-group">
					<label for="address">Address</label>
					<textarea id="address" name="address"
						placeholder="Enter your address" rows="3" required></textarea>
					<div class="error" id="address-error"></div>
				</div>

				<!-- Email -->
				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" placeholder="Enter your email" required>
					<div class="error" id="email-error"></div>
				</div>

				<div class="form-group">
					<label for="file">Image</label> <input type="file" id="file"
						name="file" required onchange="validateFile()">
					<div class="error" id="file-error"></div>
				</div>

				<!-- Password -->
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" placeholder="Enter your password"
						required>
					<div class="error" id="password-error"></div>
				</div>

				<!-- Confirm Password -->
				<div class="form-group">
					<label for="confirm-password">Confirm Password</label> <input
						type="password" id="confirm-password" name="confirm-password"
						placeholder="Confirm your password" required>
					<div class="error" id="confirm-password-error"></div>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="submit-btn">Submit</button>
				<!--<button type="button" class="submit-btn" ><a href="index.jsp">Back</a></button> -->
				<button type="button" class="back-btn"
					onclick="window.location.href='view_all_doctors.jsp?admin_name=<%=request.getParameter("admin_name")%>'">View
					Doctors</button>
			</form>
		</div>
		<%
		} else {
		response.sendRedirect("../error.jsp?error=true");
		}
		%>
	</div>
	<%@ include file="../footer.html"%>
	<script>
	
	function validateFile() {
        const fileInput = document.getElementById('file');
        const filePath = fileInput.value;
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
        const errorDiv = document.getElementById('file-error');

        if (!allowedExtensions.exec(filePath)) {
          errorDiv.textContent = 'Please upload a valid image file (JPEG or PNG).';
          fileInput.value = ''; // Clear the input if file type is invalid
          return false;
        } else {
          errorDiv.textContent = ''; // Clear the error message
          return true;
        }
      }
	
        // Validation script to display error messages
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission to check validation

            // Clear previous errors
            let errors = document.querySelectorAll('.error');
            errors.forEach(error => error.textContent = '');

            let valid = true;

            // Name validation
            const name = document.getElementById('name').value.trim();
            if (name === '') {
                document.getElementById('name-error').textContent = 'Name is required.';
                valid = false;
            }

            // Gender validation
            const gender = document.querySelector('input[name="gender"]:checked');
            if (!gender) {
                document.getElementById('gender-error').textContent = 'Gender is required.';
                valid = false;
            }

            // Age validation
            const age = document.getElementById('age').value;
            if (age < 18 || age > 100) {
                document.getElementById('age-error').textContent = 'Age must be between 18 and 100.';
                valid = false;
            }

            // Mobile number validation
            const mobile = document.getElementById('mobile').value;
            const mobileRegex = /^[0-9]{10}$/;
            if (!mobileRegex.test(mobile)) {
                document.getElementById('mobile-error').textContent = 'Mobile number must be 10 digits.';
                valid = false;
            }

            // Aadhar number validation
            const aadhar = document.getElementById('adhar').value;
            if (aadhar.length !== 12) {
                document.getElementById('adhar-error').textContent = 'Aadhar number must be 12 digits.';

                valid = false;
            }

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

            // Confirm password validation
            const confirmPassword = document.getElementById('confirm-password').value;
            if (confirmPassword !== password) {
                document.getElementById('confirm-password-error').textContent = 'Passwords do not match.';
                valid = false;
            }

            // Submit the form if valid
            if (valid) {
            // Set the form's action attribute before submitting
            const form = document.getElementById('signup-form');
            form.action = "../doctor_registration?admin_name=<%=request.getParameter("admin_name")%>";

            // Submit the form
            form.submit(); // Manually submit the form
        }
        }
        );
    </script>
</body>
</html>

