package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IPhysicalMapper;
import kr.or.ddit.service.IPhysicalService;
import kr.or.ddit.vo.MedicalEquipVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.OrderVO;
import kr.or.ddit.vo.PtRecordVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PhysicalServiceImpl implements IPhysicalService {

	@Inject
	private IPhysicalMapper physicalMapper;
	
	@Override
	public List<MemberVO> getPhysicalWaitingList() {
		log.info("[서비스][getPhysicalWaitingList] 실행!");
		return physicalMapper.selectPhysicalWaitingList();
	}

	@Override
	public MemberVO getPhysicalOrder(
			int memNo
			, int receiptNo
			) {
		log.info("[서비스][getPhysicalOrder] 실행! memNo: " + memNo + " | receiptNo: " + receiptNo);
		MemberVO memberVO = new MemberVO();
		memberVO = physicalMapper.selectPhysicalOrder(memNo, receiptNo);
		log.info("");
		return memberVO;
	}

	@Override
	public String getDoctorsName(
			MemberVO memOrderInfo
			) {
		log.info("[서비스][getDoctorsName] 실행!");
		// chartNo 구하는 걸로 바꾸기
		int chartNo = memOrderInfo.getOrderVO().getChartNo();
		log.info("[서비스][getDoctorsName] chartNo?" + chartNo);
		
		String docName = "";
		List<String> docNames = new ArrayList<String>();
		
		if (chartNo != 0) {
			docNames = physicalMapper.selectDocName(chartNo);
			docName = docNames.get(0);
			log.info("[서비스][getDoctorsName] docName: " + docName);
			return docName;
		} else {
			log.error("[서비스][getDoctorsName] orderList가 null입니다.");
			return null;
		}
	}

	@Override
	public List<MemberVO> getBodyCodes(
			int chartNo
			) {
		log.info("[서비스][getBodyCodes] 실행!");
//		List<String> bodyCodes = new ArrayList<String>();
		List<MemberVO> bodyCodes = physicalMapper.selectBodyCodes(chartNo);
		log.info("[서비스][getBodyCodes] bodyCodes: " + bodyCodes);
		return bodyCodes;
	}
	
	@Override
	public List<MedicalEquipVO>  getPhysicalEquipmentList() {
		log.info("[서비스][getPhysicalEquipmentList] 시작!");
		List<MedicalEquipVO> equipList = physicalMapper.selectPhysicalEquipmentList();
		if (equipList != null && !equipList.isEmpty()) {
			log.info("[서비스][getPhysicalEquipmentList] equipList 조회 성공! " + equipList);
			return equipList;
		}else {
			log.error("[서비스][getPhysicalEquipmentList] 장비목록 조회 실패!");
			return null;
		}
	}
	
	@Override
	public int changeStatusStart(
			int receiptNo
			) {
		log.info("[서비스][changeStatusStart] 실행! receiptNo: " + receiptNo);
		int res = physicalMapper.updateStatusStart(receiptNo);
		if (res > 0) {
			log.info("[서비스][changeStatusStart] 업데이트 성공!: " + res);
			return res;
		}else {
			log.error("[서비스][changeStatusStart] 업데이트 실패!: " + res);
			return 0;
		}
	}

	@Override
	public int postPhysicalTherapyRecord(Map<String, Object> map) {
		log.info("[서비스][postPhysicalTherapyRecord] 실행! map 가져왔니? " + map);
		int res = physicalMapper.insertPhysicalTherapyRecord(map);
		if (res > 0) {
			log.info("[서비스][postPhysicalTherapyRecord] 업데이트 성공!: " + res);
			return res;
		}else {
			log.error("[서비스][postPhysicalTherapyRecord] 업데이트 실패!: " + res);
			return 0;
		}
	}

	@Override
	public int changeStatusDone(int receiptNo) {
		log.info("[서비스][changeStatusDone] 실행! receiptNo: " + receiptNo);
		int res = physicalMapper.updateStatusDone(receiptNo);
		if (res > 0) {
			log.info("[서비스][changeStatusDone] 업데이트 성공!: " + res);
			return res;
		}else {
			log.error("[서비스][changeStatusDone] 업데이트 실패!: " + res);
			return 0;
		}
	}

	@Override
	public List<OrderVO> getOrderCodes(int chartNo) {
		log.info("[서비스][getOrderCodes] 실행! chartNo? " + chartNo);
		List<OrderVO> list = physicalMapper.selectOrderCodes(chartNo);
		log.info("[서비스][getOrderCodes] list: " + list);
		return list;
	}

	@Override
	public int getTherapistEmpNo(int memNo) {
		log.info("[서비스][getTherapistEmpNo] 실행! memNo? " + memNo);
		int empNo = physicalMapper.selectTherapistEmpNo(memNo);
		if (empNo > 0) {
			log.info("[서비스][getTherapistEmpNo] empNo: " + empNo);
			return empNo;
		}else {
			log.error("[서비스][getTherapistEmpNo] empNo 가져오기 실패!");
			return 0;
		}
	}


}
