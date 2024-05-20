package kr.or.ddit.vo;

import lombok.Data;

@Data
public class WorkHistoryVO {
	private int workHistoryNo;
	private String workStartTime;
	private String workEndTime;
	private String workHistoryDate;
	private int empNo;
	
	// 조인 쿼리 만들기 위한 회원 번호
	private int memNo;
}
