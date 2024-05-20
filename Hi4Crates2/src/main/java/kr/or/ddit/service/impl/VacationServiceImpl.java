package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ICalendarMapper;
import kr.or.ddit.mapper.IVacationMapper;
import kr.or.ddit.service.IVacationService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.VacationRequestVO;
import kr.or.ddit.vo.VacationResultVO;

@Service
public class VacationServiceImpl implements IVacationService {
	
	@Inject
	private IVacationMapper vacationMapper;
	
	@Inject
	private ICalendarMapper calendarMapper;
	
	@Override
	public List<VacationRequestVO> getVacationRequestMine(int memNo) {
		List<VacationRequestVO> vrv = vacationMapper.getVacationRequestMine(memNo);
		for (VacationRequestVO v : vrv) {
			String[] target = v.getVacationStartDate().substring(0,v.getVacationStartDate().indexOf(" ")).split("-");
			v.setVacationStartDate(String.format("%s년 %s월 %s일", target[0], target[1], target[2]));
			target = v.getVacationEndDate().substring(0,v.getVacationEndDate().indexOf(" ")).split("-");
			v.setVacationEndDate(String.format("%s년 %s월 %s일", target[0], target[1], target[2]));
			target = v.getVacationRequestDate().substring(0,v.getVacationRequestDate().indexOf(" ")).split("-");
			v.setVacationRequestDate(String.format("%s년 %s월 %s일", target[0], target[1], target[2]));
		}
		return vrv;
		
	}

	@Override
	public ServiceResult vacationRequest(VacationRequestVO vacationVO) {
		int res = vacationMapper.vacationRequest(vacationVO);
		if(res > 0) return ServiceResult.OK;
		if(res == 0) return ServiceResult.FAILED;
		return null;
	}

	@Override
	public List<VacationRequestVO> getVacationReqList() {
		return vacationMapper.getVacationReqList();
	}


	@Override
	public ServiceResult agreeRequest(VacationRequestVO reqVO) {
		int reqNo = reqVO.getVacationRequestNo();
		reqVO.setVacationRequestStatus("Y");
		int empNo = reqVO.getEmpNo();
		// 요청 테이블 null -> Y 로 변경해주기
		int req1 = vacationMapper.updateRequest(reqVO);
		// 결과 테이블 남기기 ->
		int req2 = vacationMapper.insertAgreeResult(reqNo);
		// 캘린더에 연가일정 추가하기
		VacationRequestVO goCal = vacationMapper.getVacation(reqNo);
		
		CalendarVO calVO = new CalendarVO();
		calVO.setCalendarTitle("연가");
		calVO.setCalendarContent(goCal.getVacationReason());
		calVO.setCalendarStartDate(goCal.getVacationStartDate().substring(0,10));
		calVO.setCalendarEndDate(goCal.getVacationEndDate().substring(0,10));
		calVO.setCalendarAllDay(true);
		calVO.setCalendarColor("yellow");
		calVO.setCalendarCate("CD005");
		calVO.setEmpNo(empNo);
		
		calendarMapper.insertEvent(calVO);
		
		// 잔여 일수 - 해주기
		// 해당 요청으로 vacation 요청 정보 가져오기
		VacationRequestVO vacationVO = vacationMapper.getVacation(reqNo);
		
		vacationMapper.updateEmpVacation(vacationVO);
		
		
		if(req1 > 0 && req2 > 0 )return ServiceResult.OK;
		else return ServiceResult.FAILED;
	}

	@Override
	public void disagreeRequest(Map<String, Object> map) {
		// 요청 테이블 null -> N으로 변경
		
		VacationRequestVO reqVO = new VacationRequestVO();
		reqVO.setVacationRequestNo(Integer.parseInt((String)map.get("reqNo")));
		reqVO.setVacationRequestStatus("N");
		vacationMapper.updateRequest(reqVO);
		
		VacationResultVO resultVO = new VacationResultVO();
		resultVO.setVacationRequestNo(Integer.parseInt((String)map.get("reqNo")));
		resultVO.setVacationResultDisagree((String)map.get("reason"));
		// 결과 테이블 남기기 
		vacationMapper.insertDisagreeResult(resultVO);
		
	}

}
