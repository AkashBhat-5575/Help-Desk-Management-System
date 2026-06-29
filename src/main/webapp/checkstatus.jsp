<%@page import="com.dal.TicketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Check Ticket Status - Help Desk</title>
	
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
				<li><a href="Emp_dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a></li>
				<li><a href="createticket.jsp"><i class="fa-solid fa-plus"></i> Create Ticket</a></li>
				<li><a href="viewticket.jsp"><i class="fa-solid fa-ticket"></i> My Tickets</a></li>
				<li class="active"><a href="checkstatus.jsp"><i class="fa-solid fa-circle-check"></i> Check Status</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Check Ticket Status</h2>
					<p class="welcome-text">Track the progress of your submitted issues.</p>
				</div>
				<div class="profile"><i class="fa-solid fa-user"></i> Employee</div>
			</div>

			<div class="quick-actions" style="max-width: 600px;">
				<h3><i class="fa-solid fa-magnifying-glass"></i> Lookup Ticket</h3>
				
				<form action="checkstatus.jsp" method="post">
					<div class="input-group">
						<label>Enter Ticket ID</label>
						<div class="input-box">
							<i class="fa-solid fa-hashtag"></i>
							<input type="number" name="ticketid" placeholder="e.g. 101" required>
						</div>
					</div>

					<button type="submit" class="primary-btn" style="width: 100%; justify-content: center; margin-top: 10px;">
						<i class="fa-solid fa-search"></i> Check Status
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					int ticketId = Integer.parseInt(request.getParameter("ticketid"));
					TicketDAO dao = new TicketDAO();
					String status = dao.checkStatus(ticketId);
					request.setAttribute("ticketStatus", status);
				}
				%>

				<% if(request.getAttribute("ticketStatus") != null) { %>
					<div style="margin-top: 25px; padding: 20px; background: #f8fafc; border-radius: 12px; border: 1px solid #e2e8f0; text-align: center;">
						<p style="color: #64748b; font-size: 14px; margin-bottom: 5px;">Current Status for Ticket</p>
						<h3 style="color: #0f172a; font-size: 22px;">
							<i class="fa-solid fa-info-circle" style="color: #2563eb;"></i> ${ticketStatus}
						</h3>
					</div>
				<% } %>
			</div>
		</main>
	</div>
</body>
</html>