package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RoundRecordVO {
	private int roundNo;
	private String roundDate;
	private int hsptlzNo;
	private String empName;
	
	private int roundPreNo;
	private String roundPreDate;
	private int mdcinNo;
	
	private int medicationNo;
	private String medicationDescription;
	private String medicationDate;
	
	private String memName;
	private String mdcinName;
	
	private int result;
}
