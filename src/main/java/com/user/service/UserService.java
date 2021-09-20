package com.user.service;

import com.user.domain.UserVO;

public interface UserService {
	
	/**회원 등록*/
	int insertUser(UserVO user);
	
	/**아이디로 회원 정보 검색*/
	UserVO selectUserById(String userid);
	
	/**회원 정보 수정*/
	int updateMyInfo(UserVO user);
	
}