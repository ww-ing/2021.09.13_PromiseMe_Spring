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

	@Override
	public List<UserVO> selectAllUserAdmin_paging(int start, int end) {
		Map<String, String> map=new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		
		return adminMapper.selectAllUserAdmin_paging(map);
	}

}
