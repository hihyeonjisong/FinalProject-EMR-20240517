package kr.or.ddit.mapper;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CollaborationReqVO;

public interface ICollaborationMapper {

	public int reqcollaboration(CollaborationReqVO collaboVO);

	public void updateHistory(CollaborationReqVO collaboVO);

	public void updateReceipt(CollaborationReqVO collaboVO);

}
