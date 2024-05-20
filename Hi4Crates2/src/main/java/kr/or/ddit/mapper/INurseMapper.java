package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BedVO;
import kr.or.ddit.vo.MedicineRequestResultVO;
import kr.or.ddit.vo.MedicineVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PreInspectionVO;

public interface INurseMapper {
	public List<BedVO> getBedList();
	public List<MemberVO> getHospitalizeList();
	public MemberVO getPatntOrder(int patntNo);
	public MemberVO getHospitalizePatntInfo(int chartNo);
	public List<MedicineVO> getMedicineList();
	public int requestMedicine(List<MedicineVO> mdcinList);
	public List<MedicineRequestResultVO> getRequestResultList();
	public List<MemberVO> getWardInfo(int wardNo);
	public List<MemberVO> getHospitalizeOrder();
	public int insertHospitalize(List<MemberVO> patient);
	public int leaveHospitalize(MemberVO member);
	public int updateBedStatus(MemberVO patient);
	public MemberVO getMemberInfo(int memNo);
	public List<BedVO> getAvailableBedList();
	public List<MemberVO> getWaitingSurgeryList();
	public PreInspectionVO getPreInspectionInfo(int hsptlzNo);
	public int insertPreInspection(PreInspectionVO preInspectionVO);
	public List<MemberVO> getWaitingPatntList();
	public List<MemberVO> getHistoryList(int memNo);
	public MemberVO getHistoryInfo(int chartNo);
	public int insertNursingRecord(MemberVO nursingRecord);
	public MemberVO getPatntInfo(MemberVO member);
	public MemberVO getUsingBedPatntInfo(int bedNo);
	public List<MemberVO> getLeaveOrder();
	public MemberVO getHsptlzByMemNo(int memNo);
	public int writeNursingRecord(NursingRecordVO nursingRecord);
	public List<NursingRecordVO> getNursingRecordList(int patntNo);
	public List<BedVO> getBedCount(int wardNo);
}
