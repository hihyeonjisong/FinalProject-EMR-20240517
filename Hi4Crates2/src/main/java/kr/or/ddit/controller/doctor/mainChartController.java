package kr.or.ddit.controller.doctor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.management.Notification;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.core.OrderComparator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.web.server.util.matcher.OrServerWebExchangeMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.comm.EchoHandler;
import kr.or.ddit.controller.utils.UploadFileUtils;
import kr.or.ddit.service.ICollaborationService;
import kr.or.ddit.service.IMainChartService;
import kr.or.ddit.service.INotiService;
import kr.or.ddit.service.IOrderSetService;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.CollaborationReqVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.DiagnosisPaperVO;
import kr.or.ddit.vo.DiagnosisVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RocRecordVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
@RequestMapping("/doctor")
@Slf4j
public class mainChartController {
	
	@Inject
	IMainChartService mainChartService;
	
	@Inject
	IOrderSetService orderSetService;
	
	@Inject
	ICollaborationService collaborationService;
	
	@Inject
	INotiService notiService;
	
	//로그인한 의사정보
	private MemberVO myInfo;
	
	//로그인한 의사 사번
	private int empNo;
	
	/**
	 * 메인차트실행
	 * @author jjinny
	 * @param model
	 * @return
	 */
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/mainChart")
	public String mainChart(Model model, HttpServletRequest req) {
		
		log.info("mainChart() 실행...!");
//		int empNo=1;
		
		CustomUser user = (CustomUser) req.getSession().getAttribute("user");
		myInfo = user.getMember();
		log.info(""+myInfo);
		int memNo = myInfo.getMemNo();
		//의사번호 담기
		empNo = mainChartService.getEmpNo(memNo);
		
		log.info(""+empNo);

		List<MemberVO> watingList = mainChartService.getWatingList(empNo);

		model.addAttribute("watingList", watingList);
		return "doctor/mainChart";
		
	}
	//오더세트 이름 동적으로 가져오기
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@GetMapping("/getOrderSetList")
	public ResponseEntity<List<GroupOrderVO>> getOrderSetList(){
		
//		int empNo =1 ;
		List<GroupOrderVO> orderSetList = orderSetService.getOrderSetList(empNo);
		
		return new ResponseEntity<List<GroupOrderVO>>(orderSetList, HttpStatus.OK);
		
	}
	
	/**
	 * 동적으로 환자목록 불러오기
	 * @author jjinny
	 * @return
	 */
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/getWatingList")
	@ResponseBody 
	public ResponseEntity<List<MemberVO>> getWatingList(){
		
		log.info("getWatingList() 실행...!");
		
//		int empNo=1;
		List<MemberVO> watingList = mainChartService.getWatingList(empNo);
		
		return new ResponseEntity<List<MemberVO>>(watingList, HttpStatus.OK);
	}
	
	/**
	 * 대기환자에서 환자이름 클릭시 미리보기 나오게 하기
	 * @author jjinny
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/patientPreview")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<Map<String, Object>> patientPreview(@RequestBody MemberVO memberVO){
		log.info("getPatientChart() 실행...!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//로그인한 의사의 진료실 번호 가져오기
		String historyLoc = mainChartService.getClinicNo(empNo);
		memberVO.setHistoryLoc(historyLoc);
		
		//환자정보
		memberVO.setEmpNo(empNo);
		
		MemberVO patientPreview= mainChartService.patientPreview(memberVO);
		
		int receiptNo = patientPreview.getReceiptNo();
		
		//문진표
		PreDiagnosisVO preDiagnosisVO = mainChartService.getPreDiagnosis(receiptNo);
		
		map.put("patientPreview", patientPreview);
		map.put("preDiagnosisVO", preDiagnosisVO);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	/**
	 * 대기환자에서 진료시작 클릭시 환자차트 불러오기
	 * @author jjinny
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/patientChart")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<Map<String, Object>> getPatientChart(@RequestBody Map<String, String> map){
		log.info("getPatientChart() 실행...!");
		
		//여러개 담을 리스트
//		List chartList = new ArrayList();
		Map<String, Object> chartMap = new HashMap<String, Object>();
		
		int memNo = Integer.parseInt(map.get("memNo"));
		
		log.info("회원번호 : " +memNo);
		
		//차트번호, 차트날짜, 진료이력 가져옴
		List<ChartVO> patientChartList= mainChartService.getPatientChart(memNo);
		//날짜최신순으로 정렬
		Collections.sort(patientChartList, Comparator.comparingInt(ChartVO::getChartNo).reversed());
	
		//각 차트 번호에 대한 상병 목록을 담는 맵을 선언
		Map<Integer, List<DiagnosisVO>> allDiseaseMap = new HashMap<>();
	
		//각 차트 번호에 대한 약물 목록을 담는 맵을 선언
		Map<Integer, List<MedicineVO>> allMedicineMap = new HashMap<>();
		
		//물리치료 처방 가져와서 담는 맵을 선언
		Map<Integer, List<CommonCodeVO>> allPtMap= new HashMap<>();
		Map<Integer, List<CommonCodeVO>> allBodyMap= new HashMap<>();
		
			for(ChartVO chartVO : patientChartList) {
				int chartNo = chartVO.getChartNo();
				
				//주상병코드, 주상병명, 부상병코드, 부상병명 가져옴
				List<DiagnosisVO> diseaseList = mainChartService.getDiseaseList(chartNo);
				
				allDiseaseMap.put(chartNo, diseaseList);
				
				//약물처방 가져오기
				List<MedicineVO> medicineList = mainChartService.getMedicineList(chartNo);
				allMedicineMap.put(chartNo, medicineList);
				
				//물리치료 처방 가져오기
				List<CommonCodeVO> ptList = mainChartService.getPtList(chartNo);
				List<CommonCodeVO> bodyList = mainChartService.getBodyList(chartNo);
				allPtMap.put(chartNo, ptList);
				allBodyMap.put(chartNo, bodyList);
			}
			chartMap.put("chartList", patientChartList);
			chartMap.put("diseaseMap", allDiseaseMap);
			chartMap.put("medicineMap", allMedicineMap);
			chartMap.put("ptMap", allPtMap);
			chartMap.put("bodyMap", allBodyMap);
			
			
//			chartList.add(patientChartList);	
//			chartList.add(allDiseaseMap);	
//			chartList.add(allMedicineMap);	
//			chartList.add(allPtMap);
		
		return new ResponseEntity<Map<String, Object>>(chartMap, HttpStatus.OK);
		
	}
	
	/**
	 * 방사선검사요청
	 * @param orderVO
	 * @return
	 * @author jjinny
	 */
	@ResponseBody
	@PostMapping("/orderRadation")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> orderRadiation(@RequestBody OrderVO orderVO) {
		
//		int empNo=1;
		
		log.info("orderRadiation 실행...!");
		
		int patntNo = Integer.parseInt(orderVO.getPatntNo());
		int receiptNo = orderVO.getReceiptNo();
		String chartRecord = orderVO.getChartRecord();
		
		//차트 먼저 생성
		ChartVO chartVO = new ChartVO();
		
		chartVO.setPatntNo(patntNo);
		chartVO.setReceiptNo(receiptNo);
		chartVO.setChartRecord(chartRecord);
		
		ServiceResult result1 = mainChartService.createChart(chartVO);
		
		log.info("생성된 차트 번호 " + chartVO.getChartNo());

		//바디파트 포문돌려서 넣기
		List<String> bodyPartList = orderVO.getBodyPartList();
		
		for(String bodyPart : bodyPartList ) {
			
			OrderVO ptOrderVO = new OrderVO();
			ptOrderVO.setReceiptNo(receiptNo);
			ptOrderVO.setChartNo(chartVO.getChartNo());
			ptOrderVO.setOrderCode(orderVO.getCheckTechnique());
			ptOrderVO.setBodyCode(bodyPart);
			ptOrderVO.setEmpNo(empNo);
			
			mainChartService.orderRadiation(ptOrderVO);
		}

		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	/**
	 * 상병 찾는 오토컴플릿 목록 불러오기
	 * @author jjinny
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/diseaseSearch" , method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<DiseaseVO>> searchDisease(){
		log.info("searchDisease 실행...!");
		
		List<DiseaseVO> list = mainChartService.searchDisease();
		
		return new ResponseEntity<List<DiseaseVO>>(list, HttpStatus.OK);
	}
	
	/**
	 * 약품 찾는 오토컴플릿 목록 불러오기
	 * @author jjinny
	 * @return
	 */
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/medicineSearch" , method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<MedicineVO>> searchMedicine(){
		log.info("searchMedicine 실행...!");
		
		List<MedicineVO> list = mainChartService.searchMedicine();
		
		return new ResponseEntity<List<MedicineVO>>(list, HttpStatus.OK);
	}
	
	/**
	 * 수술명 찾는 오토컴플릿 목록 불러오기
	 * @author jjinny
	 * @return
	 */
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/surgerySearch" , method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<SurgeryKindVO>> surgerySearch(){
		log.info("surgerySearch 실행...!");
		
		List<SurgeryKindVO> list = mainChartService.searchSurgery();
		
		return new ResponseEntity<List<SurgeryKindVO>>(list, HttpStatus.OK);
	}
	
	/**
	 * 진료완료시 진료차트 생성
	 * @author jjinny
	 * @param chartVO
	 * @param medicine 
	 * @param ra
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/insertChart", produces = "text/plain;charset=utf-8")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> insertChart(HttpServletRequest req, ChartVO chartVO){

		//의사사번
//		int empNo=1;
		int receiptNo = chartVO.getReceiptNo();
		//환자번호
		int patntNo = chartVO.getPatntNo();
		
		//방사선 갔다온사람이랑 구분하기 위해 받아온 차트번호로 조건 걸기
		if(chartVO.getChartNo() == 0) {
			//차트생성
			ServiceResult result1 = mainChartService.insertChart(req, chartVO);
		}else {
			ServiceResult result1 = mainChartService.updateChart(req, chartVO);
		}
		
		int chartNo = chartVO.getChartNo();	//생성된 차트번호
	
		//진단내역 인서트
		///주상병 인서트
		DiagnosisVO primaryDiagnosisVO = new DiagnosisVO();
		primaryDiagnosisVO.setChartNo(chartNo);
		
		String primaryDiseaseNo = chartVO.getPrimaryDiseaseNo();
//		if(primaryDiseaseNo !=null && primaryDiseaseNo.isEmpty()) {
			primaryDiagnosisVO.setDisNo(primaryDiseaseNo);	//주상병번호
			primaryDiagnosisVO.setDisMain("Y");
			ServiceResult result2 = mainChartService.insertDiagnosis(primaryDiagnosisVO);
//		}
			
		///부상병 인서트
		List<String> secondaryNoList = chartVO.getSecondaryDiseaseNoList();//부상병번호리스트
//		if(secondaryNoList != null && !secondaryNoList.isEmpty()) {
			for(String secondDisease : secondaryNoList) {
				DiagnosisVO secondaryDiagnosisVO = new DiagnosisVO();
				secondaryDiagnosisVO.setChartNo(chartNo);
				secondaryDiagnosisVO.setDisNo(secondDisease);
				ServiceResult result3 = mainChartService.insertSecondDiagnosis(secondaryDiagnosisVO);
			}
//		}

		//약물처방
		List<PrescriptionVO> medicineList = chartVO.getMedicineListSend();	//약물리스트 꺼내기
		if(medicineList != null && !medicineList.isEmpty()) {
			OrderVO orderMedicine = new OrderVO();
			orderMedicine.setChartNo(chartNo);
			orderMedicine.setOrderCode("OD007");
			orderMedicine.setEmpNo(empNo);
			
			ServiceResult result4 = mainChartService.insertMedicineOrder(orderMedicine);
			
			//약물처방 테이블 인서트
			int orderNo = orderMedicine.getOrderNo();
			
			for(PrescriptionVO medicine : medicineList) {
				PrescriptionVO prescriptionVO = new PrescriptionVO();
				prescriptionVO.setOrderNo(orderNo);
				prescriptionVO.setMdcinNo(medicine.getMdcinNo());
				prescriptionVO.setPrescriptionDay(medicine.getPrescriptionDay());
				prescriptionVO.setPrescriptionFrequency(medicine.getPrescriptionFrequency());
				prescriptionVO.setPrescriptionTotal(medicine.getPrescriptionTotal());
	//			//히스토리 번경을 위해 receiptNo도 같이 넘김
				ServiceResult result5 = mainChartService.insertPrescription(prescriptionVO , receiptNo);
			}
		}
			
		//물리치료 처방 테이블 인서트
		List<String> selectPtList = chartVO.getSelectPtList();	//치료방법
		List<String> selectBodyList = chartVO.getSelectBodyList();	//치료부위
		
		if(selectPtList.size() > 0) {
			for(String pt : selectPtList) {
				OrderVO orderPt = new OrderVO();
				orderPt.setChartNo(chartNo);
				orderPt.setEmpNo(empNo);
				//			orderPt.setBodyCode(selectBody);
				orderPt.setOrderCode(pt);
				orderPt.setReceiptNo(receiptNo);
				
				for(String body : selectBodyList) {
					//				OrderVO orderPt = new OrderVO();
					orderPt.setBodyCode(body);
					ServiceResult result6 = mainChartService.insertPtOrder(orderPt);
				}
			}
		}
		
		//수술 처방 인서트(수술처방은 한부위만)
		String surgeryNo = "";
		surgeryNo = chartVO.getSurgeryNo();	//수술번호
		String historyLoc = chartVO.getHistoryLoc();	//입원실  위치 거르기
		
		OrderVO orderSurgery = new OrderVO();
		if(surgeryNo != null && !surgeryNo.isEmpty()) {
			for(String body : selectBodyList) {
				orderSurgery.setChartNo(chartNo);
				orderSurgery.setOrderCode("OD005");
				orderSurgery.setEmpNo(empNo);
				orderSurgery.setBodyCode(body);
				orderSurgery.setReceiptNo(receiptNo);
				orderSurgery.setHistoryLoc(historyLoc);
				ServiceResult result7 = mainChartService.insertSurgeryOrder(orderSurgery);
			}
			
			//수술 예약 테이블 인서트
			int orderSurgeryNo = orderSurgery.getOrderNo();
			SurgeryReservationVO surgeryReservationVO = new SurgeryReservationVO();
			surgeryReservationVO.setSurgeryDoctor(empNo);
			surgeryReservationVO.setPatntNo(patntNo);
			surgeryReservationVO.setOrderNo(orderSurgeryNo);
			surgeryReservationVO.setSurgeryKindCode(surgeryNo);
			
			ServiceResult result8 = mainChartService.insertSurgeryReservation(surgeryReservationVO);
			
		}
		
		//입원 처방 오더
		String orderHospitalizationCode = chartVO.getHospitalizationOrder();
		
		if(orderHospitalizationCode != null  && !orderHospitalizationCode.isEmpty()) {
			for(String body : selectBodyList) {
				OrderVO orderHospitalizationVO = new OrderVO();
				orderHospitalizationVO.setChartNo(chartNo);
				orderHospitalizationVO.setOrderCode(orderHospitalizationCode);
				orderHospitalizationVO.setEmpNo(empNo);
				orderHospitalizationVO.setBodyCode(body);
				orderHospitalizationVO.setReceiptNo(receiptNo);
				ServiceResult result9 = mainChartService.insertHospitalizationOrder(orderHospitalizationVO);
			}
		}
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	/**
	 * 진단시 오더세트 추가
	 * @author jjinny
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/insertGroupOrder")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> insertGroupOrder(@RequestBody Map<String, Object> map ){

		log.info("insertGroupOrder 실행...!");
		
		String groupOrderName = (String) map.get("groupOrderName");	//그룹 오더 이름
		
		//그륩오더 테이블 생성
//		int empNo=1;
		GroupOrderVO groupOrderVO = new GroupOrderVO();
		groupOrderVO.setEmpNo(empNo);
		groupOrderVO.setGroupOrderName(groupOrderName);
		ServiceResult result1 = mainChartService.createGroupOrder(groupOrderVO);
		
		//생성된 그룹오더 번호
		int groupOrderNo = groupOrderVO.getGroupOrderNo();	
		
		//상병코드 그룹오더 디테일 생성
		//주상병입력
		String primaryDisease = (String) map.get("primaryDiseaseNo");	//주상병코드
		GroupOrderDetailVO groupOrderPrimaryDisease = new GroupOrderDetailVO();
		groupOrderPrimaryDisease.setGroupOrderNo(groupOrderNo);
		groupOrderPrimaryDisease.setGroupOrderDetailContent(primaryDisease);
		groupOrderPrimaryDisease.setGroupOrderDetailCategory("GO001");
		ServiceResult result2 = mainChartService.insertGroupOrderDetail(groupOrderPrimaryDisease);
		
		//부상병입력
		List<String> secondaryDiseaseNoList = (List<String>) map.get("secondaryDiseaseNoList");
		for(String groupOrderDetailContent : secondaryDiseaseNoList) {
			GroupOrderDetailVO groupOrderSecondaryDisease = new GroupOrderDetailVO();
			groupOrderSecondaryDisease.setGroupOrderNo(groupOrderNo);
			groupOrderSecondaryDisease.setGroupOrderDetailContent(groupOrderDetailContent);
			groupOrderSecondaryDisease.setGroupOrderDetailCategory("GO002");
			ServiceResult result3 = mainChartService.insertGroupOrderDetail(groupOrderSecondaryDisease);
		}

		
		//약물처방 그룹오더 디테일 인서트
		List<String> medicineNoList = (List<String>) map.get("medicineNoList");
		for(String groupOrderDetailContent : medicineNoList) {
			GroupOrderDetailVO groupOrderPrescription = new GroupOrderDetailVO();
			groupOrderPrescription.setGroupOrderNo(groupOrderNo);
			groupOrderPrescription.setGroupOrderDetailContent(groupOrderDetailContent);
			groupOrderPrescription.setGroupOrderDetailCategory("GO003");
			ServiceResult result4 = mainChartService.insertGroupOrderDetail(groupOrderPrescription);
		}

		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);		
	}
	//협진요청
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	@PostMapping("/reqCollaboration")
	public ResponseEntity<String> collaborationRequest(@RequestBody CollaborationReqVO collaboVO){
		
		
		ServiceResult result = collaborationService.reqcollaboration(collaboVO);
		int collaboReqNo = collaboVO.getCollaboReqNo();
		
		collaborationService.updateHistory(collaboVO);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>(collaboReqNo+"", HttpStatus.OK);
		else return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	//진단서 모달창 띄우면서 정보 넣어주기
	@ResponseBody
	@PostMapping("/getDiagnosisPaperForm")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<Map<String, Object>> getDiagnosisPaperForm(@RequestBody Map<String, Object> map ){
		
		log.info("진단서폼 요청 실행!");
		
		int receiptNo = (int) map.get("receiptNo");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//환자정보 가져오기
		MemberVO memberVO =  mainChartService.getPatientInfo(receiptNo);
		//의사정보
		EmpVO empVO = mainChartService.getDoctorInfo(receiptNo);
		//상병정보
		List<DiseaseVO> diseaseList =mainChartService.getDiagnosisInfo(receiptNo);
		
		resultMap.put("patntInfo", memberVO);
		resultMap.put("doctorInfo", empVO);
		resultMap.put("diseaseInfoList", diseaseList);
		
		return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
	}
	
	//진단서 인서트
	@ResponseBody
	@PostMapping("/insertDiagnosisPaper")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> insertDiagnosisPaper(@RequestBody DiagnosisPaperVO diagnosisPaperVO){
		
		ServiceResult result = mainChartService.insertDiagnosisPaper(diagnosisPaperVO);
		
		if(result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		
	}
	
	//진단서 사이드바 
	@GetMapping("/diagnosisPaper")
	public String diagnosisPaper() {
		
		return "doctor/diagnosisPaper";
	}
	
	
	//진단서 불러오기
	@ResponseBody
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/getDiagnosisPaper")
	public ResponseEntity<Map<String, Object>> getDiagnosisPaper(@RequestBody Map<String, Object> map){
		log.info("진단서폼 불러오기 요청 실행!");
		
		int receiptNo = (int) map.get("receiptNo");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//환자정보 가져오기
		MemberVO memberVO =  mainChartService.getPatientInfo(receiptNo);
		//의사정보
		EmpVO empVO = mainChartService.getDoctorInfo(receiptNo);
		//상병정보
		List<DiseaseVO> diseaseList =mainChartService.getDiagnosisInfo(receiptNo);
		
		//진단서 정보
		DiagnosisPaperVO diagnosisPaper = mainChartService.getDiagnosisPaper(receiptNo);
		
		resultMap.put("diagnosisPaper", diagnosisPaper);
		resultMap.put("patntInfo", memberVO);
		resultMap.put("doctorInfo", empVO);
		resultMap.put("diseaseInfoList", diseaseList);
		
		return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		
	}
	
	//방사선기록 불러오기
	@ResponseBody
	@PostMapping("/getRadiationRec")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<List<RocRecordVO>> getRadiationRec(@RequestBody RocRecordVO rocRecordVO){
		
		int chartNo = rocRecordVO.getChartNo();
		
		List<RocRecordVO> radiationRecordList =  mainChartService.getRadiationRec(chartNo);
		
		return new ResponseEntity<List<RocRecordVO>>(radiationRecordList, HttpStatus.OK);
		
	}
	
	//협진요청시 차트 생성
	@ResponseBody
	@PostMapping("/collaboChart")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> collaboChart(@RequestBody ChartVO chartVO) {

		ServiceResult result1 = mainChartService.createChart(chartVO);

		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	

}
