<%@ page import="com.dal.TicketDAO" %>
<%@ page import="com.enums.Ticketstatus" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Update Status - Help Desk</title>
	
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
					<a href="IT_dashboard.jsp"><i class="fa-solid fa-laptop-code"></i> IT Panel</a>
				</li>
				<li>
					<a href="viewticket.jsp"><i class="fa-solid fa-list-check"></i> View Tickets</a>
				</li>
				<li class="active">
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
					<h2>Update Ticket Status</h2>
					<p class="welcome-text">Modify the current progress status of an assigned ticket.</p>
				</div>
				<div class="profile">
					<i class="fa-solid fa-user-gear"></i> IT Technician
				</div>
			</div>

			<div class="quick-actions" style="max-width: 600px;">
				<h3><i class="fa-solid fa-bars-progress"></i> Status Update Form</h3>
				
				<form action="updatestatus.jsp" method="post">
					
					<div class="input-group">
						<label>Ticket ID</label>
						<div class="input-box">
							<i class="fa-solid fa-hashtag"></i>
							<input type="number" name="ticketid" placeholder="Enter Ticket ID" required>
						</div>
					</div>

					<div class="input-group">
						<label>New Status</label>
						<div class="input-box">
							<i class="fa-solid fa-thermometer"></i>
							<select name="status" class="custom-select" required>
								<option value="" disabled selected>Select new status...</option>
								<%
								for(Ticketstatus st : Ticketstatus.values()){
								%>
									<option value="<%= st.name() %>"><%= st.name() %></option>
								<%
								}
								%>
							</select>
						</div>
					</div>

					<button type="submit" class="primary-btn" style="width: 100%; justify-content: center; margin-top: 10px;">
						<i class="fa-solid fa-floppy-disk"></i> Save Update
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					int ticketId = Integer.parseInt(request.getParameter("ticketid"));
					Ticketstatus status = Ticketstatus.valueOf(request.getParameter("status"));

					TicketDAO dao = new TicketDAO();
					dao.updateStatus(status, ticketId);

					// Styled success message instead of a plain h3
					out.println("<div style='margin-top: 25px; padding: 15px 20px; background: #dcfce3; color: #166534; border-radius: 12px; font-weight: 500; display: flex; align-items: center; gap: 10px; border: 1px solid #bbf7d0;'>");
					out.println("<i class='fa-solid fa-circle-check' style='font-size: 18px;'></i> Status Updated Successfully for Ticket #" + ticketId);
					out.println("</div>");
				}
				%>
			</div>
		</main>
	</div>

</body>
</html>