package kr.or.ddit.controller.physical;

import java.util.ArrayList;
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

import kr.or.ddit.service.IPhysicalService;
import kr.or.ddit.vo.MedicalEquipVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/emp/physical")
public class PhysicalTherapistController {

	@Inject
	private IPhysicalService physicalService;
	
	/**
	 * 직원용 공지사항 글쓰기 화면으로 이동
	 * @return 이동할 화면 위치
	 */
	@GetMapping("/main")
	public String getPhysicalMain () {
		log.info("[컨트롤러][getPhysicalMain] 실행");
		return "empPhysical/physicalMain";
	}
	
	/**
	 * 물리치료 환자 목록 조회
	 * ajax로 요청, 자동 갱신 예정
	 * @return new ResponseEntity<List<MemberVO>>(list, HttpStatus.OK)
	 */
	@PostMapping(value="/patnts")
	public ResponseEntity<List<MemberVO>> selectPhysicalWaitingList(
			) {
		log.info("[컨트롤러][selectPhysicalWaitingList] 실행");
		List<MemberVO> physicalWaitingList = new ArrayList<>();
		// 서비스 실행
		physicalWaitingList = physicalService.getPhysicalWaitingList();
		// 결과 반환
		if(physicalWaitingList != null && !physicalWaitingList.isEmpty()) {
			log.info("[컨트롤러][selectPhysicalWaitingList] 대기목록 나옴!");
			return new ResponseEntity<List<MemberVO>>(physicalWaitingList, HttpStatus.OK);
		}else {
			log.error("[컨트롤러][selectPhysicalWaitingList] 대기목록 없음!");
			return null;
		}
	}	// [selectPhysicalWaitingList] 끝
	
	
	/**
	 * 환자 목록에서 환자 클릭시 출력할 정보 목록
	 * @param memberVO
	 * @return new ResponseEntity<MemberVO>(memOrderInfo, HttpStatus.OK)
	 */
	@ResponseBody
	@PostMapping("/order")
	public ResponseEntity<MemberVO> selectPhysicalOrder(
			@RequestBody MemberVO memberVO
			) {
		log.info("[컨트롤러][selectPhysicalOrder]시작!");
		int memNo = memberVO.getMemNo();
		int receiptNo = memberVO.getReceiptNo();
		log.info("[컨트롤러][selectPhysicalOrder] 받아온 memNo: " + memNo + " | 받아온 receiptNo: " + receiptNo);
		// 환자 오더 조회
		MemberVO memOrderInfo = physicalService.getPhysicalOrder(memNo, receiptNo);
		log.info("[컨트롤러][selectPhysicalOrder] 쿼리로 가져온 환자 이름 : " + memOrderInfo.getMemName());
		
		// 차트넘버 확인
		int chartNo = memOrderInfo.getChartVO().getChartNo();
//		int receiptNo = memOrderInfo.getHistoryVO().getReceiptNo();
		log.info("[컨트롤러][selectPhysicalOrder] chartNo: " + chartNo);

		// 오더코드 List로 조회
		List<OrderVO> orderCodes = new ArrayList<OrderVO>();
		// orderNo, orderCode를 다른 쿼리로 뺄 것 (차트넘버로 조회)
		orderCodes = physicalService.getOrderCodes(chartNo);
		log.info("[컨트롤러][selectPhysicalOrder] orderCodes: " + orderCodes);
		memOrderInfo.setOrderCodes(orderCodes);
		
		// 오더 작성 의사명 조회
		String docName = physicalService.getDoctorsName(memOrderInfo);
		log.info("[컨트롤러][selectPhysicalOrder] docName: " + docName);
		memOrderInfo.setDocName(docName);
		
		// 오더에서 따로 바디코드 가져오기
		List<MemberVO> bodyCodes = new ArrayList<MemberVO>();
		bodyCodes = physicalService.getBodyCodes(chartNo);
		log.info("[컨트롤러][selectPhysicalOrder] bodyCodes: " + bodyCodes);
		memOrderInfo.setBodyCodes(bodyCodes);

		return new ResponseEntity<MemberVO>(memOrderInfo, HttpStatus.OK);
	}

	/**
	 * 치료기기 목록 조회
	 * @return new ResponseEntity<List<MedicalEquipVO>>(equipList, HttpStatus.OK)
	 */
	@RequestMapping("/equip")
	public ResponseEntity<List<MedicalEquipVO>> selectPhysicalEquipmentList(
			){
		log.info("[컨트롤러][selectPhysicalEquipmentList] 시작!");
		List<MedicalEquipVO> equipList = new ArrayList<MedicalEquipVO>();
		equipList = physicalService.getPhysicalEquipmentList();
		// 목록 가져왔는지 검증
		if (equipList != null && !equipList.isEmpty()) {
			log.info("[컨트롤러][selectPhysicalEquipmentList] 장비목록 조회 성공! " + equipList);
			return new ResponseEntity<List<MedicalEquipVO>>(equipList, HttpStatus.OK);
		}else {
			log.error("[컨트롤러][selectPhysicalEquipmentList] 장비목록 조회 실패! " + equipList);
			return new ResponseEntity<List<MedicalEquipVO>>(equipList, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 환자의 상태를 '치료중'으로 바꾸는 메서드
	 * @param memNo
	 * @param empNo
	 * @param model
	 * @return return new ResponseEntity<String>()
	 */
	@RequestMapping("/statusStart")
	public ResponseEntity<String> updateStatusStart(
			@RequestBody Map<String, Object> map
			, Model model
			){
		log.info("[컨트롤러][updateStatusStart] 실행");
		int receiptNo = (int) map.get("receiptNo");
		log.info("[컨트롤러][updateStatusStart] receiptNo: " + receiptNo);
		int res = physicalService.changeStatusStart(receiptNo);
		String result = "";
		if (res > 0) {
			log.info("[컨트롤러][updateStatusStart] 업데이트 성공! " + res);
			result = "success";
			return new ResponseEntity<String>(result, HttpStatus.OK);
		}else {
			log.error("[컨트롤러][updateStatusStart] 업데이트 실패! " + res);
			result = "fail";
			return new ResponseEntity<String>(result, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 치료기록 등록
	 * @param map
	 * @return ResponseEntity<String> result
	 */
	@RequestMapping("/report")
	public ResponseEntity<String> insertPhysicalTherapyRecord(
			@RequestBody Map<String, Object> map
			){
		log.info("[컨트롤러][insertPhysicalTherapyRecord] 시작 [map] 값 확인!" + map);
		String result = "";
		// 치료기록 등록
		int rprt = physicalService.postPhysicalTherapyRecord(map);
		// 처리결과
		if (rprt > 0) {
			log.info("[컨트롤러][insertPhysicalTherapyRecord] 환자기록 등록 성공! " + rprt);
			result = "success";
			return new ResponseEntity<String>(result, HttpStatus.OK);
		}else {
			log.info("[컨트롤러][insertPhysicalTherapyRecord] 환자기록 등록 실패! " + rprt);
			result = "fail";
			return new ResponseEntity<String>(result, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 환자 상태를 '대기중'으로, 위치를 '수납실'로 변경
	 * @param map
	 * @param model
	 * @return ResponseEntity<String> result
	 */
	@RequestMapping("/statusDone")
	public ResponseEntity<String> updateStatusDone(
			@RequestBody Map<String, Object> map
			, Model model
			){
		log.info("[컨트롤러][updateStatusDone] 실행");
		int receiptNo = (int) map.get("receiptNo");
		log.info("[컨트롤러][updateStatusDone] receiptNo: " + receiptNo);
		int res = physicalService.changeStatusDone(receiptNo);
		String result = "";
		if (res > 0) {
			log.info("[컨트롤러][updateStatusDone] 업데이트 성공! " + res);
			result = "success";
			return new ResponseEntity<String>(result, HttpStatus.OK);
		}else {
			log.error("[컨트롤러][updateStatusDone] 업데이트 실패! " + res);
			result = "fail";
			return new ResponseEntity<String>(result, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping("/theraNo")
	public ResponseEntity<Integer> selectTherapistEmpNo(
			@RequestBody Map<String, Object> map
			){
		log.info("[컨트롤러][selectTherapistEmpNo] 실행");
		int memNo = (int) map.get("memNo");
		int empNo = physicalService.getTherapistEmpNo(memNo);
		if (empNo > 0) {
			log.info("[컨트롤러][selectTherapistEmpNo] 물리치료사 EmpNo는? " + empNo);
			return new ResponseEntity<Integer>(empNo, HttpStatus.OK);
		}else {
			log.error("[컨트롤러][selectTherapistEmpNo] 물리치료사 EmpNo 조회 실패!!!");
			return new ResponseEntity<Integer>(empNo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
