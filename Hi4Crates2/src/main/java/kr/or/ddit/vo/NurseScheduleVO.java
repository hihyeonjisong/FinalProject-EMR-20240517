package kr.or.ddit.vo;

import java.util.Map;

import lombok.Data;

@Data
public class NurseScheduleVO {

	private int empNo;
	private String memName;
	private String empJob;
	private Map<Integer, String> scheduleList;
	
	private int month;
	private int dayCount;
	private int eveningCount;
	private int nightCount;
	private int offCount;
}
