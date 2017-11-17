package com.mybatis.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.swing.DefaultListCellRenderer.UIResource;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mybatis.config.DBContextHolder;

public class CommonInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getRequestURI().length() > 6) {
			
			String uri = request.getRequestURI().substring(1, request.getRequestURI().length());
			String target = uri.substring(0, uri.indexOf("/"));
			if ("test".equals(target)) {
				DBContextHolder.setDBType(DBContextHolder.DATA_SOURCE_DataSource1);
			}
			if ("db1".equals(target)) {
				DBContextHolder.setDBType(DBContextHolder.DATA_SOURCE_DataSource2);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
