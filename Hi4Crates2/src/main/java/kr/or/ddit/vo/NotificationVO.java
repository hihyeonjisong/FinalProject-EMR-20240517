package kr.or.ddit.vo;

import lombok.Data;

@Data
public class NotificationVO {
	
	private int notificationNo;
	private String notificationContent;
	private String notificationDate;
	private int empNo;
	private int notificationPerson;
	private String notificationCheck;
	private String notificationType;
}
