package com.ww.yaksokapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	
	@RequestMapping("/start")
	public void showStart() {
	}
	
	@RequestMapping("/main")
	public void showMain() {
	}
	
	@RequestMapping("/top")
	public void showTop() {
	}
			
	@RequestMapping("/foot")
	public void showFoot() {
	}
	
	@RequestMapping("/msg")
	public void showMsg() {
	}

}
