package com.ly.bigdata.dao.impl;

import java.util.List;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.dao.AdminDao;
import com.ly.bigdata.until.DBUtils;

public class AdminDaoimpl implements AdminDao {


	@Override
	public int addAdmin(Admininfo admin) {
		String sql ="insert into admininfo(admin_name,password) values(?,?)";
		return DBUtils.executeSql(sql, admin.getAdminName(),admin.getPassword());
	}

	@Override
	public int updAdmin(Admininfo admin) {
	
		String sql ="update admininfo set admin_name=?,password=? where id=?";
		return DBUtils.executeSql(sql, admin.getAdminName(),admin.getPassword(),admin.getId());
	}

	@Override
	public int delAdminById(int adminId) {
	
		String sql ="delete from admininfo where id=?";
		return DBUtils.executeSql(sql, adminId);
	}

	@Override
	public Admininfo findAdminById(int adminId) {
	
		String sql ="select id,admin_name adminName,password from admininfo where id= ?";
		return DBUtils.executeQueryOne(Admininfo.class,sql,adminId);
	}

	@Override
	public List<Admininfo> findAdmins() {
		String sql = "select id,admin_name adminName,password from admininfo";

		return DBUtils.executeQuery(Admininfo.class,sql);
	}

	@Override
	public Admininfo login(Admininfo admin) {

		String sql = "select id,admin_name adminName,password from admininfo where admin_name= ? and password=?";
		return DBUtils.executeQueryOne(Admininfo.class,sql, admin.getAdminName(), admin.getPassword());
	}

	@Override
	public List<Admininfo> findByPage(Integer pageNo, Integer pageSize) {
		// 2   10
		String sql = "select id,admin_name adminName,password from admininfo LIMIT ?,?";
		return DBUtils.executeQuery(Admininfo.class, sql,(pageNo-1)*pageSize,pageSize);
	}
	
	@Override
	public int countAdmin() {
		String sql = "select id,admin_name adminName,password from admininfo";
		List<Admininfo> list=DBUtils.executeQuery(Admininfo.class, sql);
		return list.size();
	}

}
