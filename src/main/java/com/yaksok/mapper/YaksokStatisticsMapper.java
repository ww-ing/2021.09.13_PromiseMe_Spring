package com.yaksok.mapper;

import java.util.List;
import java.util.Map;

public interface YaksokStatisticsMapper {
	
	/**약속 예약 정보의 year데이터*/
	List<String> getAllYaksokReserveYearList(String yidx);
	
	/**약속 예약 정보의 month데이터*/
	List<String> getAllYaksokReserveMonthList(Map<String, String> map);
	
	/**약속 예약 정보의 1회만 예약을 한 예약의 수*/
	int selectYaksokReserveNotOverlapCount(String yidx);
	
	/**약속 예약 정보의 중복을 제거한 총 유저 수*/
	int selectYaksokReserveUserCount(String yidx);
	
	/**약속 얘약 정보의 month 데이터*/
	Map<String,Object> selectYaksokReserveMonthData(Map<String, Object> map);
	
	/**약속 예약 정보의 year 데이터*/
	Map<String,Object> selectYaksokReserveYearData(Map<String, Object> map);

}