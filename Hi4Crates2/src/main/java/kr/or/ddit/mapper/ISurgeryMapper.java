package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;

public interface ISurgeryMapper {
	public int selectSurgeryReservCount(PaginationVO<SurgeryReservationVO> pagingVO);
	public List<SurgeryReservationVO> selectSurgeryReservList(PaginationVO<SurgeryReservationVO> pagingVO);
	public int insertSurgeryReserv(SurgeryReservationVO surgeryReservVO);
	public SurgeryKindVO getSurgeryKind(String surgerySearchWord);
//	public List<SurgeryKindVO> getSurgeryKindList();
	public List<SurgeryKindVO> getSurgeryKindList(String surgerySearchWord);
	
	
//------------------------------------------------------------
	
}
