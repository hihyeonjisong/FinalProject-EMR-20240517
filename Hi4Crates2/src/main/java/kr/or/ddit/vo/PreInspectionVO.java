package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PreInspectionVO {
	
	private int patntNo;
	private String memName;
	
	private int inspctNo;
	private String inspctBlood;
	private String inspctElecgrm;
	private String inspctUrine;
	private String inspctDescription;
	private String inspctDate;
	
	private int hsptlzNo;
	private int empNo;
	
}
