package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("### CustomAccessDeniedHandler handler() 실행...!");
		
		//접근이 거부되어 해당 핸들러가 실행된다.
		//핸들러로 넘겨받은 접근 거부에 이벤트를 이곳에서 처리하고자 하는 프로세스로 처리 후,
		//accessError의 목적지로 Access Denied 페이지를 화면에 출력한다.
		response.sendRedirect("/accessError");
	}
	
	

}
