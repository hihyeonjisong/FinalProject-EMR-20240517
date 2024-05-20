package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.EvaluationVO;
import kr.or.ddit.vo.MemberVO;

public interface IPatientMypageService {

	List<ClinicReservationVO> list(int memNo);
	MemberVO selectOne(String memNo);
	ServiceResult updateAccount(HttpServletRequest req, MemberVO memberVO);
	MemberVO checkPw(MemberVO memberVO);
	int chagePw(MemberVO memberVO);
	int deleteAccount(MemberVO memberVO);
	List<CounselVO> cList(MemberVO memVO);
	List<EvaluationVO> eList(MemberVO memVO);
	int delCReserv(ClinicReservationVO clinicReservationVO);
	ClinicReservationVO recentReserve(int memNo);
	ClinicReservationVO willVisit(int memNo);

	
}
