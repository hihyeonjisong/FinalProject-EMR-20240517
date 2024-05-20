package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.AuthMapper;
import kr.or.ddit.service.IAuthService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberAuth;
import kr.or.ddit.vo.MemberVO;

@Service
public class AuthServiceImpl implements IAuthService{

	@Inject
	private AuthMapper authMapper;
	
	@Override
	public ServiceResult permit(MemberVO memberVO) {
		// 유저 테이블 Permission Y 로 변경,
		int res1 = authMapper.updateEmpPermission(memberVO);
		// Auth 테이블 
		int memNo = memberVO.getMemNo();
		String empJob = memberVO.getEmpJob();
		MemberAuth auth = new MemberAuth();
		// 의사, 간호사, 치료사 -> ROLE_ADMIN
		if(empJob.equals("의사") || empJob.equals("간호사") || empJob.equals("물리치료사") || empJob.equals("방사선사")) auth.setAuthName("ROLE_ADMIN");
		// 원무과 -> ROLE_SUPER
		else if(empJob.equals("원무과")) auth.setAuthName("ROLE_SUPER");
		auth.setMemNo(memberVO.getMemNo());
		int res2 = authMapper.insertAuth(auth);
		
		// EMP 테이블에 정보넣기
		EmpVO emp = new EmpVO();
		emp.setEmpJob(empJob);
		emp.setMemNo(memNo);
		
		int res3 = authMapper.insertEmp(emp);
		if(res1 > 0 && res2 > 0 && res3 >0) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult xPermit(MemberVO memberVO) {
		if(authMapper.xPermit(memberVO) > 0) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

}
