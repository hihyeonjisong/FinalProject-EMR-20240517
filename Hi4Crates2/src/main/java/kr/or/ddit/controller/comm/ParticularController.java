package kr.or.ddit.controller.comm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.IParticularService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticularVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ParticularController {
	
	@Inject
	private IParticularService particularService; 
	
	@Inject
	private IMemberService memberService;
	
	@PostMapping("/comm/admin/getParticularList")
	@ResponseBody
	public ResponseEntity<List<ParticularVO>> getParticularList(@RequestBody ParticularVO partiVO){
		
		int patntNo = partiVO.getPatntNo();
		List<ParticularVO> partiList = particularService.getParticularList(patntNo);
		
		
		return new ResponseEntity<List<ParticularVO>>(partiList, HttpStatus.OK);
	}
	
	@GetMapping("/comm/admin/searchOnline")
	@ResponseBody
	public ResponseEntity<List<MemberVO>> getOnlineList(){
		
		List<MemberVO> onlineList = memberService.getOnlineList();
		
		return new ResponseEntity<List<MemberVO>>(onlineList, HttpStatus.OK);
	}
}
