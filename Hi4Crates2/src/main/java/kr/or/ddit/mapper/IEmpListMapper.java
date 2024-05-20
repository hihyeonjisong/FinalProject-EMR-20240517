package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpListVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;

public interface IEmpListMapper {

	public List<EmpListVO> getEmpList();

	public int updateEmp(Map<String, Object> map);

}
