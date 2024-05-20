package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.WorkHistoryVO;

public interface IWorkHistoryService {

	public ServiceResult startWork(WorkHistoryVO workVO);

	public ServiceResult endWork(WorkHistoryVO workVO);

}
