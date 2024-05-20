package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.VacationRequestVO;

public interface IVacationService {

	public List<VacationRequestVO> getVacationRequestMine(int memNo);

	public ServiceResult vacationRequest(VacationRequestVO vacationVO);

	public List<VacationRequestVO> getVacationReqList();

	public ServiceResult agreeRequest(VacationRequestVO reqVO);

	public void disagreeRequest(Map<String, Object> map);

}
