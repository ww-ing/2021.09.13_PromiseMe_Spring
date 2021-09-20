package com.yaksok;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.common.CommonUtil;
import com.common.RandomNumber;
import com.user.domain.UserVO;
import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokVO;
import com.yaksok.service.YaksokService;

@Controller
public class YaksokController {
	
	@Inject
	private YaksokService yaksokService;
	
	
	
	@GetMapping("/user/yaksok")
	public String yaksok(Model m, HttpSession session) {
		
		UserVO user=(UserVO) session.getAttribute("loginUser");
		
		String idx=user.getIdx();
		
		//selectAllYaksok
		List<YaksokVO> yaksokList=yaksokService.selectAllYaksok(idx);
		
		m.addAttribute("yaksokList", yaksokList);
		
		return "yaksok/yaksok";
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

}