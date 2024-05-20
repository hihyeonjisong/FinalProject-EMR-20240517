package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.SurgeryReservationVO;

public interface ISurgeryReservationMapper {

	List<SurgeryReservationVO> getSurgeryReservWaitingList();

	List<SurgeryReservationVO> getSurgeryCal();

	List<SurgeryReservationVO> surgeryDateCheck(String startStr);

	int surgeryReservation(SurgeryReservationVO surgeryReservationVO);

	int surgeryModify(SurgeryReservationVO surgeryReservationVO);

	int surgeryDelete(int surgeryReservationNo);

}
