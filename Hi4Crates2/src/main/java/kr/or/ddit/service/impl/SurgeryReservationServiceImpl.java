package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ISurgeryReservationMapper;
import kr.or.ddit.service.ISugeryReservationService;
import kr.or.ddit.vo.SurgeryReservationVO;

@Service
public class SurgeryReservationServiceImpl implements ISugeryReservationService {
	
	@Inject
	private ISurgeryReservationMapper surgeryMapper;
	

	@Override
	public List<SurgeryReservationVO> getSurgeryReservWaitingList() {
		return surgeryMapper.getSurgeryReservWaitingList();
	}
	
	@Override
	public List<SurgeryReservationVO> getSurgeryCal() {
		 List<SurgeryReservationVO> list = surgeryMapper.getSurgeryCal();
		 for (SurgeryReservationVO s : list) {
			if(s.getSurgeryRoomNo().equals("1")) {
				s.setBackgroundColor("red");
			}
			if(s.getSurgeryRoomNo().equals("2")) {
				s.setBackgroundColor("orange");
			}
		}
		 //
		return list;
	}
	
	@Override
	public List<SurgeryReservationVO> surgeryDateCheck(String startStr) {
		return surgeryMapper.surgeryDateCheck(startStr);
	}

	@Override
	public ServiceResult surgeryReservation(SurgeryReservationVO surgeryReservationVO) {
		int res = surgeryMapper.surgeryReservation(surgeryReservationVO);
		if(res > 0) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult surgeryModify(SurgeryReservationVO surgeryReservationVO) {
		int res = surgeryMapper.surgeryModify(surgeryReservationVO);
		if(res > 0) return ServiceResult.OK;
		
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult surgeryDelete(int surgeryReservationNo) {
		int res = surgeryMapper.surgeryDelete(surgeryReservationNo);
		if(res > 0) return ServiceResult.OK;
		
		return ServiceResult.FAILED;
	}
	

}
