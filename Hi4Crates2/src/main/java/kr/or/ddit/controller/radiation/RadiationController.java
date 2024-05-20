package kr.or.ddit.controller.radiation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IRadiationService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.ClinicVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EquipmentVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.RadiationRoomVO;
import kr.or.ddit.vo.RepairRequestVO;
import kr.or.ddit.vo.RocRecordVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/radiation")
@Slf4j
public class RadiationController {

	@Inject
	private IRadiationService radiationService;

	@Resource(name = "uploadPath")
	private String resourcePath;

	@GetMapping("/main")
	public String radiationMain(Model model) {
		log.info("방사선 메인");
		return "radiation/radiationMain";
	}

	// 방사선실 페이지
	@GetMapping("/radiationRoom")
	public String radiationRoomPage(int roomNo, Model model) { // roomNo 추가
		log.info("방사선실 페이지");
		log.info("roomNo : " + roomNo);

		// 클릭한 방사선실 정보 가져오기
		RadiationRoomVO radiationRoom = radiationService.getRadiationRoomInfo(roomNo);
		log.info(radiationRoom.getRocName());

		// 방사선실 정보 model에 담기
		model.addAttribute("radiationRoomInfo", radiationRoom);

		// 방사선실에 있는 환자 정보 조회 (동기 비동기 고민해보기)
		// MemberVO member = radiationService.getRadiationPatntInfo(roomNo);

		// 방사선실에 사용할 멘트 리스트
		List<CommentVO> commentList = radiationService.getCommentList();
		// 모델에 리스트 담기
		for (int i = 0; i < commentList.size(); i++) {
			log.info("commentNo : " + commentList.get(i).getCommentNo());
			log.info(commentList.get(i).getCommentContent());
		}
		model.addAttribute("commentList", commentList);
		return "radiation/radiationRoom";
	}
	
	// 멘트 리스트 비동기로 변경
	@PostMapping("/getCommentList")
	public ResponseEntity<List<CommentVO>> getCommentList() {
		List<CommentVO> commentList = radiationService.getCommentList();
		return new ResponseEntity<List<CommentVO>>(commentList, HttpStatus.OK);
	}

	// 장비목록 페이지
	@GetMapping("/equipmentList")
	public String equipmentListPage(Model model) {
		log.info("장비목록 리스트 페이지");

		// 방사선실 장비 목록 리스트 가져오기
		List<EquipmentVO> radiationEqList = radiationService.getEqList();

		for (int i = 0; i < radiationEqList.size(); i++) {
			log.info("eqName : " + radiationEqList.get(i).getEqName());
		}
		// 장비 목록 리스트 model에 담기
		model.addAttribute("radiationEqList", radiationEqList);
		// 액션 버튼 어떻게 할지 고민해보기 (수리 요청 하는 쪽으로 갈듯?)
		// 장비 하나 클릭 시 모달로 띄워주기

		return "radiation/equipmentList";
	}
	
	// 장비 리스트 비동기로 가져오기
	@PostMapping("/getEquipList")
	public ResponseEntity<List<EquipmentVO>> getEquipList() {
		List<EquipmentVO> equipList = radiationService.getEquipList();
		return new ResponseEntity<List<EquipmentVO>>(equipList, HttpStatus.OK);
	}

	// 장비 정보 상세보기
	@ResponseBody
	@PostMapping("/equipmentInfo")
	public ResponseEntity<JSONObject> equipmentInfo(@RequestBody String eqNo) {
		log.info("eqNo : " + eqNo);

		JSONObject res = new JSONObject().fromObject(eqNo);
		int equipmentNo = Integer.parseInt((String) res.get("eqNo"));
		log.info("eqNo : " + equipmentNo);

		EquipmentVO eqVO = radiationService.getEqInfo(equipmentNo);
		JSONObject jsonEqVO = new JSONObject().fromObject(eqVO);
		return new ResponseEntity<JSONObject>(jsonEqVO, HttpStatus.OK);
	}

	// 장비 정보 수정
	@PostMapping("/updateEqInfo")
	public String updateEqInfo(EquipmentVO equipmentVO, Model model, RedirectAttributes ra) {
		log.info(equipmentVO.getEqLocname());

		String goPage = "redirect: /radiation/equipmentList";

		int updateEqInfoStatus = radiationService.updateEqInfo(equipmentVO);
		int updateEqDescription = 0;

		if (updateEqInfoStatus > 0) {
			updateEqDescription = radiationService.updateEqDescription(equipmentVO);
		}

		if (updateEqInfoStatus > 0 && updateEqDescription > 0) {
			ra.addFlashAttribute("msg", "수정 성공!");
		} else {
			ra.addFlashAttribute("msg", "수정 실패!");
		}
		return goPage;
	}

	// 수리 요청 목록, 취소 할지 말지 고민해보기
	
	@PostMapping("/checkRequest")
	public ResponseEntity<Boolean> checkRequest(@RequestBody RepairRequestVO repairRequestVO) {
		int eqNo = repairRequestVO.getEqNo();
		boolean flag = radiationService.checkRequest(eqNo);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	

	// 장비 수리 등록
	@ResponseBody
	@PostMapping("/eqRepairRequest")
	public ResponseEntity<Boolean> eqRepairRequest(@RequestBody RepairRequestVO repairReqVO) {

		boolean flag = false;
		int eqNo = repairReqVO.getEqNo();
		log.info("eqNo : " + eqNo);

		// 수리 요청
		int status = radiationService.requestRepair(repairReqVO);

		if (status == 1) {
			flag = true;
		}

		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}

	// 방송 안내 멘트 추가
	@ResponseBody
	@PostMapping("/insertComment")
	public ResponseEntity<Boolean> insertComment(@RequestBody CommentVO commentVO) {
		boolean flag = false;

		String commentContent = commentVO.getCommentContent();
		log.info("commentContent : " + commentContent);

		int status = radiationService.insertComment(commentVO);

		if (status > 0) {
			flag = true;
		}

		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}

	// 코멘트 수정
	@ResponseBody
	@PostMapping("/updateComment")
	public ResponseEntity<Boolean> updateComment(@RequestBody CommentVO commentVO) {
		boolean flag = false;

		int status = radiationService.updateComment(commentVO);

		if (status > 0) {
			flag = true; // 수정 성공
		}

		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}

	// 방송 안내 멘트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public ResponseEntity<Boolean> deleteComment(@RequestBody CommentVO commentVO) {
		boolean flag = false;
		int commentNo = commentVO.getCommentNo();
		log.info("commNo : " + commentNo);

		int status = radiationService.deleteComment(commentNo);

		if (status > 0) {
			flag = true;
		}

		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}

	// 방사선실 대기환자 조회
	@RequestMapping(value = "/radiationWaitingList", method = RequestMethod.POST)
	public ResponseEntity<List<MemberVO>> radiationWaitingList() {

		List<MemberVO> radiationWaitingList = radiationService.radiationWaitingList();

		return new ResponseEntity<List<MemberVO>>(radiationWaitingList, HttpStatus.OK);
	}

	// 환자 오더 정보 확인 > 05/02 접수번호로 불러오기 수정 
	@ResponseBody
	@PostMapping("/getPatntOrder")
	public ResponseEntity<List<MemberVO>> getPatntOrder(@RequestBody MemberVO memberVO) {
		log.info("receiptNo : " + memberVO.getReceiptNo());
		int receiptNo = memberVO.getReceiptNo();

		List<MemberVO> memOrderInfo = radiationService.getPatntOrder(receiptNo);
		for (MemberVO memberVO2 : memOrderInfo) {
			
			log.info("환자이름 : " + memberVO2.getMemName());
			log.info("접수번호 : " + memberVO2.getReceiptNo());
			log.info("바디네임 : " + memberVO2.getBodyName());
		}
		return new ResponseEntity<List<MemberVO>>(memOrderInfo, HttpStatus.OK);
	}

	// 방사선실 현황 비동기
	@GetMapping("/radiationRoomList")
	public ResponseEntity<List<RadiationRoomVO>> radiationRoomList() {
		List<RadiationRoomVO> radiationRoomList = radiationService.getRadiationRoomList();
		return new ResponseEntity<List<RadiationRoomVO>>(radiationRoomList, HttpStatus.OK);
	}

	// 촬영 요청서 조회???

	// 환자 선택 시 촬영결과 작성하는부분 데이터 보내주기

	// ajax 파일 업로드(수정해야됨)
	@PostMapping(value = "/insertRocRecord")
	public ResponseEntity<String> uploadAjax(@RequestPart("files") MultipartFile files[],
			@RequestParam("memName") String memName, @RequestParam("orderNo") int orderNo,
			@RequestParam("rocEqno") int rocEqno, @RequestParam("rocRecordcontent") String rocRecordcontent,
			@RequestParam("rocNo") int rocNo, @RequestParam("chartNo") int chartNo,
			@RequestParam("empNo") int empNo) throws Exception {
		List<AttachmentVO> fileList = new ArrayList<AttachmentVO>();
		String message = "";

		log.info("files length : " + files.length);

		for (MultipartFile file : files) {
			log.info("originalFileName : " + file.getOriginalFilename());
			log.info("file : " + file.getContentType());
			log.info("file : " + file.getSize());
			log.info("file : " + FilenameUtils.getExtension(file.getName()));

			AttachmentVO attachmentVO = RadiationUploadFileUtils.uploadFile(resourcePath, file.getOriginalFilename(),
					file.getBytes());
			attachmentVO.setAttachSize(file.getSize());
			attachmentVO.setAttachLoc("/radiation");
			fileList.add(attachmentVO);
		}

		log.info("memNo : " + memName);
		log.info("orderNo : " + orderNo);
		log.info("fileList : " + fileList);
		// 여기서 여러 개의 이미지 업로드 진행
		// 필요한거 : 오더번호, 장비, 내용, 방사선실 번호, 담당자, 파일 번호
		// 파일 insert후 group_no 받아서 기록하면 될듯?

		int groupNo = radiationService.insertFiles(fileList);
		log.info("groupNo : " + groupNo);
		
		// vo에 담아서 groupNo랑 보내주면 될거같음ㅇㅇ
		RocRecordVO rocRecordVO = new RocRecordVO();
		rocRecordVO.setOrderNo(orderNo);
		rocRecordVO.setRocRecordcontent(rocRecordcontent);
		rocRecordVO.setAttachmentGroupno(groupNo);
		rocRecordVO.setRocEqno(rocEqno);
		rocRecordVO.setRocNo(rocNo);
		rocRecordVO.setChartNo(chartNo);
		rocRecordVO.setEmpNo(empNo);

		boolean insertFlag = radiationService.insertRocRecord(rocRecordVO);
		log.info("flag : " + insertFlag);
		if (insertFlag) {
			message = "success";
		} else {
			message = "fail";
		}

		return new ResponseEntity<String>(message, HttpStatus.OK);
	}

	// 기능 삭제 예정
	@ResponseBody
	@PostMapping("/deleteEquipment")
	public ResponseEntity<Boolean> deleteEquipment(@RequestBody Map<String, Integer> eqMap) {

		log.info("map : " + eqMap);
		int eqNo = eqMap.get("eqNo");
		boolean flag = radiationService.deleteEquipment(eqNo);

		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}

	// 환자 이동 시 환자 상태, 방사선실 상태 업데이트
	@PostMapping("/updateStatus")
	public ResponseEntity<Boolean> updateStatus() {
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}

	// 방사선실 촬영중인 환자 정보 불러오기(비동기)
	@PostMapping("/inRadiationRoomPatntInfo")
	public ResponseEntity<MemberVO> inRadiationRoomPatntInfo(@RequestBody Map<String, String> roomNameMap) {
		String roomName = roomNameMap.get("rocName");
		log.info("roomNameMap : " + roomNameMap);
		log.info("rocName : " + roomName);
		MemberVO member = radiationService.inRadiationRoomPatntInfo(roomName);
		return new ResponseEntity<MemberVO>(member, HttpStatus.OK);

	}

	// history 업데이트(해당 방사선실이 사용중이면 update 안되게 하기)
	@ResponseBody
	@PostMapping("/updateHistory")
	public ResponseEntity<Boolean> updateHistory(@RequestBody HistoryVO historyVO) {
		boolean flag = radiationService.updateHistory(historyVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	
	// orderNo로 orderCode, bodyCode 가져오기
	@PostMapping(value = "/getBodyCode", produces = "application/json; charset = utf-8")
	public ResponseEntity<OrderVO> getBodyCode(@RequestBody Map<String, Integer> orderMap) {
		int orderNo = orderMap.get("orderNo");
		OrderVO orderVO = radiationService.getBodyCode(orderNo);
		log.info(orderVO.getOrderCode());
		log.info(orderVO.getBodyCode());
		return new ResponseEntity<OrderVO>(orderVO, HttpStatus.OK);
	}
	
	// memNo로 empNo등 정보 가져오기
	@PostMapping("/getEmpInfo")
	public ResponseEntity<EmpVO> getEmpInfo(@RequestBody Map<String, Integer> memberMap) {
		int memNo = memberMap.get("memNo");
		EmpVO empVO = radiationService.getEmpInfo(memNo);
		return new ResponseEntity<EmpVO>(empVO, HttpStatus.OK);
	}
	
	@PostMapping("/getClinicNo")
	public ResponseEntity<ClinicVO> getClinicNo(@RequestBody Map<String, Integer> orderMap) {
		int orderNo = orderMap.get("orderNo");
		ClinicVO clinicVO = radiationService.getClinicNo(orderNo);
		return new ResponseEntity<ClinicVO>(clinicVO, HttpStatus.OK);
	}
	
	@PostMapping("/updatePatntHistory")
	public ResponseEntity<Boolean> updatePatntHistory(@RequestBody HistoryVO historyVO) {
		boolean flag = radiationService.updatePatntHistory(historyVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
}
