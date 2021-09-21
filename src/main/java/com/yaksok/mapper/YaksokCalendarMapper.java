package com.yaksok.mapper;

import java.util.List;

import com.yaksok.domain.YaksokCalendarVO;

public interface YaksokCalendarMapper {
	
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

}
