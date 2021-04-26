package com.ly.bigdata.bean;

public class Admininfo {
	private int id;
	private String adminName;
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Admininfo(int id, String adminName, String password) {
		super();
		this.id = id;
		this.adminName = adminName;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admininfo [id=" + id + ", adminName=" + adminName + ", password=" + password + "]";
	}
	public Admininfo() {
		super();
		// TODO Auto-generated constructor stub
	}
}
