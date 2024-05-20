package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticularVO;
import kr.or.ddit.vo.ProtectorVO;

public interface MemberMapper {

	public int signup(MemberVO tm);

	public int checkId(String checkId);

	public MemberVO readByUserId(String username);

	public MemberVO find(String memId);

	public int kakaoInsert(MemberVO kakaoMember);
	
	public String findId(MemberVO memberVo);
	
	public List<MemberVO> getSearchList(String decodedName);

	public List<ChartVO> getChartRecordList(int param);

	public List<ParticularVO> getParticularList(int memNo);

	public MemberVO getPatntInfo(int memNo);

	public ProtectorVO getProtector(int memNo);

	public String checkCount(MemberVO memberVo);

	public int updatePw(MemberVO memberVo);

	public int pSignup(MemberVO tm);

	public String getMemId(int empNo);

	public List<MemberVO> getReqPermissionList();

	public List<MemberVO> getEmpList();

	public MemberVO getMemberInfo(int memNo);

	public List<MemberVO> getOnlineList();

	public int getMasterNo();

	public int getMemNo(int i);

	public MemberVO getPartiInfo(int parseInt);

	public int getReceiptMemNo(int receiptNo);

}
