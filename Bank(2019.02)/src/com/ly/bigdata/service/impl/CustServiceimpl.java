package com.ly.bigdata.service.impl;

import java.util.List;

import com.ly.bigdata.bean.CustInfo;
import com.ly.bigdata.dao.CustDao;
import com.ly.bigdata.dao.impl.CustDaoimpl;
import com.ly.bigdata.service.CustService;

public class CustServiceimpl implements CustService {
private CustDao dao=new CustDaoimpl();
	@Override
	public int addCust(CustInfo cust) {
		// TODO Auto-generated method stub
		return dao.addCust(cust);
	}

	@Override
	public int updCust(CustInfo cust) {
		// TODO Auto-generated method stub
		return dao.updCust(cust);
	}

	@Override
	public int delCustById(int custId) {
		// TODO Auto-generated method stub
		return dao.delCustById(custId);
	}

	@Override
	public CustInfo findCustById(int custId) {
		// TODO Auto-generated method stub
		return dao.findCustById(custId);
	}

	@Override
	public List<CustInfo> findCusts() {
		// TODO Auto-generated method stub
		return dao.findCusts();
	}

	@Override
	public CustInfo login(CustInfo cust) {
		// TODO Auto-generated method stub
		return dao.login(cust);
	}

	@Override
	public List<CustInfo> findByPage(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return dao.findByPage(pageNo,pageSize);
	}

	@Override
	public int countCust() {
		// TODO Auto-generated method stub
		return dao.countCust();
	}

}
