package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.PatientNoticeVO;

public interface IPatientNoticeService {

	
	/**
	 * @param pagingVO
	 * @return 총 게시물 수
	 */
	public int getPatntNoticeCount(PaginationVO<PatientNoticeVO> pagingVO);
	
	/**
	 * @param pagingVO
	 * @return 게시판 글 목록
	 */
	public List<PatientNoticeVO> getPatntNoticeList(PaginationVO<PatientNoticeVO> pagingVO);
	
	/**
	 * @param patntNoticeVO
	 * @param req
	 * @return 새 글 등록 결과
	 */
	public ServiceResult postPatntNotice(PatientNoticeVO patntNoticeVO, HttpServletRequest req);
	
	/**
	 * @param patntNoticeNo
	 * @return 상세조회할 게시글 내용
	 */
	public PatientNoticeVO selectPatntNoticeDetail(int patntNoticeNo);
	
	/**
	 * @param req
	 * @param patntNoticeVO
	 * @return 글 수정 결과
	 */
	public ServiceResult modifyPatntNoticeDetail(HttpServletRequest req, PatientNoticeVO patntNoticeVO);
	
	/**
	 * @param patntNoticeNo
	 * @param attachmentGroupNo
	 * @return 글 삭제 결과
	 */
	public ServiceResult deletePatntNoticeDetail(int patntNoticeNo, int attachmentGroupNo);
	
}
