package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.INurseMapper;
import kr.or.ddit.service.INurseService;
import kr.or.ddit.vo.BedVO;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreInspectionVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NurseServiceImpl implements INurseService {

	@Inject
	private INurseMapper nurseMapper;

	@Override
	public List<BedVO> getBedList() {
		return nurseMapper.getBedList();
	}

	@Override
	public List<MemberVO> getHospitalizeList() {
		return nurseMapper.getHospitalizeList();
	}

	@Override
	public MemberVO getPatntOrder(int patntNo) {
		return nurseMapper.getPatntOrder(patntNo);
	}

	@Override
	public MemberVO getHospitalizePatntInfo(int chartNo) {
		return nurseMapper.getHospitalizePatntInfo(chartNo);
	}

	@Override
	public List<MedicineVO> getMedicineList() {
		return nurseMapper.getMedicineList();
	}

	@Override
	public boolean requestMedicine(List<MedicineVO> mdcinList) {
		boolean flag = false;
		int status = nurseMapper.requestMedicine(mdcinList);
		
		log.info("status : " + status);
		if (status != 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public List<MedicineRequestResultVO> getRequestResultList() {
		return nurseMapper.getRequestResultList();
	}

	@Override
	public List<MemberVO> getWardInfo(int wardNo) {
		return nurseMapper.getWardInfo(wardNo);
	}

	@Override
	public List<MemberVO> getHospitalizeOrder() {
		return nurseMapper.getHospitalizeOrder();
	}

	@Override
	@Transactional
	public boolean insertHospitalize(List<MemberVO> patient) {
		
		boolean flag = false;
		
		MemberVO memberVO = patient.get(0);
		
		nurseMapper.insertHospitalize(patient);
		
		int updateStatus = nurseMapper.updateBedStatus(memberVO);
		
		if (updateStatus > 0) {
			flag = true;
		} else {
	        throw new RuntimeException("Insert or update failed");
	    }
		
		return flag;
	}

	@Override
	public boolean leaveHospitalize(MemberVO member) {
		
		boolean flag = false;
		
		nurseMapper.leaveHospitalize(member);
		
		int status = member.getResult();
		
		if (status > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public MemberVO getMemberInfo(int memNo) {
		return nurseMapper.getMemberInfo(memNo);
	}

	@Override
	public List<BedVO> getAvailableBedList() {
		return nurseMapper.getAvailableBedList();
	}

	@Override
	public List<MemberVO> getWaitingSurgeryList() {
		return nurseMapper.getWaitingSurgeryList();
	}

	@Override
	public PreInspectionVO getPreInspectionInfo(int hsptlzNo) {
		return nurseMapper.getPreInspectionInfo(hsptlzNo);
	}

	@Override
	public boolean insertPreInspection(PreInspectionVO preInspectionVO) {
		boolean flag = false;
		int status = nurseMapper.insertPreInspection(preInspectionVO);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public List<MemberVO> getWaitingPatntList() {
		return nurseMapper.getWaitingPatntList();
	}

	@Override
	public List<MemberVO> getHistoryList(int memNo) {
		return nurseMapper.getHistoryList(memNo);
	}

	@Override
	public MemberVO getHistoryInfo(int chartNo) {
		return nurseMapper.getHistoryInfo(chartNo);
	}

	@Override
	public Boolean insertNursingRecord(MemberVO nursingRecord) {
		boolean flag = false;
		
		nurseMapper.insertNursingRecord(nursingRecord);
		
		int status = nursingRecord.getResult();
		
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public MemberVO getPatntInfo(MemberVO member) {
		return nurseMapper.getPatntInfo(member);
	}

	@Override
	public MemberVO getUsingBedPatntInfo(int bedNo) {
		return nurseMapper.getUsingBedPatntInfo(bedNo);
	}

	@Override
	public List<MemberVO> getLeaveOrder() {
		return nurseMapper.getLeaveOrder();
	}

	@Override
	public MemberVO getHsptlzByMemNo(int memNo) {
		return nurseMapper.getHsptlzByMemNo(memNo);
	}

	@Override
	public Boolean writeNursingRecord(NursingRecordVO nursingRecord) {
		boolean flag = false;
		int status = nurseMapper.writeNursingRecord(nursingRecord);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public List<NursingRecordVO> getNursingRecordList(int patntNo) {
		return nurseMapper.getNursingRecordList(patntNo);
	}

	@Override
	public List<BedVO> getBedCount(int wardNo) {
		return nurseMapper.getBedCount(wardNo);
	}

}
