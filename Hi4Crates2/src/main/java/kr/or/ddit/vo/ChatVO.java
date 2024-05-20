package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ChatVO {
	private int chatNo;
	private int chatRoomNo;
	private String chatLog;
	private String chatDate;
	private int chatSender;
	private int chatUnreadCount;
	
	private String memName; // 채팅 전송자 이름 출력용
	private int myInfoNo; // 내 로그인 정보 담기 위함
	
	private String userOnlineStatus = "offline";
	
	private String disName; // 상병한글명(최근 기록에 보여줄내용 )
	
	
}
