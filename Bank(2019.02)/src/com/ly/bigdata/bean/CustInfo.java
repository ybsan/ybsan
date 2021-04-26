package com.ly.bigdata.bean;

import java.util.Date;

public class CustInfo {
	private int custId;
	private String custName;
	private String password;
	private String idcard;
	private double money;
	private Date createDate;
	private Date updateDate;
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "Custinfo [custId=" + custId + ", custName=" + custName + ", password=" + password + ", idcard=" + idcard
				+ ", money=" + money + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	public CustInfo(int custId, String custName, String password, String idcard, double money, Date createDate,
			Date updateDate) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.password = password;
		this.idcard = idcard;
		this.money = money;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public CustInfo() {
		super();

	}

	
	
	
}
