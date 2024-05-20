package kr.or.ddit.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.utils.UploadFileUtils;
import kr.or.ddit.mapper.IFileMapper;
import kr.or.ddit.mapper.IHistoryMapper;
import kr.or.ddit.mapper.IMainChartMapper;
import kr.or.ddit.service.IMainChartService;
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
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreDiagnosisVO;
import kr.or.ddit.vo.PrescriptionVO;
import kr.or.ddit.vo.RocRecordVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MainChartServiceImpl implements IMainChartService {
	
	@Inject
	private IMainChartMapper mapper;
	
	@Inject
	private IHistoryMapper historyMapper;
	
	@Inject
	private IFileMapper fileMapper;
	
	@Resource(name="uploadPath")
	private String resourcePath;
	
	@Override
	public List<MemberVO> getWatingList(int empNo) {
		
		return mapper.getWatingList(empNo);
	}
	
	//진료시작시 차트 가져오기
	@Override
	public List<ChartVO> getPatientChart(int memNo) {
		
		return mapper.getPatientChart(memNo);
	}
	
	@Override
	public List<DiagnosisVO> getDiseaseList(int chartNo) {
		return mapper.getDiseaseList(chartNo);
	}

	//환자미리보기
	@Override
	public MemberVO patientPreview(MemberVO memberVO) {
		
//		int memNo = memberVO.getMemNo();
		
		if(memberVO.getHistoryLoc() != null) {
			//history 진료중으로 업데이트
			historyMapper.updateMediCare(memberVO);
		}
		
		return mapper.patientPreview(memberVO);
	}

	//방사선검사요청
	@Override
	public ServiceResult orderRadiation(OrderVO orderVO) {
		
		ServiceResult result=null;
		
		int status = mapper.orderRadiation(orderVO);
		
		int receiptNo = orderVO.getReceiptNo();
		
		HistoryVO historyVO = new HistoryVO();
		
		historyVO.setReceiptNo(receiptNo);
		historyVO.setHistoryLoc("LOC014");
		historyVO.setHistoryStatus("HS001");
		
		//방사선 대기실 대기중으로 변경
		int status2 = historyMapper.updateHistory(historyVO);
		
		if(status>0 && status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
		
		
	}
	
	//방사선검사요청차트생성
	@Override
	public ServiceResult createChart(ChartVO chartVO) {
		
		ServiceResult result = null;
		
		int status = mapper.createChart(chartVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<MedicineVO> getMedicineList(int chartNo) {
		
		return mapper.getMedicineList(chartNo);
	}

	@Override
	public List<CommonCodeVO> getPtList(int chartNo) {
		return mapper.getPtList(chartNo);
	}
	
	@Override
	public List<CommonCodeVO> getBodyList(int chartNo) {
		return mapper.getBodyList(chartNo);
	}

	@Override
	public List<DiseaseVO> searchDisease() {
		return mapper.searchDisease();
	}
	
	@Override
	public List<SurgeryKindVO> searchSurgery() {
		return mapper.searchSurgery();
	}


	@Override
	public List<MedicineVO> searchMedicine() {
		return mapper.searchMedicine();
	}
	
	//진료완료 시 차트입력
	@Override
	public ServiceResult insertChart(HttpServletRequest req ,ChartVO chartVO) {
		
		ServiceResult result = null;
		
		int status = mapper.insertChart(chartVO);
		
		int receiptNo = chartVO.getReceiptNo();
		
		//수납실로보내기
		HistoryVO historyVO = new HistoryVO();
		historyVO.setReceiptNo(receiptNo);
		historyVO.setHistoryLoc("LOC012");
		historyVO.setHistoryStatus("HS001");
		historyMapper.updateHistory(historyVO);
		
		
		if(chartVO.getChartFile() != null && !chartVO.getChartFile().isEmpty()) {
			
			List<AttachmentVO> fileList = chartVO.getFileList();
			
			try {
				chartFileUpload(fileList, chartVO, req);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}
	
	//진단입력
	@Override
	public ServiceResult insertDiagnosis(DiagnosisVO primaryDiagnosisVO) {
		ServiceResult result = null;
		
		int status = mapper.insertDiagnosis(primaryDiagnosisVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}
	
	//약물처방입력
	@Override
	public ServiceResult insertMedicineOrder(OrderVO orderMedicine) {
		ServiceResult result = null;
		
		int status = mapper.insertMedicineOrder(orderMedicine);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}
	
	//수술처방
	@Override
	public ServiceResult insertSurgeryOrder(OrderVO orderSurgery) {
		
		ServiceResult result = null;
		
		int status = mapper.insertSurgeryOrder(orderSurgery);
		
		//입원실 거르기
		String historyLoc=orderSurgery.getHistoryLoc();
		
		if(!historyLoc.equals("LOC015")) {
			//수납실로 히스토리 변경
			HistoryVO historyVO = new HistoryVO();
			int receiptNo = orderSurgery.getReceiptNo();
			
			historyVO.setReceiptNo(receiptNo);
			historyVO.setHistoryLoc("LOC012");
			historyVO.setHistoryStatus("HS001");
			
			historyMapper.updateHistory(historyVO);
		}

		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}


	@Override
	public ServiceResult insertPrescription(PrescriptionVO prescriptionVO, int receiptNo) {
		ServiceResult result = null;
		int status = mapper.insertPrescription(prescriptionVO);
		
		//수납실로보내기
		HistoryVO historyVO = new HistoryVO();
		historyVO.setReceiptNo(receiptNo);
		historyVO.setHistoryLoc("LOC012");
		historyVO.setHistoryStatus("HS001");
		historyMapper.updateHistory(historyVO);
		
		
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult insertPtOrder(OrderVO orderPt) {
		ServiceResult result = null;
		int status = mapper.insertPtOrder(orderPt);
		
		int receiptNo = orderPt.getReceiptNo();
		
		//물리치료실로 히스토리 변경
		HistoryVO historyVO = new HistoryVO();
		
		historyVO.setReceiptNo(receiptNo);
		historyVO.setHistoryLoc("LOC009");
		historyVO.setHistoryStatus("HS001");
		
		historyMapper.updateHistory(historyVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult createGroupOrder(GroupOrderVO groupOrderVO) {
		ServiceResult result = null;
		int status = mapper.createGroupOrder(groupOrderVO);
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult insertGroupOrderDetail(GroupOrderDetailVO groupOrderDetail) {
		ServiceResult result = null;
		int status = mapper.insertGroupOrderDetail(groupOrderDetail);
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult insertSecondDiagnosis(DiagnosisVO secondaryDiagnosisVO) {
		ServiceResult result = null;
		int status = mapper.insertSecondDiagnosis(secondaryDiagnosisVO);
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}


	private void chartFileUpload(List<AttachmentVO> chartFileList,  ChartVO chartVO, HttpServletRequest req) throws Exception {
		
		if(chartFileList !=null) {	//넘겨받은 파일 데이터가 존재할 때
			if(chartFileList.size() >0) {
				AttachmentGroupVO attachmentGroupVO = new AttachmentGroupVO();
				mapper.insertAttachmentGroupInsert(attachmentGroupVO);	//공통첨부파일번호추가
				int attachmentGroupNo = attachmentGroupVO.getAttachmentGroupNo();
				for(AttachmentVO attachmentVO : chartFileList) {
					String saveName = UUID.randomUUID().toString(); //UUID의 파일명 생성
					//파일명을 설정할 때 원본 파일명과 UUID_와 합쳐서 파일명을 만든다.
					saveName += "_" + attachmentVO.getAttachName();
					
					String saveLocate =resourcePath + "/chartImg";
					
					//날짜 가져오기
					String attachPath = UploadFileUtils.calcPath(saveLocate);
					
					saveLocate += attachPath;
		
					
					File file = new File(saveLocate);
					if(!file.exists()) {	//업로드를 하기 위한 폴더 구조가 존재하지 않을 때
						file.mkdirs();	//폴더 생성
					}
							
					saveLocate +="/"+saveName;
					
					
					attachmentVO.setAttachName(saveName);
					attachmentVO.setChartNo(chartVO.getChartNo());						//게시글 번호 설정
					attachmentVO.setAttachPath(attachPath);		//파일 업로드 경로 설정
					attachmentVO.setAttachLoc("/chartImg");		
					attachmentVO.setAttachmentGroupNo(attachmentGroupNo);
					
					mapper.insertChartFile(attachmentVO);	//공통첨부파일 상세 추가
					mapper.updateChartImgNo(attachmentVO);	//해당차트에 공통첨부파일번호추가
					
					File saveFile = new File(saveLocate);
					attachmentVO.getItem().transferTo(saveFile);	//파일 복사
				}
			}
		}
	}

	@Override
	public MemberVO getPatientInfo(int receiptNo) {
		
		return mapper.getPatientInfo(receiptNo);

	}

	@Override
	public EmpVO getDoctorInfo(int receiptNo) {
		return mapper.getDoctorInfo(receiptNo);
	}

	@Override
	public List<DiseaseVO> getDiagnosisInfo(int receiptNo) {
		return mapper.getDiagnosisInfo(receiptNo);
	}

	@Override
	public ServiceResult insertDiagnosisPaper(DiagnosisPaperVO diagnosisPaperVO) {
		ServiceResult result = null;
		int status = mapper.insertDiagnosisPaper(diagnosisPaperVO);
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	

	}

	@Override
	public int getEmpNo(int memNo) {
		return mapper.getEmpNo(memNo);
	}

	@Override
	public String getClinicNo(int empNo) {
		return mapper.getClinicNo(empNo);
	}

	@Override
	public ServiceResult insertSurgeryReservation(SurgeryReservationVO surgeryReservationVO) {
		
		ServiceResult result = null;
		int status = mapper.insertSurgeryReservation(surgeryReservationVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	
	}

	//입원처리
	@Override
	public ServiceResult insertHospitalizationOrder(OrderVO orderHospitalizationVO) {
		ServiceResult result = null;
		int status = mapper.insertHospitalizationOrder(orderHospitalizationVO);
		
		//입원실 히스토리 변경
		HistoryVO historyVO = new HistoryVO();
		
		int receiptNo = orderHospitalizationVO.getReceiptNo();
				
		historyVO.setReceiptNo(receiptNo);
		historyVO.setHistoryLoc("LOC015");
		historyVO.setHistoryStatus("HS001");
		
		historyMapper.updateHistory(historyVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}
	
	//문진표가져오기
	@Override
	public PreDiagnosisVO getPreDiagnosis(int receiptNo) {
		return mapper.getPreDiagnosis(receiptNo);
	}
	
	//방사선 갔다온 사람 차트입력
	@Override
	public ServiceResult updateChart(HttpServletRequest req, ChartVO chartVO) {
		ServiceResult result = null;
		
		int status = mapper.updateChart(chartVO);
		
		if(chartVO.getChartFile() != null && !chartVO.getChartFile().isEmpty()) {
			
			List<AttachmentVO> fileList = chartVO.getFileList();
			
			try {
				chartFileUpload(fileList, chartVO, req);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public RocRecordVO getRadiationFile(int chartNo) {
		return mapper.getRadiationFile(chartNo);
	}

	@Override
	public List<RocRecordVO> getRadiationRec(int chartNo) {
		return mapper.getRadiationRec(chartNo);
	}

	@Override
	public DiagnosisPaperVO getDiagnosisPaper(int receiptNo) {
		return mapper.getDiagnosisPaper(receiptNo);
	}











}
