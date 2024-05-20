package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ChatPersonVO {
	private int chatPersonNo;
	private int chatRoomNo;
	private int memNo;
	private String memName;
	private String chatPersonStatus;
	
	private String userOnlineStatus = "offline"; // 온라인 상태 보여주기 위함 default off
}
