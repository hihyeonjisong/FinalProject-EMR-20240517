package kr.or.ddit.vo;

import lombok.Data;

@Data
public class HospitalizationRecordVO {
	
	private int hsptlzNo;
	private BedVO bedVO;
	private String hsptlzStartdate;
	private String hsptlzLeavedate;
	private String hsptlzLeavereason;
	
	private OrderVO orderVO;
	
	
	//수납계산 필요한 컬럼
	private int receiptNo;
	private int orderNo;
	private int wardNo;
	private int bedNo;
	private int wardPrice;
}
