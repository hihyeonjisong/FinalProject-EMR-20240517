package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CollaborationReqVO;
import kr.or.ddit.vo.NotificationVO;

public interface ICollaborationService {

	public ServiceResult reqcollaboration(CollaborationReqVO collaboVO);

	public void updateHistory(CollaborationReqVO collaboVO);

	
}
