package kr.or.ddit.mapper;

import java.sql.Date;
import java.util.List;

import kr.or.ddit.vo.ClinicReservationVO;
import kr.or.ddit.vo.MemberVO;

public interface IPatientBookMapper {

	List<MemberVO> doctor(String date);
	List<ClinicReservationVO> time(ClinicReservationVO data);

	String name(ClinicReservationVO clinicReservationVO);
	String phone(ClinicReservationVO clinicReservationVO);
	String doctorName(ClinicReservationVO clinicReservationVO);


}
