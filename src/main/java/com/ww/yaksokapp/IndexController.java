package com.ww.yaksokapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	
	@RequestMapping("/start")
	public String showStart() {
		return "start";
	}
	
	@RequestMapping("/main")
	public String showMain() {
		return "main";
	}

}
