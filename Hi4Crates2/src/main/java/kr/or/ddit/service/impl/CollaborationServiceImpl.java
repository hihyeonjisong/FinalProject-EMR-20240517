package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ICollaborationMapper;
import kr.or.ddit.service.ICollaborationService;
import kr.or.ddit.vo.CollaborationReqVO;
import kr.or.ddit.vo.NotificationVO;

@Service
public class CollaborationServiceImpl implements ICollaborationService {
	
	@Inject
	ICollaborationMapper mapper;
	
	@Override
	public ServiceResult reqcollaboration(CollaborationReqVO collaboVO) {
		ServiceResult result = null;
		int status = mapper.reqcollaboration(collaboVO);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public void updateHistory(CollaborationReqVO collaboVO) {
		mapper.updateHistory(collaboVO);
		mapper.updateReceipt(collaboVO);
	}

	

}
