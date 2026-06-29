<%@page import="com.dal.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pojo.Ticket"%>
<%@page import="com.dal.TicketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>View Tickets - Help Desk</title>
	
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
				<li>
					<a href="javascript:history.back()"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
				</li>
				<li class="active">
					<a href="viewticket.jsp"><i class="fa-solid fa-list-check"></i> View Records</a>
				</li>
				<li>
					<a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
				</li>
			</ul>
		</aside>

		<main class="main-content">
			
			<div class="topbar">
				<div>
					<h2>Ticket Directory</h2>
					<p class="welcome-text">Comprehensive overview of system support tickets.</p>
				</div>
			</div>

			<div class="quick-actions">
				<h3><i class="fa-solid fa-layer-group"></i> All Tickets</h3>
				
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<th>Ticket ID</th>
								<th>User ID</th>
								<th>Issue</th>
								<th>Assigned To</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							TicketDAO ticketDAO = new TicketDAO();
							ArrayList<Ticket> list = ticketDAO.viewTicket();
							
							for (Ticket t : list) {
								// Logic to dynamically color-code the status badge
								String badgeClass = "progress"; // Default yellow
								if (t.getStatus() != null) {
									String stat = t.getStatus().toString().toLowerCase();
									if (stat.contains("open") || stat.contains("new")) badgeClass = "open"; // Red
									else if (stat.contains("resolve") || stat.contains("close")) badgeClass = "resolved"; // Green
								}
							%>
							<tr>
								<td><strong>#<%=t.getTicketID()%></strong></td>
								<td><%=t.getUserID()%></td>
								<td><%=t.getTicketIssue()%></td>
								<td>
									<% if(t.getTicketAssign() != null && !t.getTicketAssign().trim().isEmpty()) { %>
										<i class="fa-solid fa-user-tag" style="color: #94a3b8; margin-right: 5px;"></i> <%=t.getTicketAssign()%>
									<% } else { %>
										<span style="color: #94a3b8; font-style: italic;">Unassigned</span>
									<% } %>
								</td>
								<td><span class="status-badge <%=badgeClass%>"><%=t.getStatus()%></span></td>
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