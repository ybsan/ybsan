package com.ly.bigdata.fifter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class LoginFilter implements Filter {

	private Set<String> uris1=new HashSet<String>();
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String url=filterConfig.getInitParameter("url");
		String[] urls=url.split(",");
		for(String s:urls) {
			uris1.add(s);
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 登录认证
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("ADMIN_NAME");
		String path = req.getRequestURI();
		// 白名单，可以写入到数据库中
		Set<String> uris = new HashSet<>();
		uris.add("/Bank/doLogin");
		uris.add("/Bank/login.jsp");

		if (uris.contains(path)) {
			chain.doFilter(request, response);
		} else {
			// 判断是否登录，
			if (obj == null) {
				// 未登录，跳转到登录页面
				res.sendRedirect("login.jsp");
				//req.getRequestDispatcher("login.jsp").forward(req, res);
			} else {
				// 登录放行
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void destroy() {

	}

}
