package kr.or.ddit.controller.admin;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IWorkHistoryService;
import kr.or.ddit.vo.VacationRequestVO;
import kr.or.ddit.vo.WorkHistoryVO;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping
@Slf4j
public class AttendanceController {
	
	@Inject
	private IWorkHistoryService workHistoryService;
	
	@PostMapping("/public/startwork.do")
	public ResponseEntity<String> startWork(@RequestBody Map<String, Object> map){
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		String workStartTime = currentTime.format(formatter);
		log.info(workStartTime);
		log.info(""+map.get("memNo"));
		int memNo =(int) map.get("memNo");
		log.info(""+memNo);
		WorkHistoryVO workVO = new WorkHistoryVO();
		workVO.setWorkStartTime(workStartTime);
		workVO.setMemNo(memNo);
		
		ServiceResult result = workHistoryService.startWork(workVO);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>(workStartTime,HttpStatus.OK);
		else return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/public/endwork.do")
	public ResponseEntity<String> endwork(@RequestBody Map<String, Object> map){
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		String workEndTime = currentTime.format(formatter);
		log.info(workEndTime);
		
		WorkHistoryVO workVO = new WorkHistoryVO();
		workVO.setWorkEndTime(workEndTime);
		workVO.setMemNo((int)map.get("memNo"));
		
		ServiceResult result = workHistoryService.endWork(workVO);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>(workEndTime,HttpStatus.OK);
		else return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	
}
