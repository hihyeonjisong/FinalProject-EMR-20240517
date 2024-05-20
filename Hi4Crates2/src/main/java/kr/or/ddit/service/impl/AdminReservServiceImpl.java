package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IAdminReservMapper;
import kr.or.ddit.service.IAdminReservService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.VacationRequestVO;

@Service
public class AdminReservServiceImpl implements IAdminReservService {
	
	@Inject
	private IAdminReservMapper mapper;
	
	@Override
	public List<ClinicReservationVO> getData(int empNo) {
		return mapper.getData(empNo);
	}

	@Override
	public List<CalendarVO> test() {
		return mapper.test();
	}

	@Override
	public int insertEvent(ClinicReservationVO clinicReservationVO) {
		return mapper.insertEvent(clinicReservationVO);
	}

	@Override
	public int updateEvent(CalendarVO calendar) {
		return mapper.updateEvent(calendar);
	}

	@Override
	public int deleteEvent(String id) {
		return mapper.deleteEvent(id);
	}

	@Override
	public List<MemberVO> showdoctorList() {
		return mapper.showdoctorList();
	}

	@Override
	public List<ClinicReservationVO> showReserveList(ClinicReservationVO clinicReservationVO) {
		return mapper.showReserveList(clinicReservationVO);
	}

	@Override
	public ServiceResult updateClinicReservation(ClinicReservationVO clinicReservationVO) {
		ServiceResult result = null;
		int status =  mapper.updateClinicReservation(clinicReservationVO);
		if(status>0) result = ServiceResult.OK;
		else if(status ==0) result = ServiceResult.FAILED;
		
		return result;
	}

	@Override
	public ServiceResult deleteClinicReservation(int target1Num) {
		ServiceResult result = null;
		int status = mapper.deleteClinicReservation(target1Num);
		if(status>0) result = ServiceResult.OK;
		else if(status==0)result = ServiceResult.FAILED;
		return result;
	}

	@Override
	public void insertCalendar(ClinicReservationVO clinicReservationVO) {
		mapper.insertCalendar(clinicReservationVO);
		
	}

	@Override
	public void updateCalendar(ClinicReservationVO clinicReservationVO) {
		mapper.updateCalendar(clinicReservationVO);
	}

	@Override
	public void deleteCalendar(int calendarKeyNum) {
		mapper.deleteCalendar(calendarKeyNum);
		
	}

	@Override
	public List<CalendarVO> getVacation(int empNo) {
		return mapper.getVacation(empNo);
	}
	

}
