package kr.or.ddit.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommonController {
	
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("접근 비인가 처리 --------------");
		log.info("접근 비인가 처리 --------------" + auth);
		
		// org.springframework.security.authentication.UsernamePasswordAuthenticationToken@34234
		// Principal : org.springframework.security.core.userdetails.User@ahfh784
		// Username : member;
		// Password : [PROTECTED];
		// Enabled : true;
		// AccountNonExpired : true;
		// credentialsNonExpired : true;
		// AccountNonLocked : true;
		// Granted Authorities : ROLE_MEMBER;
		// Credentials : [PROTECTED];
		// Authenticated : true;
		// Details : org.springframework.security.web.authentication.WebAuthenticationDetail@166c822
		// SessionId : B8u8897y89y87OKLHKU**U**U*KJH;
		// Granted Authorities : ROLE_MEMBER
		
		model.addAttribute("msg", "접근 권한이 없습니다!");
		return "accessError";
	}
	@GetMapping("/noApprove")
	public String noApproveSignUp(Authentication auth, Model model) {
		log.info("접근 비인가 처리 --------------");
		log.info("접근 비인가 처리 --------------" + auth);
		
		model.addAttribute("msg", "접근 권한이 없습니다!");
		return "noApprove";
	}
	
}
