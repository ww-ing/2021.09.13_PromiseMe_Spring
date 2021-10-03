package com.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.domain.UserVO;
import com.user.service.AdminService;

@Controller
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	//--------------------회원 정보 관련
	@GetMapping("/admin/listAdmin")
	public String showListAdmin(Model m,
			@RequestParam(value="cpage", defaultValue="1") String cpage,
			@RequestParam(value="mstate", defaultValue="0") String mstate,
			@RequestParam(value="idx", defaultValue="21") String idx,
			HttpSession session) {
		
		session.removeAttribute("cpage");
		session.setAttribute("cpage", cpage);
		
		//유저 리스트 정보
		List<UserVO> user=adminService.selectAllUserAdmin();
		//총 유저 수
		int userCount=user.size()-1;
		m.addAttribute("userCount", userCount);
		
		
		
		int cpageInt=Integer.parseInt(cpage.trim());
		if(cpageInt<1) {
			cpageInt=1;
		}
		
		//한 페이지 당 보여줄 게시글 수
		int pageSize=6;
		
		int pageCount=(userCount-1)/pageSize+1;
		m.addAttribute("pageCount", pageCount);
		
		if(cpageInt>pageCount) {
			cpageInt=pageCount;
		}
		
		int end=cpageInt*pageSize;
		int start=end-(pageSize-1);
		
		//약속 예약 정보 리스트
		List<UserVO> userList=adminService.selectAllUserAdmin_paging(start, end);		
		m.addAttribute("userList", userList);
		
		UserVO editUser=adminService.selectUserByIdx(idx);
		
		if(!editUser.getMstate().equals(mstate)) {
			adminService.editUserMstateAdmin(idx, mstate);
		}
		
		return"admin/list_admin";
	}
	
	/* 회원의 상세정보 모달창 */
	@PostMapping("/admin/userInfoModal_admin")
	public String showUserInfoModal_admin(Model m,
			@RequestParam("idx") String idx,
			HttpSession session) {
		
		m.addAttribute("idx", idx);
		
		//회원의 상세정보
		UserVO user=adminService.selectUserByIdx(idx);
		
		m.addAttribute("userInfo", user);
		
		int yaksokCount=adminService.selectYaksokCountOfUser(idx);
		
		m.addAttribute("yaksokCount", yaksokCount);
		
		String cpage=(String) session.getAttribute("cpage");
		m.addAttribute("cpage", cpage);
		
		return "admin/modal/userInfoModal_admin";
	}
	
	/* 회원정보 수정 */
	@PostMapping("/admin/mstateEdit_admin")
	public String mstateEdit_admin(Model m, 
			@RequestParam("mstate") String mstate) {
		
		System.out.println("mstate="+mstate);
		return "admin/modal/userInfoModal_admin";
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