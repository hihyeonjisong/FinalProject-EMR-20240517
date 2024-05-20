package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.PatientNoticeVO;

public interface IPatientNoticeMapper {

	public List<PatientNoticeVO> selectPatntNoticeList(PaginationVO<PatientNoticeVO> pagingVO);
	public int selectPatntNoticeCount(PaginationVO<PatientNoticeVO> pagingVO);
	public void insertPatntAttachGroupNo(PatientNoticeVO patntNoticeVO);
	public void insertPatntNoticeAttachment(AttachmentVO attachmentVO);
	public int insertPatntNotice(PatientNoticeVO patntNoticeVO);
	public void incrementViewCount(int patntNoticeNo);
	public PatientNoticeVO selectPatntNoticeDetail(int patntNoticeNo);
	public List<AttachmentVO> selectPatntNoticeDetailFile(int attachmentGroupNo);
	public void deleteOldAttachment(int attachmentGroupNoOld);
	public void deleteOldAttachGroupNo(int attachmentGroupNo);
	public int updatePatntNotice(PatientNoticeVO patntNoticeVO);
	public int deletePatntNotice(int patntNoticeNo);

}
