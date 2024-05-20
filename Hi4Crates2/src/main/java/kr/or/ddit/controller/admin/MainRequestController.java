package kr.or.ddit.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IMainAdminService;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineRequestVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.RepairRequestVO;
import kr.or.ddit.vo.RepairResultVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class MainRequestController {
	
	@Inject
	IMainAdminService mainAdminService;
	
	//의약품 전체목록 뜨기
	@GetMapping("/medicineList")
	public String showMedicineList() {
		return "admin/medicineList";
	}
	
	
	//의약품신청리스트페이지 뜨기
	@GetMapping("/medicineRequestList")
	public String showMedicineRequestList() {
		return "admin/medicineRequestList";
	}
	
	//ajax: 의약품 리스트 가져오기
	@PostMapping("/getMedicineList")
	public ResponseEntity<List<MedicineVO>> getMedicineList(){
		List<MedicineVO> list = mainAdminService.getMedicineList();
		/*for (MedicineVO medicineVO : list) {
			log.info("의약품리스트:"+medicineVO.getMdcinCompany());
		}*/
		return new ResponseEntity<List<MedicineVO>>(list,HttpStatus.OK);
	}
	
	
	//ajax: 의약품신청리스트가져오기
	@PostMapping("/getMedicineRequestList")
	public ResponseEntity <List<MedicineRequestVO>> getMedicineRequestList(){
		List<MedicineRequestVO> list =  mainAdminService.getMedicineRequestList();
		
		System.out.println(list);
		return new ResponseEntity<List<MedicineRequestVO>>(list,HttpStatus.OK);
		
	}
	
	//ajax: 의약품신청 승인시 의약품신청결과테이블에 승인결과 등록
	@PostMapping("/mediRequestAdmit")
	public ResponseEntity<Boolean> mediRequestAdmit(
			@RequestBody MedicineRequestResultVO medicineRequestVO){
		int memNo = medicineRequestVO.getEmpNo();
		int empNo = mainAdminService.getEmpNo(memNo);
		medicineRequestVO.setEmpNo(empNo);
		ServiceResult result = mainAdminService.mediRequestAdmit(medicineRequestVO);
		log.info(""+result);
		if(result.equals(ServiceResult.OK)) {
			return ResponseEntity.ok(true);
		}else {
			return ResponseEntity.ok(false);
		}
		
	}
	
	//ajax : 의약품반려시 반려사유등록
	@PostMapping("/mediRequestRefuse")
	public ResponseEntity<Boolean> mediRequestRefuse(
			@RequestBody MedicineRequestResultVO mediRequestResultVO){
		//memNo로 empNo 가져오기
		int memNo = mediRequestResultVO.getEmpNo();
		int empNo = mainAdminService.getEmpNo(memNo);
		//가져온  empNo 저장해서 반려시 직원번호로 넘겨주기
		mediRequestResultVO.setEmpNo(empNo);
		
		ServiceResult result = mainAdminService.mediRequestRefuse(mediRequestResultVO);
		if(result.equals(ServiceResult.OK)) {
			return ResponseEntity.ok(true);
		}else {
			return ResponseEntity.ok(false);
		}
		
	}
	
	
	//***********************
	
	
	// 장비신청 목록 페이지 띄우기
	@GetMapping("/equipmentRequestList")
	public String equipmentRequestList() {
		return "admin/equipmentRequestList";
	}
	
	//ajax: 장비신청 목록 가져오기
	@PostMapping("/getEquipmentRequestList")
	public ResponseEntity <List <RepairRequestVO>> getEquipmentRequestList() {
		log.info("장비신청목록 컨트롤러진입");
		List<RepairRequestVO> repairList =  mainAdminService.getEquipmentRequestList();
		for (RepairRequestVO repairRequestVO : repairList) {
			
			log.info(repairRequestVO.getRepairReason());
			log.info(repairRequestVO.getLocName());
			log.info(repairRequestVO.getEqName());
		}
		
		return new ResponseEntity<List<RepairRequestVO>>(repairList, HttpStatus.OK);
	}
	
	//ajax : 장비신청 승인하기
	@PostMapping("/equipRepairAdmit")
	public ResponseEntity<Boolean>equipRepairAdmit(
			@RequestBody RepairResultVO repairResultVO){
		
		//memNo로 empNo 가져오기
		int memNo = repairResultVO.getEmpNo();
		int empNo = mainAdminService.getEmpNo(memNo);
		//가져온  empNo 저장해서 반려시 직원번호로 넘겨주기
		repairResultVO.setEmpNo(empNo);
		
		ServiceResult result = mainAdminService.equipRepairAdmit(repairResultVO);
		if(result.equals(ServiceResult.OK)) {
			return ResponseEntity.ok(true);
		}else {
			return ResponseEntity.ok(false);
		}
	}
	
	@PostMapping("/equipRepairRefuse")
	public ResponseEntity<Boolean>equipRepairRefuse(
			@RequestBody RepairResultVO repairResultVO){
		
		//memNo로 empNo 가져오기
		int memNo = repairResultVO.getEmpNo();
		int empNo = mainAdminService.getEmpNo(memNo);
		//가져온  empNo 저장해서 반려시 직원번호로 넘겨주기
		repairResultVO.setEmpNo(empNo);
		
		ServiceResult result = mainAdminService.equipRepairRefuse(repairResultVO);
		if(result.equals(ServiceResult.OK)) {
			return ResponseEntity.ok(true);
		}else {
			return ResponseEntity.ok(false);
		}
	}
	
	
	
}
