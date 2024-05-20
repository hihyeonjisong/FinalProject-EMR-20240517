package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachmentGroupVO;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.DiagnosisPaperVO;
import kr.or.ddit.vo.DiagnosisVO;
import kr.or.ddit.vo.DiseaseVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RocRecordVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;

public interface IMainChartMapper {

	public List<MemberVO> getWatingList(int empNo);

	public List<ChartVO> getPatientChart(int memNo);

	public MemberVO patientPreview(MemberVO memberVO);

	public int orderRadiation(OrderVO orderVO);

	public int createChart(ChartVO chartVO);

	public List<MedicineVO> getMedicineList(int chartNo);

	public List<CommonCodeVO> getPtList(int chartNo);

	public List<DiseaseVO> searchDisease();

	public List<MedicineVO> searchMedicine();

	public int insertChart(ChartVO chartVO);

	public int insertDiagnosis(DiagnosisVO primaryDiagnosisVO);

	public int insertMedicineOrder(OrderVO orderMedicine);

	public int insertPrescription(PrescriptionVO prescriptionVO);

	public int insertPtOrder(OrderVO orderPt);

	public int createGroupOrder(GroupOrderVO groupOrderVO);

	public int insertGroupOrderDetail(GroupOrderDetailVO groupOrderDetail);

	public int insertSecondDiagnosis(DiagnosisVO secondaryDiagnosisVO);

	public List<DiagnosisVO> getDiseaseList(int chartNo);

	public void insertAttachmentGroupInsert(AttachmentGroupVO attachmentGroupVO);

	public void insertChartFile(AttachmentVO attachmentVO);

	public void updateChartImgNo(AttachmentVO attachmentVO);

	public MemberVO getPatientInfo(int receiptNo);

	public EmpVO getDoctorInfo(int receiptNo);

	public List<DiseaseVO> getDiagnosisInfo(int receiptNo);

	public int insertDiagnosisPaper(DiagnosisPaperVO diagnosisPaperVO);

	public int getEmpNo(int memNo);

	public List<CommonCodeVO> getBodyList(int chartNo);

	public String getClinicNo(int empNo);

	public List<SurgeryKindVO> searchSurgery();

	public int insertSurgeryOrder(OrderVO orderSurgery);

	public int insertSurgeryReservation(SurgeryReservationVO surgeryReservationVO);

	public int insertHospitalizationOrder(OrderVO orderHospitalizationVO);

	public PreDiagnosisVO getPreDiagnosis(int receiptNo);

	public int updateChart(ChartVO chartVO);

	public RocRecordVO getRadiationFile(int chartNo);

	public List<RocRecordVO> getRadiationRec(int chartNo);

	public DiagnosisPaperVO getDiagnosisPaper(int receiptNo);


}
