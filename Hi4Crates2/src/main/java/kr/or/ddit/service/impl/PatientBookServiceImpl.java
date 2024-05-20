package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IPatientBookMapper;
import kr.or.ddit.service.IPatientBookService;
import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class PatientBookServiceImpl implements IPatientBookService {

	@Inject
	private IPatientBookMapper mapper;
	
	@Override
	public List<MemberVO> doctor(String date) {

		return mapper.doctor(date);
	}

	@Override
	public List<ClinicReservationVO> time(ClinicReservationVO data) {

		return mapper.time(data);
	}

	@Override
	public String name(ClinicReservationVO clinicReservationVO) {
		return mapper.name(clinicReservationVO);
	}

	@Override
	public String phone(ClinicReservationVO clinicReservationVO) {
		return mapper.phone(clinicReservationVO);
	}

	@Override
	public String doctorName(ClinicReservationVO clinicReservationVO) {
		return mapper.doctorName(clinicReservationVO);
	}


}
