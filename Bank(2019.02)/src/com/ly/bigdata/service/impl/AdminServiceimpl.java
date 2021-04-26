package com.ly.bigdata.service.impl;

import java.util.List;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.dao.AdminDao;
import com.ly.bigdata.dao.impl.AdminDaoimpl;
import com.ly.bigdata.service.AdminService;

public class AdminServiceimpl implements AdminService{

	

	private AdminDao dao = new AdminDaoimpl();

	@Override
	public int addAdmin(Admininfo admin) {
		// TODO Auto-generated method stub
		return dao.addAdmin(admin);
	}

	@Override
	public int updAdmin(Admininfo admin) {
		// TODO Auto-generated method stub
		return dao.updAdmin(admin);
	}

	@Override
	public int delAdminById(int adminId) {
		// TODO Auto-generated method stub
		return dao.delAdminById(adminId);
	}

	@Override
	public Admininfo findAdminById(int adminId) {
		// TODO Auto-generated method stub
		return dao.findAdminById(adminId);
	}

	@Override
	public List<Admininfo> findAdmins() {
		// TODO Auto-generated method stub
		return dao.findAdmins();
	}

	@Override
	public Admininfo login(Admininfo admin) {
		// TODO Auto-generated method stub
		return dao.login(admin);
	}

	@Override
	public List<Admininfo> findByPage(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return dao.findByPage(pageNo,pageSize);
	}

	@Override
	public int countAdmin() {
		// TODO Auto-generated method stub
		return dao.countAdmin();
	}
 
	
}
