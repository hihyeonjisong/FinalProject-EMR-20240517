package kr.or.ddit.controller.admin;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IMainAdminService;
import kr.or.ddit.vo.HospitalizationRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.ReceiptVO;
import kr.or.ddit.vo.ReceiveVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class MainReceiveController {
	
	@Inject
	IMainAdminService mainAdminService;
	
	//수납 (접수 연습하던거임 이거 내일 다시 수정)
	@GetMapping("/receiveForm")
	public String getreceiptForm() {
		log.info("dd");
		return "admin/receive";
	}
	
	// 수납 대기환자 불러오는 ajax 
	@PostMapping("/getReceiveList")
	public ResponseEntity<List<MemberVO>> getReserveList(){
		log.info("수납 대기환자 컨트롤러");
		List<MemberVO> receiveList =  mainAdminService.getReceiveList();
		log.info("수납대기리스트임");
		for (MemberVO memberVO : receiveList) {
			log.info("환자번호:"+memberVO.getPatntNo());
			
		}
		
		return new ResponseEntity<List<MemberVO>>(receiveList,HttpStatus.OK);
	}
	
	//접수번호로 *가격* 불러오는 ajax
	@PostMapping("/getPrice")
	@ResponseBody
	public Map<String, Object> getPrice(@RequestBody Map<String, Object> map) {
		log.info("갯수컨트롤러");
		String receiptString = (String) map.get("receiptNo");
		int rNo = Integer.parseInt(receiptString);
		log.info("rNo:",rNo);
		int hpday = 0;
		/*의약품 처방 가져오기*/
		List<PrescriptionVO> preList = mainAdminService.getPreList(rNo);
		int medicineSum =1;
		for (PrescriptionVO pVO : preList) {
			log.info("price: "+pVO.getMdcinPrice());
			log.info("total:"+pVO.getPrescriptionTotal());
			log.info("frequency:"+pVO.getPrescriptionFrequency());
			log.info("day:"+pVO.getPrescriptionDay());
			 // VO의 칼럼 값을 가져와 곱하여 계산
		    int mediSum = pVO.getMdcinPrice() * pVO.getPrescriptionTotal() * pVO.getPrescriptionFrequency() * pVO.getPrescriptionDay();
		    
		    // mediSum을 medicineSum에 더함
		    medicineSum += mediSum;
		}

		// 모든 VO의 mediSum을 합친 결과 출력
		log.info("자자자medicineSum: " + medicineSum);
		
		
		//rNo = 25;
		//int rNo = Integer.parseInt(receiptNo); // String을 int로 변환
		//rNo :6 
		/*물리갯수*/
	    int mulliCnt = mainAdminService.getMulli(rNo);
	    log.info("물리갯수: "+mulliCnt); // SQL에서 count로 가져오면 0이어도 오류 안남
	    
		//rNo :35
	    /*수술가격*/
	    int surgeryPrice = 0;
	    int wardPrice = 0;
	    try {
	    	surgeryPrice = mainAdminService.getSurgery(rNo);
		} catch (Exception e) {    // 근데 SQL에서 int로 가져오는데 null이면 오류나니까 try-catch해줘야함
			log.info("null임");
		}
	    log.info("수술가격:"+surgeryPrice);
	    HospitalizationRecordVO hpData = new HospitalizationRecordVO();
	    //rNo : 1000
	    /*입퇴원데이타*/
	    try {
	        hpData =  mainAdminService.getHospitalizationData(rNo);
	        log.info("입퇴원데이타:");
	        log.info(hpData.getHsptlzStartdate());
	        log.info(hpData.getHsptlzLeavedate());
	        log.info(""+hpData.getWardPrice());
	        
	        wardPrice = hpData.getWardPrice();
	        log.info("dd"+wardPrice);
	        
	        
	        
	        if (hpData.getHsptlzStartdate() != null && hpData.getHsptlzLeavedate() != null) {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	            Date startDate = dateFormat.parse(hpData.getHsptlzStartdate());
	            Date leaveDate = dateFormat.parse(hpData.getHsptlzLeavedate());

	            Calendar startCalendar = Calendar.getInstance();
	            startCalendar.setTime(startDate);
	            int startHour = startCalendar.get(Calendar.HOUR_OF_DAY);

	            Calendar leaveCalendar = Calendar.getInstance();
	            leaveCalendar.setTime(leaveDate);
	            int leaveHour = leaveCalendar.get(Calendar.HOUR_OF_DAY);

	            // 퇴원일 - 입원일 : 차이
	            // 시간이 오후 12시를 넘으면 1을 추가
	            if (leaveHour >= 12) {
	                hpday = (int) ((leaveDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) -1;
	            } else {
	                hpday = (int) ((leaveDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) -2;
	            }

	            log.info("hpday: " + hpday);
	        }
	        
	    } catch (Exception e) {
	        log.info("입퇴원null임");
	    }
	    
	    
	    /*MRI 갯수*/
	    int MRICnt = mainAdminService.getMRI(rNo);
	    log.info("MRI갯수:"+MRICnt);
	    /*X-RAY 갯수*/
	    int XRAYCnt = mainAdminService.getXRAY(rNo);
	    log.info("XRAY갯수:"+XRAYCnt);
	    
	    Map<String, Object> pMap = new HashMap<String,Object>();
	    pMap.put("medicineSum", medicineSum);
	    pMap.put("mulliCnt", mulliCnt);
	    pMap.put("surgeryPrice", surgeryPrice);
	    pMap.put("hpday", hpday);
	    pMap.put("wardPrice", wardPrice); // 이거  null임 고치기
	    pMap.put("MRICnt", MRICnt);
	    pMap.put("XRAYCnt", XRAYCnt);
	    
	    
	    return pMap;
	}
	
	
	//결제 insert하는 ajax
	@PostMapping("/doPay")
	@ResponseBody
	public ResponseEntity<Boolean> doPay(@RequestBody ReceiveVO receiveVO){
		log.info("카드결제금액:"+receiveVO.getReceiveCard());
		log.info("현금결제금액:"+receiveVO.getReceiveCash());
		log.info("남은금액:"+receiveVO.getLeftCost());
		log.info("접수금액:"+receiveVO.getReceiveCost());
		log.info("접수금액합:"+receiveVO.getReceiveCostSum());
		log.info("접수번호:"+receiveVO.getReceiptNo());
		
		ServiceResult result = mainAdminService.doPay(receiveVO);
		if(result.equals(ServiceResult.OK)) {
			//접수상태 완료로 update
			mainAdminService.updateReceiptStatus(receiveVO);
			/* 여기는 환자 기록 삭제하는거 임시로 주석 */
			mainAdminService.deleteHistory(receiveVO);
			return ResponseEntity.ok(true);
			
		}else {
			return ResponseEntity.ok(false);
		}
		
	}
	
	/*@PostMapping("/putPrice")
	@ResponseBody
	public ResponseEntity<Boolean> putPrice(@RequestBody ReceiveVO receiveVO){
		mainAdminService.putPrice(receiveVO);
		
		
		return ResponseEntity.ok(true);
	}*/
	
	
	
}
