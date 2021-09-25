package com.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.user.domain.UserVO;

public class LoginCheckInterceptor implements HandlerInterceptor{

	//컨트롤러를 실행하기 전에 호출되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
			//세션에 loginUser가 저장되어 있는지 확인
			HttpSession session = request.getSession();
			UserVO user=(UserVO) session.getAttribute("loginUser");
			
			//있다면 true를 반환한다. ==> true 반환시 컨트롤러를 수행함
			if(user!=null) return true;
				
			//로그인하지 않았다면
			request.setAttribute("message", "로그인해야 이용 가능합니다");
			
			String loc=request.getContextPath()+"/login";
			request.setAttribute("loc", loc);
			
			String view="/WEB-INF/views/msg.jsp";
			RequestDispatcher disp=request.getRequestDispatcher(view);
			disp.forward(request, response);
				
			return false;
		
	}

	//컨트롤러를 실행한 후, 아직 뷰를 실행하기 전에 호출되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	//컨트롤러 실행하고 뷰를 실행한 후 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	

}
