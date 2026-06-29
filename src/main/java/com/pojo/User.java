package com.pojo;

import com.enums.Role;

public class User {
	private int userId,age;
	private String name,email,pass;
	private Role role;
	private static int count=1;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, int age, String email, String pass,Role role) {
		super();
		this.userId = count++;
		this.age = age;
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.role = role;
		
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public static int getCount() {
		return count;
	}
	public static void setCount(int count) {
		User.count = count;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", age=" + age + ", name=" + name + ", email=" + email + ", pass=" + pass
				+ "]";
	}
}
