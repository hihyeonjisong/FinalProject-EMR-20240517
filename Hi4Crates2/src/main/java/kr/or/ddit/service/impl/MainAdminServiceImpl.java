package kr.or.ddit.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IMainAdminMapper;
import kr.or.ddit.service.IMainAdminService;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.HospitalizationRecordVO;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineRequestVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.ReceiptVO;
import kr.or.ddit.vo.ReceiveVO;
import kr.or.ddit.vo.RepairRequestVO;
import kr.or.ddit.vo.RepairResultVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MainAdminServiceImpl implements IMainAdminService {
	
	@Inject
	IMainAdminMapper mainAdminMapper;
	
	//원무과 회원등록
	@Override
	public void enrollMember(MemberVO member) {
		
		//나이, 성별 구해서 memberVO에 set해주는 과정
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
		String formatedNow = now.format(formatter); //2024
		
		log.info("+++formatedNow+++++++"+formatedNow);
		
		String memRegno1 = member.getMemRegno1();
		String sub1 = memRegno1.substring(0,2);
		log.info("sub1:"+sub1); //98****
		
		String memRegno2 = member.getMemRegno2();
		String sub2 = memRegno2.substring(0,1);
		log.info("sub2:"+sub2); //1 or 2 or 3 or 4
		System.out.println("++++++++++"+(Integer.parseInt(formatedNow)-(1900+Integer.parseInt(sub1))+1));
		
		int memAge = 0;
		if(sub2.equals("1")||sub2.equals("2")) {
			           // 2024 - (1900 + 주민번호앞자리 ) + 1 = 나이
			memAge = (Integer.parseInt(formatedNow)-(1900+Integer.parseInt(sub1))+1);
		}else if(sub2.equals("3")||sub2.equals("4")) {
			memAge = (Integer.parseInt(formatedNow)-(2000+Integer.parseInt(sub1))+1);
		}
		log.info("memAge:"+memAge);
		//나이 저장
		member.setMemAge(memAge);
		
		String gender = "";
		if(sub2.equals("1")||sub2.equals("3")) {
			gender = "남자";
		}else if(sub2.equals("2")||sub2.equals("4")) {
			gender = "여자";
		}
		log.info("gender:"+gender);
		//성별 저장
		member.setMemGender(gender);
		log.info("memberVO:"+member);
		
	
		mainAdminMapper.enrollMember(member);
	}

	@Override
	public List<MemberVO> findReceiptDoctor() {
		List<MemberVO> doctorList = mainAdminMapper.findReceiptDoctor();
		
		return doctorList;
	}

	@Override
	public void enrollPatient(MemberVO member) {
		mainAdminMapper.enrollPatient(member);
	}

	@Override
	public void insertReceipt(ReceiptVO receiptVO) {
		mainAdminMapper.insertReceipt(receiptVO);
	}

	@Override
	public void insertPreDiagnosis(ReceiptVO receiptVO) {
		mainAdminMapper.insertPreDiagnosis(receiptVO);
		
	}

	@Override
	public void insertHistory(ReceiptVO receiptVO) {
		mainAdminMapper.insertHistory(receiptVO);
		
	}

	@Override
	public void insertEvaluation(ReceiptVO receiptVO) {
		mainAdminMapper.insertEvaluation(receiptVO);
		
	}
	@Override
	public List<MedicineRequestVO> getMedicineRequestList() {
		return mainAdminMapper.getMedicineRequestList();
	}

	@Override
	public List<MemberVO> getTodayDoctors() {
		
		return mainAdminMapper.getTodayDoctors();
	}

	@Override
	public List<ClinicReservationVO> getDoctorsReservList(ClinicReservationVO clVO) {
		return mainAdminMapper.getDoctorsReservList(clVO);
	}

	
	
	@Override
	public ServiceResult mediRequestAdmit(MedicineRequestResultVO medicineRequestVO) {
		ServiceResult result = null;
		int status =  mainAdminMapper.mediRequestAdmit(medicineRequestVO);
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult mediRequestRefuse(MedicineRequestResultVO mediRequestResultVO) {
		ServiceResult result = null;
		int status = mainAdminMapper.mediRequestRefuse(mediRequestResultVO);
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<RepairRequestVO> getEquipmentRequestList() {
		return mainAdminMapper.getEquipmentRequestList();
	}

	@Override
	public ServiceResult equipRepairAdmit(RepairResultVO repairResultVO) {
		ServiceResult result = null;
		int status = mainAdminMapper.equipRepairAdmit(repairResultVO);
		if(status>0) {
			int eqStatus = mainAdminMapper.changeEqStatus(repairResultVO); // 수리요청번호 보냄
			if(eqStatus>0) {
				result = ServiceResult.OK;
			}
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
		
	}

	@Override
	public ServiceResult equipRepairRefuse(RepairResultVO repairResultVO) {
		ServiceResult result = null;
		int status = mainAdminMapper.equipRepairRefuse(repairResultVO);
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<MemberVO> getReceiveList() {
		return mainAdminMapper.getReceiveList();
	}

	@Override
	public int getMulli(int receiptNo) {
		return mainAdminMapper.getMulli(receiptNo);
	}

	@Override
	public int getSurgery(int receiptNo) {
		return mainAdminMapper.getSurgery(receiptNo);
		
	}

	@Override
	public HospitalizationRecordVO getHospitalizationData(int receiptNo) {
		return mainAdminMapper.getHospitalizationData(receiptNo);
	}

	@Override
	public int getMRI(int rNo) {
		return mainAdminMapper.getMRI(rNo);
	}

	@Override
	public int getXRAY(int rNo) {
		return mainAdminMapper.getXRAY(rNo);
	}

	@Override
	public ServiceResult doPay(ReceiveVO receiveVO) {
		
		ServiceResult result = null;
		int status = mainAdminMapper.doPay(receiveVO);
		if(status>0) result = ServiceResult.OK;
		else if(status==0)result = ServiceResult.FAILED;
		return result;
		
	}

	@Override
	public ReceiveVO getPaid(ReceiveVO receiveVO) {
		return mainAdminMapper.getPaid(receiveVO);
	}

	@Override
	public void deleteHistory(ReceiveVO receiveVO) {
		mainAdminMapper.deleteHistory(receiveVO);
		
	}

	@Override
	public void insertReservStatus(ReceiptVO receiptVO) {
		mainAdminMapper.insertReservStatus(receiptVO);
		
	}

	@Override
	public List<MedicineVO> getMedicineList() {
		return mainAdminMapper.getMedicineList();
	}

	@Override
	public int getEmpNo(int memNo) {
		return mainAdminMapper.getEmpNo(memNo);
	}

	@Override
	public List<PrescriptionVO> getPreList(int rNo) {
		return mainAdminMapper.getPreList(rNo);
	}

	@Override
	public void updateReceiptStatus(ReceiveVO receiveVO) {
		mainAdminMapper.updateReceiptStatus(receiveVO);
	}

	


	

}
