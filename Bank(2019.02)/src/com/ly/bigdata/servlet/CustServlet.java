package com.ly.bigdata.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ly.bigdata.bean.CustInfo;
import com.ly.bigdata.service.CustService;
import com.ly.bigdata.service.impl.CustServiceimpl;




@WebServlet("/CustServlet")
public class CustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		String type=request.getParameter("type");


		try {
			Method method=CustServlet.class.getDeclaredMethod(type, HttpServletRequest.class,
					HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch  (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e)  {
			e.printStackTrace();
		} }
	
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
	String custname = request.getParameter("custname");
	String password = request.getParameter("password");
	String idcard = request.getParameter("idcard");
	String money = request.getParameter("money");
	CustService service = new CustServiceimpl();
	CustInfo cust = new CustInfo(1,custname,password,idcard,Double.parseDouble(money),new Date(), new Date());
	service.addCust(cust);
	response.sendRedirect("custList");
	}
	public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String custID = request.getParameter("id");
		CustService service = new CustServiceimpl();
		service.delCustById(Integer.parseInt(custID));
		response.sendRedirect("custList.jsp");
	}
	public void upd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String custId=request.getParameter("id");
		String custname = request.getParameter("custname");
		String password = request.getParameter("password");
		String idcard = request.getParameter("idcard");
		String money = request.getParameter("money");
		CustService service = new CustServiceimpl();
		CustInfo cust = new CustInfo(Integer.parseInt(custId),custname,password,idcard,Double.parseDouble(money),null,new Date());
		service.updCust(cust);
		response.sendRedirect("custList");
	}
}
