package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ISurgeryMapper;
import kr.or.ddit.mapper.ISurgeryRecordMapper;
import kr.or.ddit.service.IEmpSurgeryService;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.SurgeryKindVO;
import kr.or.ddit.vo.SurgeryReservationVO;

@Service
public class EmpSurgeryServiceImpl implements IEmpSurgeryService{

	@Inject
	private ISurgeryMapper surgeryMapper;
	
	@Inject
	private ISurgeryRecordMapper surgeryRecordMapper;
	
	@Override
	public int getSurgeryReservCount(PaginationVO<SurgeryReservationVO> pagingVO) {
		return surgeryMapper.selectSurgeryReservCount(pagingVO);
	}

	@Override
	public List<SurgeryReservationVO> getSurgeryReservList(PaginationVO<SurgeryReservationVO> pagingVO) {
		return surgeryMapper.selectSurgeryReservList(pagingVO);
	}

	@Override
	public ServiceResult insertSurgeryReserv(SurgeryReservationVO surgeryReservVO) {
		ServiceResult result = null;
		
		int status = surgeryMapper.insertSurgeryReserv(surgeryReservVO);
		
		if(status > 0 ) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public SurgeryKindVO searchSurgeryKind(String surgerySearchWord) {
		return surgeryMapper.getSurgeryKind(surgerySearchWord);
	}

	@Override
	public List<SurgeryKindVO> getSurgeryKindList() {
		String surgerySearchWord = "";
		return surgeryMapper.getSurgeryKindList(surgerySearchWord);
//		return surgeryMapper.getSurgeryKindList();
	}

	

}
