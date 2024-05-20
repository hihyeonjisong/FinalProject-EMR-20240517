package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.SurgeryReservationVO;

public interface ISugeryReservationService {

	public List<SurgeryReservationVO> getSurgeryReservWaitingList();

	public List<SurgeryReservationVO> getSurgeryCal();

	public List<SurgeryReservationVO> surgeryDateCheck(String string);

	public ServiceResult surgeryReservation(SurgeryReservationVO surgeryReservationVO);

	public ServiceResult surgeryModify(SurgeryReservationVO surgeryReservationVO);

	public ServiceResult surgeryDelete(int surgeryReservationNo);

}
