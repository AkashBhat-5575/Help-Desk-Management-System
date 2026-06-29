<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Help Desk | Login</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="login-container">

		<div class="login-card">

			<div class="logo">

				<i class="fa-solid fa-headset"></i>

			</div>

			<h1>Welcome Back</h1>

			<p class="subtitle">Login to your account</p>

			<form action="login" method="post">

				<div class="input-group">

					<label>Username</label>

					<div class="input-box">

						<i class="fa-regular fa-user"></i> <input type="text"
							name="txtuname" placeholder="Enter your username" required>

					</div>

				</div>

				<div class="input-group">

					<label>Password</label>

					<div class="input-box">

						<i class="fa-solid fa-lock"></i> <input type="password"
							name="txtpass" placeholder="Enter your password" required>

					</div>

				</div>

				<button class="login-btn">Login</button>

			</form>

			<div class="divider">

				<span>or</span>

			</div>

			<p class="register">

				Don't have an account? <a href="register.jsp"> Register </a>

			</p>

		</div>

		<p class="copyright">© 2026 Help Desk Ticketing System</p>

	</div>

</body>

</html>