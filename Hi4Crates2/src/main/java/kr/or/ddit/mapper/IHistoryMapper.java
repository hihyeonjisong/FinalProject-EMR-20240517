package kr.or.ddit.mapper;

import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.MemberVO;

public interface IHistoryMapper {

	public void updateMediCare(MemberVO memberVO);

	public int updateHistory(HistoryVO historyVO);

	

}
