package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.DoctorCareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RealmVO;
import kr.or.ddit.vo.WorkHistoryVO;

public interface IMypageMapper {

	public MemberVO getMyInfo(int memNo);

	public List<RealmVO> getMyRealm(int memNo);

	public List<DoctorCareerVO> getMyCareer(int memNo);

	public int modifyProfile(MemberVO mv);

	public int passwordModify(MemberVO member);

	public WorkHistoryVO getWorkHistory(int memNo);

}
