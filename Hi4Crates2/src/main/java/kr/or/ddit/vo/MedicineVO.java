package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MedicineVO {
	
	private String mdcinNo;
	private String mdcinName;
	private int mdcinQuantity;
	private String mdcinUnit;
	private String mdcinCompany;
	private String mdcinCourse;
	private int mdcinPrice;
	
	// 의약품 요청자
	private int medicineRequestperson;
	
}
