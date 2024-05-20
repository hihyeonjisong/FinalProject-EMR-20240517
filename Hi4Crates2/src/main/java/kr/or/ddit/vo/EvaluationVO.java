package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EvaluationVO {

	private int evlNo;
	private String evlContent;
	private int evlScore;
	private String evlDate;
	private int receiptNoa;
	
	// 평점List
	private int receiptNo;
	private int patntNo;
	private String memName;
	private String receiptDate;
	
	private int memNo;
}
