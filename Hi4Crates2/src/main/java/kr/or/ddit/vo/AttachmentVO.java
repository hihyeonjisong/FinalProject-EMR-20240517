package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AttachmentVO {
	
	private int attachNo;			// 파일 번호 (PK;seq)
	private String attachType;		// 파일 타입
	private String attachName;		// 파일명
	private Long attachSize;		// 파일크기
	private String attachDate;		// 업로드날짜 (sysdate)
	private String attachPath;		// 파일저장경로
	private String attachLoc;		// 사용처 (공지사항 등)
	private int attachmentGroupNo;	// 공통첨부파일번호
	
	private MultipartFile item;
	
	private int chartNo;
	private int empNoticeNo;
	
	public AttachmentVO() {}
	 
	public AttachmentVO(MultipartFile item) {
		this.item = item;
		this.attachType = item.getContentType();
		this.attachSize = item.getSize();
		this.attachName = item.getOriginalFilename();
	 }
}
