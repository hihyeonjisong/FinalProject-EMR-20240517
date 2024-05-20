package kr.or.ddit.controller.comm;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ILoginService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class SignupController {
	
	@Inject
	public ILoginService loginService;
	
	
	@GetMapping("/signup")
	public String signupForm() {
		return "/signup";
	}

	@PostMapping("public/signup.do")
	public String signup(MemberVO tm, Model model, HttpServletRequest req, RedirectAttributes ra) {
		log.info("getMemId : " + tm.getMemId());
		log.info("getMemPw : " + tm.getMemPw());
		log.info("getMemPw2 : " + tm.getMemPw2());
		log.info("getMemAddress1 : " + tm.getMemAddress1());
		log.info("getMemAddress2 : " + tm.getMemAddress2());
		log.info("getEmpJob : " + tm.getEmpJob());
		log.info("getMemEmail : " + tm.getMemEmail());
		log.info("getMemRegno : " + tm.getMemRegno());
		ServiceResult serviceResult = loginService.signup(tm, req);

		return "patient/home";
	}
	
	@ResponseBody
	@PostMapping("/public/idChk.do")
	public ResponseEntity<ServiceResult> idCheck(@RequestBody Map<String, Object> map){
		String checkId = (String) map.get("checkId");
		
		ServiceResult result = loginService.checkId(checkId);
		
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	};
	
	@GetMapping("patient/signup.do")
	public String patientSignupForm() {
		
		return ("patient/signup");
	}
	
	@PostMapping("patient/signup.do")
	public String patientSignup(MemberVO tm) {
		
		ServiceResult result = loginService.pSignUp(tm);
		
		// 성공
		if(result.equals(ServiceResult.OK)) return "redirect:/home";
			
		// 실패
		return "redirect:/patient/signup.do";
	}

}
