package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IStatisticsMapper;
import kr.or.ddit.service.IStatisticsService;
import kr.or.ddit.vo.HospitalizationRecordVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class StatisticsServcieImpl implements IStatisticsService {

	@Inject
	private IStatisticsMapper mapper;
	

	@Override
	public int mCount(MemberVO rVO) {
		return mapper.manCount(rVO);
	}
	
	@Override
	public int dCount(MemberVO mVO) {
		return mapper.dCount(mVO);
	}
	@Override
	public int nCount(MemberVO mVO) {
		return mapper.nCount(mVO);
	}
	@Override
	public int rCount(MemberVO mVO) {
		return mapper.rCount(mVO);
	}
	@Override
	public int pCount(MemberVO mVO) {
		return mapper.pCount(mVO);
	}
	@Override
	public int oCount(MemberVO mVO) {
		return mapper.oCount(mVO);
	}
	
	
	
	@Override
	public int mriCount(MemberVO mVO) {
		return mapper.mriCount(mVO);
	}
	@Override
	public int xrayCount(MemberVO mVO) {
		return mapper.xrayCount(mVO);
	}
	@Override
	public int phyCount(MemberVO mVO) {
		return mapper.phyCount(mVO);
	}
	@Override
	public int serCount(MemberVO mVO) {
		return mapper.serCount(mVO);
	}
	@Override
	public int hpCount() {
		return mapper.hpCount();
	}

	
	
	
	@Override
	public int moneyMonth(MemberVO mVO) {
		return mapper.moneyMonth(mVO);
	}

	
	@Override
	public int yearGet() {
		return mapper.yearGet();
	}

	@Override
	public int monthGet() {
		return mapper.monthGet();
	}


}
