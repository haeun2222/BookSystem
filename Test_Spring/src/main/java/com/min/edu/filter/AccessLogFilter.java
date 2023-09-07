package com.min.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AccessLogFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(AccessLogFilter.class);
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.info("들어왔습니다");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String remoteAddr = req.getRemoteAddr();
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		
		String queryString = req.getQueryString();
		 
		StringBuffer sb = new StringBuffer();
		sb.append(remoteAddr).append(":").append(url).append(":");
		
		logger.info("Logger Filter{}", sb.toString());
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		logger.info("나갔습니다");
	}

}
