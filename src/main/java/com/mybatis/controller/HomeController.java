package com.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Controller
@RequestMapping
public class HomeController {
	@Autowired
	InternalResourceViewResolver viewResolver;

	@GetMapping({ "/", "/index" })
	public String home() {
		return "index";
	}

	@GetMapping(value={"/f"},produces={"text/html;charset=utf-8"})
	public String first() {
		System.out.println(111);
		
		return "first";
	}
}
