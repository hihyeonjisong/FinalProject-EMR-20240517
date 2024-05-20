package kr.or.ddit.controller.patient;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.service.ICounselService;
import kr.or.ddit.vo.CounselVO;
import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/counsel")
@Slf4j
public class CounselDetailController {
	
	@Inject
	private ICounselService service;
	
	@GetMapping("/detail")
	public String detail(int counselNo, Model model) {
		
//		log.info("$$$counselNo" + counselNo);
		CounselVO conselOne = service.counselOne(counselNo);
//		System.out.println("conselOne 가져옴 ##" + conselOne);
		
		model.addAttribute("conselOne", conselOne);
		
		return "/patient/counselDetail";
	}
}