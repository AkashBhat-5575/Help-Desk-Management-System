package com.pages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dal.UserDAO;
import com.enums.Role;
import com.pojo.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public RegisterServlet() {
        super();
    }

//	public void init(ServletConfig config) throws ServletException {
//	}

//	public void destroy() {
//	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("txtname");
		int age = Integer.parseInt(request.getParameter("txtage"));
		String uname = request.getParameter("txtuname");
		String pass = request.getParameter("txtpass");
		Role r = Role.valueOf(request.getParameter("role"));
		User u = new User(name,age,uname,pass,r);
		UserDAO user = new UserDAO();
		try {
			user.register(u);
			response.sendRedirect("login.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
