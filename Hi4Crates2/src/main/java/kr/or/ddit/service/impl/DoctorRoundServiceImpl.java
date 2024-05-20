package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IDoctorRoundMapper;
import kr.or.ddit.service.IDoctorRoundService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NursingRecordVO;
import kr.or.ddit.vo.RoundRecordVO;

@Service
public class DoctorRoundServiceImpl implements IDoctorRoundService {
	
	@Inject
	private IDoctorRoundMapper doctorRoundMapper;

	@Override
	public List<MemberVO> getPatntRecordsList(int patntNo) {
		return doctorRoundMapper.getPatntRecordsList(patntNo);
	}

	@Override
	public MemberVO getPatntRecordInfo(int chartNo) {
		return doctorRoundMapper.getPatntRecordInfo(chartNo);
	}

	@Override
	public boolean insertRoundRecord(RoundRecordVO roundRecordVO) {
		
		boolean flag = false;
		doctorRoundMapper.insertRoundRecord(roundRecordVO);
		int result = roundRecordVO.getResult();
		if (result > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public List<RoundRecordVO> getRoundRecordList(int hsptlzNo) {
		return doctorRoundMapper.getRoundRecordList(hsptlzNo);
	}

	@Override
	public List<NursingRecordVO> getNursingRecord(int hsptlzNo) {
		return doctorRoundMapper.getNursingRecord(hsptlzNo);
	}


}
