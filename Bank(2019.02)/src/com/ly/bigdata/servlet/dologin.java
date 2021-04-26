package com.ly.bigdata.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ly.bigdata.bean.Admininfo;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.impl.AdminServiceimpl;


@WebServlet("/doLogin")
public class dologin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberme = request.getParameter("rememberme");
		
		if (rememberme != null) {
			Cookie USER_NAME = new Cookie("USERNAME", username);
			USER_NAME.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(USER_NAME);
		}
		
			AdminService service = new AdminServiceimpl();
		Admininfo admin = service.login(new Admininfo(1, username, password));

		if (admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("ADMIN_NAME", admin.getAdminName());
			response.sendRedirect("home.jsp");
		} else {
			request.setAttribute("msg", "”√ªß√‹¬Î¥ÌŒÛ£°");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
