package kr.or.ddit.controller.email;

import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class EmailController {
	
	@Inject
	JavaMailSenderImpl mailSender;
	
	@PostMapping(value = "/public/emailAuth")
	@ResponseBody
	public ResponseEntity<Integer> emailAuth(@RequestBody Map<String, Object> map) {
		log.info("전달 ㅂ다은 이메일 주소 : " + map.get("email"));
		
//		111111~999999
		Random ran = new Random();
		 int checkNum = ran.nextInt(888888)+111111; 
		
//		이메일 양식
		String setFrom = "hi4crates@gmail.com";
		String toMail = map.get("email")+"";
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다."+
						"<br>" +
						"해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
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
		
		log.info("랜덤 숫자 : " + checkNum );
		return new ResponseEntity<Integer>(checkNum, HttpStatus.OK);
		
	}
	
}
