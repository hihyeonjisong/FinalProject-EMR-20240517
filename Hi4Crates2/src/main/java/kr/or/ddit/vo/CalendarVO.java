package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CalendarVO {

	private int calendarKey;
	private String calendarTitle;
	private String calendarContent;
	private String calendarStartDate;
	private String calendarEndDate;
	private boolean calendarAllDay;
	private String calendarColor;
	private String calendarCate;
	private int empNo;
	private int patntNo;
	
	private String memName;	//환자이름

	
	
	
	
	
	private int id;
	private String title;
	private String start;
	private String end;
	private boolean allDay;
	private String backgroundColor;
}
