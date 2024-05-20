package kr.or.ddit.controller.doctor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IMainChartService;
import kr.or.ddit.service.IOrderSetService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/orderSet")
@Slf4j
public class OrderSetController {
	
	@Inject
	IOrderSetService orderSetService;
	
	@Inject
	IMainChartService mainChartService;
	
	//로그인한 의사정보
	private MemberVO myInfo;
	
	//로그인한 의사 사번
	private int empNo;
	
	/**
	 * 오더세트 메인화면 호출, 오더세트 이름 리스트 가져옴
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String main(Model model, HttpServletRequest req) {
		
		CustomUser user = (CustomUser) req.getSession().getAttribute("user");
		myInfo = user.getMember();
		log.info(""+myInfo);
		int memNo = myInfo.getMemNo();
		//의사번호 담기
		empNo = mainChartService.getEmpNo(memNo);
		
		
		List<GroupOrderVO> orderSetList = orderSetService.getOrderSetList(empNo);
		
		model.addAttribute("orderSetList",orderSetList);
	
		return "doctor/orderSet";
	}
	
	@PostMapping("/detail")
	@ResponseBody
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<Map<String, Object>> getOrderSetDetail(@RequestBody Map<String, String> map){
		
		int groupOrderNo = Integer.parseInt(map.get("groupOrderNo"));
		
		Map<String, Object> orderSetDetailMap = new HashMap<String, Object>();
		
		//오더세트 이름
		String orderSetName = orderSetService.getOrderSetName(groupOrderNo);

		//오더세트 상병
		List<GroupOrderDetailVO> orderSetDiseaseList = orderSetService.getOrderSetDisease(groupOrderNo);
		
		//오더세트 처방약
		List<GroupOrderDetailVO> orderSetMedicineList = orderSetService.getOrderSetMedicine(groupOrderNo);
		
		
		orderSetDetailMap.put("orderSetName", orderSetName);
		orderSetDetailMap.put("orderSetDiseaseList", orderSetDiseaseList);
		orderSetDetailMap.put("orderSetMedicineList", orderSetMedicineList);
		
		return new ResponseEntity<Map<String,Object>>(orderSetDetailMap, HttpStatus.OK);
		
	}
	
	@ResponseBody
	@PostMapping("/delete")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> deleteOrderSet(@RequestBody Map<String, String> map){
		
		int groupOrderNo = Integer.parseInt(map.get("groupOrderNo"));
		
	 	ServiceResult result = orderSetService.deleteOrderSet(groupOrderNo);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/modify")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> modifyOrderSet(@RequestBody Map<String, String> map){
		
		int groupOrderNo = Integer.parseInt(map.get("groupOrderNo"));
		
		//먼저 삭제하고
	 	ServiceResult result = orderSetService.deleteOrderSet(groupOrderNo);
	 	//등록함
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}



}
