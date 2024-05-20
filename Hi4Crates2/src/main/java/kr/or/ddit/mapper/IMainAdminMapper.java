package kr.or.ddit.mapper;

import java.util.List;

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

public interface IMainAdminMapper {

	//원무과 회원 등록
	public void enrollMember(MemberVO member);
	
	//환자 등록
	public void enrollPatient(MemberVO member);
	
	//접수시 진료가능한 의사 조회
	public List<MemberVO> findReceiptDoctor();
	
	//접수시 접수 테이블에 인서트
	public void insertReceipt(ReceiptVO receiptVO);
	
	//접수시 예진표 테이블에 인서트
	public void insertPreDiagnosis(ReceiptVO receiptVO);
	
	//접수시 환자상태 히스토리테이블에 인서트
	public void insertHistory(ReceiptVO receiptVO);
	
	//접수시 평가테이블에 인서트
	public void insertEvaluation(ReceiptVO receiptVO);
	
	//의약품 신청리스트 
	public List<MedicineRequestVO> getMedicineRequestList();
	
	//접수페이지 속 오늘 예약리스트> 근무중인 의사리스트
	public List<MemberVO> getTodayDoctors();
	
	//접수페이지 속 오늘예약리스트> 의사선택하면 나올 예약리스트
	public List<ClinicReservationVO> getDoctorsReservList(ClinicReservationVO clVO);
	
	
	//의약품 신청 시 결과 테이블은 생성된다
	//의약품 신청 수락 업데이트(결과컬럼등을 업데이트하기)
	public int mediRequestAdmit(MedicineRequestResultVO medicineRequestVO);
	
	//의약품 신청 거절 업데이트
	public int mediRequestRefuse(MedicineRequestResultVO mediRequestResultVO);
	
	//장비수리요청 리스트
	public List<RepairRequestVO> getEquipmentRequestList();
	
	//장비수리요청 수락 업데이트
	public int equipRepairAdmit(RepairResultVO repairResultVO);
	//장비수리요청 수락 업데이트 후 장비상태-수리중으로 업데이트
	public int changeEqStatus(RepairResultVO repairResultVO);
	
	//장비수리요청 거절 업데이트
	public int equipRepairRefuse(RepairResultVO repairResultVO);
	
	
	/*수납*/ 
	
	//수납대기중인 환자 목록
	public List<MemberVO> getReceiveList();
	
	//접수번호의 물리치료오더 갯수 
	public int getMulli(int receiptNo);
	//접수번호의 수술가격
	public int getSurgery(int receiptNo);
	//접수번호의 입퇴원데이터
	public HospitalizationRecordVO getHospitalizationData(int receiptNo);
	//접수번호의 MRI갯수
	public int getMRI(int rNo);
	//접수번호의 xRAY갯수
	public int getXRAY(int rNo);
	
	//수납 인서트
	public int doPay(ReceiveVO receiveVO);
	
	//수납인서트 결과
	public ReceiveVO getPaid(ReceiveVO receiveVO);
	//수납 성공시 히스토리 삭제
	public void deleteHistory(ReceiveVO receiveVO);
	
	
	//선택한 예약번호의 상태를 Y로 update
	public void insertReservStatus(ReceiptVO receiptVO);
	
	//의약품 전체목록 
	public List<MedicineVO> getMedicineList();
	//empNo
	public int getEmpNo(int memNo);
	
	//약품처방 리스트 
	public List<PrescriptionVO> getPreList(int rNo);
	
	//접수 상태 완료로 update
	public void updateReceiptStatus(ReceiveVO receiveVO);
	

	

}
