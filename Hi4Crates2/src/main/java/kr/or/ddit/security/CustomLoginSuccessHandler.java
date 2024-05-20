package kr.or.ddit.security;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Inject
	private MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("-------------로그인 처리 성공-------------");
		User customUser = (User) authentication.getPrincipal();
		request.getSession().setAttribute("user", customUser);
		log.info("세션에 저장된 사용자 정보: {}", customUser);
		
	    // 권한 확인
	    log.info("사용자 권한: {}", customUser.getAuthorities()); 
//	    for (GrantedAuthority authority : customUser.getAuthorities()) {
//	        if (authority.getAuthority().equals("READY") || authority.getAuthority().equals("ROLE_READY")) {
//	            // 사용자가 'READY' 권한을 가지고 있다면 시큐리티 작업을 초기화하고 특정 화면으로 리다이렉트
//	        	log.info(authority.getAuthority());
//	        	SecurityContextHolder.clearContext();
//	            response.sendRedirect("/noApprove"); // 접속을 막을 특정 화면의 URL로 변경
//	            return;
//	        }
//	    }
		// 인증이 완료된 사용자 ID 꺼내기
		log.info("유저네임 : "+customUser.getUsername());
		// 인증이 오나료된 사용자 pw 꺼내기
		log.info("비번 : "+customUser.getPassword());
		
		// 세션에 등록되어있는 인증 과정에서 발생한 에러 정보를 삭제
		clearAuthenticationAttribute(request);
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = "/home";
		
		// 타겟 정보가 존재함
		if(savedRequest != null) targetUrl = savedRequest.getRedirectUrl();
		
		log.info("타겟 URL Login Succes targetUrl : "+targetUrl);
		response.sendRedirect(targetUrl);
	}

	private void clearAuthenticationAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session == null) {
			return;
		}
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
