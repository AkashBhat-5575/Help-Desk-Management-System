package com.pojo;

import com.enums.Ticketstatus;

public class Ticket {
	private int ticketID;
	private int userID;
	private String ticketAssign;
	private String ticketIssue;
	private Ticketstatus status;
	
	private static int count =1;

	public Ticket() {
		super();
	}
	public Ticket(String ticketIssue,Ticketstatus status,String ticketAssign) {
		super();
		this.ticketID = count++;
		this.ticketAssign = ticketAssign;
		this.ticketIssue = ticketIssue;
		this.status = status;
	}
	public int getTicketID() {
		return ticketID;
	}
	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getTicketAssign() {
		return ticketAssign;
	}
	public void setTicketAssign(String ticketAssign) {
		this.ticketAssign = ticketAssign;
	}
	public String getTicketIssue() {
		return ticketIssue;
	}
	public void setTicketIssue(String ticketIssue) {
		this.ticketIssue = ticketIssue;
	}
	public Ticketstatus getStatus() {
		return status;
	}
	public void setStatus(Ticketstatus status) {
		this.status = status;
	}
	public static int getCount() {
		return count;
	}
	public static void setCount(int count) {
		Ticket.count = count;
	}
	@Override
	public String toString() {
		return "Ticket [ticketID=" + ticketID + ", ticketContent=" + ticketIssue + ", ticketAssign=" + ticketAssign
				+", status=" + status + "]";
	}
}
