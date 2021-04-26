package com.ly.bigdata.dao.impl;

import java.util.List;

import com.ly.bigdata.bean.CustInfo;
import com.ly.bigdata.dao.CustDao;
import com.ly.bigdata.until.DBUtils;

public class CustDaoimpl implements CustDao {

	@Override
	public int addCust(CustInfo cust) {
		// TODO Auto-generated method stub
		String sql="insert into custinfo(cust_name,password,idcard,money,create_date,update_date) values(?,?,?,?,?,?)";
		return DBUtils.executeSql(sql, cust.getCustName(),cust.getPassword(),cust.getIdcard(),cust.getMoney(),cust.getCreateDate(),cust.getUpdateDate());
	}

	@Override
	public int updCust(CustInfo cust) {
		// TODO Auto-generated method stub
		String sql="update custinfo SET cust_name=?,password=?,idcard=?,money=?,update_date=? where id=?";
		return DBUtils.executeSql(sql, cust.getCustName(),cust.getPassword(),cust.getIdcard(),cust.getMoney(),cust.getUpdateDate(),cust.getCustId());
	}

	@Override
	public int delCustById(int custId) {
		// TODO Auto-generated method stub
		String sql="delete from custinfo where id=?";
		return DBUtils.executeSql(sql, custId);
	}

	@Override
	public CustInfo findCustById(int custId) {
		// TODO Auto-generated method stub
		String sql="select id custId,cust_name custName,password,idcard,money,create_date createDate,update_date updateDate from custinfo where id=?";
		return DBUtils.executeQueryOne(CustInfo.class, sql, custId);
	}

	@Override
	public List<CustInfo> findCusts() {
		// TODO Auto-generated method stub
		String sql = "select id custId,cust_name custName,password,idcard,money,create_date createDate,update_date updateDate from custinfo";
		return DBUtils.executeQuery(CustInfo.class, sql);
	}

	@Override
	public CustInfo login(CustInfo cust) {
		// TODO Auto-generated method stub
		String sql="select id custId,cust_name custName,password,idcard,money,create_date createDate,update_date updateDate from custinfo where cust_name= ? and password= ?";
		return DBUtils.executeQueryOne(CustInfo.class,sql, cust.getCustName(), cust.getPassword());
	}

	@Override
	public List<CustInfo> findByPage(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		String sql ="select id custId,cust_name custName,password,idcard,money,create_date createDate,update_date updateDate from custinfo LIMIT ?,?";
		return DBUtils.executeQuery(CustInfo.class, sql, (pageNo-1)*pageSize,pageSize);
	}

	@Override
	public int countCust() {
		// TODO Auto-generated method stub
		String sql ="select id custId,cust_name custName,password,idcard,money,create_date createDate,update_date updateDate from custinfo";
		List<CustInfo> list=DBUtils.executeQuery(CustInfo.class, sql);
		return list.size();
	}
}
