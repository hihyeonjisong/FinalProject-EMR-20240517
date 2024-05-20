package kr.or.ddit.controller.physical;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IEquipmentService;
import kr.or.ddit.vo.EquipmentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/emp/physical")
public class PhysicalEquipmentController {

	@Inject
	private IEquipmentService eqService;
	
	@GetMapping("/equipmentList")
	public String equipmentList(Model model) {
		
		List<EquipmentVO> physicalEq = eqService.getPhysicalEquip();
		
		model.addAttribute("physicalEquip", physicalEq);
		return "empPhysical/physicalEquipmentList";
	}
	
	
}
