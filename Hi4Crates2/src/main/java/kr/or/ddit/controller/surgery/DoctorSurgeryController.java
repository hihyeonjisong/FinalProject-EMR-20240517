package kr.or.ddit.controller.surgery;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.service.IEmpSurgeryService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/emp/surgery")
@Slf4j
public class DoctorSurgeryController {

	@Inject
	private IEmpSurgeryService surgeryService;
	
	@Inject
	private ICalendarService calService;
	
	// 수술 예정 환자 (화면)
//	@RequestMapping(value = "/reservList")
//	public String getSurgeryWaitlist(
//			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
//			Model model
//			) {
//		log.info("getSurgeryWaitlist 실행");
//		PaginationVO<SurgeryReservationVO> pagingVO = 
//				new PaginationVO<SurgeryReservationVO>();
//		
//		// 검색 기능 추가 자리
//		
//		pagingVO.setCurrentPage(currentPage);
//		int totalRecord = surgeryService.getSurgeryReservCount(pagingVO);
//		pagingVO.setTotalRecord(totalRecord);
//		
//		List<SurgeryReservationVO> dataList = 
//				surgeryService.getSurgeryReservList(pagingVO);
//		pagingVO.setDataList(dataList);
//		
//		model.addAttribute("pagingVO", pagingVO);
//		return "empSurgery/surgeryReservation";
//	}
	



	// 수술 일정 등록 (화면)
	@GetMapping("/reservForm")
	public String getSurgeryReservForm() {
		log.info("getSurgeryReservForm 실행");
		return "empSurgery/reservForm";
	}
	
	// 수술 일정 등록 (처리 기능)
	@PostMapping("/reservSurgery")
	public String registerSurgeryReserv (
			SurgeryReservationVO surgeryReservVO
			) {
		log.info("registerSurgeryReserv 실행");
		String goPage = "";
		
		ServiceResult result = surgeryService.insertSurgeryReserv(surgeryReservVO);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/emp/surgery/reservList";
		}else {
			goPage = "empSurgery/waitlist";
		}
		return goPage;
	}
	
	// 수술실 예약 현황 (화면)
	@RequestMapping(value = "/surgeryRoom")
	public String getSurgeryRoomReservStatus() {
		log.info("getSurgeryRoomReservStatus 실행");
		return "empSurgery/reservStatus";
	}
	
	// 수술 기록 조회 (화면)
	@RequestMapping(value = "/surgeryRecord")
	public String getSurgicalRecords() {
		log.info("getSurgicalRecords 실행");
		return "empSurgery/surgicalrecords";
	}
	
	// 수술 종류 조회 (수술 일정 등록시 form 입력에 사용)
//	@GetMapping("/getKinds.do")
//	public ResponseEntity<SurgeryKindVO> getSurgeryKind(
//			@RequestParam(required = false) String surgerySearchWord
//			, Model model
//			){
//		log.info("[searchSurgeryKind] 검색어: " + surgerySearchWord);
//		SurgeryKindVO surgeryKindVO = new SurgeryKindVO();
//		surgeryKindVO = surgeryService.searchSurgeryKind(surgerySearchWord);
//		model.addAttribute("surgeryKindVO", surgeryKindVO);
//		log.info("[searchSurgeryKind] 검색결과: " + surgeryKindVO);
//		
//		return ResponseEntity.ok().body(surgeryKindVO);
//	}
	
	// 수술 종류 조회2 (수술 일정 등록시 form 입력에 사용)
	@ResponseBody
	@RequestMapping(value = "/getKinds.do", method = RequestMethod.GET, 
			produces = "application/json;charset=utf-8")
	public ResponseEntity<List<SurgeryKindVO>> getSurgeryKind(
			){
		log.info("[getSurgeryKind] 실행!");
		List<SurgeryKindVO> list = surgeryService.getSurgeryKindList();
		log.info("[getSurgeryKind] 전체 목록: " + list);
		for (SurgeryKindVO kindVO : list) {
			log.info(kindVO.getSurgeryKindName());
		}
		return new ResponseEntity<List<SurgeryKindVO>>(list, HttpStatus.OK);
	}
	

}
