package com.user.mapper;

import java.util.List;
import java.util.Map;

import com.user.domain.UserVO;

public interface AdminMapper {
	
	
	//--------------------회원 정보 관련
	
	/** 회원 리스트 출력 */
	List<UserVO> selectAllUserAdmin();
	
	/** idx로 회원 정보 가져오기 */
	UserVO selectUserByIdx(String idx);
	
	/** idx로 해당 회원이 등록한 약속 수 가져오기 */
	int selectYaksokCountOfUser(String idx);
	
	/** 페이징된 회원 리스트 가져오기 */
	List<UserVO> selectAllUserAdmin_paging(Map<String, String> map);
	
	/** 회원의 mstate값을 수정 */
	Integer editUserMstateAdmin(Map<String, String> map);

}
