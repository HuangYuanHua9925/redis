package com.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.InternalResourceView;

@Controller
@RequestMapping
public class HomeController {
	
	
	@GetMapping({"/","/index"})
	public String home(){
		System.out.println(1);
		return "index";
	}
}
