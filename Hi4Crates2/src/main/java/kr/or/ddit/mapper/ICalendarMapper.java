package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CalendarVO;

public interface ICalendarMapper {

	public int insertEvent(CalendarVO calendarVO);

	public List<CalendarVO> getCalendar(int empNo);

	public int deleteEvent(int calendarKey);

	public int updateEvent(CalendarVO calendarVO);

	public List<CalendarVO> getCalendarOffice(int empNo);

	public List<CalendarVO> getCalendarVacation(int empNo);

	public List<CalendarVO> getCalendarReservation(int empNo);

	public List<CalendarVO> getEmpVacationList(int empNo);

	public List<CalendarVO> getCalendarSurgeryList(int empNo);

}
