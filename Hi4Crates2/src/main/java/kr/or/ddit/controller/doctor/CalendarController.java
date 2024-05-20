package kr.or.ddit.controller.doctor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.service.IMainChartService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Controller
@Slf4j
@RequestMapping("/calendar")
public class CalendarController {
	
	@Inject
	private ICalendarService calendarService;
	
	@Inject
	private IMainChartService mainChartService;
	
	//로그인한 의사정보
	private MemberVO myInfo;
	
	//로그인한 의사 사번
	private int empNo;
	
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/personal")
	public ResponseEntity<JSONArray> getCalendar(HttpServletRequest req){
		ResponseEntity<JSONArray> data = null;
		log.info("캘린더 실행!");
		
		CustomUser user = (CustomUser) req.getSession().getAttribute("user");
		myInfo = user.getMember();
		int memNo = myInfo.getMemNo();
		//의사번호 담기
		empNo = mainChartService.getEmpNo(memNo);
		List<CalendarVO> dataList = calendarService.getCalendar(empNo);
		
		JSONArray dataArray = new JSONArray().fromObject(dataList);
		
		// JSONArray를 응답으로 전달
		data = new ResponseEntity<JSONArray>(dataArray, HttpStatus.OK);
		return data;
		
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/insertEvent")
	public ResponseEntity<String> insertEvent(@RequestBody CalendarVO calendarVO){
		
		calendarVO.setEmpNo(empNo);
		calendarVO.setCalendarCate("CD001");
		
		ServiceResult result = calendarService.insertEvent(calendarVO);
	
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/deleteEvent")
	public ResponseEntity<String> deleteEvent(@RequestBody CalendarVO calendarVO){
		
		int calendarKey = calendarVO.getCalendarKey();
		ServiceResult result = calendarService.deleteEvent(calendarKey);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		else{
			return new ResponseEntity<String>("FAILED",HttpStatus.OK);
		}
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/updateEvent")
	public ResponseEntity<String> updateEvent(@RequestBody CalendarVO calendarVO){
		
		ServiceResult result = calendarService.updateEvent(calendarVO);
	
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/office")
	public ResponseEntity<JSONArray> getCalendarOffice(){
		ResponseEntity<JSONArray> data = null;
		
		log.info("캘린더 실행!");
		
		List<CalendarVO> dataList = calendarService.getCalendarOffice(empNo);
		
		
		JSONArray dataArray = new JSONArray().fromObject(dataList);
		
		// JSONArray를 응답으로 전달
		data = new ResponseEntity<JSONArray>(dataArray, HttpStatus.OK);
		return data;
		
	}	
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/all")
	public ResponseEntity<JSONArray> getCalendarAll(){
		ResponseEntity<JSONArray> data = null;
		
		log.info("캘린더 실행!");
		
		List<CalendarVO> dataList = calendarService.getCalendarAll(empNo);
		
		
		JSONArray dataArray = new JSONArray().fromObject(dataList);
		
		// JSONArray를 응답으로 전달
		data = new ResponseEntity<JSONArray>(dataArray, HttpStatus.OK);
		return data;
		
	}	
}
