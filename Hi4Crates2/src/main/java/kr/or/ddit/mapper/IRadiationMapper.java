package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

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

public interface IRadiationMapper {
	public List<CommentVO> getCommentList();
	public List<RadiationRoomVO> getRadiationRoomList();
	public RadiationRoomVO getRadiationRoomInfo(int roomNo);
	public List<EquipmentVO> getEqList();
	public EquipmentVO getEqInfo(int eqNo);
	public int updateEqInfo(EquipmentVO equipmentVO);
	public String getCommonCode(String codeName);
	public int updateEqDescription(EquipmentVO equipmentVO);
	public int requestRepair(RepairRequestVO repairRequestVO);
	public int insertComment(CommentVO commentVO);
	public int deleteComment(int commentNo);
	public List<MemberVO> radiationWaitingList();
	public List<MemberVO> getPatntOrder(int receiptNo);
	public int updateComment(CommentVO commentVO);
	public int deleteEquipment(int eqNo);
	public int updateHistory(HistoryVO historyVO);
	public MemberVO inRadiationRoomPatntInfo(String roomName);
	public int insertFiles(AttachmentVO file);
	public int insertFileGroup(Map<String, Object> params);
	public int insertRocRecord(RocRecordVO rocRecordVO);
	public OrderVO getBodyCode(int orderNo);
	public EmpVO getEmpInfo(int memNo);
	public int checkRequest(int eqNo);
	public List<EquipmentVO> getEquiptList();
	public ClinicVO getClinicNo(int orderNo);
	public boolean updatePatntHistory(HistoryVO historyVO);
}
