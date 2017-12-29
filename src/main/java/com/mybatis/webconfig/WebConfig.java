package com.mybatis.webconfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.mybatis.interceptor.CommonInterceptor;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(new CommonInterceptor());
	}

	
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/pages/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setViewClass(JstlView.class);
	
		viewResolver.setOrder(1);
		return viewResolver;
	}
}
