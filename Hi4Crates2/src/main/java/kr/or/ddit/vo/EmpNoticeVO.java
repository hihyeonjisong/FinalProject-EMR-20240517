package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.Data;

@Data
public class EmpNoticeVO {
	private int empNoticeNo;
	private String empNoticeTitle;
	private String empNoticeWriter;
	private String empNoticeDate;
	private String empNoticeContent;
	private int empNoticeHit;
	private String empNoticeFix = "N";
	private int attachmentGroupNo;
	
//	private Integer[] attachFileDel;	// (임시) 수정 화면에서 첨부파일에 X 누르는 순간 담을 곳
	private MultipartFile[] empNoticeFile;	// 새롭게 추가되는 파일
	private List<AttachmentVO> attachFileList;
	
	public void setEmpNoticeFile(MultipartFile[] empNoticeFile) {
		this.empNoticeFile = empNoticeFile;
		if(empNoticeFile != null) {
			List<AttachmentVO> attachFileList = new ArrayList<AttachmentVO>();
			for(MultipartFile item : empNoticeFile) {
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
