package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RadiationRoomVO {

	private int rocNo;
	private String rocName;
	private String rocStatus;
	private String rocStatusname;
	
	private String memName;
	private String memGender;
	private String memAge;
}
