package com.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.user.domain.UserVO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		UserVO user=(UserVO) session.getAttribute("loginUser");
		
		if(user!=null) {
			if(user.getUserid().equals("admin")) return true;//관리자가 맞는 경우
			else {
				request.setAttribute("message", "관리자만 이용 가능합니다");
				request.setAttribute("loc", request.getContextPath()+"/login");
				String view="/WEB-INF/views/msg.jsp";
				RequestDispatcher disp=request.getRequestDispatcher(view);
				disp.forward(request, response);
				return false;//관리자가 아닌 경우
			}
		}
		
		return false;//로그인 하지 않은 경우
		
		
	}

}









