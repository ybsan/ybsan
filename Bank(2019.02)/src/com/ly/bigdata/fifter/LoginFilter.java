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
		// ��¼��֤
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("ADMIN_NAME");
		String path = req.getRequestURI();
		// ������������д�뵽���ݿ���
		Set<String> uris = new HashSet<>();
		uris.add("/Bank/doLogin");
		uris.add("/Bank/login.jsp");

		if (uris.contains(path)) {
			chain.doFilter(request, response);
		} else {
			// �ж��Ƿ��¼��
			if (obj == null) {
				// δ��¼����ת����¼ҳ��
				res.sendRedirect("login.jsp");
				//req.getRequestDispatcher("login.jsp").forward(req, res);
			} else {
				// ��¼����
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void destroy() {

	}

}
