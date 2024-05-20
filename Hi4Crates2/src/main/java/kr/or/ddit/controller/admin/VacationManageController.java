package kr.or.ddit.controller.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.INotiService;
import kr.or.ddit.service.IVacationService;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.VacationRequestVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping
public class VacationManageController {
	
	@Inject
	private IVacationService vacationService;
	
	@Inject
	private INotiService notiService;
	
	@ResponseBody
	@PostMapping("/public/vacationRequest.do")
	public ResponseEntity<String> vacationRequest(@RequestBody VacationRequestVO vacationVO){
		log.info("vacationStartDate : "+vacationVO.getVacationStartDate());
		log.info("vacationEndDate : "+vacationVO.getVacationEndDate());
		log.info("vacationDate : "+vacationVO.getVacationDate());
		log.info("memNo : "+vacationVO.getMemNo());
		log.info("vacationReason : "+vacationVO.getVacationReason());
		
		ServiceResult result = vacationService.vacationRequest(vacationVO);
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		if(result.equals(ServiceResult.FAILED)) return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		return null;
	}
	
	@PreAuthorize("hasRole('ROLE_SUPER')")
	@GetMapping("/admin/vacationRequestList")
	public String vacationRequestList(Model model) {
		List<VacationRequestVO> vacationReqList = vacationService.getVacationReqList();
		model.addAttribute("vacationReqList", vacationReqList);
		return "main/admin/vacationManage";
	}
	
	@ResponseBody
	@PostMapping("/admin/vacationrequestagree.do")
	public ResponseEntity<String> vacationRequestAgree(@RequestBody VacationRequestVO reqVO){
			
		ServiceResult result = vacationService.agreeRequest(reqVO);
		
//		NotificationVO notiVO = new NotificationVO();
//		
//		
//		notiVO.setEmpNo(reqVO.getEmpNo());
//		notiVO.setNotificationPerson(1);
//		notiVO.setNotificationContent("당신의 연가신청이 승인되었습니다.");
//		
//		notiService.insertNoti(notiVO);
//		
//		log.info(notiVO.getNotificationNo()+"");
		
//		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>(notiVO.getNotificationNo()+"", HttpStatus.OK);
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("", HttpStatus.OK);
		else return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping("/admin/vacationrequestdisagree.do")
	public ResponseEntity<String> vacationRequestDisagree(@RequestBody Map<String, Object> map) {
		vacationService.disagreeRequest(map);
		
//		NotificationVO notiVO = new NotificationVO();
//		
//		notiVO.setEmpNo(Integer.parseInt((String)map.get("empNo")));
//		notiVO.setNotificationContent((String)map.get("reason"));
//		notiService.insertNoti(notiVO);
		
		return new ResponseEntity<String>("", HttpStatus.OK);		
	}
}
