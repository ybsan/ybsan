package com.ly.bigdata.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ly.bigdata.service.CustService;
import com.ly.bigdata.service.impl.CustServiceimpl;



@WebServlet("/doDelcustServlet")
public class doDelcustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
  
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String custId = request.getParameter("id");
		CustService service = new CustServiceimpl();
		service.delCustById(Integer.parseInt(custId));
		response.sendRedirect(request.getContextPath()+"/custList");
	}
	}

