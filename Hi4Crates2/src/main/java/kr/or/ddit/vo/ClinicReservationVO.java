package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ClinicReservationVO {
	private int reservNo;
	private String reservDate;
	private String reservTime;
	private String reservMemo;
	
	
	
	private int empNo;
	private int memNo;
	
	// 캘린더날짜선택 후 예약정보가져오기에 필요한 컬럼
	private String empName; // 의사 이름
	private String memName; // 환자 이름
	
	// 캘린더테이블에 추가할 컬럼 :2024-04-17 09:10
	private String calStartdate; 
	
	// 캘린더테이블의 fk
	private int calendarKey;
	
	//의사번호로 진료실 이름 불러오기 위한 컬럼 추가
	private String clinicNo;
	
	
	//접수예약리스트보여줄때필요한 컬럼
	private int memAge;
	private String memGender;
	private int patntNo;
}
