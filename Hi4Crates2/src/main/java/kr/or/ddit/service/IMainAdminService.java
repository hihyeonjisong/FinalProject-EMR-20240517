package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
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

public interface IMainAdminService {

	public void enrollMember(MemberVO member);

	public List<MemberVO> findReceiptDoctor();

	public void enrollPatient(MemberVO member);

	public void insertReceipt(ReceiptVO receiptVO);

	public void insertPreDiagnosis(ReceiptVO receiptVO);

	public void insertHistory(ReceiptVO receiptVO);

	public List<MedicineRequestVO> getMedicineRequestList();

	public List<MemberVO> getTodayDoctors();

	public List<ClinicReservationVO> getDoctorsReservList(ClinicReservationVO clVO);

	public void insertEvaluation(ReceiptVO receiptVO);

	public ServiceResult mediRequestAdmit(MedicineRequestResultVO medicineRequestVO);

	public ServiceResult mediRequestRefuse(MedicineRequestResultVO mediRequestResultVO);

	public List<RepairRequestVO> getEquipmentRequestList();

	public ServiceResult equipRepairAdmit(RepairResultVO repairResultVO);

	public ServiceResult equipRepairRefuse(RepairResultVO repairResultVO);


	public int getMulli(int receiptNo);

	public int getSurgery(int receiptNo);

	public HospitalizationRecordVO getHospitalizationData(int receiptNo);

	public int getMRI(int rNo);

	public int getXRAY(int rNo);

	public ServiceResult doPay(ReceiveVO receiveVO);

	public ReceiveVO getPaid(ReceiveVO receiveVO);

	public void deleteHistory(ReceiveVO receiveVO);

	public void insertReservStatus(ReceiptVO receiptVO);

	public List<MemberVO> getReceiveList();

	public List<MedicineVO> getMedicineList();

	public int getEmpNo(int memNo);

	public List<PrescriptionVO> getPreList(int rNo);

	public void updateReceiptStatus(ReceiveVO receiveVO);




}
