package com.yaksok;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;
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
	
	
	//--------------------YaksokReserveList 관련
	@GetMapping("/user/yaksokReserveList")
	public String yaksokReserveList(Model m, 
			@RequestParam("yidx") String yidx,
			@RequestParam("cpage") String cpageStr) {
		
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
		String pageSizeStr="5";
		
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
	
	
	//--------------------YaksokSetting 관련
	
	@GetMapping("/user/yaksokSetting")
	public String yaksokSetting(Model m,
			@RequestParam("yidx") String yidx) {
		
		System.out.println(yidx);
		
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
		
		int n=yaksokService.updateYaksokOnOff(onoffVo);
		
		m.addAttribute("yidx", onoffData.getYidx());
		
		return "redirect:yaksokSetting";
		//return "/yaksok/yaksokSetting";
		
	}
}