package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PatientNoticeVO {
	private int patntNoticeNo;
	private String patntNoticeTitle;
	private String patntNoticeWriter;
	private String patntNoticeDate;
	private String patntNoticeContent;
	private int patntNoticeHit;
	private String patntNoticeFix = "N";
	private int attachmentGroupNo;
	
	private MultipartFile[] patntNoticeFile;	// 새롭게 추가되는 파일
	private List<AttachmentVO> attachFileList;
	
	public void setEmpNoticeFile(MultipartFile[] patntNoticeFile) {
		this.patntNoticeFile = patntNoticeFile;
		if(patntNoticeFile != null) {
			List<AttachmentVO> attachFileList = new ArrayList<AttachmentVO>();
			for(MultipartFile item : patntNoticeFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;	// 첨부파일이 없을 경우
				}
				AttachmentVO attachmentVO = new AttachmentVO(item);
				attachFileList.add(attachmentVO);
			} // for 닫기
			this.attachFileList = attachFileList;
		} // if 닫기
	}
}
