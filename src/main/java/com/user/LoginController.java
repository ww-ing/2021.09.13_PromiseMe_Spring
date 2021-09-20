package com.user;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class LoginController {
	
	@Inject
	private UserService userService;
	
	@GetMapping("/login")
	public String login(HttpServletRequest req) {
		
		Cookie[] cks = req.getCookies();
		if(cks!=null){
			for(Cookie ck : cks){
				String key = ck.getName();
				if(key.equals("uid")){
					req.setAttribute("checked", "checked");
					req.setAttribute("uid", ck.getValue());
					break;
				}
				
			}
		}
		
		return "login/login";
	}
	
	
	@PostMapping("/login")
	public String login(Model m, @ModelAttribute("user") UserVO user, 
			HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		
		String id = user.getUserid();
		String pwd = user.getPwd();
		
		//아이디 저장 체크박스에 체크한 값 받아오기
		String saveId = req.getParameter("saveId");
		
		//유효성 체크
		if(id==null || pwd==null || "".equals(id.trim())||"".equals(pwd.trim())){
			
			return CommonUtil.addMsgBack(m, "잘못된 경로입니다.");
		}
		
		UserVO loginUser = userService.selectUserById(id);
		
		if(loginUser==null) {
			
			return CommonUtil.addMsgBack(m, id+"란 아이디는 존재하지 않아요");
		}
		
		if(!pwd.equals(loginUser.getPwd())){
			
			return CommonUtil.addMsgBack(m, "패스워드가 일치하지 않습니다.");
		}
	
		
		if(loginUser!=null){
			session.setAttribute("loginUser", loginUser);
			
			//쿠키 등록
			Cookie ck = new Cookie("uid",loginUser.getUserid());//쿠키 생성
			if(saveId!=null){//체크했다면
				//쿠키 속성을 설정
				ck.setMaxAge(60*60*24*7);//7일간 유효
				
			}else{//체크하지 않았다면
				ck.setMaxAge(0);//쿠키 삭제
				
			}
			
			//쿠키를 어디에서든 꺼내올수 있도록 설정
			ck.setPath("/");
			
			//쿠키를 클라이언트 쪽에 밀어넣기
			res.addCookie(ck);
			
		}
		return "main";		
		
	}
	
	@GetMapping("/logout")
	public String logout(Model m, 
			HttpSession session) {
		
		session.invalidate();
		
		return CommonUtil.addMsgLoc(m, "로그아웃 완료", "main");
	}
	
}