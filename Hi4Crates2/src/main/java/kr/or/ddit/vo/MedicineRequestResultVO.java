package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MedicineRequestResultVO {
	
	private int medicineResultno;
	private String medicineResultagree;
	private String medicineResultdisagree;
	private String medicineResultdate;

	private MedicineRequestVO medicineRequestVO;
	private MemberVO resultEmp;
	
	//로그인한 멤버번호 ? 직원번호? 어떤거 가져올지선택하기
	private int memNo;
	private int empNo;
	
	private int medicineRequestno;
	
	
}
