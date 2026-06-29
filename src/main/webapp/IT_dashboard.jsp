<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>IT Dashboard - Help Desk</title>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
	
	<link rel="stylesheet" href="css/style.css">
</head>

<body class="dashboard-body">

	<div class="dashboard">

		<aside class="sidebar">
			<div class="brand">
				<i class="fa-solid fa-headset"></i> <span>HelpDesk</span>
			</div>
			<ul>
				<li class="active">
					<a href="IT_dashboard.jsp"><i class="fa-solid fa-laptop-code"></i> IT Panel</a>
				</li>
				<li>
					<a href="viewticket.jsp"><i class="fa-solid fa-list-check"></i> View Tickets</a>
				</li>
				<li>
					<a href="updatestatus.jsp"><i class="fa-solid fa-pen-to-square"></i> Update Status</a>
				</li>
				<li>
					<a href="deleteticket.jsp"><i class="fa-solid fa-trash-can"></i> Delete Ticket</a>
				</li>
				<li>
					<a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
				</li>
			</ul>
		</aside>

		<main class="main-content">
			
			<div class="topbar">
				<div>
					<h2>IT Support Dashboard</h2>
					<p class="welcome-text">Manage, resolve, and track assigned technical issues.</p>
				</div>
				<div class="profile">
					<i class="fa-solid fa-user-gear"></i> IT Technician
				</div>
			</div>

			<div class="quick-actions">
				<h3><i class="fa-solid fa-toolbox"></i> Resolution Tools</h3>
				
				<div class="cards" style="margin-top: 25px; margin-bottom: 0;">
					
					<a href="viewticket.jsp" class="card" style="text-decoration: none;">
						<i class="fa-solid fa-magnifying-glass-chart"></i>
						<h3>Assigned Tickets</h3>
						<p style="font-size: 16px; margin-top: 10px; color: #2563eb; font-weight: 600;">View & Analyze <i class="fa-solid fa-arrow-right" style="font-size: 14px; margin-left: 5px;"></i></p>
					</a>
					
					<a href="updatestatus.jsp" class="card" style="text-decoration: none; border-left-color: #f59e0b;">
						<i class="fa-solid fa-bars-progress" style="color: #f59e0b;"></i>
						<h3>Update Status</h3>
						<p style="font-size: 16px; margin-top: 10px; color: #f59e0b; font-weight: 600;">Log Progress <i class="fa-solid fa-arrow-right" style="font-size: 14px; margin-left: 5px;"></i></p>
					</a>
					
					<a href="deleteticket.jsp" class="card" style="text-decoration: none; border-left-color: #ef4444;">
						<i class="fa-solid fa-trash" style="color: #ef4444;"></i>
						<h3>Delete Ticket</h3>
						<p style="font-size: 16px; margin-top: 10px; color: #ef4444; font-weight: 600;">Close & Remove <i class="fa-solid fa-arrow-right" style="font-size: 14px; margin-left: 5px;"></i></p>
					</a>

				</div>
			</div>

		</main>

	</div>

</body>
</html>