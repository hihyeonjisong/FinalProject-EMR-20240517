package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RepairResultVO {
	private int repairResultno;
	private String repairResultagree;
	private String repairResultdisagree;
	private String repairResultdate;
	private int empNo;
	private int repairNo;
}
