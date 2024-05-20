package kr.or.ddit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
/**
 * 충돌 
 * @author PC-05
 *
 */
// test11 
@Controller
public class HomeController {
	
	@GetMapping("/home")
	public String goHome() {
		
		return "patient/home";
	}
}
