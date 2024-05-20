package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.SurgeryReservationVO;
import kr.or.ddit.vo.SurgeryVO;

public interface ISurgeryRecordMapper {
	
	//수술 목록 보여줌
	public List<SurgeryReservationVO> getSurgeryList();

	public int insertSurgery(SurgeryVO surgery);

	public SurgeryReservationVO detailSurgery(int surgeryNo);
	
	

}
