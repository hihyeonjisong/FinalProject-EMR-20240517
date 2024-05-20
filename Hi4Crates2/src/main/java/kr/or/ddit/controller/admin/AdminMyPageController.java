package kr.or.ddit.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.service.IMypageService;
import kr.or.ddit.service.IVacationService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.DoctorCareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RealmVO;
import kr.or.ddit.vo.VacationRequestVO;
import kr.or.ddit.vo.WorkHistoryVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@Slf4j
public class AdminMyPageController {
	@Inject
	private IMypageService mypageService; 
	
	@Inject
	private IVacationService vacationService;
	
	@Inject
	private PasswordEncoder pe;

	@GetMapping("/mypage/{memNo}")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String goMyPage(@PathVariable int memNo, Model model) {
		MemberVO member = new MemberVO();
		
		member = mypageService.getMyInfo(memNo);
		
		WorkHistoryVO workVO = mypageService.getWorkHistory(memNo);
		
		List<VacationRequestVO> vacationReqList = vacationService.getVacationRequestMine(memNo);
		
//		member = mypageService.getMemInfo(memNo);
//		List<RealmVO> realmList = mypageService.getMyRealm(memNo);
//		List<DoctorCareerVO> careerList = mypageService.getMyCareer(memNo);
		
		model.addAttribute("member", member);
		model.addAttribute("workVO",workVO);
		model.addAttribute("vacationReqList",vacationReqList);
		
//		model.addAttribute("realmList", realmList);
//		model.addAttribute("careerList", careerList);
		return "main/admin/mypage";
	}
//	@PostMapping("/mypage/mypage")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
////	@Secured("ADMIN")
////	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
//	public String goMyPage(@RequestParam("memNo") int memNo, Model model) {
//		MemberVO member = new MemberVO();
//		
//		member = mypageService.getMyInfo(memNo);
//		
//		WorkHistoryVO workVO = mypageService.getWorkHistory(memNo);
//		
//		List<VacationRequestVO> vacationReqList = vacationService.getVacationRequestMine(memNo);
//		
////		member = mypageService.getMemInfo(memNo);
////		List<RealmVO> realmList = mypageService.getMyRealm(memNo);
////		List<DoctorCareerVO> careerList = mypageService.getMyCareer(memNo);
//		
//		model.addAttribute("member", member);
//		model.addAttribute("workVO",workVO);
//		model.addAttribute("vacationReqList",vacationReqList);
//		
////		model.addAttribute("realmList", realmList);
////		model.addAttribute("careerList", careerList);
//		return "main/admin/mypage";
//	}
	
//	@GetMapping("/mypage/myinfo/{memNo}")
//	public String viewMyInfo(@PathVariable int memNo, Model model) {
//		MemberVO member = new MemberVO();
//		member = mypageService.getMyInfo(memNo);
//		model.addAttribute("member", member);
//		return "main/admin/myinfo";
//	}
//	
	@ResponseBody
	@PostMapping("/public/pwchk.do")
	public ResponseEntity<String> passwordCheck(@RequestBody Map<String, Object> map, HttpSession session){		
		String memPw = (String) map.get("memPw");
		String memPw2 = (String) map.get("memPw2");
		boolean isMatched = BCrypt.checkpw(memPw, memPw2);
		if(isMatched) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		else if(!isMatched) return new ResponseEntity<String>("FAILED", HttpStatus.OK);
		return new ResponseEntity<String>("FAILED", HttpStatus.OK);
		
	}
	
//	@GetMapping("/mypage/modifyprofile/{memNo}")
//	public String modifyMyProfileForm(@PathVariable int memNo, Model model) {
//		MemberVO member = new MemberVO();
//		member = mypageService.getMyInfo(memNo);
//		model.addAttribute("member", member);
//		return "main/admin/modifyProfile";
//	}
	
	@PostMapping("/public/mypage/profilemodify.do")
	public String modifyMyProfile(MemberVO mv) {
		ServiceResult result = mypageService.modifyProfile(mv);
		if(result.equals(ServiceResult.OK)) return "redirect:/mypage/"+mv.getMemNo();
//		if(result.equals(ServiceResult.FAILED)) return 
		return null;
	}
	
	@ResponseBody
	@PostMapping("/public/mypage/passwordmodify.do")
	public ResponseEntity<String> modifyMyPassword(@RequestBody Map<String, Object> map){
		String userPassword = (String) map.get("memPw1");
		String modifyPassword = (String) map.get("memPw2");	
		String originPassword = (String) map.get("memPw3");
		if(!BCrypt.checkpw(userPassword, originPassword)) return new ResponseEntity<String>("!MATCH",HttpStatus.OK);
		String m = (String) map.get("memNo");
		int memNo = Integer.parseInt(m);
		
		MemberVO member = new MemberVO();
		member.setMemPw(pe.encode(modifyPassword));
		member.setMemNo(memNo);
		ServiceResult result = mypageService.passwordModify(member);
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		if(result.equals(ServiceResult.FAILED)) return new ResponseEntity<String>("FAILED",HttpStatus.OK);
		return null;
		
	}
	
	
}
