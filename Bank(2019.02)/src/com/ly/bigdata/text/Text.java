package com.ly.bigdata.text;
import org.junit.Before;
import org.junit.Test;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;

public class Text {
	public AdminService as;
	
	@Before
	public void before() {
		// 测试初始化的一些代码
		as = new AdminServiceimpl();	}
	
	@Test
	public void addAdmin(Admininfo admin) {
		Admininfo adm= new Admininfo(1,"zhangzhang","123456");		
		int addAdmin = as.addAdmin(adm);
		System.out.println(addAdmin);
	}
}
