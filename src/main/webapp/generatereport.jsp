<%@ page import="com.dal.TicketDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Generate Report - Help Desk</title>
	
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
				<li><a href="deleteticket.jsp"><i class="fa-solid fa-trash-can"></i> Delete Ticket</a></li>
				<li class="active"><a href="generatereport.jsp"><i class="fa-solid fa-file-invoice"></i> Reports</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<div class="topbar">
				<div>
					<h2>Generate Ticket Report</h2>
					<p class="welcome-text">Compile system data into an analytical overview.</p>
				</div>
				<div class="profile"><i class="fa-solid fa-user-shield"></i> Administrator</div>
			</div>

			<div class="quick-actions" style="max-width: 600px; text-align: center; padding: 50px 30px;">
				<i class="fa-solid fa-file-export" style="font-size: 60px; color: #3b82f6; margin-bottom: 20px;"></i>
				<h3 style="justify-content: center;">System Diagnostics</h3>
				<p style="color: #64748b; margin-bottom: 30px;">Click the button below to trigger the backend database compilation process and generate a fresh ticket report.</p>
				
				<form action="generatereport.jsp" method="post">
					<button type="submit" class="primary-btn" style="padding: 16px 32px; font-size: 16px;">
						<i class="fa-solid fa-gears"></i> Initialize Report Generation
					</button>
				</form>

				<%
				if(request.getMethod().equalsIgnoreCase("POST")){
					TicketDAO dao = new TicketDAO();
					dao.generateReport();
					
					out.println("<div style='margin-top: 35px; padding: 15px 20px; background: #dcfce3; color: #166534; border-radius: 12px; display: inline-flex; align-items: center; gap: 10px; border: 1px solid #bbf7d0; text-align: left;'>");
					out.println("<i class='fa-solid fa-circle-check'></i> Database Report Generated Successfully");
					out.println("</div>");
				}
				%>
			</div>
		</main>
	</div>
</body>
</html>