package com.yaksok.service;

import java.util.List;
import java.util.Map;

import com.yaksok.domain.YaksokCalendarVO;
import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;
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
	
	
	
	
	
	//--------------------YaksokCalendarMapper 관련
	
	/**약속 yidx로 캘린더 정보 불러오기*/
	List<YaksokCalendarVO> selectAllYaksokCalendar(String yidx);
	
	/**약속 캘린더 일정 등록*/
	int insertYaksokCalendar(YaksokCalendarVO yaksokCalendar);
	
	/**약속 일정 cidx로 캘린더 일정 정보 불러오기*/
	YaksokCalendarVO selectYaksokCalendarSchedule(String cidx);
	
	/**약속 캘린더 일정 수정*/
	int updateYaksokCalendar(YaksokCalendarVO yaksokCalendar);
	
	/**약속 캘린더 일정 삭제*/
	int deleteYaksokCalendar(String cidx);
	
	
	
	
	
	//--------------------YaksokReserveListMapper 관련
	
	/**약속 예약 정보 개수*/
	int getYaksokReserveCount(String yidx);
	
	/**약속 예약 유저 정보 리스트 페이징*/
	List<YaksokReserveVO> selectAllYaksokReserve(String yidx, int start, int end);
	
	/**약속 예약 유저 정보*/
	YaksokReserveVO selectYaksokReserve(String ridx);
	
	/**약속 예약 유저의 unchecked 정보 수정*/
	int updateYaksokReserve(String ridx);
	
	
	
	
	
	//--------------------YaksokStatisticsMapper 관련	
	
	/**약속 예약 정보의 year데이터*/
	List<String> getAllYaksokReserveYearList(String yidx);
	
	/**약속 예약 정보의 month데이터*/
	List<String> getAllYaksokReserveMonthList(String yidx, String year);
	
	/**약속 예약 정보의 1회만 예약을 한 예약의 수*/
	int selectYaksokReserveNotOverlapCount(String yidx);
	
	/**약속 예약 정보의 중복을 제거한 총 유저 수*/
	int selectYaksokReserveUserCount(String yidx);
	
	/**약속 얘약 정보의 month 데이터*/
	Map<String,Object> selectYaksokReserveMonthData(String yidx, String year_month_data, String month_last_day);
	
	/**약속 예약 정보의 year 데이터*/
	Map<String,Object> selectYaksokReserveYearData(String yidx, String year_selectYear);
	
	
		
		
	//--------------------YaksokSettingMapper 관련
	
	/**yidx로 약속 OnOff 정보 부르기*/
	YaksokOnOffVO selectYaksokOnOff(String yidx);
	
	/**약속 OnOff 정보 수정*/
	int updateYaksokOnOff(YaksokOnOffVO yaksokOnOff);
	
}
