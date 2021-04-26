package com.ly.bigdata.service;

import java.util.List;

import com.ly.bigdata.bean.CustInfo;

public interface CustService {

	public int addCust(CustInfo cust);

	public int updCust(CustInfo cust);

	public int delCustById(int custId);

	public CustInfo findCustById(int custId);

	public List<CustInfo> findCusts();

	public CustInfo login(CustInfo cust);
	
	public List<CustInfo> findByPage(Integer pageNo,Integer pageSize);
	
	public int countCust();
}
