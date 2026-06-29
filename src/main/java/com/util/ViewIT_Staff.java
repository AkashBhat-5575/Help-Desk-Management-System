package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ViewIT_Staff {
	public void viewStaff() throws SQLException
	{
		Connection con = ConnectionUtil.getDbConnection();
		String sqlquery = "select userID,name from user where role=\"IT_Staff\"";
		Statement stmt = con.createStatement();
		ResultSet rset = stmt.executeQuery(sqlquery);
		
		System.out.println("");
		System.out.println("Select by userID");
		while (rset.next())
			System.out.println("ID: "+rset.getInt("userID")+"  Name: "+rset.getString("name"));
		System.out.println("");
	}
}