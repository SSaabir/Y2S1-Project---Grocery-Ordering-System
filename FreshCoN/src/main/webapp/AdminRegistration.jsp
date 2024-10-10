<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="freshco.Model.AdminDBUtil"%>
<%@ page import="freshco.Beans.Admin"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fresh Co</title>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	background-image:
		url("https://i.pinimg.com/736x/5d/aa/aa/5daaaacda6f2f3d2837cd981658318dc.jpg");
	margin: 0;
	padding: 0;
}

.main {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background-color: #ffffff;
}

.registration {
	padding: 30px;
	width: 50%;
	background-color: #ffffff;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-bottom: 20px;
	font-size: 30px;
	color: #000000;
	text-align: center;
	font-style: italic;
}

.form-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.sub-part {
	width: 48%;
}

.sub-part label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.sub-part input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.form-actions {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

.back-btn, .reset-btn, .submit-btn {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.back-btn {
	background-color: #007bff;
	color: white;
}

.reset-btn {
	background-color: #ccc;
	color: #333;
}

.submit-btn {
	background-color: #ff6600;
	color: white;
}

@media ( max-width : 768px) {
	.registration {
		width: 90%;
	}
	.form-row {
		flex-direction: column;
	}
	.sub-part {
		width: 100%;
	}
}
</style>
</head>
<body>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script>
        alert("<%= errorMessage %>");
	</script>
	<%
	}
	%>
	<div class="main">
		<div class="registration">
			<h2>ADMIN REGISTRATION FORM</h2>
			<form action="AddAdm" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="sub-part">
						<label for="fName">First Name:</label> <input type="text"
							id="fName" name="fName" placeholder="Enter First Name" required>
					</div>
					<div class="sub-part">
						<label for="lName">Last Name:</label> <input type="text"
							id="lName" name="lName" placeholder="Enter Last Name" required>
					</div>
				</div>
				<div class="form-row">
					<div class="sub-part">
						<label for="email">Email:</label> <input type="email" id="email"
							name="email" placeholder="Enter Email" required>
					</div>
					<div class="sub-part">
						<label for="phone">Phone:</label> <input type="tel" id="phone"
							name="phone" placeholder="Enter Phone Number" required>
					</div>
				</div>
				<div class="form-row">
					<div class="sub-part">
						<label for="Lane">Address Line:</label> <input type="text"
							id="Lane" name="Lane" placeholder="Enter Address Line" required>
					</div>
					<div class="sub-part">
						<label for="city">City:</label> <input type="text" id="city"
							name="city" placeholder="Enter City" required>
					</div>
				</div>
				<div class="form-row">
					<div class="sub-part">
						<label for="dob">Date of Birth:</label> <input type="date"
							id="dob" name="dob" max="2004-12-31" required>
					</div>
					<div class="sub-part">
						<label for="img">Add Image</label> <input type="file" id="img"
							name="imgUrl">
					</div>
				</div>

				<div class="form-row">
					<div class="sub-part">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" placeholder="Enter Password"
							required>
					</div>

					<div class="sub-part">
						<label for="password">Confirm Password:</label> <input
							type="password" id="Confirmpassword" name="Confirmpassword"
							placeholder="Enter Confirm password" required>
					</div>


				</div>


				<div class="form-actions">

					<button type="reset" class="reset-btn">Reset All</button>
					<button type="submit" class="submit-btn">Submit Form</button>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const form = document.querySelector('form');
							const emailField = document.getElementById('email');
							const phoneField = document.getElementById('phone');
							const dobField = document.getElementById('dob');
							const passwordField = document
									.getElementById('password');
							const confirmPasswordField = document
									.getElementById('Confirmpassword');

							form
									.addEventListener(
											'submit',
											function(event) {
												let errors = [];

												// Email validation
												const email = emailField.value;
												const emailRegex = /^[a-zA-Z0-9._%+-]+@adm\.freshco\.lk$/;
												if (!emailRegex.test(email)) {
													errors
															.push("Email must be in the format '@adm.freshco.lk'.");
												}

												// Phone number validation (10 digits)
												const phone = phoneField.value;
												const phoneRegex = /^\d{10}$/;
												if (!phoneRegex.test(phone)) {
													errors
															.push("Phone number must be exactly 10 digits.");
												}

												// Age validation (must be at least 20 years old)
												const dob = new Date(
														dobField.value);
												const age = new Date()
														.getFullYear()
														- dob.getFullYear();
												if (age < 20) {
													errors
															.push("You must be at least 20 years old.");
												}

												// Password validation (at least 8 characters)
												const password = passwordField.value;
												if (password.length < 8) {
													errors
															.push("Password must be at least 8 characters long.");
												}

												// Confirm password validation
												const confirmPassword = confirmPasswordField.value;
												if (password !== confirmPassword) {
													errors
															.push("Passwords do not match.");
												}

												// If there are errors, prevent form submission and show alerts
												if (errors.length > 0) {
													alert(errors.join("\n"));
													event.preventDefault();
												}
											});
						});
	</script>


</body>

</html>