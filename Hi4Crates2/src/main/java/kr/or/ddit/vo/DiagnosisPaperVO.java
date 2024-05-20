package kr.or.ddit.vo;

import lombok.Data;

@Data
public class DiagnosisPaperVO {
	
	private int diagnosisPaperNo;
	private String diagnosisPaperIssueDate;
	private String diagnosisPaperDiagDate;
	private String diagnosisPaperOnsetDate;
	private String diagnosisPaperContent;
	private String diagnosisPaperPurpose;
	private String diagnosisPaperType;
	private String diagnosisPaperRemark;
	private String diagnosisType;
	
	private int receiptNo;
	private String memName;
	private String memRegno1;
	

}
