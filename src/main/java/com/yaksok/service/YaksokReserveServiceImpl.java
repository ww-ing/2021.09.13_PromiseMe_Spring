package com.yaksok.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yaksok.domain.YaksokInfoVO;
import com.yaksok.domain.YaksokOnOffVO;
import com.yaksok.domain.YaksokReserveVO;
import com.yaksok.mapper.YaksokReserveMapper;

@Service("yaksokReserveService")
public class YaksokReserveServiceImpl implements YaksokReserveService {
	
	@Inject
	private YaksokReserveMapper yaksokReserveMapper;

	/**약속 url로 약속 정보 부르기*/
	@Override
	public YaksokInfoVO selectYaksokInfoByURL(String yaksokURL) {
		return yaksokReserveMapper.selectYaksokInfoByURL(yaksokURL);
	}

	/**yidx로 약속 OnOff 정보 부르기*/
	@Override
	public YaksokOnOffVO selectYaksokOnOff(String yidx) {
		return yaksokReserveMapper.selectYaksokOnOff(yidx);
	}

	/**약속 예약 정보 등록*/
	@Override
	public int insertYaksokReserve(YaksokReserveVO yaksokReserve) {
		return yaksokReserveMapper.insertYaksokReserve(yaksokReserve);
	}

}