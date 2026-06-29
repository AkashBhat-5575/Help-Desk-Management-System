<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - Help Desk</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet" href="css/style.css">
</head>

<body class="dashboard-body">

	<div class="dashboard">

		<aside class="sidebar">
			<div class="brand">
				<i class="fa-solid fa-headset"></i> <span>HelpDesk</span>
			</div>
			<ul>
				<li class="active"><a href="admin_dashboard.jsp"><i
						class="fa-solid fa-chart-line"></i> Admin Panel</a></li>
				<li><a href="viewticket.jsp"><i class="fa-solid fa-list-ul"></i>
						View Tickets</a></li>
				<li><a href="assignticket.jsp"><i
						class="fa-solid fa-user-check"></i> Assign Ticket</a></li>
				<li><a href="deleteticket.jsp"><i
						class="fa-solid fa-trash-can"></i> Delete Ticket</a></li>
				<li><a href="generatereport.jsp"><i
						class="fa-solid fa-file-invoice"></i> Reports</a></li>
				<li><a href="login.jsp"><i
						class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">

			<div class="topbar">
				<div>
					<h2>Admin Dashboard</h2>
					<p class="welcome-text">System overview and administrative
						controls.</p>
				</div>
				<div class="profile">
					<i class="fa-solid fa-user-shield"></i> Administrator
				</div>
			</div>

			<div class="quick-actions">
				<h3>
					<i class="fa-solid fa-screwdriver-wrench"></i> Management Tools
				</h3>

				<div class="cards" style="margin-top: 25px; margin-bottom: 0;">

					<a href="viewticket.jsp" class="card"
						style="text-decoration: none;"> <i class="fa-solid fa-ticket"></i>
						<h3>All Tickets</h3>
						<p
							style="font-size: 16px; margin-top: 10px; color: #2563eb; font-weight: 600;">
							View & Manage <i class="fa-solid fa-arrow-right"
								style="font-size: 14px; margin-left: 5px;"></i>
						</p>
					</a> <a href="assignticket.jsp" class="card"
						style="text-decoration: none;"> <i
						class="fa-solid fa-user-tag"></i>
						<h3>Assign Tickets</h3>
						<p
							style="font-size: 16px; margin-top: 10px; color: #2563eb; font-weight: 600;">
							Delegate Tasks <i class="fa-solid fa-arrow-right"
								style="font-size: 14px; margin-left: 5px;"></i>
						</p>
					</a> <a href="deleteticket.jsp" class="card"
						style="text-decoration: none; border-left-color: #ef4444;"> <i
						class="fa-solid fa-trash" style="color: #ef4444;"></i>
						<h3>Delete Ticket</h3>
						<p
							style="font-size: 16px; margin-top: 10px; color: #ef4444; font-weight: 600;">
							Remove Records <i class="fa-solid fa-arrow-right"
								style="font-size: 14px; margin-left: 5px;"></i>
						</p>
					</a> <a href="generatereport.jsp" class="card"
						style="text-decoration: none; border-left-color: #10b981;"> <i
						class="fa-solid fa-file-export" style="color: #10b981;"></i>
						<h3>Generate Report</h3>
						<p
							style="font-size: 16px; margin-top: 10px; color: #10b981; font-weight: 600;">
							System Analytics <i class="fa-solid fa-arrow-right"
								style="font-size: 14px; margin-left: 5px;"></i>
						</p>
					</a>

				</div>
			</div>

		</main>

	</div>

</body>
</html>