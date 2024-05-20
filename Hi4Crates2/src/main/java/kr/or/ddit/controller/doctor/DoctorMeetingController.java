package kr.or.ddit.controller.doctor;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IDoctorMeetingService;
import kr.or.ddit.service.IRadiationService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MeetingPersonVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.TreeViewVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/doctor/meeting")
@Slf4j
public class DoctorMeetingController {

	@Inject
	private IDoctorMeetingService doctorMeetingService;
	
	@Inject
	private IRadiationService radiationService;
	
	@GetMapping("/start")
	public String goMeetingPage(@RequestParam("roomName") String roomName, @RequestParam("alias") String alias, Model model) {
		log.info("roomName : " + roomName);
		log.info("alias : " + alias);
		model.addAttribute("roomName", roomName);
		model.addAttribute("alias", alias);
		return "doctor/meeting";
	}
	
	@GetMapping("/treeView")
	public String goTreeViewPage() {
		return "doctor/treeView";
	}
	
	/*
	 * @GetMapping("/{roomAlias}") public String inviteCodePage(@PathVariable String
	 * roomAlias, Model model) { model.addAttribute("roomAlias", roomAlias); return
	 * "redirect:/doctor/meeting/start"; }
	 */
	
	@PostMapping("/createMeeting")
	public ResponseEntity<Integer> insertMeetingRecord(@RequestBody MeetingVO meetingVO) {
		
		int meetingNo = doctorMeetingService.insertMeetingRecord(meetingVO);
		
		return new ResponseEntity<Integer>(meetingNo, HttpStatus.OK);
	}
	
	@PostMapping("/recordingMeeting")
	public ResponseEntity<Boolean> recordingMeeting(@RequestBody MeetingVO meetingVO) {
		boolean flag = doctorMeetingService.recordingMeeting(meetingVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@PostMapping("/insertMeetingPerson")
	public ResponseEntity<Boolean> insertMeetingPerson(@RequestBody MeetingPersonVO meetingPersonVO) {
		boolean flag = doctorMeetingService.insertMeetingPerson(meetingPersonVO);
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@PostMapping("/getEmpList")
	public ResponseEntity<List<TreeViewVO>> getEmpList() {
		List<TreeViewVO> treeList = doctorMeetingService.getEmpList();
		for (int i = 0; i < treeList.size(); i++) {
			TreeViewVO tree = treeList.get(i);
			if (tree.getParent() == null) {
				tree.setParent("#");
			}
		}
		return new ResponseEntity<List<TreeViewVO>>(treeList, HttpStatus.OK);
	}
	
	@PostMapping("/getEmpInfo")
	public ResponseEntity<EmpVO> getEmpInfo(@RequestBody Map<String, Integer> memberMap) {
		int memNo = memberMap.get("memNo");
		EmpVO empVO = radiationService.getEmpInfo(memNo);
		return new ResponseEntity<EmpVO>(empVO, HttpStatus.OK);
	}
	
	@PostMapping("/getMeetingRecord")
	public ResponseEntity<List<MeetingVO>> getMeetingRecord() {
		List<MeetingVO> meetingRecordList = doctorMeetingService.getMeetingRecord();
		return new ResponseEntity<List<MeetingVO>>(meetingRecordList, HttpStatus.OK);
	}
	
	
}
