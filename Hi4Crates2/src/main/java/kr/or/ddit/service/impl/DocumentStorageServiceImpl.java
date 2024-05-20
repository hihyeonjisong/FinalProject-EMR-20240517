package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IDocumentStorageMapper;
import kr.or.ddit.service.IDocumentStorageService;
import kr.or.ddit.vo.DiagnosisPaperVO;
import kr.or.ddit.vo.DocumentStorageVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class DocumentStorageServiceImpl implements IDocumentStorageService {
	
	@Inject
	IDocumentStorageMapper mapper;
	
	@Override
	public List<DocumentStorageVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<DiagnosisPaperVO> getDiagnosisPaperList() {
		return mapper.getDiagnosisPaperList();
	}

	@Override
	public List<MemberVO> getPatntInfo(int patntNo) {
		return mapper.getPatntInfo(patntNo);
	}

	@Override
	public List<DocumentStorageVO> getSelChartImgList(int receiptNo) {
		return mapper.getSelChartImgList(receiptNo);
	}

	@Override
	public List<DiagnosisPaperVO> getSelDiagnosisPaperList(int receiptNo) {
		return mapper.getSelDiagnosisPaperList(receiptNo);
	}

	@Override
	public List<DocumentStorageVO> getradiationList() {
		return mapper.getradiationList();
	}

	@Override
	public List<DocumentStorageVO> getSelRadiagionList(int receiptNo) {
		return mapper.getSelRadiagionList(receiptNo);
	}
	

}
