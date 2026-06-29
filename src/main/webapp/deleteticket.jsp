<%@ page import="com.dal.TicketDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Delete Ticket - Help Desk</title>
	
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
				<li><a href="assignticket.jsp"><i class="fa-solid fa-user-check"></i> Assign Ticket</a></li>
				<li class="active"><a href="deleteticket.jsp"><i class="fa-solid fa-trash-can"></i> Delete Ticket</a></li>
				<li><a href="generatereport.jsp"><i class="fa-solid fa-file-invoice"></i> Reports</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Delete Ticket</h2>
					<p class="welcome-text">Permanently remove a ticket from the system.</p>
				</div>
				<div class="profile"><i class="fa-solid fa-user-shield"></i> Administrator</div>
			</div>

			<div class="quick-actions" style="max-width: 600px;">
				<h3 style="color: #ef4444;"><i class="fa-solid fa-triangle-exclamation"></i> Danger Zone</h3>
				
				<form action="deleteticket.jsp" method="post">
					<div class="input-group">
						<label>Ticket ID to Delete</label>
						<div class="input-box">
							<i class="fa-solid fa-hashtag"></i>
							<input type="number" name="ticketid" placeholder="Enter Ticket ID" required>
						</div>
					</div>

					<button type="submit" class="primary-btn" style="width: 100%; justify-content: center; margin-top: 10px; background: #ef4444; box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);">
						<i class="fa-solid fa-trash"></i> Permanently Delete
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					int ticketId = Integer.parseInt(request.getParameter("ticketid"));
					TicketDAO dao = new TicketDAO();
					dao.deleteTicket(ticketId);

					out.println("<div style='margin-top: 25px; padding: 15px 20px; background: #fee2e2; color: #b91c1c; border-radius: 12px; display: flex; align-items: center; gap: 10px; border: 1px solid #fecaca;'>");
					out.println("<i class='fa-solid fa-trash-check'></i> Ticket #" + ticketId + " Deleted Successfully");
					out.println("</div>");
				}
				%>
			</div>
		</main>
	</div>
</body>
</html>