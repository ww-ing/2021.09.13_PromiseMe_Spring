package com.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.user.domain.UserVO;
import com.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserMapper userMapper;

	@Override
	public int insertUser(UserVO user) {
		return 0;
	}

	@Override
	public UserVO selectUserById(String userid) {
		return userMapper.selectUserById(userid);
	}

	@Override
	public UserVO selectUser(String idx) {
		return null;
	}

	@Override
	public int updateMyInfo(UserVO user) {
		return 0;
	}

}
