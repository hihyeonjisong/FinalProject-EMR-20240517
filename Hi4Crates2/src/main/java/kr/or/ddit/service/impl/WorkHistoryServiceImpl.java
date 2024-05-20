package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IWorkHistoryMapper;
import kr.or.ddit.service.IWorkHistoryService;
import kr.or.ddit.vo.WorkHistoryVO;

@Service
public class WorkHistoryServiceImpl implements IWorkHistoryService {
	
	@Inject
	private IWorkHistoryMapper workHistoryMapper;
	
	@Override
	public ServiceResult startWork(WorkHistoryVO workVO) {
		
		int res = workHistoryMapper.startWork(workVO);
		workHistoryMapper.start(workVO);
		if(res > 0) return ServiceResult.OK;
		if(res == 0) return ServiceResult.FAILED;
		
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult endWork(WorkHistoryVO workVO) {
		int res = workHistoryMapper.endWork(workVO);
		workHistoryMapper.end(workVO);
		if(res > 0) return ServiceResult.OK;
		if(res == 0) return ServiceResult.FAILED;
		
		return ServiceResult.FAILED;
	}

}
