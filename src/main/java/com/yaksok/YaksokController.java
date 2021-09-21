package com.yaksok;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.CommonUtil;
import com.common.RandomNumber;
import com.user.domain.UserVO;
import com.yaksok.domain.YaksokCalendarVO;
import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;
import com.yaksok.domain.YaksokVO;
import com.yaksok.service.YaksokService;

@Controller
public class YaksokController {
	
	@Inject
	private YaksokService yaksokService;
	
	
	
	
	
	//--------------------Yaksok 관련
	
	@GetMapping("/user/yaksok")
	public String yaksok(Model m, HttpSession session) {
		
		UserVO user=(UserVO) session.getAttribute("loginUser");
		
		String idx=user.getIdx();
		
		//selectAllYaksok
		List<YaksokVO> yaksokList=yaksokService.selectAllYaksok(idx);
		
		m.addAttribute("yaksokList", yaksokList);
		
		return "/yaksok/yaksok";
	}
	
	@PostMapping("/user/yaksokAdd")
	public String yaksokAdd(Model m, HttpSession session, @ModelAttribute("yaksok") YaksokVO yaksok) {
		
		//로그인회원의 정보 가져오기
		UserVO user=(UserVO) session.getAttribute("loginUser");
		
		yaksok.setIdx(user.getIdx());
		
		int n=yaksokService.insertYaksok(yaksok);
		
		//랜덤한 url생성
		String yaksokurl=yaksok.getYaksokname()+RandomNumber.randomNumber(8,1);
		
		//약속 데이터 등록
		YaksokInfoVO info=new YaksokInfoVO(null,yaksokurl,
				"위치","02","1234","6578","010","1234","5678",
				"imageSample1.png","imageSample2.png","imageSample3.png",
				"imageSample4.png","imageSample5.png",
				"메인 제목","메인 설명","설명1 제목","설명1","설명2 제목","설명2","설명3 제목","설명3","1");
		int infosuc=yaksokService.insertYaksokInfo(info);
		
		//약속 OnOff 등록
		YaksokOnOffVO onoff=new YaksokOnOffVO(null,"1","1","1","1","1");
		int onoffsuc=yaksokService.insertYaksokOnOff(onoff);
		
		String msg=((n>0)&&(infosuc>0)&&(onoffsuc>0))? "등록 성공":"등록 실패";
		String loc=((n>0)&&(infosuc>0)&&(onoffsuc>0))? "yaksok":"javascript:history.back()";
		
		return CommonUtil.addMsgLoc(m, msg, loc);
		
	}
	
	//--------------------YaksokTheme 관련
	
	@PostMapping("/user/yaksokMenu")
	public String yaksokMenu(Model m, @RequestParam("yidx") String yidx) {
		
		YaksokInfoVO info=yaksokService.selectYaksokInfo(yidx);
		
		m.addAttribute("info", info);
		
		return"/yaksok/yaksokMenu";
	}
	
	@GetMapping("/user/yaksokSetForm")
	public String yaksokSetForm(Model m, @RequestParam("yidx") String yidx) {
		
		YaksokInfoVO info=yaksokService.selectYaksokInfo(yidx);
		
		m.addAttribute("info", info);
		
		return "/yaksok/yaksokSetForm";
	}
	
	@GetMapping("/user/yaksokSet")
	public String yaksokSet(Model m, 
			@RequestParam("editNum") String editNum,
			@RequestParam("yidx") String yidx,
			@RequestParam("templates") String templates) {
		
		String edit="";
		if(editNum.equals("0")) {
			m.addAttribute("edit", edit);
		}
		else if(editNum.equals("1")) {
			edit="edit";
			m.addAttribute("edit", edit);
		}
				
		YaksokInfoVO info=yaksokService.selectYaksokInfo(yidx);
		m.addAttribute("info", info);
		
		//선택한 탬플릿 번호
		return "/yaksok/templates/template"+templates+"/template"+templates;
		
	}
	
	@PostMapping("/user/yaksokEdit")
	public String yaksokEdit(Model m, @ModelAttribute("info") YaksokInfoVO info) {
		
		//해당 약속의 정보 얻어오기
	
		int n=yaksokService.updateYaksokInfo(info);
		
		if(n>0) {
			m.addAttribute("yidx", info.getYidx());
			return "/yaksok/yaksokMenu";
		}else {
			return CommonUtil.addMsgBack(m, "수정 실패! 관리자에게 문의하세요.");
		}
		
	}
	
	
	
	
	
	//--------------------YaksokCalendar 관련
	
	@GetMapping("/user/yaksokCalendar")
	public String yaksokCalendar(Model m,
			@RequestParam("yidx") String yidx) {
		
		m.addAttribute("yidx", yidx);
		
		List<YaksokCalendarVO> calendarList=yaksokService.selectAllYaksokCalendar(yidx);
		m.addAttribute("calendarList", calendarList);
		
		return "/yaksok/yaksokCalendar";
	}
	
	@GetMapping("/user/yaksokCalendarAdd")
	public String yaksokCalendarAdd(Model m,
			@RequestParam("yidx") String yidx,
			@RequestParam("ctitle") String ctitle,
			@RequestParam("ccontent") String ccontent,
			@RequestParam("year") String cyear,
			@RequestParam("month") String cmonth,
			@RequestParam("day") String cday) {
		
		YaksokCalendarVO vo=new YaksokCalendarVO(null,ctitle,ccontent,cyear,cmonth,cday,yidx);
		
		yaksokService.insertYaksokCalendar(vo);
		
		m.addAttribute("yidx", yidx);
		return "redirect:yaksokCalendar";
	}
	
	@GetMapping("/user/yaksokCalendarEditModal")
	public String yaksokCalendarEditModal(Model m,
			HttpServletRequest req,
			@RequestParam("yidx") String yidx,
			@RequestParam("cidx") String cidx) {
		
		YaksokCalendarVO vo=yaksokService.selectYaksokCalendarSchedule(cidx);
		
		String ctitle=vo.getCtitle();
		String ccontent=vo.getCcontent();
		
		req.setAttribute("yidx", yidx);
		req.setAttribute("cidx", cidx);
		req.setAttribute("ctitle", ctitle);
		req.setAttribute("ccontent", ccontent);
		
		return "/yaksok/modal/yaksokCalendarEditModal";
	}
	
	@GetMapping("/user/yaksokCalendarEdit")
	public String yaksokCalendarEdit(Model m,
			HttpServletRequest req) {
		
		String yidx=req.getParameter("yidx");
		String cidx=req.getParameter("cidx");
		String ctitle=req.getParameter("ctitle");
		String ccontent=req.getParameter("ccontent");
		
		YaksokCalendarVO vo=new YaksokCalendarVO(cidx,ctitle,ccontent,null,null,null,null);
		
		yaksokService.updateYaksokCalendar(vo);
		
		m.addAttribute("yidx", yidx);
		
		return "redirect:yaksokCalendar";
		
	}
	
	@GetMapping("/user/yaksokCalendarDelete")
	public String yaksokCalendarDelete(Model m,
			HttpServletRequest req,
			@RequestParam("cidx") String cidx) {
		
		String yidx=req.getParameter("yidx");
		m.addAttribute("yidx", yidx);
		
		yaksokService.deleteYaksokCalendar(cidx);
		
		return "redirect:yaksokCalendar";
	}
	
	
	
	
	
	//--------------------YaksokReserveList 관련
	
	@GetMapping("/user/yaksokReserveList")
	public String yaksokReserveList(Model m, 
			@RequestParam("yidx") String yidx,
			@RequestParam("cpage") String cpageStr,
			@RequestParam(defaultValue="5") String pageSizeStr) {
		
		m.addAttribute("yidx", yidx);
		
		//default 페이지 창을 1로 지정
		if(cpageStr==null||cpageStr.trim().isEmpty()) {
			cpageStr="1";
		}
		
		int cpage=Integer.parseInt(cpageStr.trim());
		if(cpage<1) {
			cpage=1;
		}
		
		//페이지 사이즈를 유동적으로 받기 위함
		//if(pageSizeStr==null||pageSizeStr.trim().isEmpty()) {
			//pageSizeStr="5";
		//}
		
		//약속 예약 정보 개수 가져오기
		int count=yaksokService.getYaksokReserveCount(yidx);
		m.addAttribute("reserveCount", count);
		
		//한 페이지 당 보여줄 게시글 수
		int pageSize=Integer.parseInt(pageSizeStr);
		
		int pageCount=(count-1)/pageSize+1;
		m.addAttribute("pageCount", pageCount);
		
		if(cpage>pageCount) {
			cpage=pageCount;
		}
		
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		//약속 예약 정보 리스트
		List<YaksokReserveVO> reserveList=yaksokService.selectAllYaksokReserve(yidx, start, end);		
		m.addAttribute("reserveList", reserveList);
		
		return "/yaksok/yaksokReserveList";
	}
	
	@GetMapping("/user/yaksokReserveListUserInfoModal")
	public String yaksokReserveListUserInfoModal(Model m,
			@RequestParam("yidx") String yidx,
			@RequestParam("ridx") String ridx) {

		m.addAttribute("yidx", yidx);
		m.addAttribute("ridx", ridx);
		
		YaksokReserveVO vo=yaksokService.selectYaksokReserve(ridx);
		
		String rusername=vo.getRusername();
		String rhp=vo.getRhp();
		Date rindate=vo.getRindate();
		String rcontent=vo.getRcontent();
		m.addAttribute("rusername", rusername);
		m.addAttribute("rhp", rhp);
		m.addAttribute("rindate", rindate);
		m.addAttribute("rcontent", rcontent);
		
		if(vo.getRcheckedstate().equals("1")) {
			yaksokService.updateYaksokReserve(ridx);
		}
		
		return "/yaksok/modal/yaksokReserveListUserInfoModal";
	}
	
	
	
	
	
	//--------------------YaksokStatistic 관련
	
	@GetMapping("/user/yaksokStatistics")
	public String yaksokStatistics(Model m,
			@RequestParam("yidx") String yidx,
			@RequestParam(defaultValue="") String month_selectYear,
			@RequestParam(defaultValue="") String month_selectMonth,
			@RequestParam(defaultValue="") String year_selectYear
			) {
		
		//String yidx=req.getParameter("yidx");
		m.addAttribute("yidx", yidx);
		//System.out.println("yidx="+yidx);
		
		//----------해당 월의 예약 통계 화면
		//1. 데이터가 들어있는 연도 뽑아주기
		List<String> yearList = yaksokService.getAllYaksokReserveYearList(yidx);
		m.addAttribute("yearList", yearList);
		
		//2. 월 데이터의 선택된 year값 받아오기
		//String month_selectYear=req.getParameter("month_selectYear");
		//System.out.println("month_selectYear1="+month_selectYear);
	
		if(month_selectYear==null||month_selectYear.trim().isEmpty()) {
			month_selectYear=yearList.get(0);
			//System.out.println("month_selectYear2="+month_selectYear);
			
		}
		m.addAttribute("month_selectYear", month_selectYear);
		
		//3. 데이터가 들어있는 월 뽑아주기
		List<String> monthList = yaksokService.getAllYaksokReserveMonthList(yidx,month_selectYear);
		//System.out.println("monthList="+monthList);
		m.addAttribute("monthList", monthList);
		
		//4. 월 데이터의 선택된 month값 받아오기
		//String month_selectMonth=req.getParameter("month_selectMonth");
		//System.out.println("month_selectMonth1="+month_selectMonth);
		
		if(month_selectMonth==null||month_selectMonth.trim().isEmpty()) {
			month_selectMonth=monthList.get(0);
			//System.out.println("month_selectMonth2="+month_selectMonth);
			
		}
		m.addAttribute("month_selectMonth", month_selectMonth);
		
		//----------해당 연도의 예약 통계 화면
		//1. 선택한 연도 받아오기
		//String year_selectYear=req.getParameter("year_selectYear");
		//System.out.println("year_selectYear1="+year_selectYear);
		
		if(year_selectYear==null||year_selectYear.trim().isEmpty()) {
			year_selectYear=yearList.get(0);
			//System.out.println("year_selectYear2="+year_selectYear);
			
		}
		
		m.addAttribute("year_selectYear", year_selectYear);

		//----------해당 월의의 예약 통계 데이터
		
		//10월이 아니라면 0을 빼기
		if(!month_selectMonth.equals("10")) {
			month_selectMonth=month_selectMonth.replace("0", "");
			
			//System.out.println("0을 제거한 month_selectMonth="+month_selectMonth);
		}
		//선택한 연 월 을 합친 문자열
		String year_month_data=month_selectYear+"/"+month_selectMonth+"/";
		
		//선택한 월의 마지막 day값 구하기
        Calendar cal = Calendar.getInstance();
        cal.set(Integer.parseInt(month_selectYear), Integer.parseInt(month_selectMonth)-1, 1);
		String month_last_day=Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		//해당 월의 데이터 가져오기
//		List<String> monthData = 
//				dao.selectYaksokReserveMonthData(yidx,year_month_data,month_last_day);
		
//		System.out.println("해당 월의 데이터="+monthData);
		
		//----------해당 연도의 예약 통계 데이터
		//List<String> yearData = dao.selectYaksokReserveYearData(yidx,year_selectYear);
		
		
		//----------중복 예약 통계 데이터
		//약속 예약 유저정보 중 중복값이 없는 (1회만 예약한 유저의 수)
		int notOverlapCount=yaksokService.selectYaksokReserveNotOverlapCount(yidx);
		
		//약속 예약 유저정보 중 중복값을 제거한 유저 수
		int reserveUserCount=yaksokService.selectYaksokReserveUserCount(yidx);
		
		//약속 예약 유저정보 중 중복값이 있는 (2회 이상 예약한 유저의 수)
		int overlapCount=reserveUserCount-notOverlapCount;
		
		m.addAttribute("notOverlapCount", notOverlapCount);
		m.addAttribute("overlapCount", overlapCount);
		
		return "/yaksok/yaksokStatistics";
	}
	
	
	
	
	
	//--------------------YaksokSetting 관련
	
	@GetMapping("/user/yaksokSetting")
	public String yaksokSetting(Model m,
			@RequestParam("yidx") String yidx) {
		
		YaksokOnOffVO onoffData=yaksokService.selectYaksokOnOff(yidx);
		
		m.addAttribute("onoffData", onoffData);
		
		String yaksokonoffCheck="";
		if(onoffData.getYaksokonoff().equals("1")) {
			yaksokonoffCheck="checked";
		}
		String calendaronoffCheck="";
		if(onoffData.getCalendaronoff().equals("1")) {
			calendaronoffCheck="checked";
		}
		String overlaponoffCheck="";
		if(onoffData.getOverlaponoff().equals("1")) {
			overlaponoffCheck="checked";
		}
		String payonoffCheck="";
		if(onoffData.getPayonoff().equals("1")) {
			payonoffCheck="checked";
		}
		String maxreserveonoffCheck="";
		if(onoffData.getMaxreserve().equals("1")) {
			maxreserveonoffCheck="checked";
		}
		
		m.addAttribute("yaksokonoffCheck", yaksokonoffCheck);
		m.addAttribute("calendaronoffCheck", calendaronoffCheck);
		m.addAttribute("overlaponoffCheck", overlaponoffCheck);
		m.addAttribute("payonoffCheck", payonoffCheck);
		m.addAttribute("maxreserveonoffCheck", maxreserveonoffCheck);
		
		return "/yaksok/yaksokSetting";
	}
	
	@GetMapping("/user/yaksokSettingUpdate")
	public String YaksokSettingUpdate(Model m,
			@ModelAttribute("onoffData") YaksokOnOffVO onoffData) {
	
		String yaksokOnOffStr=onoffData.getYaksokonoff();
		String calendarOnOffStr=onoffData.getCalendaronoff();
		String overlapOnOffStr=onoffData.getOverlaponoff();
		String payOnOffStr=onoffData.getPayonoff();
		String maxreserveStr=onoffData.getMaxreserve();
		
		String yaksokOnOff="0";
		if(yaksokOnOffStr!=null) {
			yaksokOnOff="1";
		}
		
		String calendarOnOff="0";
		if(calendarOnOffStr!=null) {
			calendarOnOff="1";
		}
		
		String overlapOnOff="0";
		if(overlapOnOffStr!=null) {
			overlapOnOff="1";
		}
		
		String payOnOff="0";
		if(payOnOffStr!=null) {
			payOnOff="1";
		}
		
		String maxreserveOnOff="0";
		if(maxreserveStr!=null) {
			maxreserveOnOff="1";
		}
		
		YaksokOnOffVO onoffVo=new YaksokOnOffVO(onoffData.getYidx(),yaksokOnOff,calendarOnOff,
				overlapOnOff,payOnOff,maxreserveOnOff);
		
		yaksokService.updateYaksokOnOff(onoffVo);
		
		m.addAttribute("yidx", onoffData.getYidx());
		
		return "redirect:yaksokSetting";
		
	}
}