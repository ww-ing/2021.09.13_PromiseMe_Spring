package com.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.user.domain.UserVO;
import com.user.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminMapper adminMapper;
	
	//---------------------회원 관리 관련

	/** 회원 리스트 출력 */
	@Override
	public List<UserVO> selectAllUserAdmin() {
		return adminMapper.selectAllUserAdmin();
	}
	
	/** idx로 회원 정보 가져오기 */
	@Override
	public UserVO selectUserByIdx(String idx) {
		return adminMapper.selectUserByIdx(idx);
	}

	/** idx로 해당 회원이 등록한 약속 수 가져오기 */
	@Override
	public int selectYaksokCountOfUser(String idx) {
		return adminMapper.selectYaksokCountOfUser(idx);
	}

	/** 페이징된 리스트 가져오기 */
	@Override
	public List<UserVO> selectAllUserAdmin_paging(int start, int end) {
		Map<String, String> map=new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		
		return adminMapper.selectAllUserAdmin_paging(map);
	}

	/** 회원상태 수정 */
	@Override
	public Integer editUserMstateAdmin(String idx, String mstate) {
		Map<String, String> map=new HashMap<>();
		map.put("idx", idx);
		map.put("mstate", mstate);
		
		return adminMapper.editUserMstateAdmin(map);
	}
	
	
	
	
	
	//---------------------약속 통계 관련

	@Override
	public List<String> getAllYaksokReserveYearList() {
		return adminMapper.getAllYaksokReserveYearList();
	}

	@Override
	public List<String> getAllYaksokReserveMonthList(String year) {
		return adminMapper.getAllYaksokReserveMonthList(year);
	}

	@Override
	public Map<String, Object> selectYaksokReserveMonthData(String year_month_data, String month_last_day) {
		Map<String, Object> map=new HashMap<>();
		map.put("year_month_data", year_month_data);
		map.put("month_last_day", month_last_day);
		
		adminMapper.selectYaksokReserveMonthData(map);
		return map;
	}

	@Override
	public Map<String, Object> selectYaksokReserveYearData(String year_selectYear) {
		Map<String,Object> map=new HashMap<>();
		map.put("year_selectYear", year_selectYear);
		
		adminMapper.selectYaksokReserveYearData(map);
		return map;
	}

	/** 총 약속 등록 수 가져오기 */
	@Override
	public int selectTotalYaksokCount() {
		return adminMapper.selectTotalYaksokCount();
	}

	/** 최근 7일 등록 수 가져오기 */
	@Override
	public int selectWeekYaksokCount() {
		return adminMapper.selectWeekYaksokCount();
	}

	/** 최근 30일 등록 수 가져오기 */
	@Override
	public int selectMonthYaksokCount() {
		return adminMapper.selectMonthYaksokCount();
	}
	
	/** 최근 1년 등록 수 가져오기 */
	@Override
	public int selectYearYaksokCount() {
		return adminMapper.selectYearYaksokCount();
	}

}
