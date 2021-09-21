package com.yaksok.mapper;

import com.yaksok.domain.YaksokOnOffVO;

public interface YaksokSettingMapper {
	
	/**yidx로 약속 OnOff 정보 부르기*/
	YaksokOnOffVO selectYaksokOnOff(String yidx);
	
	/**약속 OnOff 정보 수정*/
	int updateYaksokOnOff(YaksokOnOffVO yaksokOnOff);

}
