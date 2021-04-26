package com.ly.bigdata.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;

@WebServlet("/toupadmin")
public class toupAdminservlet extends HttpServlet{

	private static final long serialVersionUID = 9060010535915162750L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminId = request.getParameter("id");
		AdminService service = new AdminServiceimpl();
		Admininfo admin = service.findAdminById(Integer.parseInt(adminId));
		request.setAttribute("admin", admin);
		request.getRequestDispatcher("upadmin.jsp").forward(request, response);
	}
}
