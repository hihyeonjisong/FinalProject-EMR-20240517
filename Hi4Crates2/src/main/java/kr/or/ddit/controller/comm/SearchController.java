package kr.or.ddit.controller.comm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticularVO;
import kr.or.ddit.vo.ProtectorVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SearchController {
	
	@Inject
	private IMemberService memberService;
	
	@ResponseBody
	@PostMapping("/comm/getSearchList")
	public ResponseEntity<List<MemberVO>> getSearchList(@RequestBody Map<String, Object> map) throws UnsupportedEncodingException{
		List<MemberVO> memList = new ArrayList<MemberVO>();
		log.info("검색이름 : "+ map.get("searchName"));
		
		memList = memberService.getSearchList((String)map.get("searchName"));
		
		return new ResponseEntity<List<MemberVO>>(memList, HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/comm/showpatientdetail")
	public ResponseEntity<List> showPatientDetail(@RequestParam String param, Model model) {
		List list = new ArrayList();
		int memNo = Integer.parseInt(param);
		log.info(param);
		List<ChartVO> chartRecordList = new ArrayList<ChartVO>();
		List<ParticularVO> particularList = new ArrayList<ParticularVO>();
		MemberVO patntInfo = new MemberVO();
		ProtectorVO protector = new ProtectorVO();
		
		chartRecordList = memberService.getChartRecordList(memNo);
		for (ChartVO c : chartRecordList) {
			log.info("번호"+c.getChartNo());
			log.info("날짜"+c.getChartDate());
			log.info("이름 :"+c.getMemName());
		}
		particularList = memberService.getParticularList(memNo); 
		for (ParticularVO p : particularList) {
			log.info("내용"+p.getParticularDescription());
			log.info("날짜"+p.getParticularDate());
			log.info("이름"+p.getParticularWriter());
		}
		patntInfo = memberService.getPatntInfo(memNo);
		log.info("번호 : "+patntInfo.getMemNo());
		log.info("등록일 : "+patntInfo.getMemSignupDate());
		log.info("이름 : "+patntInfo.getMemName());
		log.info("주민등록번호 : "+patntInfo.getMemTel());
		log.info("성별 : "+patntInfo.getMemGender());
		log.info("나이 : "+patntInfo.getMemAge());
		
//		try {
			protector = memberService.getProtector(memNo);
//			log.info("이름 : "+protector.getProtectorName());
//			log.info("번호 : "+protector.getProtectorTel());
//			log.info("관계 : "+protector.getProtectorRelate());
//			log.info("등록일 : "+protector.getProtectorDate());
//		} catch (Exception e) {
//			protector = null;
//		}
		
		list.add(chartRecordList);
		list.add(particularList);
		list.add(patntInfo);
		if(protector != null) {
			list.add(protector);
		}
		
		return new ResponseEntity<List>(list,HttpStatus.OK);
	}
	
	
	@ResponseBody
	@PostMapping("/comm/getPartiInfo")
	public ResponseEntity<MemberVO> getPartiInfo(@RequestBody Map<String, Object> map){
		
		MemberVO member = memberService.getPartiInfo((int)map.get("partiTargetNo"));
		
		return new ResponseEntity<MemberVO>(member, HttpStatus.OK);
	}
}
