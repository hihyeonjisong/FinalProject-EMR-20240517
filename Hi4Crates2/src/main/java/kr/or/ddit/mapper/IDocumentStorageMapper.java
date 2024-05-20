package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.DiagnosisPaperVO;
import kr.or.ddit.vo.DocumentStorageVO;
import kr.or.ddit.vo.MemberVO;

public interface IDocumentStorageMapper {

	public List<DocumentStorageVO> getList();

	public List<DiagnosisPaperVO> getDiagnosisPaperList();

	public List<MemberVO> getPatntInfo(int patntNo);

	public List<DocumentStorageVO> getSelChartImgList(int receiptNo);

	public List<DiagnosisPaperVO> getSelDiagnosisPaperList(int receiptNo);

	public List<DocumentStorageVO> getradiationList();

	public List<DocumentStorageVO> getSelRadiagionList(int receiptNo);

}
