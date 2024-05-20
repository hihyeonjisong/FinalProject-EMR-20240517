package kr.or.ddit.controller.nurse;

import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import kr.or.ddit.service.INurseService;
import kr.or.ddit.service.IRadiationService;
import kr.or.ddit.vo.BedVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NurseScheduleVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreInspectionVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/nurse")
@Slf4j
public class NurseController {

	@Inject
	private INurseService nurseService;
	
	@Inject
	private IRadiationService radiationService;
	
	// 간호사 메인 페이지
	@GetMapping("/main")
	public String nursePage() {
		log.info("nurse main!!!");

		return "nurse/nurseMain";
	}

	// 입원 페이지
	@GetMapping("/hospitalization")
	public String hospitalizationPage(Model model) {

		// 입원환자 리스트 가져오기
		List<MemberVO> hospitalizeList = nurseService.getHospitalizeList();
		log.info("size : " + hospitalizeList.size());

		for (int i = 0; i < hospitalizeList.size(); i++) {
			MemberVO info = hospitalizeList.get(i);
			log.info("환자 번호 : "+info.getPatientVO().getPatntNo());
			log.info("환자명 : "+info.getMemName());
			log.info("호실 : "+info.getBedVO().getWardVO().getWardNo());
			log.info("침대번호 : "+info.getBedVO().getBedNo());
			log.info("담당의 사번 : "+info.getEmpVO().getEmpNo());
			log.info("담당의 : "+info.getEmpName());
			
		}
		
		// 입원환자 리스트 model에 담기
		model.addAttribute("hospitalizeList", hospitalizeList);

		return "nurse/hospitalizationPage";
	}
	
	// 입원환자 리스트 비동기
	@ResponseBody
	@PostMapping("/getHospitalizeList")
	public ResponseEntity<List<MemberVO>> getHospitalizeList() {
		
		List<MemberVO> hospitalizeList = nurseService.getHospitalizeList();
		return new ResponseEntity<List<MemberVO>>(hospitalizeList, HttpStatus.OK);
	}
	
	// 입원환자 상세정보 가져오기
	@ResponseBody
	@PostMapping("/getHospitalizePatntInfo")
	public ResponseEntity<MemberVO> getHospitalizePatntInfo(@RequestBody Map<String, Integer> patntMap) {
		log.info("환자 번호 : " + patntMap.get("patntNo"));
		int patntNo = patntMap.get("patntNo");
		MemberVO member = nurseService.getHospitalizePatntInfo(patntNo);
		
		return new ResponseEntity<MemberVO>(member, HttpStatus.OK);
	}

	// 오더 조회
	@ResponseBody
	@PostMapping("/getPatntOrder")
	public ResponseEntity<MemberVO> getPatntOrder(@RequestBody Map<String, Integer> chartMap) {
		int chartNo = chartMap.get("chartNo");
		MemberVO memberVO = nurseService.getPatntOrder(chartNo);
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
	}

	// 근무 스케줄 조회 페이지
	@GetMapping("/schedule")
	public String nurseSchedule() {
		return "nurse/nurseSchedule";
	}
	
	
	// 간호사 근무 스케줄 조회(나중에 수정할 예정)
	@ResponseBody
	@PostMapping("/getSchedule")
	public Map<String, Object> getSchedule(MultipartHttpServletRequest request) {
		
		Map<String, Object> response = new HashMap<>();
		
		MultipartFile file = null;
		Iterator<String> miterator = request.getFileNames();
		if (miterator.hasNext()) {
			file = request.getFile(miterator.next());
		}
		
		if (file == null) {
			response.put("status", "error");
			return response;
		}
		
		List<NurseScheduleVO> dataList = ExcelUpload.getExcelList(file);
		System.out.println("dataList : " + dataList);

		response.put("dataList", dataList);
		response.put("status", "success");
			
		return response;
	}

	// 의약품 조회 페이지
	@GetMapping("/medicineList")
	public String medicineListPage() {
		return "nurse/medicineList";
	}
	
	// 의약품 리스트 비동기로 가져오기
	@PostMapping(value = "/getMedicineList")
	public ResponseEntity<List<MedicineVO>> getMedicineList() {
		List<MedicineVO> medicineList = nurseService.getMedicineList();
		return new ResponseEntity<List<MedicineVO>>(medicineList, HttpStatus.OK);
	}
	
	// 의약품 신청 리스트 비동기
	@PostMapping("/getRequestResult")
	public ResponseEntity<List<MedicineRequestResultVO>> getRequestResult() {
		
		List<MedicineRequestResultVO> requestList = nurseService.getRequestResultList();
		
		return new ResponseEntity<List<MedicineRequestResultVO>>(requestList, HttpStatus.OK);
	}

	// 의약품 신청
	@ResponseBody
	@PostMapping("/requestMedicine")
	public ResponseEntity<Boolean> requestMedicine(@RequestBody List<MedicineVO> mdcinList) {
		
		boolean insertFlag = nurseService.requestMedicine(mdcinList);
		
		return new ResponseEntity<Boolean>(insertFlag, HttpStatus.OK);
	}
	
	// 입원실 정보 불러오기 테스트
	@ResponseBody
	@PostMapping("/getWardInfo")
	public ResponseEntity<List<MemberVO>> getWardInfo(@RequestBody Map<String, Integer> wardMap) {
		
		int wardNo = wardMap.get("wardNo");
		List<MemberVO> list = nurseService.getWardInfo(wardNo);
		
		for (int i = 0; i < list.size(); i++) {
			MemberVO vo = list.get(i);
			log.info("호실 : " + vo.getBedVO().getWardVO().getWardNo());
			log.info("침대번호 : " + vo.getBedVO().getBedNo());
			log.info("환자명 : " + vo.getMemName());
		}
		
		return new ResponseEntity<List<MemberVO>>(list, HttpStatus.OK);
	}
	
	// 입원 오더 받은 환자 불러오기
	@PostMapping("/getHospitalizeOrder")
	public ResponseEntity<List<MemberVO>> getHospitalizeOrder() {
		List<MemberVO> memberList = nurseService.getHospitalizeOrder();
		for (int i = 0; i < memberList.size(); i++) {
			MemberVO memberVO = memberList.get(i);
			log.info("환자명 : " + memberVO.getMemName());
			log.info("오더번호 : " + memberVO.getOrderVO().getOrderNo());
			log.info("오더코드명 : " + memberVO.getOrderVO().getOrderCode());
		}
		return new ResponseEntity<List<MemberVO>>(memberList, HttpStatus.OK);
	}
	
	// 환자 입원
	@ResponseBody
	@PostMapping("/insertHospitalize")
	public ResponseEntity<Boolean> insertHospitalize(@RequestBody List<MemberVO> orderList) {
		
		for (int i = 0; i < orderList.size(); i++) {
			MemberVO memberVO = orderList.get(i);
			log.info("bedNo : " + memberVO.getBedVO().getBedNo());
			log.info("orderNo : " + memberVO.getOrderVO().getOrderNo());
		}
		
		boolean insertFlag = nurseService.insertHospitalize(orderList);
		return new ResponseEntity<Boolean>(insertFlag, HttpStatus.OK);
	}
	
	// 환자 퇴원
	@PostMapping("/leaveHospitalize")
	public ResponseEntity<Boolean> leaveHospitalize(@RequestBody MemberVO member) {
		
		boolean leaveHospitalize = nurseService.leaveHospitalize(member);
		
		return new ResponseEntity<Boolean>(leaveHospitalize, HttpStatus.OK);
	}
	
	// 비동기 환자 정보 가져오기
	@ResponseBody
	@PostMapping("/getMemberInfo")
	public ResponseEntity<MemberVO> getMemberInfo(@RequestBody Map<String, Integer> memberMap) {
		
		int memNo = memberMap.get("memNo");
		
		log.info("memNo : " + memNo);
		
		MemberVO memberVO = nurseService.getMemberInfo(memNo);
		
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
		
	}
	
	// 사용 가능한 침대만 조회
	@PostMapping("/getAvailableBedList")
	public ResponseEntity<List<BedVO>> getAvailableBedList() {
		
		List<BedVO> bedList = nurseService.getAvailableBedList();
		
		return new ResponseEntity<List<BedVO>>(bedList, HttpStatus.OK);
	}
	
	// 수술 페이지
	@GetMapping("/surgery")
	public String surgeryPage() {
		return "nurse/surgeryPage";
	}
	
	// 수술 대기환자 조회(입원 한 상태)
	@PostMapping("/getWaitingSurgeryList")
	public ResponseEntity<List<MemberVO>> getWaitingSurgeryList() {
		
		List<MemberVO> waitingSurgeryList = nurseService.getWaitingSurgeryList();
		
		return new ResponseEntity<List<MemberVO>>(waitingSurgeryList, HttpStatus.OK);
	}
	
	// 수술 대기환자 사전검사 결과 조회
	@ResponseBody
	@PostMapping("/getPreInspectionInfo")
	public ResponseEntity<PreInspectionVO> getPreInspectionInfo(@RequestBody Map<String, Integer> hsptlzMap) {
		int hsptlzNo = hsptlzMap.get("hsptlzNo");
		PreInspectionVO preInspectionVO = nurseService.getPreInspectionInfo(hsptlzNo);
		return new ResponseEntity<PreInspectionVO>(preInspectionVO, HttpStatus.OK);
	}
	
	// 사전검사 등록
	@PostMapping("/insertPreInspection")
	public ResponseEntity<Boolean> insertPreInspection(@RequestBody PreInspectionVO preInspectionVO) {
		boolean flag = nurseService.insertPreInspection(preInspectionVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	// 타이머 테스트 페이지 이동
	@GetMapping("/timerTest")
	public String timerTestPage() {
		return "nurse/timerPage";
	}
	
	// 메인페이지 환자 목록 가져오기
	@PostMapping("/getWaitingPatntList")
	public ResponseEntity<List<MemberVO>> getWaitingPatntList() {
		List<MemberVO> waitingPatntList = nurseService.getWaitingPatntList();
		return new ResponseEntity<List<MemberVO>>(waitingPatntList, HttpStatus.OK);
	}
	
	// 내원이력 비동기로 가져오기
	@PostMapping("/getHistoryList")
	public ResponseEntity<List<MemberVO>> getHistoryList(@RequestBody Map<String, Integer> memberMap) {
		log.info("내원이력 컨트롤러체킹");
		int memNo = memberMap.get("memNo");
		List<MemberVO> historyList = nurseService.getHistoryList(memNo);
		for (MemberVO m : historyList) {
			log.info("내원이력 테스트:"+m.getMemName());
		}
		return new ResponseEntity<List<MemberVO>>(historyList, HttpStatus.OK);
	}
	
	// 내원이력 상세조회
	@PostMapping("/getHistoryInfo")
	public ResponseEntity<MemberVO> getHistoryInfo(@RequestBody Map<String, Integer> chartMap) {
		int chartNo = chartMap.get("chartNo");
		MemberVO historyInfo = nurseService.getHistoryInfo(chartNo);
		return new ResponseEntity<MemberVO>(historyInfo, HttpStatus.OK);
	}
	
	@PostMapping("/insertNursingRecord")
	public ResponseEntity<Boolean> insertNursingRecord(@RequestBody MemberVO nursingRecord) {
		log.info("hsptlzNo : " + nursingRecord.getHsptlzRecordVO().getHsptlzNo());
		log.info("ioIntake : " + nursingRecord.getIoVO().getIoIntake());
		log.info("vitalHeat : " + nursingRecord.getVitalVO().getVitalHeat());
		Boolean flag = nurseService.insertNursingRecord(nursingRecord);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@PostMapping("/writeNursingRecord")
	public ResponseEntity<Boolean> writeNursingRecord(@RequestBody NursingRecordVO nursingRecord) {
		Boolean flag = nurseService.writeNursingRecord(nursingRecord);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	
	// 로그인한 직원 정보 가져오기
	@PostMapping("/getEmpInfo")
	public ResponseEntity<EmpVO> getEmpInfo(@RequestBody Map<String, Integer> memberMap) {
		int memNo = memberMap.get("memNo");
		EmpVO empVO = radiationService.getEmpInfo(memNo);
		return new ResponseEntity<EmpVO>(empVO, HttpStatus.OK);
	}	
	
	// 환자 상세정보 가져오기
	@PostMapping("/getPatntInfo")
	public ResponseEntity<MemberVO> getPatntInfo(@RequestBody MemberVO member) {
		MemberVO memberVO = nurseService.getPatntInfo(member);
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
	}
	
	// 침대를 사용중인 환자 정보 가져오기
	@PostMapping("/getUsingBedPatntInfo")
	public ResponseEntity<MemberVO> getUsingBedPatntInfo(@RequestBody Map<String, Integer> bedMap) {
		int bedNo = bedMap.get("bedNo");
		MemberVO memberVO = nurseService.getUsingBedPatntInfo(bedNo);
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
	}
	
	// 퇴원오더 조회
	@PostMapping("/getLeaveOrder")
	public ResponseEntity<List<MemberVO>> getLeaveOrder() {
		List<MemberVO> memberList = nurseService.getLeaveOrder();
		return new ResponseEntity<List<MemberVO>>(memberList, HttpStatus.OK);
	}
	
	// memNo로 입원 정보 가져오기
	@PostMapping("/getHsptlzByMemNo")
	public ResponseEntity<MemberVO> getHsptlzByMemNo(@RequestBody Map<String, Integer> memNoMap) {
		int memNo = memNoMap.get("memNo");
		MemberVO hsptlzInfo = nurseService.getHsptlzByMemNo(memNo);
		return new ResponseEntity<MemberVO>(hsptlzInfo, HttpStatus.OK);
	}
	
	@PostMapping("/getNursingRecordList")
	public ResponseEntity<List<NursingRecordVO>> getNursingRecordList(@RequestBody Map<String, Integer> patntMap) {
		int patntNo = patntMap.get("patntNo");
		List<NursingRecordVO> nursingRecordList = nurseService.getNursingRecordList(patntNo);
		return new ResponseEntity<List<NursingRecordVO>>(nursingRecordList, HttpStatus.OK);
	}
	
	@PostMapping("/getBedCount")
	public ResponseEntity<List<BedVO>> getBedCount(@RequestBody Map<String, Integer> wardMap) {
		int wardNo = wardMap.get("wardNo");
		List<BedVO> bedCountList = nurseService.getBedCount(wardNo);
		for (int i = 0; i < bedCountList.size(); i++) {
			log.info("bedStatus : " + bedCountList.get(i).getBedStatus());
		}
		return new ResponseEntity<List<BedVO>>(bedCountList, HttpStatus.OK);
	}
	
	
}
