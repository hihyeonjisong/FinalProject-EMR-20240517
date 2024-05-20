package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AttachmentGroupVO {

	private int attachmentGroupNo;		// 공통첨부파일번호 (sequence)
	private String attachmentGroupDel;	// 삭제여부 (null가능)
}
