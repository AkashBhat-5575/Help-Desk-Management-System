package com.dal;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import com.enums.Ticketstatus;
import com.pojo.Ticket;
import com.util.ConnectionUtil;
import com.util.ViewIT_Staff;

public class TicketDAO {
	Scanner sc = new Scanner(System.in);
	Connection con = ConnectionUtil.getDbConnection();
	ViewIT_Staff view = new ViewIT_Staff();

	public void createTicket(Ticket ticket) throws SQLException {
		String sqlquery = "insert into ticket values (?,?,?,?,?)";
		try {
			view.viewStaff();
			System.out.println("Enter your empid,issue,assign");
			PreparedStatement pstmt = con.prepareStatement(sqlquery);
			pstmt.setInt(1,0);
			pstmt.setInt(2,ticket.getUserID());
			pstmt.setString(3,ticket.getTicketIssue());
			if (ticket.getTicketAssign() == null || ticket.getTicketAssign().trim().isEmpty()) {
			    // If the form was left blank, explicitly send a database NULL
			    pstmt.setNull(4, java.sql.Types.INTEGER);
			} else {
			    // If they typed a number, convert it and send it
			    pstmt.setInt(4, Integer.parseInt(ticket.getTicketAssign())); 
			}
			pstmt.setString(5,ticket.getStatus().name());
			int row = pstmt.executeUpdate();
			System.out.println("");
			System.out.println("-----Ticket Registered-----");
			System.out.println("");
		} catch (Exception e) {
			System.err.println("No user found");
			e.printStackTrace();
		}
	}

	public ArrayList<Ticket> viewTicket() {
		ArrayList<Ticket> list = new ArrayList<>();
		String sqlquery = "select * from ticket";
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rset = stmt.executeQuery(sqlquery);
			while (rset.next()) {
				 Ticket t = new Ticket();
			        t.setTicketID(rset.getInt("ticketID"));
			        t.setUserID(rset.getInt("userID"));
			        t.setTicketIssue(rset.getString("issue"));
			        t.setTicketAssign(rset.getString("assign_to"));
			        t.setStatus(Ticketstatus.valueOf(rset.getString("status")));

			        list.add(t);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void viewTicket(int id) throws SQLException {
		String sqlquery = "select * from ticket where userID=?";
		PreparedStatement pstmt = con.prepareStatement(sqlquery);
		pstmt.setInt(1, id);
		ResultSet rset = pstmt.executeQuery();
		while (rset.next()) {
			System.out.println("TicketID:" + rset.getInt("ticketID") + " UserID:" + rset.getInt("userID") + " Issue:"
					+ rset.getString("issue") + " Assigned:" + rset.getString("assign_to") + " Status:"
					+ rset.getString("status"));
		}
	}
	public ArrayList<Ticket> viewAssignedTicket(int id) throws SQLException {
	    ArrayList<Ticket> list = new ArrayList<>();
	    String sqlquery = "select * from ticket where assign_to=?";

	    PreparedStatement pstmt = con.prepareStatement(sqlquery);
	    pstmt.setInt(1, id);
	    ResultSet rset = pstmt.executeQuery();

	    while (rset.next()) {
	        Ticket t = new Ticket();
	        t.setTicketID(rset.getInt("ticketID"));
	        t.setUserID(rset.getInt("userID"));
	        t.setTicketIssue(rset.getString("issue"));
	        t.setTicketAssign(rset.getString("assign_to"));
	        t.setStatus(Ticketstatus.valueOf(rset.getString("status")));

	        list.add(t);
	    }

	    return list;
	}
	public void assignTicket(int assignTo, int ticketId) throws SQLException {
	    String sqlquery = "update ticket set assign_to=? where ticketID=?";

	    PreparedStatement pstmt = con.prepareStatement(sqlquery);
	    pstmt.setInt(1, assignTo);
	    pstmt.setInt(2, ticketId);

	    pstmt.executeUpdate();
	}

	public void updateStatus(Ticketstatus status, int ticketId) throws SQLException 
	{
		String sqlquery = "update ticket set status=? where ticketID=?";

		PreparedStatement pstmt = con.prepareStatement(sqlquery);
		pstmt.setString(1, status.name());
		pstmt.setInt(2, ticketId);

		pstmt.executeUpdate();
	}

	public void deleteTicket(int ticketId) throws SQLException {
	    String sqlquery = "delete from ticket where ticketID=?";

	    PreparedStatement pstmt = con.prepareStatement(sqlquery);
	    pstmt.setInt(1, ticketId);

	    pstmt.executeUpdate();
	}
	
	public String checkStatus(int ticketID) {
	    String sqlquery = "select status from ticket where ticketID=?";
	    PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sqlquery);
			pstmt.setInt(1, ticketID);

		    ResultSet rset = pstmt.executeQuery();

		    if (rset.next()) {
		        return rset.getString("status");
		    }

		    return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void generateReport() throws IOException, SQLException {
	    FileWriter fw = new FileWriter("Report.txt");
	    String sqlquery = "select * from ticket";
	    Statement stmt = con.createStatement();
	    ResultSet rset = stmt.executeQuery(sqlquery);

	    while (rset.next()) {
	        fw.write("TicketID: " + rset.getInt("ticketID")
	                + "\nUserID: " + rset.getInt("userID")
	                + "\nIssue: " + rset.getString("issue")
	                + "\nAssigned: " + rset.getString("assign_to")
	                + "\nStatus: " + rset.getString("status"));
	        fw.write("\n-----------------\n");
	    }

	    fw.close();
	}
}
