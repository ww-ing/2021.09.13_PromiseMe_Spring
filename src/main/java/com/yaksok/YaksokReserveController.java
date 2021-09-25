package com.yaksok;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.CommonUtil;
import com.common.RandomNumber;
import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;
import com.yaksok.service.YaksokReserveService;

@Controller
public class YaksokReserveController {
	
	@Inject
	private YaksokReserveService yaksokReserveService;
	
	@GetMapping("yaksokReservePage")
	public String yaksokReservePage(Model m,
			@RequestParam("url") String url) {
		
		YaksokInfoVO info=yaksokReserveService.selectYaksokInfoByURL(url);
		
		String template=info.getTemplates();
		m.addAttribute("info", info);
		
		YaksokOnOffVO onoffData=yaksokReserveService.selectYaksokOnOff(info.getYidx());
		m.addAttribute("onoffData", onoffData);
		
		m.addAttribute("url", url);
		
		return "/yaksok/templates_reserve/template"+template+"/template"+template;
		
	}
	
	@PostMapping("yaksokReserve")
	public String yaksokReserve(Model m,
			@RequestParam("url") String url,
			@ModelAttribute("reserveVo") YaksokReserveVO reserveVo) {
		
		String rnumber=RandomNumber.randomNumber(6,1);
		
		reserveVo.setRnumber(rnumber);
		reserveVo.setRcheckedstate("1");
		
		if(reserveVo.getRusername()==null||reserveVo.getRusername().trim().isEmpty()||reserveVo.getRhp()==null||reserveVo.getRhp().trim().isEmpty()) {
			return CommonUtil.addMsgBack(m, "모든 정보를 입력해주세요.");
		}
		
		int n=yaksokReserveService.insertYaksokReserve(reserveVo);
		
		m.addAttribute("url", url);
		String msg=(n>0)? "약속완료! 약속번호는 \""+rnumber+"\"입니다.":"약속실패";
		String loc=(n>0)? "yaksokReservePage":"javascript:history.back()";
		return CommonUtil.addMsgLoc(m, msg, loc);
		//return "redirect:yaksokReservePage";
		
	}
	
}