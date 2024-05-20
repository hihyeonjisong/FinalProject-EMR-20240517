package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.PaginationVO;

public interface IEmpNoticeMapper {
	public int insertEmpNotice(EmpNoticeVO empNoticeVO);
	public int selectEmpNoticeCount(PaginationVO<EmpNoticeVO> pagingVO);
	public List<EmpNoticeVO> selectEmpNoticeList(PaginationVO<EmpNoticeVO> pagingVO);
	public void incrementViewCount(int empNoticeNo);
	public EmpNoticeVO selectEmpNoticeDetail(int empNoticeNo);
	public int updateNotice(EmpNoticeVO empNoticeVO);
	public int deleteNotice(int empNoticeNo);
	public int insertEmpAttachGroupNo(EmpNoticeVO empNoticeVO);
	public void insertEmpNoticeAttachment(AttachmentVO attachmentVO);
	public List<AttachmentVO> selectEmpNoticeDetailFile(int attachmentGroupNo);
	public void deleteOldAttachment(int attachmentGroupNo);
	public void deleteOldAttachGroupNo(int attachmentGroupNo);

}
