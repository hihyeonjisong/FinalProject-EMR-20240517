package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RocRecordVO {

	private int rocRecordno;
	private int rocEqno;
	private String rocRecordcontent;
	private String rocRecorddate;
	private int rocNo;
	private int empNo;
	private int orderNo;
	private int attachmentGroupno;
	private int chartNo;
	
	//방사선파일 가져오기 위한 컬럼추가
	private String attachName;
	private String attachPath;
	private String attachNo;

}
