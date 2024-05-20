package kr.or.ddit.controller.patient;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IDoctorListService;
import kr.or.ddit.vo.DoctorCareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RealmVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/aboutUs")
@Slf4j
public class aboutHospitalController {

	@Inject
	private IDoctorListService service;
	
	@GetMapping("/hospital")
	public String aboutUs() {
		
		return "patient/aboutHospital";
	}
	
	@GetMapping("/doctor")
	public String doctor(Model model) {
	
		List<MemberVO> docList = service.docList();
		
		for (int i = 0; i < docList.size(); i++) {
			MemberVO member = docList.get(i);
//			log.info("doctorName : " + member.getMemName());
			List<RealmVO> realmList = member.getRealmList();
			for (int j = 0; j < realmList.size(); j++) {
				RealmVO realm = realmList.get(j);
//				log.info("realm : " + realm.getRealmName());
			}
			List<DoctorCareerVO> careerVO = member.getCareerList();
			for (int j = 0; j < careerVO.size(); j++) {
				DoctorCareerVO career = careerVO.get(j);
//				log.info("career : " + career.getCareerName());
			}
		}
		
//		System.out.println("###docList" + docList);
		
		model.addAttribute("docList", docList);
		
		
		return "patient/aboutDoctor";
	}
	
	@GetMapping("/equipment")
	public String equipment() {
		
		return "patient/aboutEquipment";
	}
}
