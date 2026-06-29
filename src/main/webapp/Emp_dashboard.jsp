<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dal.TicketDAO" %>
<%@ page import="com.pojo.Ticket" %>
<%@ page import="java.util.ArrayList" %>

<%
	// Initialize DAO and fetch tickets
	TicketDAO ticketDAO = new TicketDAO();
	ArrayList<Ticket> ticketList = ticketDAO.viewTicket();
	
	// Variables to hold our dynamic counts
	int totalTickets = 0;
	int openTickets = 0;
	int inProgressTickets = 0;
	int resolvedTickets = 0;
	
	// Calculate metrics if the database returned data
	if(ticketList != null) {
		totalTickets = ticketList.size();
		for(Ticket t : ticketList) {
			if(t.getStatus() != null) {
				String statusStr = t.getStatus().toString().toLowerCase();
				if(statusStr.contains("open") || statusStr.contains("new")) {
					openTickets++;
				} else if(statusStr.contains("progress")) {
					inProgressTickets++;
				} else if(statusStr.contains("resolve") || statusStr.contains("close")) {
					resolvedTickets++;
				}
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Employee Dashboard</title>
	
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
					<a href="Emp_dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a>
				</li>
				<li>
					<a href="createticket.jsp"><i class="fa-solid fa-plus"></i> Create Ticket</a>
				</li>
				<li>
					<a href="viewticket.jsp"><i class="fa-solid fa-ticket"></i> My Tickets</a>
				</li>
				<li>
					<a href="checkstatus.jsp"><i class="fa-solid fa-circle-check"></i> Check Status</a>
				</li>
				<li>
					<a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
				</li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Employee Dashboard</h2>
					<p class="welcome-text">Welcome back! Manage your support tickets from one place.</p>
				</div>
				<div class="profile">
					<i class="fa-solid fa-user"></i> Employee
				</div>
			</div>

			<div class="cards">
				<div class="card">
					<i class="fa-solid fa-ticket"></i>
					<h3>Total Tickets</h3>
					<p><%= totalTickets %></p>
				</div>
				<div class="card">
					<i class="fa-solid fa-folder-open"></i>
					<h3>Open Tickets</h3>
					<p><%= openTickets %></p>
				</div>
				<div class="card">
					<i class="fa-solid fa-spinner"></i>
					<h3>In Progress</h3>
					<p><%= inProgressTickets %></p>
				</div>
				<div class="card">
					<i class="fa-solid fa-circle-check"></i>
					<h3>Resolved</h3>
					<p><%= resolvedTickets %></p>
				</div>
			</div>

			<div class="quick-actions">
				<h3><i class="fa-solid fa-bolt"></i> Quick Actions</h3>
				<div class="action-buttons">
					<a href="createticket.jsp" class="primary-btn"> 
						<i class="fa-solid fa-plus"></i> Create Ticket
					</a> 
					<a href="viewticket.jsp" class="secondary-btn"> 
						<i class="fa-solid fa-ticket"></i> My Tickets
					</a> 
					<a href="checkstatus.jsp" class="secondary-btn"> 
						<i class="fa-solid fa-magnifying-glass"></i> Check Status
					</a>
				</div>
			</div>

			<div class="quick-actions">
				<h3><i class="fa-solid fa-clock-rotate-left"></i> Recent Activity</h3>
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<th>Ticket ID</th>
								<th>Issue</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								int displayCount = 0;
								if(ticketList != null && !ticketList.isEmpty()) {
									// Iterate backwards to show the most recently added tickets first
									for(int i = ticketList.size() - 1; i >= 0 && displayCount < 3; i--) {
										Ticket t = ticketList.get(i);
										
										// Determine badge color dynamically
										String badgeClass = "progress";
										if (t.getStatus() != null) {
											String stat = t.getStatus().toString().toLowerCase();
											if (stat.contains("open") || stat.contains("new")) badgeClass = "open";
											else if (stat.contains("resolve") || stat.contains("close")) badgeClass = "resolved";
										}
							%>
										<tr>
											<td><strong>#<%= t.getTicketID() %></strong></td>
											<td><%= t.getTicketIssue() %></td>
											<td><span class="status-badge <%= badgeClass %>"><%= t.getStatus() %></span></td>
										</tr>
							<%
										displayCount++;
									}
								}
								// Fallback if the database is completely empty
								if (displayCount == 0) {
							%>
									<tr>
										<td colspan="3" style="text-align: center; color: #94a3b8; padding: 20px;">No recent activity found.</td>
									</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>

		</main>
	</div>

</body>
</html>