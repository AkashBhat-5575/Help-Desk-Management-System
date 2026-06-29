package com.pages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.ldap.Rdn;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dal.UserDAO;
import com.util.ConnectionUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

//	public void init(ServletConfig config) throws ServletException {
//		Connection con = ConnectionUtil.getDbConnection();
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
		PrintWriter pw = response.getWriter();
		UserDAO user = new UserDAO();
		try {
			boolean check= user.login(request.getParameter("txtuname"), request.getParameter("txtpass"));
			if (check==true) {
				String role = user.getrole(request.getParameter("txtuname"));
				HttpSession session = request.getSession(); 
				session.setAttribute("role",role);
				if (role.equals("Admin"))
					response.sendRedirect("admin_dashboard.jsp");
				if (role.equals("Employee"))
					response.sendRedirect("Emp_dashboard.jsp");
				if (role.equals("IT_Staff"))
					response.sendRedirect("IT_dashboard.jsp");
			}
			else {
				response.sendRedirect("login.jsp");
				pw.print("Invalid Credentials");
			}

		} catch (SQLException e) {
			System.err.println("No database Found");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

//	public void destroy() {
//	}

}
