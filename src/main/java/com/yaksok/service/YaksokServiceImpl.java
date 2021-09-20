package com.yaksok.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokVO;
import com.yaksok.mapper.YaksokMapper;

@Service("yaksokService")
public class YaksokServiceImpl implements YaksokService {
	
	@Inject
	private YaksokMapper yaksokMapper;

	/**idx로 약속 정보 리스트 불러오기*/
	@Override
	public List<YaksokVO> selectAllYaksok(String idx) {
		return yaksokMapper.selectAllYaksok(idx);
	}

	@Override
	public int insertYaksok(YaksokVO yaksok) {
		return yaksokMapper.insertYaksok(yaksok);
	}

	@Override
	public int insertYaksokInfo(YaksokInfoVO yaksokInfo) {
		return yaksokMapper.insertYaksokInfo(yaksokInfo);
	}

	@Override
	public int insertYaksokOnOff(YaksokOnOffVO yaksokOnOff) {
		return yaksokMapper.insertYaksokOnOff(yaksokOnOff);
	}

}
