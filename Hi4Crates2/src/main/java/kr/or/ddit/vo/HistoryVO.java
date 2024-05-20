package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HistoryVO {
	
	private int historyNo;
	private Date historyDate;
	private String historyLoc;
	private String historyStatus;
	private int receiptNo;
	
	private RadiationRoomVO radiationRoomVO;
	
	// pl/sql 리턴받을 변수 선언
	private int result;
	
}
