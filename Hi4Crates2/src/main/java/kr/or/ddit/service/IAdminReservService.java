package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.VacationRequestVO;

public interface IAdminReservService {
	public List<ClinicReservationVO> getData(int empNo);
	public List<CalendarVO> test();
	public int insertEvent(ClinicReservationVO clinicReservationVO);
	public int updateEvent(CalendarVO calendar);
	public int deleteEvent(String id);
	public List<MemberVO> showdoctorList();
	public List<ClinicReservationVO> showReserveList(ClinicReservationVO clinicReservationVO);
	public ServiceResult updateClinicReservation(ClinicReservationVO clinicReservationVO);
	public ServiceResult deleteClinicReservation(int target1Num);
	public void insertCalendar(ClinicReservationVO clinicReservationVO);
	public void updateCalendar(ClinicReservationVO clinicReservationVO);
	public void deleteCalendar(int calendarKeyNum);
	public List<CalendarVO> getVacation(int empNo);
}
