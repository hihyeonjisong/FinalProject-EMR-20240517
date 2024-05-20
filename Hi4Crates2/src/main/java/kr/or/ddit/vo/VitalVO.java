package kr.or.ddit.vo;

import lombok.Data;

@Data
public class VitalVO {
	
	private int vitalNo;
	private int pressureMax;
	private int pressureMin;
	private int vitalPulse;
	private int respirationMin;
	private double vitalHeat;
	private String vitalDate;
}
