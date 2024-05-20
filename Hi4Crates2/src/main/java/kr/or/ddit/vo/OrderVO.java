package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class OrderVO {

	private int orderNo;
	private String orderCode;
	private String bodyCode;
	private String bodyCodeno;
	private int chartNo;
	private int empNo;
	
	//환자정보 담기 위한 컬럼 추가
	private String patntNo;
	private int receiptNo;
	
	//방사선요청을 위한 컬럼 추가
	private String checkTechnique;
	private List<String> bodyPartList;
	private String chartRecord;
	
	private String mdcinNames;
	
	private String historyLoc;

} 
