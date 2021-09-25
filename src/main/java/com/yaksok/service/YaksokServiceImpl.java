package com.yaksok.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yaksok.domain.YaksokCalendarVO;
import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;
import com.yaksok.domain.YaksokVO;
import com.yaksok.mapper.YaksokCalendarMapper;
import com.yaksok.mapper.YaksokMapper;
import com.yaksok.mapper.YaksokReserveListMapper;
import com.yaksok.mapper.YaksokSettingMapper;
import com.yaksok.mapper.YaksokStatisticsMapper;
import com.yaksok.mapper.YaksokThemeMapper;

@Service("yaksokService")
public class YaksokServiceImpl implements YaksokService {
	
	@Inject
	private YaksokMapper yaksokMapper;
	
	@Inject
	private YaksokThemeMapper yaksokThemeMapper;
	
	@Inject
	private YaksokCalendarMapper yaksokCalendarMapper;
	
	@Inject
	private YaksokReserveListMapper yaksokReserveListMapper;
	
	@Inject
	private YaksokStatisticsMapper yaksokStatisticsMapper;
	
	@Inject
	private YaksokSettingMapper yaksokSettingMapper;
	
	
	
	
	
	//----------YaksokMapper 관련

	/**idx로 약속 정보 리스트 불러오기*/
	@Override
	public List<YaksokVO> selectAllYaksok(String idx) {
		return yaksokMapper.selectAllYaksok(idx);
	}

	/**약속 등록*/
	@Override
	public int insertYaksok(YaksokVO yaksok) {
		return yaksokMapper.insertYaksok(yaksok);
	}

	/**약속 정보 등록*/
	@Override
	public int insertYaksokInfo(YaksokInfoVO yaksokInfo) {
		return yaksokMapper.insertYaksokInfo(yaksokInfo);
	}

	/**약속 세팅정보 등록*/
	@Override
	public int insertYaksokOnOff(YaksokOnOffVO yaksokOnOff) {
		return yaksokMapper.insertYaksokOnOff(yaksokOnOff);
	}


	
	
	
	//----------YaksokThemeMapper 관련
	
	@Override
	public YaksokInfoVO selectYaksokInfo(String yidx) {
		return yaksokThemeMapper.selectYaksokInfo(yidx);
	}

	@Override
	public int updateYaksokInfo(YaksokInfoVO yaksokInfo) {
		return yaksokThemeMapper.updateYaksokInfo(yaksokInfo);
	}
	
	
	
	
	
	//--------------------YaksokCalendarMapper 관련
	
	/**약속 yidx로 캘린더 정보 불러오기*/
	@Override
	public List<YaksokCalendarVO> selectAllYaksokCalendar(String yidx) {
		return yaksokCalendarMapper.selectAllYaksokCalendar(yidx);
	}
	
	/**약속 캘린더 일정 등록*/
	@Override
	public int insertYaksokCalendar(YaksokCalendarVO yaksokCalendar) {
		return yaksokCalendarMapper.insertYaksokCalendar(yaksokCalendar);
	}
	
	/**약속 일정 cidx로 캘린더 일정 정보 불러오기*/
	@Override
	public YaksokCalendarVO selectYaksokCalendarSchedule(String cidx) {
		return yaksokCalendarMapper.selectYaksokCalendarSchedule(cidx);
	}
	
	/**약속 캘린더 일정 수정*/
	@Override
	public int updateYaksokCalendar(YaksokCalendarVO yaksokCalendar) {
		return yaksokCalendarMapper.updateYaksokCalendar(yaksokCalendar);
	}
	
	/**약속 캘린더 일정 삭제*/
	@Override
	public int deleteYaksokCalendar(String cidx) {
		return yaksokCalendarMapper.deleteYaksokCalendar(cidx);
	}
	
	
	
	
	
	//--------------------YaksokReserveListMapper 관련
	
	/**약속 예약 정보 개수*/
	@Override
	public int getYaksokReserveCount(String yidx) {
		return yaksokReserveListMapper.getYaksokReserveCount(yidx);
	}

	/**약속 예약 유저 정보 리스트 페이징*/
	@Override
	public List<YaksokReserveVO> selectAllYaksokReserve(String yidx, int start, int end) {
		
		Map<String, String> map=new HashMap<>();
		map.put("yidx", yidx);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return yaksokReserveListMapper.selectAllYaksokReserve(map);
	}

	/**약속 예약 유저 정보*/
	@Override
	public YaksokReserveVO selectYaksokReserve(String ridx) {
		return yaksokReserveListMapper.selectYaksokReserve(ridx);
	}

	/**약속 예약 유저의 unchecked 정보 수정*/
	@Override
	public int updateYaksokReserve(String ridx) {
		return yaksokReserveListMapper.updateYaksokReserve(ridx);
	}
	
	
	
	
	
	//--------------------YaksokStatisticsMapper 관련	
	
	/**약속 예약 정보의 year데이터*/
	@Override
	public List<String> getAllYaksokReserveYearList(String yidx) {
		return yaksokStatisticsMapper.getAllYaksokReserveYearList(yidx);
	}

	/**약속 예약 정보의 month데이터*/
	@Override
	public List<String> getAllYaksokReserveMonthList(String yidx, String year) {

		Map<String, String> map=new HashMap<>();
		map.put("yidx", yidx);
		map.put("year", year);
		
		return yaksokStatisticsMapper.getAllYaksokReserveMonthList(map);
	}

	/**약속 예약 정보의 1회만 예약을 한 예약의 수*/
	@Override
	public int selectYaksokReserveNotOverlapCount(String yidx) {
		return yaksokStatisticsMapper.selectYaksokReserveNotOverlapCount(yidx);
	}

	/**약속 예약 정보의 중복을 제거한 총 유저 수*/
	@Override
	public int selectYaksokReserveUserCount(String yidx) {
		return yaksokStatisticsMapper.selectYaksokReserveUserCount(yidx);
	}
	
	@Override
	public List<String> selectYaksokReserveMonthData(String yidx, String year_month_data, String month_last_day) {
		
		Map<String, String> map=new HashMap<>();
		map.put("yidx", yidx);
		map.put("year_month_data", year_month_data);
		map.put("month_last_day", month_last_day);
		
		return yaksokStatisticsMapper.selectYaksokReserveMonthData(map);
	}
	
	
	
	
	
	//--------------------YaksokSettingMapper 관련

	/**yidx로 약속 OnOff 정보 부르기*/
	@Override
	public YaksokOnOffVO selectYaksokOnOff(String yidx) {
		return yaksokSettingMapper.selectYaksokOnOff(yidx);
	}

	/**약속 OnOff 정보 수정*/
	@Override
	public int updateYaksokOnOff(YaksokOnOffVO yaksokOnOff) {
		return yaksokSettingMapper.updateYaksokOnOff(yaksokOnOff);
	}
	
}
