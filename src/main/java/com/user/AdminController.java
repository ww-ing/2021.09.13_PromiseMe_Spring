package com.user;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	
	
	
	
	
	//--------------------약속 통계 관련
	
	@GetMapping("/admin/yaksokAdmin")
	public String showYaksokAdmin(Model m,
			@RequestParam(defaultValue="") String month_selectYear,
			@RequestParam(defaultValue="") String month_selectMonth,
			@RequestParam(defaultValue="") String year_selectYear) {
		
		//----------해당 월의 예약 통계 화면
		//1. 데이터가 들어있는 연도 뽑아주기
		List<String> yearList = adminService.getAllYaksokReserveYearList();
		m.addAttribute("yearList", yearList);
		
		//2. 월 데이터의 선택된 year값 받아오기
	
		if(month_selectYear==null||month_selectYear.trim().isEmpty()) {
			month_selectYear=yearList.get(0);
			
		}
		m.addAttribute("month_selectYear", month_selectYear);
		
		//3. 데이터가 들어있는 월 뽑아주기
		List<String> monthList = adminService.getAllYaksokReserveMonthList(month_selectYear);
		m.addAttribute("monthList", monthList);
		
		//4. 월 데이터의 선택된 month값 받아오기
		
		if(month_selectMonth==null||month_selectMonth.trim().isEmpty()) {
			month_selectMonth=monthList.get(0);
			//System.out.println("month_selectMonth2="+month_selectMonth);
			
		}
		m.addAttribute("month_selectMonth", month_selectMonth);
		
		//----------해당 연도의 예약 통계 화면
		//1. 선택한 연도 받아오기
		
		if(year_selectYear==null||year_selectYear.trim().isEmpty()) {
			year_selectYear=yearList.get(0);
			//System.out.println("year_selectYear2="+year_selectYear);
			
		}
		
		m.addAttribute("year_selectYear", year_selectYear);
		
		//선택한 연도의 전년도 데이터 구해서 넣어주기
		int year_selectYear_before_int = Integer.parseInt(year_selectYear)-1;
		String year_selectYear_before = Integer.toString(year_selectYear_before_int); 
		m.addAttribute("year_selectYear_before", year_selectYear_before);

		//----------해당 월의의 예약 통계 데이터
		
		//10월이 아니라면 0을 빼기
		if(!month_selectMonth.equals("10")) {
			month_selectMonth=month_selectMonth.replace("0", "");
		}
		
		//선택한 연 월 을 합친 문자열
		String year_month_data=month_selectYear+"/"+month_selectMonth+"/";
		
		//선택한 월의 마지막 day값 구하기
        Calendar cal = Calendar.getInstance();
        cal.set(Integer.parseInt(month_selectYear), Integer.parseInt(month_selectMonth)-1, 1);
		String month_last_day=Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		//해당 월의 데이터 가져오기
		Map<String,Object> monthMap =
				adminService.selectYaksokReserveMonthData(year_month_data, month_last_day);
		String monthData=(String) monthMap.get("monthData");
		
		m.addAttribute("monthData", monthData);
		
		//----------해당 연도의 데이터 가져오기
		Map<String,Object> yearMap =
				adminService.selectYaksokReserveYearData(year_selectYear);
		
		String yearData=(String) yearMap.get("yearData");
		m.addAttribute("yearData", yearData);
		
		//----------해당 연도의 전년도 예약 통계 데이터
		Map<String,Object> yearMap_before =
				adminService.selectYaksokReserveYearData(year_selectYear_before);
		
		String yearData_before=(String) yearMap_before.get("yearData");
		m.addAttribute("yearData_before", yearData_before);
		
		//등록 현황 집계
		int totalYaksokCount=adminService.selectTotalYaksokCount();
		m.addAttribute("totalYaksokCount", totalYaksokCount);
		
		int weekYaksokCount=adminService.selectWeekYaksokCount();
		m.addAttribute("weekYaksokCount", weekYaksokCount);
		
		int monthYaksokCount=adminService.selectMonthYaksokCount();
		m.addAttribute("monthYaksokCount", monthYaksokCount);
		
		int yearYaksokCount=adminService.selectYearYaksokCount();
		m.addAttribute("yearYaksokCount", yearYaksokCount);
		
		return"admin/yaksok_admin";
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/admin/CustomerServiceAdmin")
	public String showCustomerServiceAdmin() {
		
		return"admin/customerService_admin";
	}
	
}