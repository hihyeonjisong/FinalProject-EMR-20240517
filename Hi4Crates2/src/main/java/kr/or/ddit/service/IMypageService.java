package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.DoctorCareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RealmVO;
import kr.or.ddit.vo.WorkHistoryVO;

public interface IMypageService {

	public MemberVO getMyInfo(int memNo);

//	public MemberVO getMemInfo(int memNo);

	public List<RealmVO> getMyRealm(int memNo);

	public List<DoctorCareerVO> getMyCareer(int memNo);

	public ServiceResult modifyProfile(MemberVO mv);

	public ServiceResult passwordModify(MemberVO member);

	public WorkHistoryVO getWorkHistory(int memNo);

}
