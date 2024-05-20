package kr.or.ddit.controller.patient;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IEvaluationService;
import kr.or.ddit.vo.EvaluationVO;

@Controller
@RequestMapping("/star")
public class plusStarController {

	@Inject
	private IEvaluationService service;
	
	@GetMapping("/plusStar")
	public String addStar(EvaluationVO eVO) {
		
		return "/patient/plusStar";
	}
	
	@PostMapping("/plusStar")
	public String addStar2(EvaluationVO eVO) {
		System.out.println("##Eva"+ eVO);
		int update = service.plusStar(eVO);
		
		System.out.println("###update완료" + update);
		
		return "redirect:/pMypage/home";
	}
}
