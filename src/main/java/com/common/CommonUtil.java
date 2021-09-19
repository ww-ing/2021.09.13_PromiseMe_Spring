package com.common;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class CommonUtil {
	
	public static String addMsgLoc(Model m, String msg, String loc) {
		m.addAttribute("message",msg);
		m.addAttribute("loc",loc);
		return "msg";
	}
	
	public static String addMsgBack(Model m, String msg) {
		m.addAttribute("message",msg);
		m.addAttribute("loc","javascript:history.back()");
		return "msg";
	}

}
