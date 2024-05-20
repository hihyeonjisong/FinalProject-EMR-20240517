package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChartVO {
	
	private int chartNo;
	
	private String chartDate;
	private String chartRecord;
	private int receiptNo;
	private int patntNo;
	
	//상병가져오기 위한 컬럼추가
	private String disNo;
	private String disNameEn;
	private String disNameKr;
	private String disMain;
	
	// 의사이름 가져오기
	private String memName;	
	
	//차트등록과 오더 입력을 위한 컬럼추가
	private String primaryDiseaseNo;
	private List<String> secondaryDiseaseNoList;
	
	
	private String mdcinNo;
//	private List<String> medicineNoList;
	private String surgeryNo;
	private String hospitalizationOrder;
	
//	private List<PrescriptionVO> medicineListTest;	//처방약 담은 배열
	private List<PrescriptionVO> medicineListSend;	//처방약 담은 배열
	
	private List<String> selectPtList;
	private List<String> selectBodyList;
	private String selectBody;
	
	private String historyLoc; //입원실 거르기
	
	
	// 진료용 사진 첨부 파일
	// 첨부파일 그룹번호
	private int attachmentGroupNo;
	
	// 첨부파일 
	private List<AttachmentVO> fileList;
	private List<MultipartFile> chartFile;
	private String imgData;
	
	private AttachmentVO fileVO;
	
	//chartFile의 setter 재정의 //서버에 도착하기 전에 vo에서 먼저 풀어주는 작업
	public void setChartFile(List<MultipartFile> chartFile) {
		//일단 들어온 파일들을 this.boFile에 담고
		
		this.chartFile = chartFile;
		if(chartFile != null) { //널이 아니면
			
			List<AttachmentVO> fileList = new ArrayList<AttachmentVO>();
			for(MultipartFile item : chartFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachmentVO attachmentVO = new AttachmentVO(item);
				fileList.add(attachmentVO);
			}
			this.fileList = fileList;
		}
	}
	
}

	
