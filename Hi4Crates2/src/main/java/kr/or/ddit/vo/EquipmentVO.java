package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EquipmentVO {

	private int eqNo;
	private String eqName;
	private String eqCompany;
	private String eqLoc;
	private String eqLocname;
	private String eqModel;
	private String eqStatus;
	private String eqStatusname;
	private String eqDescriptioncontent;
	
	private int result;
}
