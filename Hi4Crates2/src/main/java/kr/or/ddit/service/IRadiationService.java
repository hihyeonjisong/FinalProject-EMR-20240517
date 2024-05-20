package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.ClinicVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EquipmentVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.RadiationRoomVO;
import kr.or.ddit.vo.RepairRequestVO;
import kr.or.ddit.vo.RocRecordVO;

public interface IRadiationService {

	public List<CommentVO> getCommentList();
	public List<RadiationRoomVO> getRadiationRoomList();
	public RadiationRoomVO getRadiationRoomInfo(int roomNo);
	public List<EquipmentVO> getEqList();
	public EquipmentVO getEqInfo(int equipmentNo);
	public int updateEqInfo(EquipmentVO equipmentVO);
	public String getCommonCode(String codeName);
	public int updateEqDescription(EquipmentVO equipmentVO);
	public int requestRepair(RepairRequestVO repairReqVO);
	public int insertComment(CommentVO commentVO);
	public int deleteComment(int commentNo);
	public List<MemberVO> radiationWaitingList();
	public List<MemberVO> getPatntOrder(int receiptNo);
	public int updateComment(CommentVO commentVO);
	public boolean deleteEquipment(int eqNo);
	public boolean updateHistory(HistoryVO historyVO);
	public MemberVO inRadiationRoomPatntInfo(String roomName);
	public int insertFiles(List<AttachmentVO> fileList);
	public boolean insertRocRecord(RocRecordVO rocRecordVO);
	public OrderVO getBodyCode(int orderNo);
	public EmpVO getEmpInfo(int memNo);
	public boolean checkRequest(int eqNo);
	public List<EquipmentVO> getEquipList();
	public ClinicVO getClinicNo(int orderNo);
	public boolean updatePatntHistory(HistoryVO historyVO);
}
