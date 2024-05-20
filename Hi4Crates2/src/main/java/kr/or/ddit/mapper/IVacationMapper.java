package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.VacationRequestVO;
import kr.or.ddit.vo.VacationResultVO;

public interface IVacationMapper {

	public List<VacationRequestVO> getVacationRequestMine(int memNo);

	public int vacationRequest(VacationRequestVO vacationVO);

	public List<VacationRequestVO> getVacationReqList();

	public int updateRequest(int reqNo);

	public int insertAgreeResult(int reqNo);

	public VacationRequestVO getVacation(int reqNo);

	public void updateEmpVacation(VacationRequestVO vacationVO);

	public int updateRequest(VacationRequestVO reqVO);

	public void insertDisagreeResult(VacationResultVO resultVO);



}
