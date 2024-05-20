package kr.or.ddit.vo;


import lombok.Data;

@Data
public class VacationRequestVO {
	private int vacationRequestNo; 
	private String vacationStartDate; 
	private String vacationEndDate; 
	private int vacationDate;
	private String vacationRequestDate; 
	private int empNo; // 신청자
	private String vacationReason;
	
	private String vacationRequestStatus;
	private String vacationResultDisagree;
	
	private int memNo; // 데이터 보내주기 위한 변수
	
	
    // 예약 확인하기용 
    private String memName;
    
    private String empJob;
    
    private int empVacation;
	

	
	
	
	
	
}
