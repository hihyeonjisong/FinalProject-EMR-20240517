package kr.or.ddit.vo;

import java.util.Date;
import java.util.Map;

import lombok.Data;

@Data
public class ReceiptVO {

	private int receiptNo;
	private String receiptDate;
	private String receiptReason;
	private String receiptStatus;
	private int patntNo;
	private String clinicNo;
	private int empNo;
	
	
	//예진표 VO추가 (같이 사용)
	private int preDiagnosisNo;
	private String preDiagnosisExp;
	private String preDiagnosisDisease;
	private String preDiagnosisAllergy;
	private String preDiagnosisPregnancy;
	private String preDiagnosisChoice;
	private String preDiagnosisDate;
	
	// 차트 날짜 다음날	
	private int receiptDate2;
	//접수시 선택한 예약번호 
	private int reservNo;
	//
}
