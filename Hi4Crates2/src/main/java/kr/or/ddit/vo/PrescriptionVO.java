package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PrescriptionVO {
	
	private int prescriptionNo;
	private int orderNo;
	private String mdcinNo;
	private int prescriptionDay;
	private int prescriptionTotal;
	private int prescriptionFrequency;
	
	//오더입력할때 mdcin으로 변환하기 위한 컬럼
	private String mdcinName;
	
	private int mdcinPrice; //  약품가격
	private int receiptNo;


}
