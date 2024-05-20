package kr.or.ddit.vo;

import lombok.Data;

@Data
public class DocumentStorageVO {

	private int attachNo;			// 파일 번호 (PK;seq)
	private String attachType;		// 파일 타입
	private String attachName;		// 파일명
	private Long attachSize;		// 파일크기
	private String attachDate;		// 업로드날a짜 (sysdate)
	private String attachPath;		// 파일저장경로
	private String attachLoc;		// 사용처 (공지사항 등)
	private int attachmentGroupNo;	// 공통첨부파일번호
	
	private int patntNo;
	private String memName;
	private String memRegno1;
	
	private int chartNo;
	
	
	
}
