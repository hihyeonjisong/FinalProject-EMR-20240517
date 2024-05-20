package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.EvaluationVO;
import kr.or.ddit.vo.MemberVO;

public interface IPatientMypageMapper {

	List<ClinicReservationVO> reservList(int memNo);
	MemberVO selectOne(String memNo);
	int updateAccount(MemberVO memberVO);
	MemberVO checkPw(MemberVO memberVO);
	int changePw(MemberVO memberVO);
	int deleteAccount(MemberVO memberVO);
	List<CounselVO> counselList(MemberVO memVO);
	List<EvaluationVO> eList(MemberVO memberVO);
	int delCReserv(ClinicReservationVO clinicReservationVO);
	ClinicReservationVO recentReserve(int memNo);
	ClinicReservationVO willVisit(int memNo);

}
