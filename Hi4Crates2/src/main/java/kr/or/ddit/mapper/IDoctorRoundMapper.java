package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.RoundRecordVO;

public interface IDoctorRoundMapper {

	public List<MemberVO> getPatntRecordsList(int patntNo);
	public MemberVO getPatntRecordInfo(int chartNo);
	public void insertRoundRecord(RoundRecordVO roundRecordVO);
	public List<RoundRecordVO> getRoundRecordList(int hsptlzNo);
	public List<NursingRecordVO> getNursingRecord(int hsptlzNo);
}
