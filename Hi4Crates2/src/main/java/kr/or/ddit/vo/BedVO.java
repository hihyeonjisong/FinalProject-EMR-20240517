package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BedVO {
	private int bedNo;
	private String bedStatus;
	private String bedStatusname;
	private WardVO wardVO;
	
	// 전체 침대 갯수
	private int totalCount;
	// 사용가능/ 불가능한 침대 갯수
	private int statusCount;
}
