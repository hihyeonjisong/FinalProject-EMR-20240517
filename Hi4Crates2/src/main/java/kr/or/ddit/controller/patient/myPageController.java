package kr.or.ddit.controller.patient;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import kr.or.ddit.service.IPatientMypageService;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.EvaluationVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pMypage")
@Slf4j
public class myPageController {
	@Inject
	public IPatientMypageService service;
	
//	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/home")
	public String myPage(Model model, MemberVO memVO) {
		
		// 예약리스트
		int memNo = memVO.getMemNo();
		log.info("###memNo" + memNo);
		List<ClinicReservationVO> reserList = service.list(memNo);
		for (ClinicReservationVO cc : reserList) {
			cc.setReservDate(cc.getReservDate().split(" ")[0]+" "+cc.getReservTime());
		}
		System.out.println("####reserList" + reserList);
		
		// 최근 진료
		ClinicReservationVO crVO = service.recentReserve(memNo);
		log.info("###crVO" + crVO);
		if(crVO == null) {
			crVO = new ClinicReservationVO();
			crVO.setReservDate("최근 진료 이력이 없습니다.");
			
			model.addAttribute("recentReservation", crVO);
		}else {
			
			String rTime = crVO.getReservDate();
			String[] parts = rTime.split(" "); // 공백을 기준으로 문자열을 분리
			String datePart = parts[0]; // 날짜 부분
			
			String formattedTime = datePart; // 날짜와 시간을 다시 조합하여 문자열로 생성
			crVO.setReservDate(formattedTime);
			
			model.addAttribute("recentReservation", crVO);
		}
		
		// 방문 예정일
		ClinicReservationVO willVisit = service.willVisit(memNo);
		log.info("###willVisit" + willVisit);
		// 날짜 형식을 변환할 포맷 지정
		SimpleDateFormat originalDateFormat = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		// willVisit가 null이 아닌 경우에만 변환을 수행
		if (willVisit != null && willVisit.getReservDate() != null) {
		    try {
		        // 기존의 날짜를 가져와서 형식을 변경
		        Date originalDate = originalDateFormat.parse(willVisit.getReservDate());
		        String targetDateStr = targetDateFormat.format(originalDate);

		        // 변경된 형식의 날짜를 다시 willVisit 객체에 설정
		        willVisit.setReservDate(targetDateStr);
		    } catch (ParseException e) {
		        // 날짜 포맷 변환 중 에러 발생 시 처리할 내용
		        e.printStackTrace(); // 또는 로그 등을 출력할 수 있음
		    }
		} else {
		    // willVisit가 null인 경우 등에 대한 처리
		    willVisit = new ClinicReservationVO();
		    willVisit.setReservDate("방문 예정일이 존재하지 않습니다.");
		}
		log.info("!!willVisit" + willVisit);
		// 변경된 willVisit를 모델에 추가
		model.addAttribute("willVisit", willVisit);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new Date());
		log.info("##currentDate" + currentDate);
		
		model.addAttribute("currentDate", currentDate);
		model.addAttribute("reserList", reserList);
		
		// 상담내역
		List<CounselVO> CounsList = service.cList(memVO);
		System.out.println("###CounsList찾아옴ㅋㅋ" + CounsList);
		model.addAttribute("CounsList", CounsList);
		
		// 서비스 평가
		List<EvaluationVO> EvaluList = service.eList(memVO);
		System.out.println("###EvList" + EvaluList);
		
		model.addAttribute("EvaluList", EvaluList);
		
		return "patient/myPage";
	}
	
	@PostMapping("/delClinicReserv")
	public ResponseEntity<Boolean> delReservation(@RequestBody ClinicReservationVO clinicReservationVO,
			Model model) {
		System.out.println("하이ㅜㄹ~~" + clinicReservationVO);
		boolean deleteFlag = false;
		
		int status = service.delCReserv(clinicReservationVO);
		log.info("###하이루" + status);
		
		if(status > 0) {
			deleteFlag = true;
		}
		log.info("###하이루" + deleteFlag);
		
		return new ResponseEntity<Boolean>(deleteFlag, HttpStatus.OK);
	}
	
}