package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MedicineRequestVO {
	private int medicineRequestno;
	private int medicineRequestperson;//발주 요청자
	private String medicineRequestdate;
	private int medicineRequestquantity;
	private String medicineRequestunit;
	
	// 의약품 정보
	private MedicineVO medicineVO;
	
	// 의약품 신청자 정보
	private String memName;
	
	//의약품 신청리스트에 필요한 컬럼
	private String mdcinNo;   // 의약품번호
	private String mdcinName; // 의약품명
	private String medicineResultagree; // 의약품 신청결과
	private String codeName;            // 의약품 신청결과 공통코드명
	
	
}
