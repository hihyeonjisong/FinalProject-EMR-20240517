package kr.or.ddit.controller.statistics;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IStatisticsService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.HospitalizationRecordVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ReceiptVO;
import kr.or.ddit.vo.ReceiveVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/statistics")
@Slf4j
public class StatisticsController {

	@Inject
	private IStatisticsService service;
	
	/* 연, 월 매출  차트 */
	@GetMapping("/yearMonth")
	public String statistics() {
		
		
		return "statistics/yearMonth";
	}
	
	@PostMapping("/yearMonth")
	public ResponseEntity<Integer> yearMonth(@RequestBody MemberVO mVO){
//		log.info("yearMonth 옴~" + mVO);
		int year = service.yearGet();
		
		log.info("####year" + year);
		
		
		return new ResponseEntity<Integer>(year, HttpStatus.OK);
	}
	
	@PostMapping("/month")
	public ResponseEntity<Integer> month(@RequestBody MemberVO mVO){
		
		log.info("zzzz");
		int month = service.monthGet();
		System.out.println("###달달" + month);
		
		return new ResponseEntity<Integer>(month, HttpStatus.OK);
	}
	
	// 환자 수 / 직원 수 통계
	@GetMapping("/patientEmp")
	public String patientEmp() {
		
		
		return "statistics/patientEmp";
	}
	
	@PostMapping("/patientCount")
	public ResponseEntity<MemberVO> patientCount(
			@RequestBody MemberVO rVO
			){
		// 남자수
		int manCount = service.mCount(rVO);
		
		MemberVO memberVo = new MemberVO();
		memberVo.setManCount(manCount);
		
		
		return new ResponseEntity<MemberVO>(memberVo, HttpStatus.OK);
	}
	
	@PostMapping("/empCount")
	public ResponseEntity<EmpVO> empCount(@RequestBody MemberVO mVO){
		
		// select에서 뽑아온 year
		int year = mVO.getStatisticsYear();
		// 쿼리에서 쓸 statisticsYear
		int statisticsYear = year + 1;
		mVO.setStatisticsYear(statisticsYear);
		
		System.out.println("하이루!@!" + mVO);
		
		int doctor = service.dCount(mVO);		// 의사
		int nurse = service.nCount(mVO);		// 간호사
		int radiology = service.rCount(mVO);	// 방사선사
		int physical = service.pCount(mVO);	// 물리치료사
		int one = service.oCount(mVO);			// 원무과

		log.info("###doctor" + doctor);
		System.out.println("##doctor" + doctor + nurse + radiology
				+ physical + one);
		
		EmpVO empVO = new EmpVO();
		empVO.setDoctor(doctor);
		empVO.setNurse(nurse);
		empVO.setRadiology(radiology);
		empVO.setPhysical(physical);
		empVO.setOne(one);
		
		
		return new ResponseEntity<EmpVO>(empVO, HttpStatus.OK);
	}
	
	/* 수입통계 */
	
	// 수입 통계 
	@GetMapping("/revenue")
	public String revenueList() {
		
		return "statistics/revenue";
	}
	
	@PostMapping("/monthMoney")
	public ResponseEntity<Integer> monthMoney(@RequestBody MemberVO mVO){
		
		int money = service.moneyMonth(mVO);
//		log.info("###money" + money);
		
		
		return new ResponseEntity<Integer>(money, HttpStatus.OK);
	}
	
	
	@PostMapping("/subject")
	public ResponseEntity<ReceiveVO> subject(@RequestBody MemberVO mVO){
		
//	System.out.println("mVo날짜" + mVO);
		
	int mriPrice = service.mriCount(mVO);
	int xrayPrice = service.xrayCount(mVO);
	int phyPrice = service.phyCount(mVO);
	int serPrice = service.serCount(mVO);
	int hpPrice = service.hpCount();
	
	ReceiveVO rVO = new ReceiveVO();
	rVO.setMriPrice(mriPrice);
	rVO.setXrayPrice(xrayPrice);
	rVO.setMulliPrice(phyPrice);
	rVO.setSurgeryPrice(serPrice);
	rVO.setHpPrice(hpPrice);
	
		
	return new ResponseEntity<ReceiveVO>(rVO, HttpStatus.OK);
	}
}
