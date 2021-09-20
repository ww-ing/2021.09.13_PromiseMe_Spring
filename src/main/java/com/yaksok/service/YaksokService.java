package com.yaksok.service;

import java.util.List;

import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokVO;

public interface YaksokService {
	
	//---------------------YaksokMapper 관련
	
	/**idx로 약속 정보 리스트 불러오기*/
	List<YaksokVO> selectAllYaksok(String idx);
	
	/**약속 등록*/
	int insertYaksok(YaksokVO yaksok);
	
	/**약속 데이터 등록*/
	int insertYaksokInfo(YaksokInfoVO yaksokInfo);
	
	/**약속 OnOff 데이터 등록*/
	int insertYaksokOnOff(YaksokOnOffVO yaksokOnOff);
	
	
	//--------------------YaksokThemeMapper 관련
	/**yidx로 약속 정보 선택*/
	YaksokInfoVO selectYaksokInfo(String yidx); 
	
	/**약속 정보 수정*/
	int updateYaksokInfo(YaksokInfoVO yaksokInfo);

}
