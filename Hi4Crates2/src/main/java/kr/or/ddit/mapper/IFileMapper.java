package kr.or.ddit.mapper;

import kr.or.ddit.vo.AttachmentVO;

public interface IFileMapper {

	public void uploadProfileImg(AttachmentVO fileVO);

	public int attachmentGroup(AttachmentVO fileVO);

	public AttachmentVO getFileDetail(int attachGroupNo);

	public void uploadChartImg(AttachmentVO fileVO);

	public void insertChartFile(AttachmentVO attachmentVO);
	
}
