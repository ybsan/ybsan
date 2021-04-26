package com.ly.bigdata.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;





@WebServlet("/adminservlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		String type=request.getParameter("type");
		
		try {
			Method method=AdminServlet.class.getDeclaredMethod(type, HttpServletRequest.class,
					HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch  (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e)  {
			
			e.printStackTrace();
		} }
		
		
		
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminService service = new AdminServiceimpl();
		service.addAdmin(new Admininfo(1, username, password));
		response.sendRedirect("adminList");

	}

	
	
	public void upd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminService service = new AdminServiceimpl();
		service.updAdmin(new Admininfo(Integer.parseInt(id),username,password));
		response.sendRedirect("adminList");
	}

  
	}

		
		
