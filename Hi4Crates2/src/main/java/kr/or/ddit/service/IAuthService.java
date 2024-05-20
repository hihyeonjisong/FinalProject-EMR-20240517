package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;

public interface IAuthService {

	public ServiceResult permit(MemberVO memberVO);

	public ServiceResult xPermit(MemberVO memberVO);

}
