package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SurgeryKindVO {

	private String surgeryKindCode;		// 수술 코드
	private String surgeryKindName;		// 수술명
	private int surgeryKindPrice;		// 수술비용
	private int surgeryHospitalize;		// 입원기간
	
	private String surgerySearchWord;	// 수술검색어
}
