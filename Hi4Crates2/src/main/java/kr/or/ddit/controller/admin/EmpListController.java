package kr.or.ddit.controller.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IEmpListService;
import kr.or.ddit.vo.EmpListVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/empList")
public class EmpListController {
	
	@Inject
	IEmpListService empService;
	
	//목록요청
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/showEmpList")
	public String empList() {
		return "admin/empList";
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/getEmpList")
	public ResponseEntity<List<EmpListVO>> getEmpList() {
		log.info("getEmpList 실행...!");
		
		List<EmpListVO> empList = empService.getEmpList();
		
		//날짜 자르기
		for(EmpListVO empListVO : empList) {
			if(empListVO.getEmpHireDate() != null) {
				String empHireDate = (String) empListVO.getEmpHireDate().substring(0, 10);
				empListVO.setEmpHireDate(empHireDate);
			}
			if(empListVO.getEmpLeaveDate() != null) {
				String empLeaveDate = (String) empListVO.getEmpLeaveDate().substring(0, 10);
				empListVO.setEmpLeaveDate(empLeaveDate);
			}
		}
	
		return new ResponseEntity<List<EmpListVO>>(empList, HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/updateEmp")
	public ResponseEntity<String> updateEmp(@RequestBody Map<String, Object> map){

		log.info((String)map.get("value"));
		ServiceResult result = empService.updateEmp(map);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
}
