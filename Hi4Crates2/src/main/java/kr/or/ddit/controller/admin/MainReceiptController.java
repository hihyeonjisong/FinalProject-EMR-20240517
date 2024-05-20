package kr.or.ddit.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.AuthMapper;
import kr.or.ddit.service.IMainAdminService;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberAuth;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticularVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.ProtectorVO;
import kr.or.ddit.vo.ReceiptVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class MainReceiptController {
	
	@Inject
	public PasswordEncoder pe;
	
	@Inject
	public AuthMapper authMapper;
	
	
	@Inject
	IMainAdminService mainAdminService;
	
	@Inject
	private IMemberService memberService;
	
	//접수
	@GetMapping("/receiptForm")
	public String getreceiveForm() {
		log.info("dd");
		return "admin/receipt";
	}
	
	//접수 환자등록 ajax
	@PostMapping("/enrollMember")
	public ResponseEntity<MemberVO> ajaxEnrollMember(
			@RequestBody MemberVO member){
		
		member.setMemPw(pe.encode(member.getMemRegno1())); // 비밀번호 인코딩해서 넣어줌
		
		log.info("ajax회원등록 프로세스");
		log.info("memName : "+member.getMemName());
		log.info("memRegno1 : "+member.getMemRegno1());
		log.info("memRegno2 : "+member.getMemRegno2());
		log.info("memTel : "+member.getMemTel());
		log.info("postCode : "+member.getMemPostcode());
		log.info("memAddress1 : "+member.getMemAddress1());
		log.info("memAddress1 : "+member.getMemAddress2());
		
		//member테이블에 환자 등록
		mainAdminService.enrollMember(member);
		System.out.println("+++++++++++++"+member.getMemNo());
		
		//patient테이블에 환자 등록
		mainAdminService.enrollPatient(member);
		//권한주기
		MemberAuth auth = new MemberAuth();
		auth.setAuthName("ROLE_USER");
		auth.setMemNo(member.getMemNo());
		authMapper.insertAuth(auth);
		
		
		
		return new ResponseEntity<MemberVO>(member,HttpStatus.OK);
	}
	
	// 진료가능한 의사 조회 ajax
	@PostMapping("/findReceiptDoctor")
	public ResponseEntity<List<MemberVO>> findReceiptDoctor(Model model){
		List<MemberVO> doctorList = mainAdminService.findReceiptDoctor();
		log.info("*************"+doctorList);
		model.addAttribute("doctorList",doctorList);
		return new ResponseEntity<List<MemberVO>>(doctorList,HttpStatus.OK);
	}
	
	//접수진행 ajax 
	@PostMapping("/doReceipt")
	@ResponseBody
	public ResponseEntity<ReceiptVO> doReceipt(@RequestBody ReceiptVO receiptVO) {
		log.info(receiptVO.getClinicNo());
		log.info(receiptVO.getEmpNo()+"");
		log.info(receiptVO.getPatntNo()+"");
		log.info("선택한 예약번호:"+receiptVO.getReservNo());
		
		//접수 테이블 insert
		mainAdminService.insertReceipt(receiptVO);
		//예약 테이블에 insert (예약 status Y로)
		mainAdminService.insertReservStatus(receiptVO);
		//예진표 테이블 insert
		mainAdminService.insertPreDiagnosis(receiptVO);
		//환자상태 History테이블 insert(상태:대기중)
		mainAdminService.insertHistory(receiptVO);
		//평가 테이블에 insert (receipt_no만 넣기)
		mainAdminService.insertEvaluation(receiptVO);
		log.info("선택한 예약번호:"+receiptVO.getReservNo());
		
		
		return new ResponseEntity<ReceiptVO>(receiptVO,HttpStatus.OK);
		
	}
	
	//ajax: 오늘 근무하는 의사리스트
	/*@GetMapping("/getTodayDoctors")
	public ResponseEntity <List<MemberVO>> getTodayDoctors(){
		List<MemberVO> todayDoctorList =  mainAdminService.getTodayDoctors();
		
		for (MemberVO memberVO : todayDoctorList) {
			log.info(memberVO.getMemName());
		}
		return new ResponseEntity<List<MemberVO>>(todayDoctorList,HttpStatus.OK);
		
	}*/
	
	//ajax: 예약목록에서 의사 선택시 나올 예약리스트들
	@PostMapping("/getDoctorsReservList")
	public ResponseEntity<List<ClinicReservationVO>> getDoctorsReservList( ){
		
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		log.info(dateFormat.format(date));
		String todayDate = dateFormat.format(date);
		
		ClinicReservationVO clVO = new ClinicReservationVO();
		clVO.setReservDate(todayDate);
		
		
		List<ClinicReservationVO> doctorsReservList = mainAdminService.getDoctorsReservList(clVO);
		for (ClinicReservationVO cList : doctorsReservList) {
			log.info("의사명:"+cList.getEmpName());
			log.info("환자명: "+cList.getMemName());
			log.info("예약번호: "+cList.getReservNo());
			log.info("환자의멤버번호: "+cList.getMemNo());
			log.info("환자의환자번호: "+cList.getPatntNo());
		}
		
		return new ResponseEntity<List<ClinicReservationVO>>(doctorsReservList,HttpStatus.OK);
		
	}
	
	
	//최근 방문 내역 가져옴
	@ResponseBody
	@PostMapping("/getRecentRecord")
	public ResponseEntity<List<ChartVO>> getRecentRecord(@RequestBody Map<String, Object> map) {
		
		log.info("최근방문내역 진입, memNo : "+ map.get("memNo"));
		int memNo = (int) map.get("memNo");
		List<ChartVO> chartRecordList = new ArrayList<ChartVO>();
		
		chartRecordList = memberService.getChartRecordList(memNo);
		for (ChartVO c : chartRecordList) {
			log.info("번호"+c.getChartNo());
			log.info("날짜"+c.getChartDate());
			log.info("이름 :"+c.getMemName());
			log.info("처방약이름 :"+c.getDisNameKr());
		}
		
		return new ResponseEntity<List<ChartVO>>(chartRecordList,HttpStatus.OK) ;
		
	}
	
	
	
	
	//원무과 메인
	@GetMapping("/main")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String getMain() {
		log.info("dd");
		return "admin/empmain";
	}
	
	
	
	
	
}
