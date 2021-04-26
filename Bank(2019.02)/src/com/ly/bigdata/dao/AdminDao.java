package com.ly.bigdata.dao;

import java.util.List;


import com.ly.bigdata.bean.Admininfo;

public interface AdminDao {
	
	public int addAdmin(Admininfo admin);

	public int updAdmin(Admininfo admin);

	public int delAdminById(int adminId);

	public Admininfo findAdminById(int adminId);

	public List<Admininfo> findAdmins();
	
	public Admininfo login(Admininfo admin);
	
	public List<Admininfo> findByPage(Integer pageNo,Integer pageSize);
	
	public int countAdmin(); 
}




