package com.ly.bigdata.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;

@WebServlet("/adminList")
public class AdminListservlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
	Integer pNo=0;
	Integer pSize=0;
	if (pageNo != null && !"".equals(pageNo)) {
		pNo = Integer.parseInt(pageNo);
	} else {
		pNo = 1;
	}

	if (pageSize != null && !"".equals(pageSize)) {
		pSize = Integer.parseInt(pageSize);
	} else {
		pSize = 10;
	}
		
	AdminService service = new AdminServiceimpl();
	// 总记录数
	int total=service.countAdmin();
	// 末页
	int lastPage=0;
	if(total%pSize==0) {
		lastPage=total/pSize;
	}else {
		lastPage=total/pSize+1;
	}
		//分页查询
		
	List<Admininfo> list = service.findByPage(pNo, pSize);
	request.setAttribute("list", list);
	request.setAttribute("pageNo", pNo);
	request.setAttribute("lastPage", lastPage);
		request.getRequestDispatcher("adminList.jsp").forward(request, response);
	}
	
}
