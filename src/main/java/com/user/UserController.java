package com.user;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.common.CommonUtil;
import com.user.domain.UserVO;
import com.user.service.UserService;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	
	/**회원가입 페이지*/
	@GetMapping("/join")
	public String showJoin() {
		
		return"member/join";
	}
	
	/**회원가입*/
	@PostMapping("/join")
	public String join(Model m, @ModelAttribute("user") UserVO user) {
		
		if(user.getUsername()==null || user.getUserid()==null){
			
			return CommonUtil.addMsgLoc(m, "잘못된 경로입니다.", "join");
		}
		
		int	n = userService.insertUser(user);
		
		String msg=(n>0)?"회원가입 성공! 로그인 페이지로 이동합니다":"회원가입 실패! 회원가입 양식에 맞게 기입해주세요.";
		String loc=(n>0)?"login":"javascript:history.back()";
		
		return CommonUtil.addMsgLoc(m, msg, loc);
		
	}
	
	/**아이디 중복 검사*/
	@PostMapping("/idCheck")
	public String idCheck(Model m, HttpServletRequest req) {
		
		String userid=req.getParameter("userid");
		
		UserVO user=userService.selectUserById(userid);
		
		if(user!=null) {
			return "";
		}else {
			return "/member/join";
		}
		
	}
	
	/**내 정보*/
	@GetMapping("/user/myInfo")
	public String myInfo(Model m, HttpSession session) {
		
		UserVO loginUser=(UserVO) session.getAttribute("loginUser");
		
		String userid=loginUser.getUserid();
		
		UserVO user=userService.selectUserById(userid);
		m.addAttribute("user", user);
		
		String mstate=user.getMstate();
		if(mstate.equals("0")) {
			m.addAttribute("mstate1", "checked");
		}else if(mstate.equals("1")) {
			m.addAttribute("mstate2", "checked");
		}else if(mstate.equals("-1")) {
			m.addAttribute("mstate3", "checked");
		}
		
		return "/member/myInfo";
	}
	
	/**내 정보 수정*/
	@PostMapping("/user/myInfoEdit")
	public String myInfoEdit(Model m, @ModelAttribute("user") UserVO user) {
		
		int n=userService.updateMyInfo(user);
		
		String msg=(n>0)? "수정 완료":"수정 실패";
		String loc=(n>0)? "myInfo":"javascript:history.back()";
		
		return CommonUtil.addMsgLoc(m, msg, loc);
		
	}
	
}