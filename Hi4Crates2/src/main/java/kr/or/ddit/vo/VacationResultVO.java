package kr.or.ddit.vo;

import lombok.Data;

@Data
public class VacationResultVO {
	
	private int vacationResultNo;
	private String vacationResultDate;
	private String vacationResultAgree;
	private String vacationResultDisagree;
	private int vacationRequestNo;
	private String empNo; // 승인자
	
	
}
