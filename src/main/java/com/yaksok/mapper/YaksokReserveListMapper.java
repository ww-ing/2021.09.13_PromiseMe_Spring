package com.yaksok.mapper;

import java.util.List;
import java.util.Map;

import com.yaksok.domain.YaksokReserveVO;

public interface YaksokReserveListMapper {
	
	/**약속 예약 정보 개수*/
	int getYaksokReserveCount(String yidx);
	
	/**약속 예약 유저 정보 리스트 페이징*/
	List<YaksokReserveVO> selectAllYaksokReserve(Map<String, String> map);
	
	/**약속 예약 유저 정보*/
	YaksokReserveVO selectYaksokReserve(String ridx);
	
	/**약속 예약 유저의 unchecked 정보 수정*/
	int updateYaksokReserve(String ridx);

}