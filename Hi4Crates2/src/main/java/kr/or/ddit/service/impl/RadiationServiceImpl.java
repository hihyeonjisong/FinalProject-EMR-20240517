package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IRadiationMapper;
import kr.or.ddit.service.IRadiationService;
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
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RadiationServiceImpl implements IRadiationService{
	
	@Inject
	private IRadiationMapper radiationMapper;

	@Override
	public List<CommentVO> getCommentList() {
		return radiationMapper.getCommentList();
	}

	@Override
	public List<RadiationRoomVO> getRadiationRoomList() {
		return radiationMapper.getRadiationRoomList();
	}

	@Override
	public RadiationRoomVO getRadiationRoomInfo(int roomNo) {
		return radiationMapper.getRadiationRoomInfo(roomNo);
	}

	@Override
	public List<EquipmentVO> getEqList() {
		return radiationMapper.getEqList();
	}

	@Override
	public EquipmentVO getEqInfo(int eqNo) {
		return radiationMapper.getEqInfo(eqNo);
	}

	@Override
	public int updateEqInfo(EquipmentVO equipmentVO) {
		return radiationMapper.updateEqInfo(equipmentVO);
	}

	@Override
	public String getCommonCode(String codeName) {
		return radiationMapper.getCommonCode(codeName);
	}

	@Override
	public int updateEqDescription(EquipmentVO equipmentVO) {
		return radiationMapper.updateEqDescription(equipmentVO);
	}


	@Override
	public int requestRepair(RepairRequestVO repairRequestVO) {
		radiationMapper.requestRepair(repairRequestVO);
		int result = repairRequestVO.getResult();
		return result;
	}

	@Override
	public int insertComment(CommentVO commentVO) {
		return radiationMapper.insertComment(commentVO);
	}

	@Override
	public int deleteComment(int commentNo) {
		return radiationMapper.deleteComment(commentNo);
	}

	@Override
	public List<MemberVO> radiationWaitingList() {
		return radiationMapper.radiationWaitingList();
	}

	@Override
	public List<MemberVO> getPatntOrder(int receiptNo) {
		return radiationMapper.getPatntOrder(receiptNo);
	}

	@Override
	public int updateComment(CommentVO commentVO) {
		return radiationMapper.updateComment(commentVO);
	}

	@Override
	public boolean deleteEquipment(int eqNo) {
		boolean flag = false;
		
		int status = radiationMapper.deleteEquipment(eqNo);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateHistory(HistoryVO historyVO) {
		boolean flag = false;
		
		radiationMapper.updateHistory(historyVO);
		
		int status = historyVO.getResult();
		
		if (status == 1) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public MemberVO inRadiationRoomPatntInfo(String roomName) {
		return radiationMapper.inRadiationRoomPatntInfo(roomName);
	}

	@Override
	public int insertFiles(List<AttachmentVO> fileList) {
		boolean flag = false;
		int groupNo = 0;
		Map<String, Object> params = new HashMap<String, Object>();
		
		int insertGroupStatus = radiationMapper.insertFileGroup(params);
		if (insertGroupStatus > 0) {
			groupNo = (Integer) params.get("attachmentGroupNo");
			for (AttachmentVO file : fileList) {
				file.setAttachmentGroupNo(groupNo); // attachment_group_no 설정
				int status = radiationMapper.insertFiles(file);
				if (status > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}
		}
		if (flag) {
			return groupNo; 
		} else {
			return 0;
		}
		
	}

	@Override
	public boolean insertRocRecord(RocRecordVO rocRecordVO) {
		boolean flag = false;
		int status = radiationMapper.insertRocRecord(rocRecordVO);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public OrderVO getBodyCode(int orderNo) {
		return radiationMapper.getBodyCode(orderNo);
	}

	@Override
	public EmpVO getEmpInfo(int memNo) {
		return radiationMapper.getEmpInfo(memNo);
	}

	@Override
	public boolean checkRequest(int eqNo) {
		boolean flag = true;
		int status = radiationMapper.checkRequest(eqNo);
		if (status > 0) {
			flag = false;
		}
		return flag;
	}

	@Override
	public List<EquipmentVO> getEquipList() {
		return radiationMapper.getEquiptList();
	}

	@Override
	public ClinicVO getClinicNo(int orderNo) {
		return radiationMapper.getClinicNo(orderNo);
	}

	@Override
	public boolean updatePatntHistory(HistoryVO historyVO) {
		return radiationMapper.updatePatntHistory(historyVO);
	}

}
