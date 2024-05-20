package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RepairRequestVO {

	private int repairNo;
	private int eqNo; // fk
	private int repairPerson;
	private String repairDate;
	private String repairReason;
	
	private String repairResultAgree; //수리요청결과- 승인여부
	private String resultName; // 요청결과명
	
	private int empNo;
	
	private String eqName;
	private String eqLoc;
	private String locName; // 장소명
	private String eqModel;
	private String eqStatus; 
	private String eqCompany;
	private String statusName; // 상태명
	private String repairPersonName;// 수리요청자이름
	
	private int result;
	
	
}
