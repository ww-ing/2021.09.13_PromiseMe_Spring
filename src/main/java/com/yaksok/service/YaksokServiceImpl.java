package com.yaksok.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokVO;
import com.yaksok.mapper.YaksokMapper;
import com.yaksok.mapper.YaksokThemeMapper;

@Service("yaksokService")
public class YaksokServiceImpl implements YaksokService {
	
	@Inject
	private YaksokMapper yaksokMapper;
	
	@Inject
	private YaksokThemeMapper yaksokThemeMapper;
	
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
	
	

}
