package kr.or.ddit.controller.comm;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.mapper.AuthMapper;
import kr.or.ddit.mapper.IMainAdminMapper;
import kr.or.ddit.service.ILoginService;
import kr.or.ddit.service.impl.LoginServiceImpl;
import kr.or.ddit.vo.MemberAuth;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Pre;

@Controller
@Slf4j
public class LoginController {
	
	@Inject
	public IMainAdminMapper adminMapper;
	
	@Inject
	public AuthMapper authMapper;
	
	@Inject
	private ILoginService loginService;
	
	@Resource(name="client_id")
	public String client_id;

	@Resource(name="redirect_uri")
	public String redirect_uri;
	
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
	
		log.info("error : "+error);
		log.info("logout : "+logout);
		
		if(error != null) model.addAttribute("error", error);
		if(logout != null) return "redirect:/home";
		
		String location = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+
				client_id+"&redirect_uri="+redirect_uri;
		model.addAttribute("location", location);
		
		return "loginForm";
	}

	
	@GetMapping("/logout")
	@PreAuthorize("permitAll()")
	public String logoutForm() {
		return"logoutForm";
	}
	
	@GetMapping("/callback")
	public String callback(@RequestParam("code") String code) throws Exception {
		
		String goPage = "";
		
		log.info("code" + code);
		// Rest API KEY와 인가code로 로그인한 사용자의 token을 가져옵니다.
		String accessToken = loginService.getAccessTokenFromKakao(client_id, code);
		log.info("accessToken "+ accessToken);
		// token을 이용하여 로그인한 사용자의 정보를 map의 형태로 가져옵니다.
		HashMap<String, Object> userInfo = loginService.getUserInfo(accessToken);
		System.out.println("###userInfo" + userInfo);
		System.out.println(userInfo.get("id"));
		System.out.println(userInfo.get("email"));
		System.out.println(userInfo.get("name"));
		System.out.println(userInfo.get("birthyear"));
		System.out.println(userInfo.get("birthday"));
		
		// 사용자 정보가 담긴 map의 사이즈가 0보다 크다면 사용자 정보가 있다는 것이고
		// 로그인에 성공한 것이다.
		if(userInfo.size() > 0) {
			log.info("성공적으로 카카오로그인");
			goPage = "patient/home";
		}else {
			log.info("실패함");
			goPage = "/login";
		}
		
		return goPage;
	}
	
}
