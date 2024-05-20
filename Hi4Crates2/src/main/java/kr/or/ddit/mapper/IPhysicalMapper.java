package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MedicalEquipVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;

public interface IPhysicalMapper {
	public List<MemberVO> selectPhysicalWaitingList();
	public MemberVO selectPhysicalOrder(@Param("memNo")int memNo, @Param("receiptNo")int receiptNo);
	public List<String> selectDocName(int chartNo);
	public List<MemberVO> selectBodyCodes(int chartNo);
	
	public int selectReceiptNo(int memNo, int empNo);
	public int updateStatusStart(int receiptNo);
	public int insertPhysicalTherapyRecord(Map<String, Object> map);
	public int updateStatusDone(int receiptNo);
	public List<MedicalEquipVO> selectPhysicalEquipmentList();
	public List<OrderVO> selectOrderCodes(int chartNo);
	public int selectTherapistEmpNo(int memNo);
}
