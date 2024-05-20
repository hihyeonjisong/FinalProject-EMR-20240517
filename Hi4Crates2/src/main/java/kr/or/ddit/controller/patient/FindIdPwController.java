package kr.or.ddit.controller.patient;

import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.ILoginService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/patient")
public class FindIdPwController {
	
	@Inject
	public ILoginService loginService;
	
	@Inject
	JavaMailSenderImpl mailSender;
	
	@GetMapping("/findForm")
	public String Findform() {
		
		
		return "patient/findForm";
	}
	
	@PostMapping("/findId")
	public ResponseEntity<String> findId(MemberVO memberVo) {
	
	
	String findId = loginService.findId(memberVo);
	
	return new ResponseEntity<String>(findId, HttpStatus.OK);
	
	}
	
	@PostMapping("/checkCount")
	public ResponseEntity<String> equalCount(MemberVO memberVo) {
		
		String checkCount = loginService.checkCount(memberVo);
		
		
		return new ResponseEntity<String>(checkCount, HttpStatus.OK);
	}
	
	@PostMapping("/changePw")
	public ResponseEntity<String> changePw(MemberVO memberVo
			 ) {
		
		UUID uuid = UUID.randomUUID();
	    // UUID를 문자열로 변환하고 '-'를 제거하여 6글자의 문자열로 임시 비밀번호 생성
	    String Pw = "ddit!"+uuid.toString().replaceAll("-", "").substring(0, 6);
	    System.out.println("##########바꾼 비밀번호 " + Pw);
	    
		memberVo.setMemPw(Pw);
		System.out.println(memberVo.getMemPw());
		int changePw = loginService.updatePw(memberVo);
		
		System.out.println(changePw);
		
		String setFrom = "hi4crates@gmail.com";
		String toMail = memberVo.getMemEmail()+"";
		String title = "대덕정형외과 임시비밀번호 입니다.";
		String content = "임시비밀번호는 " + Pw + " 입니다."+
						"<br>" +
						"로그인 후 비밀번호를 변경해주세요(찡긋~♥)";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<String>(Pw, HttpStatus.OK);
	}
}
