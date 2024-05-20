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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.service.IProtectorService;
import kr.or.ddit.service.ISugeryReservationService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ProtectorVO;
import kr.or.ddit.vo.SurgeryReservationVO;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/surgery")
@Slf4j
public class SurgeryReservationController {
	
	@Inject
	private ISugeryReservationService surgeryService;
	
	@Inject
	private IProtectorService protectorService;
	
	@Inject
	private ICalendarService calService;
	
//	예약 대기 환자 리스트
	@GetMapping("/reservList")
	public String surgeryReservation(Model model) {
		
		List<SurgeryReservationVO> surgeryWaitingList = surgeryService.getSurgeryReservWaitingList();
		model.addAttribute("surgeryWaitingList",surgeryWaitingList);
		
		return "empSurgery/surgeryReservation";
	}
	
// 	기본 캘린더
	@ResponseBody
	@GetMapping("/getSurgeryCal")
	public List<SurgeryReservationVO> getSurgeryCal(){
		
		List<SurgeryReservationVO> surgeryReservList = surgeryService.getSurgeryCal();
		log.info("");
		return surgeryReservList;
	}
	
// 선택시 해당 의사 연가 포함 캘린더
	@ResponseBody
	@PostMapping("/empvacationcal")
	public List<SurgeryReservationVO> empVacationCal(@RequestBody Map<String, String> map){
		
		List<SurgeryReservationVO> surgeryReservList = surgeryService.getSurgeryCal();
		int empNo = Integer.parseInt(map.get("empNo"));
		List<CalendarVO> empVacationList = calService.getEmpVacationList(empNo);
		
		for (CalendarVO c : empVacationList) {
			SurgeryReservationVO sr = new SurgeryReservationVO();
			sr.setTitle(c.getTitle());
			sr.setStart(c.getStart());
			sr.setBackgroundColor(c.getBackgroundColor());
			sr.setEnd(c.getEnd());
			
			surgeryReservList.add(sr);
		}
		
		
		log.info("");
		return surgeryReservList;
	}
	
// 캘린더 날짜 체크
	@PostMapping("/surgerydatecheck")
	public ResponseEntity<List<SurgeryReservationVO>> surgeryDateCheck(@RequestBody Map<String, String> map) {
		
		List<SurgeryReservationVO> surgeryReservVO = surgeryService.surgeryDateCheck(map.get("startStr"));
		
		return new ResponseEntity<List<SurgeryReservationVO>>(surgeryReservVO, HttpStatus.OK);
	}
	
	
// 예약
	@PostMapping("/reservation")
	public ResponseEntity<String> surgeryReservation(@RequestBody SurgeryReservationVO surgeryReservationVO) {
		ServiceResult result = surgeryService.surgeryReservation(surgeryReservationVO);
		
		if(result.equals(ServiceResult.OK)) {
			ProtectorVO protector = new ProtectorVO();
			protector.setProtectorName(surgeryReservationVO.getProtectorName());
			protector.setProtectorRelate(surgeryReservationVO.getProtectorRelate());
			protector.setProtectorTel(surgeryReservationVO.getProtectorTel());
			protector.setPatntNo(surgeryReservationVO.getPatntNo());
			
			result = protectorService.insertProtector(protector);
		}
		
		CalendarVO calendar = new CalendarVO();
		calendar.setAllDay(true);
		if(surgeryReservationVO.getSurgeryRoomNo().equals("1")) calendar.setCalendarColor("red");
		if(surgeryReservationVO.getSurgeryRoomNo().equals("2")) calendar.setCalendarColor("orange");
		calendar.setCalendarTitle(surgeryReservationVO.getPatntName());
		calendar.setCalendarContent(surgeryReservationVO.getSurgeryKindName());
		calendar.setCalendarCate("CD003");
		calendar.setCalendarStartDate(surgeryReservationVO.getSurgeryReservationDate());
		calendar.setCalendarEndDate(surgeryReservationVO.getSurgeryReservationDate());
		calendar.setEmpNo(surgeryReservationVO.getSurgeryDoctor());
		calendar.setPatntNo(surgeryReservationVO.getPatntNo());
		
		calService.insertEvent(calendar);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/modify")
	public ResponseEntity<String> surgeryModify(@RequestBody SurgeryReservationVO surgeryReservationVO){
		ServiceResult result = surgeryService.surgeryModify(surgeryReservationVO);
		
		if(result.equals(ServiceResult.OK)) {
			ProtectorVO protector = new ProtectorVO();
			protector.setProtectorNo(surgeryReservationVO.getProtectorNo());
			protector.setProtectorName(surgeryReservationVO.getProtectorName());
			protector.setProtectorRelate(surgeryReservationVO.getProtectorRelate());
			protector.setProtectorTel(surgeryReservationVO.getProtectorTel());
			protector.setPatntNo(surgeryReservationVO.getPatntNo());
			
			result = protectorService.modifyProtector(protector);
		}
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/delete")
	public ResponseEntity<String> surgeryDelete(@RequestBody Map<String, Object> map){
		int surgeryReservationNo = (int) map.get("surgeryReservationNo");
		ServiceResult result = surgeryService.surgeryDelete(surgeryReservationNo);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	
}
