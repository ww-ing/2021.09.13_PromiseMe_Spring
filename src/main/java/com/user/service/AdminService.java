package com.user.service;

import java.util.List;
import java.util.Map;

import com.user.domain.UserVO;

public interface AdminService {
	
	
	//--------------------회원 정보 관련
	
	/** 회원 리스트 가져오기 */
	List<UserVO> selectAllUserAdmin();
	
	/** idx로 회원 정보 가져오기 */
	UserVO selectUserByIdx(String idx);
	
	/** idx로 해당 회원이 등록한 약속 수 가져오기 */
	int selectYaksokCountOfUser(String idx);
	
	/** 페이징된 회원 리스트 가져오기 */
	List<UserVO> selectAllUserAdmin_paging(int start, int end);
	
	/** 회원의 mstate값을 수정 */
	Integer editUserMstateAdmin(String idx, String mstate);
	
	//--------------------약속 통계 관련
	
	/**약속 예약 정보의 year데이터*/
	List<String> getAllYaksokReserveYearList();
	
	/**약속 예약 정보의 month데이터*/
	List<String> getAllYaksokReserveMonthList(String year);
	
	/**약속 얘약 정보의 month 데이터*/
	Map<String,Object> selectYaksokReserveMonthData(String year_month_data, String month_last_day);
	
	/**약속 예약 정보의 year 데이터*/
	Map<String,Object> selectYaksokReserveYearData(String year_selectYear);
	
	/** 총 등록 약속 가져오기 */
	int selectTotalYaksokCount();
	
	/** 최근 7일 등록 약속 가져오기 */
	int selectWeekYaksokCount();
	
	/** 최근 30일 등록 약속 가져오기 */
	int selectMonthYaksokCount();
	
	/** 최근 1년 약속 가져오기 */
	int selectYearYaksokCount();

}
