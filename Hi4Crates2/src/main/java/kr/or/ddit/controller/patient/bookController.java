package kr.or.ddit.controller.patient;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IAdminReservService;
import kr.or.ddit.service.IPatientBookService;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@RequestMapping("/book")
@Slf4j
public class bookController {
	
	final DefaultMessageService messageService;
	
	public bookController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("API_KEY", "SECRET_KEY", "https://api.coolsms.co.kr");
    }
	
	@Inject
	private IPatientBookService service;
	
	@Inject
	private IAdminReservService calService;
	
	@GetMapping("/do")
	public String bookJ() {
		
		return "patient/book";
	}
	
	@PostMapping("/click")
	public ResponseEntity<List<MemberVO>> book(@RequestBody Map<String, String> requestData) {
		String date = requestData.get("calendarStartDate");
		System.out.println("##date" + date);
		
		List<MemberVO> chooseDoctor = service.doctor(date);
		log.info("###chooseDoctor" + chooseDoctor);
		
//	    log.info("####chooseDoctor: " + chooseDoctor);
	    
	    return new ResponseEntity<List<MemberVO>>(chooseDoctor, HttpStatus.OK);
	}
	
	@PostMapping("/time")
	@ResponseBody
	public ResponseEntity<List<ClinicReservationVO>> time(@RequestBody ClinicReservationVO data) {
		
		log.info("하이루 ㅋㅋ~");
		int empNo = data.getEmpNo();
		
		log.info("####empNo" + data);
		
		List<ClinicReservationVO> time = service.time(data);
		log.info("####time" + time);
		
		return new ResponseEntity<List<ClinicReservationVO>>(time, HttpStatus.OK);
	}
	
	@PostMapping("/do")
	public String insertBook(ClinicReservationVO clinicReservationVO, Model model, RedirectAttributes ra) {
	    String calStartdate = clinicReservationVO.getReservDate() + " " + clinicReservationVO.getReservTime();
	    
	    log.info("###전부다 확인" + clinicReservationVO);
	    
	    clinicReservationVO.setReservMemo("온라인예약");
	    clinicReservationVO.setCalStartdate(calStartdate);
	    // 나중에 setMemNo 없애야함
	//  System.out.println("###calStartdate" + calStartdate);
	    
	    
	    log.info("예약 컨 진입");
	    
	    // 이벤트 등록 여부 flag. 기본값 false
	    boolean insertFlag = false;
	    
	    // calendar테이블 (calendarKey가 생김)
	    calService.insertCalendar(clinicReservationVO);
	    log.info("#키" + clinicReservationVO.getCalendarKey());
	    
	    
	    // insert 성공 여부 상태 값 (calendar테이블 fk도 같이 추가)
	    int status = calService.insertEvent(clinicReservationVO);
	    log.info("**********insert성공여부:" + status);
	    
	    // 이름
	    String name = service.name(clinicReservationVO);
	    // 전화번호
	    String phone = service.phone(clinicReservationVO);
	    // 날짜
	    String day = clinicReservationVO.getReservDate();
	    // 시간
	    String time = clinicReservationVO.getReservTime();
	    // 선생님
	    String doctor = service.doctorName(clinicReservationVO);
	    
	    String content = "안녕하세요! 대덕정형외과입니다." + name+" 님의 예약이 "+ day +" "+ time+"에 정상적으로 예약되었습니다."
	    		+ "문의사항이 있으시면 연락바랍니다. 감사합니다. 담당 주치의 : " + doctor;
	    log.info("###content" + content);
	    
	    if (status > 0) {    // insert에 성공했다면
	        // flag값을 true로 변경
	    	// coolSMS 실행
	    	Message message = new Message();
	        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
	        message.setFrom("01050645042");	// 발신번호
	        message.setTo(phone);	// 수신번호
	        message.setText(content);
	        
	        // 메시지를 전송하고 응답을 저장
	        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
	        System.out.println(response);
	    }
	    

	    return "redirect:/pMypage/home?memNo="+clinicReservationVO.getMemNo();
	    
	}
}
