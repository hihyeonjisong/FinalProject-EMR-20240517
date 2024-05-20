package kr.or.ddit.vo;

import lombok.Data;

@Data
public class NursingRecordVO {
	
	private int nursingNo;
	private String nursingWriter;
	private String nursingDate;
	private String nursingContent;
	private int hsptlzNo;
	private int patntNo;
	private int receiptNo;
	private double ioIntake;
	private double ioEmissions;
	private String ioDate;
	private int pressureMax;
	private int pressureMin;
	private int vitalPulse;
	private int respirationMin;
	private double vitalHeat;
	
	private String memName;
	private String empName;
	
}
