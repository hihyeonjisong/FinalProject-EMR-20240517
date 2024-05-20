package kr.or.ddit.controller.surgery;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IEmpSurgeryService;
import kr.or.ddit.service.ISurgeryRecordService;
import kr.or.ddit.vo.SurgeryReservationVO;
import kr.or.ddit.vo.SurgeryVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/surgeryRecord")
@Slf4j
public class SurgeryRecordController {
	
	@Inject
	private ISurgeryRecordService surgeryRecordService;
	
	//수술목록 리스트
	@GetMapping("/getSurgeryList")
	public String getSurgeryList(Model model){
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date today = cal.getTime();
		List<SurgeryReservationVO> surgeryList =  surgeryRecordService.getSurgeryList();
		for (SurgeryReservationVO sr : surgeryList) {
			String date =sr.getSurgeryReservationDate();
			
			Date targetDate = null;
			
			try {
				targetDate = formatter.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if(today.after(targetDate) || today.equals(targetDate)) {
				sr.setFlagDate(true);
			}
		}
		model.addAttribute("surgeryList", surgeryList);
		
		return "empSurgery/surgeryRecord";
	}
	
	@ResponseBody
	@PostMapping("/insertsurgery")
	public ResponseEntity<String> insertSurgery(@RequestBody SurgeryVO surgery){
		surgery.setSurgeryDate(surgery.getSurgeryDate().substring(0,10));
		ServiceResult result = surgeryRecordService.insertSurgery(surgery);
		if (result.equals(ServiceResult.OK)) return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		
	}
	
	@ResponseBody
	@PostMapping("/detailSurgery")
	public ResponseEntity<SurgeryReservationVO> detailSurgery(@RequestBody Map<String, Integer> map){
		
		int surgeryNo = map.get("surgeryNo");
		
		SurgeryReservationVO surgeryReservationDetail = surgeryRecordService.detailSurgery(surgeryNo);
		
		return new ResponseEntity<SurgeryReservationVO>(surgeryReservationDetail, HttpStatus.OK);
		
		
	}
}
