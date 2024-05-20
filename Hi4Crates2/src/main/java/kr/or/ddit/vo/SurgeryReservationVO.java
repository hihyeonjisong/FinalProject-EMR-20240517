package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SurgeryReservationVO {
	private int surgeryReservationNo;
	private String surgeryReservationDate;
	private String surgeryReservationTime;
	private String surgeryRoomNo;
	private String surgeryRoomStatus;
	private int orderNo;
	private int patntNo;
	private int surgeryDoctor;
	private String surgeryKindCode;
	private String surgeryReservationStatus;
	private int maxSurgeryNo;
	
	
	private int empNo;
	private String empLicence;
	private String doctorName;
	private String patntName;
	private String clinicName;
	private String surgeryKindName;
	private String bodycodeName;
	private String historyName;
	private String memAge;
	private String memGender;
	private String memTel;
	
	private String surgeryComment;
	private String surgeryRecDate;
	private String surgeryDate;
	private String surgeryElapse;
	
	
	
	//예약목록 불러오기 위한 컬럼 추가
	private String empName; //집도의 이름
	private int surgeryNo;	//수술기록번호
	
	
	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private boolean allDay = true;
	
	private int protectorNo;
	private String protectorName;
	private String protectorTel;
	private String protectorRelate;
	
	private boolean flagDate;
}
