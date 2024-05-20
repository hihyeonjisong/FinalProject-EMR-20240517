package kr.or.ddit.controller.patient;

import java.io.Console;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IPatientMypageService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pAccount")
@Slf4j
public class modifyAccountController {

	@Inject
	public PasswordEncoder pe;
	
	@Inject
	private IPatientMypageService service;
	
	
	@GetMapping("/update.do")
	public String update(String memNo, Model model) {
		MemberVO memberVO = service.selectOne(memNo);
		
		model.addAttribute("memberVO", memberVO);
		return "/patient/updateAccount";
	}
	
	@PostMapping("/update.do")
	public String noticeUpdate(MemberVO memberVO
			,HttpServletRequest req,
			Model model,
			RedirectAttributes ra) {
		
		log.info("###MemberVO" + memberVO);
		
		String goPage = "";
		ServiceResult result = service.updateAccount(req, memberVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 수정되었습니다.");
			goPage = "redirect:/pMypage/home?memNo=" + memberVO.getMemNo();
		} else {
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "pAccount/update.do";
		}
		
		return goPage;
	}
	
	@PostMapping("/check.do")
	@ResponseBody
	public ResponseEntity<Boolean> checkPw(@RequestBody MemberVO memberVO, Model model,
			HttpServletRequest req,
			RedirectAttributes ra) {
		boolean flag = false;
		MemberVO pw = service.checkPw(memberVO);
		
		if(pw != null && pe.matches(memberVO.getMemPw(), pw.getMemPw())) {
			ra.addFlashAttribute("message", "비밀번호가 인증되었습니다.");
			log.info("aaaaaaa");
			flag = true;
		}else {
			log.info("bbbbbb");
			
		}
		
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@GetMapping("/checkPw")
	public String changePw(MemberVO memberVO) {
		return "/patient/changePwForm";
	}
	
	@PostMapping("/checkPw")
	@ResponseBody
	public ResponseEntity<Boolean> changePw2(@RequestBody MemberVO memberVO
			,HttpServletRequest req,
			RedirectAttributes ra) {
		log.info("###MemberVO123" + memberVO);
		boolean flag = false;
		MemberVO pw = service.checkPw(memberVO);
		log.info("pw@#" + pw);
		
		if(pw != null && pe.matches(memberVO.getMemPw(), pw.getMemPw())) {
			ra.addFlashAttribute("message", "비밀번호가 인증되었습니다");
			log.info("cccc");
			flag = true;
		}else {
			log.info("dddd");
			ra.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@GetMapping("/updatePw")
	public String changePw3() {
		
		return "/patient/changePwForm";
	}
	
	@PostMapping("/updatePw")
	public String changePw4(MemberVO memberVO) {
		log.info("###memberVO" + memberVO);
		int changePw = service.chagePw(memberVO);
		System.out.println("###비밀번호 바꾼 상태 " + changePw);
		
		return "redirect:/home";
		
	}
	
	@GetMapping("/deleteAccountCheckPw")
	public String deleteAccount(MemberVO memberVO) {
		
		return "/patient/deletePage";
	}
	
	@ResponseBody
	@PostMapping("/deleteAccountCheckPw")
	public ResponseEntity<Boolean> deleteAccount2(@RequestBody MemberVO memberVO
			,HttpServletRequest req,
			RedirectAttributes ra) {
		
		System.out.println("##계정지우기 memberVO" + memberVO);
		boolean flag = false;
		MemberVO pw = service.checkPw(memberVO);
		
		if(pw != null && pe.matches(memberVO.getMemPw(), pw.getMemPw())) {
			ra.addFlashAttribute("message", "비밀번호가 인증되었습니다");
			log.info("cccc");
			flag = true;
		}else {
			log.info("dddd");
		}
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
//	@GetMapping("/deleteAccount2")
//	public String deleteAccount3(MemberVO memberVo) {
//		
//		return "/patient/deletePage";
//	}
	
	@PostMapping("/deleteAccount2")
	public String deleteAccount4(MemberVO memberVO, HttpServletRequest req) {
		
		System.out.println("####deleteAccount 계정에 Y" + memberVO );
		int deleteAccount = service.deleteAccount(memberVO);
		if(deleteAccount > 0) {
			req.getSession().invalidate();	
		}
		return "redirect:/home";
	}
}
