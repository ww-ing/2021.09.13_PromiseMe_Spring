package com.yaksok.mapper;

import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;

public interface YaksokReserveMapper {

	/**약속 url로 약속 정보 부르기*/
	YaksokInfoVO selectYaksokInfoByURL(String yaksokURL);
	
	/**yidx로 약속 OnOff 정보 부르기*/
	YaksokOnOffVO selectYaksokOnOff(String yidx);
	
	/**약속 예약 정보 등록*/
	int insertYaksokReserve(YaksokReserveVO yaksokReserve);
}
