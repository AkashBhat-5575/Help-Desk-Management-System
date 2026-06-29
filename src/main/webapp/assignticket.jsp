<%@ page import="com.dal.TicketDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Assign Ticket - Help Desk</title>
	
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
				<li><a href="admin_dashboard.jsp"><i class="fa-solid fa-chart-line"></i> Admin Panel</a></li>
				<li><a href="viewticket.jsp"><i class="fa-solid fa-list-ul"></i> View Tickets</a></li>
				<li class="active"><a href="assignticket.jsp"><i class="fa-solid fa-user-check"></i> Assign Ticket</a></li>
				<li><a href="deleteticket.jsp"><i class="fa-solid fa-trash-can"></i> Delete Ticket</a></li>
				<li><a href="generatereport.jsp"><i class="fa-solid fa-file-invoice"></i> Reports</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Assign Ticket</h2>
					<p class="welcome-text">Delegate a support ticket to an IT staff member.</p>
				</div>
				<div class="profile"><i class="fa-solid fa-user-shield"></i> Administrator</div>
			</div>

			<div class="quick-actions" style="max-width: 600px;">
				<h3><i class="fa-solid fa-user-tag"></i> Task Delegation Form</h3>
				
				<form action="assignticket.jsp" method="post">
					<div class="input-group">
						<label>Ticket ID</label>
						<div class="input-box">
							<i class="fa-solid fa-hashtag"></i>
							<input type="number" name="ticketid" placeholder="Enter Ticket ID" required>
						</div>
					</div>

					<div class="input-group">
						<label>Assign To (IT Staff ID)</label>
						<div class="input-box">
							<i class="fa-solid fa-id-badge"></i>
							<input type="number" name="assignTo" placeholder="Enter Staff ID" required>
						</div>
					</div>

					<button type="submit" class="primary-btn" style="width: 100%; justify-content: center; margin-top: 10px;">
						<i class="fa-solid fa-paper-plane"></i> Assign Ticket
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					int ticketId = Integer.parseInt(request.getParameter("ticketid"));
					int assignTo = Integer.parseInt(request.getParameter("assignTo"));

					TicketDAO dao = new TicketDAO();
					dao.assignTicket(assignTo, ticketId);

					out.println("<div style='margin-top: 25px; padding: 15px 20px; background: #dcfce3; color: #166534; border-radius: 12px; display: flex; align-items: center; gap: 10px; border: 1px solid #bbf7d0;'>");
					out.println("<i class='fa-solid fa-circle-check'></i> Ticket #" + ticketId + " Assigned Successfully to Staff ID " + assignTo);
					out.println("</div>");
				}
				%>
			</div>
		</main>
	</div>
</body>
</html>