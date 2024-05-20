package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CollaborationReqVO {
	
	private int collaboReqNo;
	private String collaboReqDate;
	private String collaboReqContent;
	private String collaboReqAgree;
	private int empNo;
	private int collaboDr;
	private int patntNo;
	private int notificationNo;
	
	
	private int receiptNo;
}
