package com.ly.bigdata.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;

/**
 * Servlet implementation class doDelservlet
 */
@WebServlet("/doDelservlet")
public class doDelservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminId = request.getParameter("id");
		AdminService service = new AdminServiceimpl();
		service.delAdminById(Integer.parseInt(adminId));
		response.sendRedirect("adminList");
	}


}
