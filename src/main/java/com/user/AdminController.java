package com.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin/listAdmin")
	public String showListAdmin() {
		
		return"admin/list_admin";
	}
	
	@GetMapping("/admin/yaksokAdmin")
	public String showYaksokAdmin() {
		
		return"admin/yaksok_admin";
	}
	
	@GetMapping("/admin/CustomerServiceAdmin")
	public String showCustomerServiceAdmin() {
		
		return"admin/customerService_admin";
	}
	
	
}