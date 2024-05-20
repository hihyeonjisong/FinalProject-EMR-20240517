package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.HospitalizationRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ReceiptVO;

public interface IStatisticsService {
	int mCount(MemberVO rVO);

	int dCount(MemberVO mVO);
	int nCount(MemberVO mVO);
	int rCount(MemberVO mVO);
	int pCount(MemberVO mVO);
	int oCount(MemberVO mVO);
	
	int mriCount(MemberVO mVO);
	int xrayCount(MemberVO mVO);
	int phyCount(MemberVO mVO);
	int serCount(MemberVO mVO);
	int hpCount();

	int moneyMonth(MemberVO mVO);

	int yearGet();
	int monthGet();


}
