package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.SurgeryReservationVO;
import kr.or.ddit.vo.SurgeryVO;

public interface ISurgeryRecordService {

	public List<SurgeryReservationVO> getSurgeryList();

	public ServiceResult insertSurgery(SurgeryVO surgery);

	public SurgeryReservationVO detailSurgery(int surgeryNo);

}
