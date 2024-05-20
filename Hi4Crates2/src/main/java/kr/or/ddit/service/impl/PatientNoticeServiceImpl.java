package kr.or.ddit.service.impl;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IPatientNoticeMapper;
import kr.or.ddit.service.IPatientNoticeService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.PatientNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PatientNoticeServiceImpl implements IPatientNoticeService {

	/**
	 * mapper 주입
	 */
	@Inject
	private IPatientNoticeMapper noticeMapper;
	
	/**
	 * 미리 정해둔 업로드 경로 표시
	 */
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	/**
	 * 게시판 목록 불러오기
	 */
	@Override
	public List<PatientNoticeVO> getPatntNoticeList(PaginationVO<PatientNoticeVO> pagingVO) {
		return noticeMapper.selectPatntNoticeList(pagingVO);
	}
	
	/**
	 * 총 게시물 수 구하기 (페이징)
	 */
	@Override
	public int getPatntNoticeCount(PaginationVO<PatientNoticeVO> pagingVO) {
		return noticeMapper.selectPatntNoticeCount(pagingVO);
	}

	/**
	 * 새 글 등록 기능
	 */
	@Override
	public ServiceResult postPatntNotice(
			PatientNoticeVO patntNoticeVO
			,HttpServletRequest req
			) {
		ServiceResult result = null;
		log.info("[서비스]postPatntNotice 시작!");
		
		log.info("[서비스]postPatntNotice: patntNoticeVO: " + patntNoticeVO);
		if(patntNoticeVO != null) {	// 등록할 글 정보가 존재한다면
			log.info("[서비스][postPatntNotice] patntNoticeVO 있음!");
			// 첨부파일 있는지 확인
//			log.info("[서비스][postPatntNotice] patntNoticeVO.getAttachFileList(): " + patntNoticeVO.getAttachFileList());
			List<AttachmentVO> attachFileList = patntNoticeVO.getAttachFileList();
			log.info("[서비스][postPatntNotice] attachFileList: " + attachFileList);
			
			// 첨부파일이 존재한다면 (첨부 시작)
			if(attachFileList != null && !attachFileList.isEmpty()) {
				log.info("[서비스][postPatntNotice] 파일첨부 if절 진입!");
				// empAttachGroupNo 등록해서 가져오기 (VO이용)
				noticeMapper.insertPatntAttachGroupNo(patntNoticeVO);
				int attachmentGroupNo = patntNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][postPatntNotice] attachmentGroupNo " + attachmentGroupNo);
				// insert할 글 내용이 담긴 VO에 attachmentGroupNo 세팅
				patntNoticeVO.setAttachmentGroupNo(attachmentGroupNo);
	
				// attachmentGroupNo 생성&등록 됐으면
				if (attachmentGroupNo > 0) {
					log.info("[서비스][postPatntNotice] attachmentGroupNo > 0 일때 ");
					try {
						// 파일 업로드 메서드 실행
						uploadPatntNoticeFile(
								attachFileList, attachmentGroupNo, req);
					}catch(Exception e) {
						log.error("[서비스][postPatntNotice] 파일 업로드 과정 중 문제 발생!", e);
					}
	
				}	// if 'attachmentGroupNo 생성&등록 됐으면' -- 끝
				log.info("[서비스][postPatntNotice] 파일첨부 if 끝!");
			}	// 첨부파일 첨부 끝
			
			log.info("[서비스][postPatntNotice] 게시글 등록 시작!");
			// 게시글 등록
			int status = noticeMapper.insertPatntNotice(patntNoticeVO);
			// 게시글 등록 성공했다면
			if (status > 0) {
				log.info("[서비스][postPatntNotice] 게시글 등록 성공!");
				result = ServiceResult.OK;
			}else {
				log.error("[서비스][postPatntNotice] 게시글 등록 과정 중 문제 발생!");
				result = ServiceResult.FAILED;
			}

		}	// if '등록할 글 정보가 존재한다면' 끝
		else {	// 등록할 empNoticeVO가 null 이라면
			log.error("[서비스]postPatntNotice: empNoticeVO==null");
			result = ServiceResult.FAILED;
		}
		log.info("[서비스][postPatntNotice] 종료");
		return result;
	}
	

	/**
	 * 새 글 등록 기능에서 사용될 첨부파일 등록 기능
	 * @param attachFileList
	 * @param attachmentGroupNo
	 * @param req
	 * @throws Exception
	 */
	private void uploadPatntNoticeFile(
			List<AttachmentVO> attachFileList
			, int attachmentGroupNo
			, HttpServletRequest req
			) throws Exception {
		log.info("[서비스]uploadPatntNoticeFile 시작!");
		
		// 첨부파일이 존재한다면
		if(attachFileList != null && attachFileList.size() > 0) {
				log.info("[서비스][uploadPatntNoticeFile] 첨부파일 존재할 때..."
						+ "attachFileList: " + attachFileList);

				// 첨부파일 저장 경로 만들기
				String attachLoc = "/patntNotice";
				String savePath = getPatntNoticeFilePaths(
						resourcePath, attachLoc);
				log.info("[서비스][uploadPatntNoticeFile] savePath: " + savePath);

				// 저장할 첨부파일 파일명 설정
				for(AttachmentVO attachmentVO : attachFileList) {

					// 랜덤 UUID + _원래파일명 으로 저장명 만들기 ("saveName")
					String saveName = UUID.randomUUID().toString();
					saveName += "_" + attachmentVO.getAttachName();
					log.info("[서비스][uploadPatntNoticeFile] 첨부한 파일명: "
							+ attachmentVO.getAttachName());
					// 경로에서 슬래쉬 변환
					savePath = savePath.replace(File.separatorChar, '/');

					// 전체 저장 경로
					String saveAttachPath = resourcePath + attachLoc + savePath
							+ "/" + saveName;
					
					// 저장할 각각의 첨부파일 정보를 attachmentVO에 세팅
					MultipartFile item = attachmentVO.getItem();
					log.info("[서비스][uploadPatntNoticeFile] 파일타입: " + item.getContentType());
					attachmentVO.setAttachType(item.getContentType());	// 파일 속성 세팅
					attachmentVO.setAttachName(saveName);	// 파일명만 세팅
					attachmentVO.setAttachmentGroupNo(attachmentGroupNo);	// 그룹넘버 세팅
					attachmentVO.setAttachPath(savePath);	// 파일 업로드 경로 세팅
					attachmentVO.setAttachLoc(attachLoc);	// 파일 사용처 세팅

					// 첨부파일 등록
					try {
						noticeMapper.insertPatntNoticeAttachment(attachmentVO);
					}catch(Exception e) {
//						e.printStackTrace();
						log.error("[서비스][uploadPatntNoticeFile] 파일 업로드 중 문제 발생!", e);
					}

					File saveFile = new File(saveAttachPath);
					item.transferTo(saveFile);	// 파일 복사

				}	// for 닫기
		}	// if '첨부파일이 존재한다면' 닫기
	}	// 메서드 닫기


	/**
	 * 새 글 등록에서 사용될 첨부파일 등록을 위해
	 * 날짜별 폴더 경로 생성
	 * @param resourcePath
	 * @param attachLoc
	 * @return String (첨부파일 경로로 사용할 문자열)
	 */
	private static String getPatntNoticeFilePaths(
			String resourcePath
			, String attachLoc
			) {
		Calendar cal = Calendar.getInstance();
		// DecimalFormat("00") : 두자리에서 빈자리는 0으로 채움
		String yearPath = File.separator + cal.get(Calendar.YEAR);	// 2024
		log.info("[서비스][getPatntNoticeFilePaths] yearPath? " + yearPath);
		String monthPath = yearPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);	// 2024/04
		log.info("[서비스][getPatntNoticeFilePaths] monthPath? " + monthPath);
		String datePath = monthPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));	// 2024/04/19
		log.info("[서비스][getPatntNoticeFilePaths] datePath? " + datePath);

		// 연월일 구조로 폴더 생성
		makeDir(resourcePath, attachLoc, yearPath, monthPath, datePath);

		return datePath;
	}
	
	/**
	 * 새 글 등록에서 사용될 첨부파일 등록을 위해
	 * 날짜별 폴더 경로 생성을 할 때 사용할
	 * 실제 폴더 경로가 없다면 만드는 기능
	 * 가변 인자, 키워드 '...' 사용, 타입...변수명 형태로 사용
	 * 순서대로 yearPath, monthPath, datePath가 배열로 들어가 처리
	 * @param resourcePath
	 * @param attachLoc
	 * @param paths
	 */
	private static void makeDir(
			String resourcePath
			, String attachLoc
			, String...paths
			) {
		// 이미 만들려던 폴더 구조가 존재한다면 만들 필요가 없으니 return 함
		if(new File(paths[paths.length-1]).exists()) {
			log.info("[서비스][makeDir] 해당 경로 이미 존재함");
			return;
		}

		for(String path : paths) {
			log.info("[서비스][makeDir] path? " + path);
			File dirPath = new File(resourcePath + "/" + attachLoc + path);
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
		log.info("[서비스][makeDir] 생성 완료 ");
	}

	/**
	 * 공지사항 게시글 상세조회
	 */
	@Override
	public PatientNoticeVO selectPatntNoticeDetail(
			int patntNoticeNo
			) {
		noticeMapper.incrementViewCount(patntNoticeNo);
		PatientNoticeVO patntNoticeVO = noticeMapper.selectPatntNoticeDetail(patntNoticeNo);
		if(patntNoticeVO != null) {
			// 첨부파일 정보 조회
			int attachmentGroupNo = patntNoticeVO.getAttachmentGroupNo();
			List<AttachmentVO> attachFileList =  noticeMapper.selectPatntNoticeDetailFile(attachmentGroupNo);
			patntNoticeVO.setAttachFileList(attachFileList);
		}
		return patntNoticeVO;
	}

	/**
	 * 글 수정 결과 반환 (원본)
	 */
	@Override
	public ServiceResult modifyPatntNoticeDetail(
			HttpServletRequest req
			, PatientNoticeVO patntNoticeVO
			) {
		ServiceResult result = null;
		log.info("[서비스][modifyPatntNoticeDetail] 시작");
		
		if(patntNoticeVO != null) {	// 등록할 글 정보가 존재한다면
			log.info("[서비스][modifyPatntNoticeDetail] empNoticeVO 있음!");

			// 첨부파일 있는지 확인
			log.info("[서비스][modifyPatntNoticeDetail] empNoticeVO.getAttachFileList(): " 
					+ patntNoticeVO.getAttachFileList());
			List<AttachmentVO> attachFileList = patntNoticeVO.getAttachFileList();
			log.info("[서비스][modifyPatntNoticeDetail] attachFileList: " + attachFileList);
			
			if(attachFileList != null && !attachFileList.isEmpty()) {	// 첨부파일이 있으면
//			if(ObjectUtils.isEmpty(attachFileList)) {	// 첨부파일이 있으면
				log.info("[서비스][modifyPatntNoticeDetail] 첨부파일 있음 확인!");
		
				// (기존 파일 삭제하는 로직 자리)
				// attachmentGroupNo로 attachment와 attachmentGroup에서 파일을 지우자
				// 그 후 새 파일 업로드 & 새 그룹 넘버 받고 => 글 내용 수정
				int attachmentGroupNoOld = patntNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][modifyPatntNoticeDetail] 기존 첨부파일 그룹 넘버: " + attachmentGroupNoOld);
				// DB의 첨부파일 삭제(delete)
				noticeMapper.deleteOldAttachment(attachmentGroupNoOld);
				// DB의 첨부파일 그룹넘버 삭제처리(update)
				noticeMapper.deleteOldAttachGroupNo(attachmentGroupNoOld);
				// VO에 저장된 그룹넘버 초기화
				patntNoticeVO.setAttachmentGroupNo(0);
		
				// (새 첨부파일 업로드)
				// (VO이용) empAttachGroupNo 등록해서 가져오기
				noticeMapper.insertPatntAttachGroupNo(patntNoticeVO);
				int attachmentGroupNo = patntNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][modifyPatntNoticeDetail] attachmentGroupNo " + attachmentGroupNo);
				// insert할 글 내용이 담긴 VO에 attachmentGroupNo 세팅
				patntNoticeVO.setAttachmentGroupNo(attachmentGroupNo);
	
				if (attachmentGroupNo > 0) {
					log.info("[서비스][modifyPatntNoticeDetail] attachmentGroupNo > 0 일때 ");
					try {
						// 파일 업로드 메서드 실행
						uploadPatntNoticeFile(
								attachFileList, attachmentGroupNo, req);
					}catch(Exception e) {
	//					e.printStackTrace();
						log.error("[서비스][modifyPatntNoticeDetail] 파일 업로드 과정 중 문제 발생!", e);
					}
	
				}	// if 'attachmentGroupNo등록' 성공했다면 -- 끝
				log.info("[서비스][modifyPatntNoticeDetail] 파일첨부 if 끝!");
			}	// 첨부파일 첨부 끝
		
		// (기존 로직: 수정 게시글 등록)
		
			int status = noticeMapper.updatePatntNotice(patntNoticeVO);
			if(status > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}	// if '등록할 글 정보가 존재한다면' 끝
		return result;
	}
	
	/**
	 * 글 삭제 처리
	 */
	@Override
	public ServiceResult deletePatntNoticeDetail(
			int patntNoticeNo
			, int attachmentGroupNo) {
		ServiceResult result = null;
		log.info("[서비스][deletePatntNoticeDetail] empNoticeNo: " + patntNoticeNo);
		log.info("[서비스][deletePatntNoticeDetail] attachmentGroupNo: " + attachmentGroupNo);
		if(attachmentGroupNo != 0) {	// 첨부파일 있으면 삭제
			noticeMapper.deleteOldAttachment(attachmentGroupNo);
			noticeMapper.deleteOldAttachGroupNo(attachmentGroupNo);
		}
		// 글 삭제 처리
		int status = noticeMapper.deletePatntNotice(patntNoticeNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	
}
