package kr.or.ddit.controller.patient;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/how")
public class howToComeController {

	@GetMapping("/toCome")
	public String toCome() {
		
		return "patient/howtocome";
	}
	
}
