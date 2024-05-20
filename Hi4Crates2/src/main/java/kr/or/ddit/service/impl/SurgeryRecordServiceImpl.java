package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ISurgeryRecordMapper;
import kr.or.ddit.service.ISurgeryRecordService;
import kr.or.ddit.vo.SurgeryReservationVO;
import kr.or.ddit.vo.SurgeryVO;

@Service
public class SurgeryRecordServiceImpl implements ISurgeryRecordService {
	
	@Inject
	ISurgeryRecordMapper surgeryRecordMapper;
	
	@Override
	public List<SurgeryReservationVO> getSurgeryList() {
		return surgeryRecordMapper.getSurgeryList();
	}

	@Override
	public ServiceResult insertSurgery(SurgeryVO surgery) {
		int res = surgeryRecordMapper.insertSurgery(surgery);
		if(res > 0 ) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

	@Override
	public SurgeryReservationVO detailSurgery(int surgeryNo) {
		return surgeryRecordMapper.detailSurgery(surgeryNo);
	}

}
