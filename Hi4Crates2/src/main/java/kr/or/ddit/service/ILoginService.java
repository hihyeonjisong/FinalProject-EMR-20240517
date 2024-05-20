package kr.or.ddit.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;

public interface ILoginService {

	ServiceResult signup(MemberVO tm, HttpServletRequest req);

	ServiceResult checkId(String checkId);

	String getAccessTokenFromKakao(String client_id, String code) throws Exception;

	HashMap<String, Object> getUserInfo(String accessToken) throws Exception;

	MemberVO findkakao(String id);

	int kakaoInsert(MemberVO kakaoMember);

	String findId(MemberVO memberVo);

	String checkCount(MemberVO memberVo);

	int updatePw(MemberVO memberVo);

	ServiceResult pSignUp(MemberVO tm);

}
