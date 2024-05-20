package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PreDiagnosisVO {
	private int preDiagnosisNo;
	private String preDiagnosisExp;
	private String preDiagnosisDisease;
	private String preDiagnosisAllergy;
	private String preDiagnosisPregnancy;
	private String preDiagnosisChoice;
	private String preDiagnosisDate;
	
	//fk
	private int patntNo;
	
}
