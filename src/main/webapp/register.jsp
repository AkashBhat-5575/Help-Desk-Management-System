<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.enums.Role"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Help Desk | Register</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<!-- Common CSS -->
<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="login-container">

		<div class="login-card register-card">

			<div class="logo">

				<i class="fa-solid fa-user-plus"></i>

			</div>

			<h1>Create Account</h1>

			<p class="subtitle">Join the Help Desk Ticketing System</p>

			<form action="register" method="post">

				<div class="input-group">

					<label>Full Name</label>

					<div class="input-box">

						<i class="fa-regular fa-user"></i> <input type="text"
							name="txtname" placeholder="Enter your full name" required>

					</div>

				</div>

				<div class="input-group">

					<label>Username</label>

					<div class="input-box">

						<i class="fa-solid fa-at"></i> <input type="text" name="txtuname"
							placeholder="Choose a username" required>

					</div>

				</div>

				<div class="input-group">

					<label>Password</label>

					<div class="input-box">

						<i class="fa-solid fa-lock"></i> <input type="password"
							name="txtpass" placeholder="Create a password" required>

					</div>

				</div>

				<!-- Two Column Layout -->

				<div class="form-row">

					<div class="input-group">

						<label>Age</label>

						<div class="input-box">

							<i class="fa-solid fa-cake-candles"></i> <input type="number"
								name="txtage" min="18" placeholder="Age" required>

						</div>

					</div>

					<div class="input-group">

						<label>Role</label>

						<div class="input-box">

							<i class="fa-solid fa-user-tag"></i> <select
								class="custom-select" name="role">

								<%
								for (Role r : Role.values()) {
								%>

								<option value="<%=r.name()%>">

									<%=r.name()%>

								</option>

								<%
								}
								%>

							</select>

						</div>

					</div>

				</div>

				<button class="login-btn" type="submit">Create Account</button>

			</form>

			<div class="divider">

				<span>or</span>

			</div>

			<p class="register">

				Already have an account? <a href="login.jsp"> Login </a>

			</p>

		</div>

		<p class="copyright">© 2026 Help Desk Ticketing System</p>

	</div>

</body>

</html>