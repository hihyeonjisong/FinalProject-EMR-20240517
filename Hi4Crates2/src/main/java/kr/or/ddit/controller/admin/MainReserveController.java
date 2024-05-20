package kr.or.ddit.controller.admin;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IAdminReservService;
import kr.or.ddit.service.IMainAdminService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.VacationRequestVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin")
@Slf4j
public class MainReserveController {
	
	@Inject 
	private IMainAdminService mainAdminService;
	
	@Inject
	private IAdminReservService calService;
	
	/*
	 * 주의 사항
	 * 
	 * allDay를  true로 설정한 경우 시작시간, 종료시간이 없어도 된다. (시간 설정은 가능하지만 reSize는 불가능)
	 * allDay가 false이고 시작 날짜만 설정한 경우 시작 시간은 00시, 종료시간은 시작 날짜 + 01시로 설정된다.
	 * allDay가 false이고 시작 날짜, 종료 날짜만 설정하면 시작, 종료날짜는 00시로 설정된다. (allDay 체크 안할 경우 시간 입력 받게 해야할듯)
	 * allDay가 true이면 시작 시간, 종료 시간은 설정하지 않아도 됨 (설정하지 않을 경우 00시로 설정됨)
	 * allDay가 true이면 시작 시간, 종료 시간을 설정해도 무시되고 00시로 설정됨
	 * allDay가 true인 경우 시작 날짜, 종료 날짜를 동일하게 설정하면 종료 날짜가 하루 뒤로 자동으로 설정됨.
	 */

	
	// FullCalender 화면에 띄우기 +  예약 페이지 띄우기
	@GetMapping("/reserveForm")
	public String calendar() {
		log.info("calendar() 실행!!!");
		return "admin/reserve";
	}
	
	// DB 데이터를 FullCalendar페이지에 보내기
	@ResponseBody
	@PostMapping("/loadData")
	public ResponseEntity<JSONArray> loadData(@RequestBody Map<String, Object> map) {
		log.info("****************"+map.get("empNo"));
		int empNo = (int) map.get("empNo");
		
		// ResponseEntity 초기화
		ResponseEntity<JSONArray> data = null;
		log.info("xx");
		
		JSONArray jsonArray = new JSONArray();
		
		// DB에서 예약 데이터를 받아와 List에 저장
		List<ClinicReservationVO> dataList = calService.getData(empNo);
		for (int i = 0; i < dataList.size(); i++) {
			ClinicReservationVO cal = dataList.get(i);
			String date = cal.getReservDate().split(" ")[0];
			String time = cal.getReservTime();
			log.info("Date : " + date);
			log.info("Time : " + time);
			String dateString = date + "T" + time;
			log.info("memo : " + cal.getReservMemo());
			log.info("empNo : "+ empNo);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("title", cal.getReservMemo());
			jsonObj.put("start", dateString);
			jsonArray.add(jsonObj);
		}
		
		// DB에서 연가일정을 받아와 List에 저장
		// 캘린더에 연가일정 띄우기 하던중,,,,,,,,,,,,,
		/*
		List<VacationRequestVO> vacationList =  calService.getVacation(empNo);
		for (int i = 0; i < vacationList.size(); i++) {
			VacationRequestVO vac = vacationList.get(i);
			log.info("no: "+vac.getVacationRequestNo());
			log.info(vac.getVacationStartDate());
			log.info(vac.getVacationEndDate());
			log.info("사원번호: "+vac.getEmpNo());
			
			String date = vac.getVacationStartDate();
			String date2 = date.split(" ")[0];
			log.info(date2);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("title", "연가");
			jsonObj.put("start",date2);
			jsonObj.put("end", vac.getVacationEndDate());
			jsonObj.put("textColor", "blue");
			jsonObj.put("backgroundColor", "violet");
			jsonObj.put("className", "hide-time");
			jsonObj.put("allDay", true);
			
			jsonArray.add(jsonObj);
		}
		*/
		//캘린더 VO로 꺼내오기
		List<CalendarVO> vacationList =  calService.getVacation(empNo);
		for (CalendarVO cal : vacationList) {
			log.info(cal.getTitle());
			log.info(cal.getStart());
			log.info(cal.getEnd());
			log.info("사원번호: "+cal.getEmpNo());
			
			String date = cal.getStart();
			String vacStartDate = date.split(" ")[0];
			log.info(vacStartDate);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("title", "연가");
			jsonObj.put("start",vacStartDate);
			jsonObj.put("end", cal.getEnd());
			jsonObj.put("backgroundColor", "skyblue");
			jsonObj.put("className", "hide-time");
			jsonObj.put("allDay", true);
			
			jsonArray.add(jsonObj);
		}
		
		
		// JSONArray를 응답으로 전달
		data = new ResponseEntity<JSONArray>(jsonArray, HttpStatus.OK);
		return data;
	}
	
	
	
	private void getVacation(int empNo) {
		// TODO Auto-generated method stub
		
	}

	// 이벤트 등록 (clinic_reservation테이블 insert)
	@ResponseBody
	@RequestMapping(value = "/insertEvent", method = RequestMethod.POST)
	public ResponseEntity<Boolean> insertEvent(@RequestBody ClinicReservationVO clinicReservationVO) {
		log.info("예약 컨 진입");
		
		// 이벤트 등록 여부 flag. 기본값 false
		boolean insertFlag = false;
		
		// calendar테이블 (calendarKey가 생김)
		calService.insertCalendar(clinicReservationVO);
		log.info(""+clinicReservationVO.getCalendarKey());
		
		
		// insert 성공 여부 상태 값 (calendar테이블 fk도 같이 추가)
		int status = calService.insertEvent(clinicReservationVO);
		log.info("**********insert성공여부:"+status);
		
		if (status > 0) {	// insert에 성공했다면
			// flag값을 true로 변경
			insertFlag = true;
		}
		
		// flag값을 응답으로 전달
		return new ResponseEntity<Boolean>(insertFlag, HttpStatus.OK);
	}
	
	
	//ajax 꼭 return에 responseEntity안해줘도된다..고하셨는데 잘안됐음
	//ajax : 캘린더 수정update
	@PostMapping("/updateClinicReservation")
	public ResponseEntity<Boolean> updateClinicReservation(@RequestBody ClinicReservationVO clinicReservationVO,
			RedirectAttributes ra){
		ServiceResult result = calService.updateClinicReservation(clinicReservationVO);
		log.info("getCalendarKey : "+clinicReservationVO.getCalendarKey());
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","수정이완료되었습니다");
			log.info("성공시result결과: "+result);
			
			//calendar테이블에  update해주기
			calService.updateCalendar(clinicReservationVO);
			
			return ResponseEntity.ok(true);
			
		}else {
			
			log.info("실패시result결과: "+result);
		}
		
		
		 return ResponseEntity.ok(false);
	}
	
	
	
	
	//ajax : 캘린더 삭제 delete
	@PostMapping("/deleteClinicReservation")
	@ResponseBody
	public ResponseEntity<Boolean> deleteClinicReservation(@RequestBody Map<String, Object> map){
		log.info("삭제컨트롤러진입");
		log.info(""+map.get("reservNo"));
		String tar = (String) map.get("reservNo");
		int target1Num = Integer.parseInt(tar);
		log.info("target1Num: "+target1Num);
		
		//String calendarKey = (String) map.get("calendarKey");
		String calendarKey = String.valueOf(map.get("calendarKey"));
		int calendarKeyNum = Integer.parseInt(calendarKey);
		log.info("calendarKeyNum : "+calendarKeyNum);
		
		ServiceResult result = calService.deleteClinicReservation(target1Num);
		log.info("삭제결과 : "+result);
		if(result.equals(ServiceResult.OK)) {
			
			//calendar테이블에 delete해주기
			calService.deleteCalendar(calendarKeyNum);
			
			return ResponseEntity.ok(true);
		}else {
			
			return ResponseEntity.ok(false);
		}
		
	}
	
	
	
	
	//ajax :드롭박스 전체의사 이름 선택
	@PostMapping("/showdoctorList")
	public ResponseEntity<List<MemberVO>> showdoctorList(){
		List<MemberVO> doctorNameList =  calService.showdoctorList();
		for (MemberVO dl : doctorNameList) {
			log.info("전체의사이름: "+dl.getMemName());
			
		}
		return new ResponseEntity<List<MemberVO>>(doctorNameList,HttpStatus.OK);
	}
	
	//ajax : 선택한 날의 해당의사의 예약리스트 보기
	@PostMapping("/showDateReserve")
	public ResponseEntity<List<ClinicReservationVO>> showDateReserve(@RequestBody Map<String, Object> map){
		log.info((String) map.get("clickDate"));
		String clickDate = (String) map.get("clickDate");
		String clickDateVal = clickDate.split(" ")[0];
		log.info("clickDate: "+clickDate);
		log.info("clickDateVal: "+clickDateVal);
		
		
		int empNo =  (int) map.get("empNo");
		
		
		ClinicReservationVO clinicReservationVO = new ClinicReservationVO();
		clinicReservationVO.setReservDate(clickDateVal);
		clinicReservationVO.setEmpNo(empNo);
		
		
		log.info("선택한 의사 번호!!!!:"+empNo);
		List<ClinicReservationVO> reserveList = calService.showReserveList(clinicReservationVO);
		return new ResponseEntity<List<ClinicReservationVO>>(reserveList,HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//////////////////////////캘린더 기본 있던 수정/삭제 안씀
	
	
	
	// 이벤트 수정
	@ResponseBody
	@PostMapping("/updateEvent")
	public ResponseEntity<Boolean> updateEvent(@RequestBody CalendarVO calendar) {
		// 이벤트 수정 여부 flag. 기본값 false
		boolean updateFlag = false;
		
		// update 성공 여부 상태값
		int status = calService.updateEvent(calendar);
		
		if (status > 0) {	// update에 성공했다면
			updateFlag = true;	// flag값을 true로 변경
		}
		
		// flag값을 응답으로 전달
		return new ResponseEntity<Boolean>(updateFlag, HttpStatus.OK);
	}
	
	
	// event 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteEvent", method = RequestMethod.POST)
	public ResponseEntity<Boolean> deleteEvent(@RequestBody String id) {	// id값만 받아옴
		// 이벤트 삭제 여부 flag. 기본값 false
		boolean deleteFlag = false;
		
		// delete 성공여부 상태값
		int status = calService.deleteEvent(id);
		
		if (status > 0) {	// 삭제에 성공했다면
			deleteFlag = true;	// flag값을 true로 변경
		}
		
		// flag값을 응답으로 전달
		return new ResponseEntity<Boolean>(deleteFlag, HttpStatus.OK);
	}
}
