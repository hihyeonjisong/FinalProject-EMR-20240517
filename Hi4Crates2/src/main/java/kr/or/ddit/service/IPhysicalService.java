package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MedicalEquipVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;

public interface IPhysicalService {
	public List<MemberVO>getPhysicalWaitingList();
	public MemberVO getPhysicalOrder(int memNo, int receiptNo);
	public String getDoctorsName(MemberVO memOrderInfo);
	public List<MemberVO> getBodyCodes(int chartNo);

	public int changeStatusStart(int receiptNo);
	public int postPhysicalTherapyRecord(Map<String, Object> map);
	public int changeStatusDone(int receiptNo);
	public List<MedicalEquipVO> getPhysicalEquipmentList();
	public List<OrderVO> getOrderCodes(int chartNo);
	public int getTherapistEmpNo(int memNo);
}
