package com.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.pojo.User;

import com.enums.Role;
import com.util.ConnectionUtil;

public class UserDAO{
	static Connection con = ConnectionUtil.getDbConnection();
	Scanner sc = new Scanner(System.in);
	public void register(User user) throws SQLException
	{
		String sqlquery = "insert into user values (?,?,?,?,?,?)";
		System.out.println("Enter your name,age,email,password");
		PreparedStatement pstmt = con.prepareStatement(sqlquery);
		pstmt.setInt(1,0);
		pstmt.setString(2,user.getName());
		pstmt.setInt(3,user.getAge());
		pstmt.setString(4,user.getEmail());
		pstmt.setString(5,user.getPass());
//		System.out.println("Enter 1 for Admin, 2 for Employee, 3 for IT_Staff");
//		int choice=sc.nextInt();
//		Role role=null;
//		if (choice==1)
//			role=Role.Admin;
//		else if (choice==2)
//			role=Role.Employee;
//		else if (choice==3)
//			role=Role.IT_Staff;
//		else
//			System.err.println("Retry, Invalid Choice");
		pstmt.setString(6,user.getRole().name());
		@SuppressWarnings("unused")
		int row = pstmt.executeUpdate();
		System.out.println("");
		System.out.println("-----Registered-----");
		System.out.println("");
	}
	
	public boolean login(String email, String pass) throws SQLException 
	{
		String sqlquery = "select * from user where email=? and password=?";
		
		PreparedStatement pstmt = con.prepareStatement(sqlquery);
		pstmt.setString(1,email);
		pstmt.setString(2,pass);
		
		ResultSet rset = pstmt.executeQuery();
		return rset.next();	
	}
	public String getrole(String email) throws SQLException
	{
		String sqlquery = "select role from user where email=?";
		PreparedStatement pstmt = con.prepareStatement(sqlquery);
		pstmt.setString(1,email);
		ResultSet rset = pstmt.executeQuery();
		while (rset.next())
			return rset.getString("role");
		return null; 
	}
}
