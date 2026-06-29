package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {

	public static Connection getDbConnection()
	{
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/help_desk", "YOUR_DB_USERNAME","YOUR_DB_PASSWORD");
			
			return con;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
