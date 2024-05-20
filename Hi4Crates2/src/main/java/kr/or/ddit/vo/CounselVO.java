package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CounselVO {
	private int counselNo;
	private int patntNo;
	private int empNo;
	private String counselTitle;
	private String counselQuestion;
	private String counselAnswer;
	private String counselDate;
	
	private String memName;
	private String empName;
	private String memEmail;
	private String careerName;
}
