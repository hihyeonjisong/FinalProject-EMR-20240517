package kr.or.ddit.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IAuthService;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SignupPermissionController {
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IAuthService authService;
	
	@GetMapping("/admin/permission")
	public String sigunupPermissionList(Model model) {
		List<MemberVO> memList = memberService.getReqPermissionList();
		model.addAttribute("memList",memList);
		return "main/admin/signupPermission";
	}
	
	@ResponseBody
	@PostMapping("/admin/signuppermit.do")
	public ResponseEntity<String> signupPermit(@RequestBody MemberVO memberVO){
		ServiceResult result =	authService.permit(memberVO);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping("/admin/signupXpermit.do")
	public ResponseEntity<String> signupXPermit(@RequestBody MemberVO memberVO){
		ServiceResult result = authService.xPermit(memberVO);
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
}
