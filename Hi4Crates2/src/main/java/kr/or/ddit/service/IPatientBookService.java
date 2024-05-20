package kr.or.ddit.service;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;

public interface IPatientBookService {

	List<MemberVO> doctor(String date);
	List<ClinicReservationVO> time(ClinicReservationVO data);

	// 문자메시지
	String name(ClinicReservationVO clinicReservationVO);
	String phone(ClinicReservationVO clinicReservationVO);
	String doctorName(ClinicReservationVO clinicReservationVO);


}
