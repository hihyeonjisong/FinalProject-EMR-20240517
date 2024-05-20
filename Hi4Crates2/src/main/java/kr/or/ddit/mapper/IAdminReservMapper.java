package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.VacationRequestVO;

public interface IAdminReservMapper {
	
	//캘린더로 띄워줄 예약정보를 가져오기
	public List<ClinicReservationVO> getData(int empNo);
	//캘린더로 띄워줄 연가 일정 가져오기
	public List<CalendarVO> getVacation(int empNo);
	
	public List<CalendarVO> test();
	public int insertEvent(ClinicReservationVO clinicReservationVO);
	public int updateEvent(CalendarVO calendar);
	public int deleteEvent(String id);
	//selectbox에  MT001(직원)이고 emp_job = '의사'인 사람 불러오기
	public List<MemberVO> showdoctorList();
	
	public List<ClinicReservationVO> showReserveList(ClinicReservationVO clinicReservationVO);
	
	//캘린더로 선택한 진료예약 수정/삭제하기
	public int updateClinicReservation(ClinicReservationVO clinicReservationVO);
	public int deleteClinicReservation(int target1Num);
	//공통캘린더에 insert/update/delete 하기
	public void insertCalendar(ClinicReservationVO clinicReservationVO);
	public void updateCalendar(ClinicReservationVO clinicReservationVO);
	public void deleteCalendar(int calendarKeyNum);
}
