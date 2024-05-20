package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.PaginationVO;

public interface IEmpNoticeService {
	public ServiceResult postEmpNotice(HttpServletRequest req, EmpNoticeVO empNoticeVO);
	public int getEmpNoticeCount(PaginationVO<EmpNoticeVO> pagingVO);
	public List<EmpNoticeVO> getEmpNoticeList(PaginationVO<EmpNoticeVO> pagingVO);
	public EmpNoticeVO selectEmpNoticeDetail(int empNoticeNo);
	public ServiceResult updateNotice(HttpServletRequest req, EmpNoticeVO empNoticeVO);
	public ServiceResult updateNoticeModal(EmpNoticeVO empNoticeVO);
	public ServiceResult deleteNotice(int empNoticeNo, int attachmentGroupNo);

}
