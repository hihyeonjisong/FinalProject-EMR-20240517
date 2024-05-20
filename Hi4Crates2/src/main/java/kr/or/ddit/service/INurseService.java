package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BedVO;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreInspectionVO;

public interface INurseService {
	public List<BedVO> getBedList();
	public List<MemberVO> getHospitalizeList();
	public MemberVO getPatntOrder(int chartNo);
	public MemberVO getHospitalizePatntInfo(int patntNo);
	public List<MedicineVO> getMedicineList();
	public boolean requestMedicine(List<MedicineVO> mdcinList);
	public List<MedicineRequestResultVO> getRequestResultList();
	public List<MemberVO> getWardInfo(int wardNo);
	public List<MemberVO> getHospitalizeOrder();
	public boolean insertHospitalize(List<MemberVO> orderList);
	public boolean leaveHospitalize(MemberVO member);
	public MemberVO getMemberInfo(int memNo);
	public List<BedVO> getAvailableBedList();
	public List<MemberVO> getWaitingSurgeryList();
	public PreInspectionVO getPreInspectionInfo(int hsptlzNo);
	public boolean insertPreInspection(PreInspectionVO preInspectionVO);
	public List<MemberVO> getWaitingPatntList();
	public List<MemberVO> getHistoryList(int memNo);
	public MemberVO getHistoryInfo(int chartNo);
	public Boolean insertNursingRecord(MemberVO nursingRecord);
	public MemberVO getPatntInfo(MemberVO member);
	public MemberVO getUsingBedPatntInfo(int bedNo);
	public List<MemberVO> getLeaveOrder();
	public MemberVO getHsptlzByMemNo(int memNo);
	public Boolean writeNursingRecord(NursingRecordVO nursingRecord);
	public List<NursingRecordVO> getNursingRecordList(int patntNo);
	public List<BedVO> getBedCount(int wardNo);
}
