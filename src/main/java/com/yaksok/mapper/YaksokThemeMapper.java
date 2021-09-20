package com.yaksok.mapper;

import com.yaksok.domain.YaksokInfoVO;

public interface YaksokThemeMapper {
	
	/**yidx로 약속 정보 선택*/
	YaksokInfoVO selectYaksokInfo(String yidx); 
	
	/**약속 정보 수정*/
	int updateYaksokInfo(YaksokInfoVO yaksokInfo);

}
