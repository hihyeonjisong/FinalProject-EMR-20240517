package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;

public interface IEmpSurgeryService {
	public int getSurgeryReservCount(PaginationVO<SurgeryReservationVO> pagingVO);
	public List<SurgeryReservationVO> getSurgeryReservList(PaginationVO<SurgeryReservationVO> pagingVO);
	public ServiceResult insertSurgeryReserv(SurgeryReservationVO surgeryReservVO);
	public SurgeryKindVO searchSurgeryKind(String surgerySearchWord);
	public List<SurgeryKindVO> getSurgeryKindList();

}
