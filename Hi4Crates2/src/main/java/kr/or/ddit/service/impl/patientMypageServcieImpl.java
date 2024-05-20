package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IPatientMypageMapper;
import kr.or.ddit.service.IPatientMypageService;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.EvaluationVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class patientMypageServcieImpl implements IPatientMypageService {

	@Inject
	private IPatientMypageMapper mapper;
	
	@Inject
	public PasswordEncoder pe;

	@Override
	public List<ClinicReservationVO> list(int memNo) {

		return mapper.reservList(memNo);
	}

	@Override
	public MemberVO selectOne(String memNo) {
		return mapper.selectOne(memNo);
	}


	@Override
	public ServiceResult updateAccount(HttpServletRequest req, MemberVO memberVO) {
		ServiceResult result = null;
		int status = mapper.updateAccount(memberVO);
		if(status > 0) result = ServiceResult.OK;
		else if(status == 0) result = ServiceResult.FAILED;
//		System.out.println("#####status" + status);
		return result;
	}

	@Override
	public MemberVO checkPw(MemberVO memberVO) {
		
		return mapper.checkPw(memberVO);
	}

	@Override
	public int chagePw(MemberVO memberVO) {
		memberVO.setMemPw(pe.encode(memberVO.getMemPw()));
		return mapper.changePw(memberVO);
	}

	@Override
	public int deleteAccount(MemberVO memberVO) {

		return mapper.deleteAccount(memberVO);
	}

	@Override
	public List<CounselVO> cList(MemberVO memVO) {
		
		return mapper.counselList(memVO);
	}

	@Override
	public List<EvaluationVO> eList(MemberVO memberVO) {

		return mapper.eList(memberVO);
	}

	@Override
	public int delCReserv(ClinicReservationVO clinicReservationVO) {

		return mapper.delCReserv(clinicReservationVO);
	}

	@Override
	public ClinicReservationVO recentReserve(int memNo) {

		return mapper.recentReserve(memNo);
	}

	@Override
	public ClinicReservationVO willVisit(int memNo) {
		return mapper.willVisit(memNo);
	}

}
