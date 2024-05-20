package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MeetingVO {
	
	private int meetingNo;
	private String meetingDate;
	private String meetingStarttime;
	private String meetingEndtime;
	private String meetingStarter;
	
	private int meetingPersoncount;
}
