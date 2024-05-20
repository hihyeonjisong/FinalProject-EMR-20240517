package kr.or.ddit.controller.doctor;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IDoctorRoundService;
import kr.or.ddit.service.INurseService;
import kr.or.ddit.service.IRadiationService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.RoundRecordVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/doctor/round")
@Slf4j
public class RoundController {
	
	@Inject
	private IDoctorRoundService doctorRoundService;
	
	@Inject
	private INurseService nurseService;
	
	@Inject
	private IRadiationService radiationService;
	
	// 회진 페이지
	@GetMapping("/main")
	public String goRoundPage() {
		return "doctor/roundPage";
	}
	
	
	// 입원 환자 리스트 가져오기
	@PostMapping("/getHsptlzPatntList")
	public ResponseEntity<List<MemberVO>> getHsptlzPatntList() {
		List<MemberVO> hsptlzPatntList = nurseService.getHospitalizeList();
		return new ResponseEntity<List<MemberVO>>(hsptlzPatntList, HttpStatus.OK);
	}
	
	// 환자 진료 내역 리스트 가져오기
	@PostMapping("/getPatntRecordList")
	public ResponseEntity<List<MemberVO>> getPatntRecordsList(@RequestBody Map<String, Integer> patntMap) {
		int patntNo = patntMap.get("patntNo");
		List<MemberVO> recordsList = doctorRoundService.getPatntRecordsList(patntNo);
		
		return new ResponseEntity<List<MemberVO>>(recordsList, HttpStatus.OK);
	}
	
	// 진료 내역 상세조회
	@PostMapping("/getPatntRecordInfo")
	public ResponseEntity<MemberVO> getPatntRecordInfo(@RequestBody Map<String, Integer> chartMap) {
		int chartNo = chartMap.get("chartNo");
		MemberVO recordInfo = doctorRoundService.getPatntRecordInfo(chartNo);
		
		return new ResponseEntity<MemberVO>(recordInfo, HttpStatus.OK);
	}
	
	// 회진 기록 insert
	@PostMapping("/insertRoundRecord")
	public ResponseEntity<Boolean> insertRoundRecord(@RequestBody RoundRecordVO roundRecordVO) {
		boolean flag = doctorRoundService.insertRoundRecord(roundRecordVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	// 회진 기록 리스트
	@PostMapping("/getRoundRecordList")
	public ResponseEntity<List<RoundRecordVO>> getRoundRecordList(@RequestBody Map<String, Integer> hsptlzMap) {
		int hsptlzNo = hsptlzMap.get("hsptlzNo");
		List<RoundRecordVO> roundRecordList = doctorRoundService.getRoundRecordList(hsptlzNo);
		return new ResponseEntity<List<RoundRecordVO>>(roundRecordList, HttpStatus.OK);
	}
	
	// 간호기록 불러오기
	@PostMapping("/getNursingRecord")
	public ResponseEntity<List<NursingRecordVO>> getNursingRecord(@RequestBody Map<String, Integer> hsptlzMap) {
		int hsptlzNo = hsptlzMap.get("hsptlzNo");
		List<NursingRecordVO> nursingRecordList = doctorRoundService.getNursingRecord(hsptlzNo);
		return new ResponseEntity<List<NursingRecordVO>>(nursingRecordList, HttpStatus.OK);
		
	}
	
	@PostMapping("/getEmpInfo")
	public ResponseEntity<EmpVO> getEmpInfo(@RequestBody Map<String, Integer> memberMap) {
		int memNo = memberMap.get("memNo");
		log.info("memNo : " + memNo);
		EmpVO empVO = radiationService.getEmpInfo(memNo);
		return new ResponseEntity<EmpVO>(empVO, HttpStatus.OK);
	}
}
