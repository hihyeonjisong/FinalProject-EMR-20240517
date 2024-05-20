package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
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

public interface IMainChartService {

	public List<MemberVO> getWatingList(int empNo);

	public List<ChartVO> getPatientChart(int memNo);

	public MemberVO patientPreview(MemberVO memberVO);

	public ServiceResult orderRadiation(OrderVO orderVO);

	public ServiceResult createChart(ChartVO chartVO);

	public List<DiagnosisVO> getDiseaseList(int chartNo);

	public List<MedicineVO> getMedicineList(int chartNo);

	public List<CommonCodeVO> getPtList(int chartNo);

	public List<DiseaseVO> searchDisease();

	public List<MedicineVO> searchMedicine();

	public ServiceResult insertDiagnosis(DiagnosisVO primaryDiagnosisVO);

	public ServiceResult insertMedicineOrder(OrderVO orderMedicine);

	public ServiceResult insertPrescription(PrescriptionVO prescriptionVO, int receiptNo);

	public ServiceResult insertPtOrder(OrderVO orderPt);

	public ServiceResult createGroupOrder(GroupOrderVO groupOrderVO);

	public ServiceResult insertGroupOrderDetail(GroupOrderDetailVO groupOrderDetail);

	public ServiceResult insertSecondDiagnosis(DiagnosisVO secondaryDiagnosisVO);

	public ServiceResult insertChart(HttpServletRequest req, ChartVO chartVO);

	public MemberVO getPatientInfo(int receiptNo);

	public EmpVO getDoctorInfo(int receiptNo);

	public List<DiseaseVO> getDiagnosisInfo(int receiptNo);

	public ServiceResult insertDiagnosisPaper(DiagnosisPaperVO diagnosisPaperVO);

	public int getEmpNo(int memNo);
	
	//진료이력에서 물리치료 처방 부위 가져오기
	public List<CommonCodeVO> getBodyList(int chartNo);

	public String getClinicNo(int empNo);

	//수술검색목록 가져오기(오토컴플릿)
	public List<SurgeryKindVO> searchSurgery();
	
	//수술 처방 
	public ServiceResult insertSurgeryOrder(OrderVO orderSurgery);

	public ServiceResult insertSurgeryReservation(SurgeryReservationVO surgeryReservationVO);
	//입원처방
	public ServiceResult insertHospitalizationOrder(OrderVO orderHospitalizationVO);
	
	//문진표가져오기
	public PreDiagnosisVO getPreDiagnosis(int receiptNo);
	
	//방사선 갔다 온 사람 차트 입력
	public ServiceResult updateChart(HttpServletRequest req, ChartVO chartVO);

	//방사선 이미지 가져오기
	public RocRecordVO getRadiationFile(int chartNo);

	public List<RocRecordVO> getRadiationRec(int chartNo);
	
	//진단서 정보 가져오기
	public DiagnosisPaperVO getDiagnosisPaper(int receiptNo);







}
