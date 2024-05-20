package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ICalendarMapper;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements ICalendarService {

	@Inject
	ICalendarMapper mapper;
	
	@Override
	public ServiceResult insertEvent(CalendarVO calendarVO) {
		
		ServiceResult result = null;
		
		int status= mapper.insertEvent(calendarVO);
		
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<CalendarVO> getCalendar(int empNo) {
		return mapper.getCalendar(empNo);
	}

	@Override
	public ServiceResult deleteEvent(int calendarKey) {
		
		ServiceResult result = null;
		
		int status=  mapper.deleteEvent(calendarKey);
		
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
		
	}

	@Override
	public ServiceResult updateEvent(CalendarVO calendarVO) {
		ServiceResult result = null;
		
		int status=  mapper.updateEvent(calendarVO);
		
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<CalendarVO> getCalendarOffice(int empNo) {
		
		List<CalendarVO> resultList = new ArrayList<>();
		
		
		//연가리스트
		List<CalendarVO> vacationList = mapper.getCalendarVacation(empNo);
		
			for(CalendarVO calendarVO : vacationList) {
				resultList.add(calendarVO);
			}
		
		//진료예약리스트
		List<CalendarVO> reservationList = mapper.getCalendarReservation(empNo);
		
			for(CalendarVO calendarVO : reservationList) {
				resultList.add(calendarVO);
			}
			
		//수술예약리스트
		List<CalendarVO> surgeryList = mapper.getCalendarSurgeryList(empNo);
			for(CalendarVO calendarVO : surgeryList) {
				resultList.add(calendarVO);
			}
		
		return resultList;
	}

	@Override
	public List<CalendarVO> getCalendarAll(int empNo) {
		
		List<CalendarVO> resultList = new ArrayList<>();
		
		//개인일정
		List<CalendarVO> personalList = mapper.getCalendar(empNo);
		
			for(CalendarVO calendarVO : personalList) {
				resultList.add(calendarVO);
			}
		
		//연가리스트
		List<CalendarVO> vacationList = mapper.getCalendarVacation(empNo);
		
			for(CalendarVO calendarVO : vacationList) {
				resultList.add(calendarVO);
			}
		
		//진료예약리스트
		List<CalendarVO> reservationList = mapper.getCalendarReservation(empNo);
		
			for(CalendarVO calendarVO : reservationList) {
				resultList.add(calendarVO);
			}
			
			//수술예약리스트
			List<CalendarVO> surgeryList = mapper.getCalendarSurgeryList(empNo);
				for(CalendarVO calendarVO : surgeryList) {
					resultList.add(calendarVO);
				}
			
		
		return resultList;
	}

	@Override
	public List<CalendarVO> getEmpVacationList(int empNo) {
		return mapper.getEmpVacationList(empNo);
	}

}
