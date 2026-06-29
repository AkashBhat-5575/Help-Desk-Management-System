<%@page import="com.enums.Ticketstatus"%>
<%@page import="com.pojo.Ticket"%>
<%@page import="com.dal.TicketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Create Ticket - Help Desk</title>
	
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
				<li class="active"><a href="createticket.jsp"><i class="fa-solid fa-plus"></i> Create Ticket</a></li>
				<li><a href="viewticket.jsp"><i class="fa-solid fa-ticket"></i> My Tickets</a></li>
				<li><a href="checkstatus.jsp"><i class="fa-solid fa-circle-check"></i> Check Status</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Create New Ticket</h2>
					<p class="welcome-text">Submit a new request or report an issue.</p>
				</div>
				<div class="profile"><i class="fa-solid fa-user"></i> Employee</div>
			</div>

			<div class="quick-actions" style="max-width: 600px;">
				<h3><i class="fa-solid fa-file-signature"></i> Ticket Details</h3>
				
				<form action="createticket.jsp" method="post">
					
					<div class="input-group">
						<label>User ID</label>
						<div class="input-box">
							<i class="fa-solid fa-id-card"></i>
							<input type="number" name="userid" placeholder="Your Employee ID" required>
						</div>
					</div>

					<div class="input-group">
						<label>Issue Description</label>
						<div class="input-box">
							<i class="fa-solid fa-triangle-exclamation"></i>
							<input type="text" name="issue" placeholder="Briefly describe the problem" required>
						</div>
					</div>

					<div class="input-group">
						<label>Assign To (Optional)</label>
						<div class="input-box">
							<i class="fa-solid fa-user-tag"></i>
							<input type="text" name="assign" placeholder="Specific staff or department">
						</div>
					</div>

					<div class="input-group">
						<label>Initial Status</label>
						<div class="input-box">
							<i class="fa-solid fa-flag"></i>
							<select name="status" class="custom-select" required>
								<% for(Ticketstatus st : Ticketstatus.values()){ %>
									<option value="<%= st.name() %>"><%= st.name() %></option>
								<% } %>
							</select>
						</div>
					</div>

					<button type="submit" class="primary-btn" style="width: 100%; justify-content: center; margin-top: 10px;">
						<i class="fa-solid fa-plus-circle"></i> Create Ticket
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					int userId = Integer.parseInt(request.getParameter("userid"));
					String issue = request.getParameter("issue");
					String assign = request.getParameter("assign");
					String statusStr = request.getParameter("status");

					Ticketstatus status = Ticketstatus.valueOf(statusStr);
					Ticket t = new Ticket();
					t.setUserID(userId);
					t.setTicketIssue(issue);
					t.setTicketAssign(assign);
					t.setStatus(status);

					TicketDAO ticket = new TicketDAO();
					ticket.createTicket(t);
					
					out.println("<div style='margin-top: 25px; padding: 15px 20px; background: #dcfce3; color: #166534; border-radius: 12px; display: flex; align-items: center; gap: 10px; border: 1px solid #bbf7d0;'>");
					out.println("<i class='fa-solid fa-circle-check'></i> Ticket Created Successfully!");
					out.println("</div>");
				}
				%>
			</div>
		</main>
	</div>
</body>
</html>