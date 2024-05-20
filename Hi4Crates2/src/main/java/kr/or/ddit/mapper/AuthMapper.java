package kr.or.ddit.mapper;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberAuth;
import kr.or.ddit.vo.MemberVO;

public interface AuthMapper {

	public void insertEmpAuth(int memNo);

	public int updateEmpPermission(MemberVO memberVO);

	public int insertAuth(MemberAuth auth);

	public int insertEmp(EmpVO emp);

	public int xPermit(MemberVO memberVO);

}
