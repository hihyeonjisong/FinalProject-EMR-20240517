package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.EmpListVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;

public interface IEmpListService {

	public List<EmpListVO> getEmpList();

	public ServiceResult updateEmp(Map<String, Object> map);

}
