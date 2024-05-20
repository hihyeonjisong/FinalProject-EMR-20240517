package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EmpVO {
	private int empNo; 
	private String empJob; 
	private String empHireDate; 
	private String empLeaveDate; 
	private String empLeave; 
	private String empLicence; 
	private int empVacation; 
	private int memNo; 
	private String memName;
	private String empStatus; 
	private int attachmentGroupNo;
	
	private String empDepartment;
	private int empSuperior;
	
	// 직원 통계수 구하는 vo추가
	private int doctor;
	private int nurse;
	private int radiology;
	private int physical;
	private int one;
	
}
