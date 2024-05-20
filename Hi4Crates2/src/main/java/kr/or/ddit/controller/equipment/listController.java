package kr.or.ddit.controller.equipment;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IEquipmentService;
import kr.or.ddit.vo.EquipmentVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/equipment")
@Slf4j
public class listController {

	@Inject
	private IEquipmentService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<EquipmentVO> list = service.list();
//		log.info("###list" + list);
		
		model.addAttribute("list", list);
		
		return "equipment/list";
	}
	
	
	@ResponseBody
	@PostMapping("/equipmentInfo")
	public ResponseEntity<EquipmentVO> equipmentInfo(@RequestBody Map<String, Integer> eqMap) {
		int eqNo = eqMap.get("eqNo");	
		log.info("###eqNo: " + eqNo);
		EquipmentVO detailInfo = service.detail(eqNo);
		log.info("###eqNo: " + detailInfo);
		
		return new ResponseEntity<EquipmentVO>(detailInfo ,HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/update")
	public String updateEquipment(EquipmentVO eqVO,RedirectAttributes ra) {
		System.out.println("##하이루 여기까지 왔음" + eqVO);
		
		String goPage = "redirect: /equipment/list";
		
		int updateInfoStatus = service.update(eqVO);
		
		if(updateInfoStatus > 0) {
			ra.addAttribute("msg", "수정 성공");
		}else {
			ra.addAttribute("msg", "수정실패");
			goPage = "redirect: /equipment/update";
		}
//		log.info("#update+eqVO" + updateInfo + eqVO);
		return goPage;
		
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<Integer> equipmentDel(@RequestBody Map<String, Integer> eqMap){
		int eqNo = eqMap.get("eqNo");
//		log.info("###eqNo: " + eqNo);
		
		int deleteInfo = service.delete(eqNo);
//		log.info("###delete" + deleteInfo);
		
		return new ResponseEntity<Integer>(deleteInfo,HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/addEquipment")
	public String addEquipment(EquipmentVO eqVO,RedirectAttributes ra) {
//		log.info("추가하기는거 왔심~" + eqVO);
		
		int eqNo = service.addEquip(eqVO);
		
//		log.info("###eqNo됐는지 확인 " + eqNo);
		if(eqNo == 0) {
			return "";
		}else {
			eqVO.setEqNo(eqNo);
			log.info("##eqNo추가한 VO" + eqVO);
			int description = service.addDesc(eqVO);
			log.info("###꺄르륵 성공~" + description);
			
			return "redirect:/equipment/list";
		}
		
	}
}
