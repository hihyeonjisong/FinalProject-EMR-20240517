package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ChatRoomVO {
	private int chatRoomNo;
	private String chatRoomDate;
	private String chatRoomName;
	private int memNo;
	private String chatRoomType;
	private int chatRoomNop;
	
	
	private String chatLog;
	private int opponentNo; // 상대방 번호
	private int unreadChatNo; // 안읽은 채팅 번호
	private String memName; // 상대방 이름
	
	private String onlineStatus; //상대방 온라인 상태
	private String chatDate; // 가장 최근 메세지 시간
}
