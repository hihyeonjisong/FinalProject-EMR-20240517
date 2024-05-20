package kr.or.ddit.mapper;

import kr.or.ddit.vo.WorkHistoryVO;

public interface IWorkHistoryMapper {

	public int startWork(WorkHistoryVO workVO);

	public int endWork(WorkHistoryVO workVO);

	public void start(WorkHistoryVO workVO);

	public void end(WorkHistoryVO workVO);

}
