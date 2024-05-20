package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CalendarVO;

public interface ICalendarService {

	public ServiceResult insertEvent(CalendarVO calendarVO);

	public List<CalendarVO> getCalendar(int empNo);

	public ServiceResult deleteEvent(int calendarKey);

	public ServiceResult updateEvent(CalendarVO calendarVO);

	public List<CalendarVO> getCalendarOffice(int empNo);

	public List<CalendarVO> getCalendarAll(int empNo);

	public List<CalendarVO> getEmpVacationList(int empNo);

}
