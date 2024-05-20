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
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IEmpNoticeMapper;
import kr.or.ddit.service.IEmpNoticeService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpNoticeServiceImpl implements IEmpNoticeService {

	@Inject
	private IEmpNoticeMapper noticeMapper;

	/**
	 * 미리 정해둔 업로드 경로 표시
	 */
	@Resource(name = "uploadPath")
	private String resourcePath;

	/**
	 * [ajax] 게시글 등록 관련 서비스
	 * @return ServiceResult
	 */
	@Override
	public ServiceResult postEmpNotice(
			HttpServletRequest req, EmpNoticeVO empNoticeVO) {
		ServiceResult result = null;
		log.info("[서비스]postEmpNotice 실행: empNoticeVO: " + empNoticeVO);
		if(empNoticeVO != null) {	// 등록할 글 정보가 존재한다면
			log.info("[서비스][postEmpNotice] empNoticeVO 있음!");
			// 첨부파일 있는지 확인
			log.info("[서비스][postEmpNotice] empNoticeVO.getAttachFileList(): " + empNoticeVO.getAttachFileList());
			List<AttachmentVO> attachFileList = empNoticeVO.getAttachFileList();
			log.info("[서비스][postEmpNotice] attachFileList: " + attachFileList);
			
			if(attachFileList != null && !attachFileList.isEmpty()) {	// 첨부파일이 있으면
				log.info("[서비스][postEmpNotice] 파일첨부 if절 진입!");
				// (VO이용) empAttachGroupNo 등록해서 가져오기
				noticeMapper.insertEmpAttachGroupNo(empNoticeVO);
				int attachmentGroupNo = empNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][postEmpNotice] attachmentGroupNo " + attachmentGroupNo);
				// insert할 글 내용이 담긴 VO에 attachmentGroupNo 세팅
				empNoticeVO.setAttachmentGroupNo(attachmentGroupNo);
	
				if (attachmentGroupNo > 0) {
					log.info("[서비스][postEmpNotice] attachmentGroupNo > 0 일때 ");
					try {
						// 파일 업로드 메서드 실행
						uploadEmpNoticeFile(
								attachFileList, attachmentGroupNo, req);
					}catch(Exception e) {
						log.error("[서비스][postEmpNotice] 파일 업로드 과정 중 문제 발생!", e);
					}
				}	// if 'attachmentGroupNo등록' 성공했다면 -- 끝
				log.info("[서비스][postEmpNotice] 파일첨부 if 끝!");
			}	// 첨부파일 첨부 끝
			
			log.info("[서비스][postEmpNotice] 게시글 등록 시작!");
			// 게시글 등록 과정
			int status = noticeMapper.insertEmpNotice(empNoticeVO);
			// 게시글 등록 성공했다면
			if (status > 0) {
				log.info("[서비스][postEmpNotice] 게시글 등록 성공!");
				result = ServiceResult.OK;
			}else {
				log.error("[서비스][postEmpNotice] 게시글 등록 과정 중 문제 발생!");
				result = ServiceResult.FAILED;
			}

		}	// if '등록할 글 정보가 존재한다면' 끝
		else {	// 등록할 empNoticeVO가 null 이라면
			log.error("[서비스]postEmpNotice: empNoticeVO==null");
			result = ServiceResult.FAILED;
		}
		log.info("[서비스][postEmpNotice] 종료");
		return result;
	}



	/**
	 * 파일 업로드 기능
	 * @param attachFileList
	 * @param attachmentGroupNo
	 * @param req
	 * @throws Exception
	 */
	private void uploadEmpNoticeFile(
			List<AttachmentVO> attachFileList,
//			int attachNo, // 선생님 방식에선 원래 게시글 번호
			int attachmentGroupNo,
			HttpServletRequest req
			) throws Exception {
		log.info("[서비스]empNoticeFileUpload 시작!");

		if(attachFileList != null) {	// (첨부파일이 존재한다면)
			if(attachFileList.size() > 0) {	// (첨부파일 존재)
				log.info("[서비스]empNoticeFileUpload: 첨부파일 존재할 때..."
						+ "attachFileList: " + attachFileList);

				// 파일 저장 경로 만들기
				String attachLoc = "/empNotice";
				String savePath = getEmpNoticeFilePaths(
						resourcePath, attachLoc);
				log.info("[서비스]empNoticeFileUpload: savePath? " + savePath);

				for(AttachmentVO attachmentVO : attachFileList) {

					// 랜덤 UUID + _원래파일명 으로 저장명 만들기 ("saveName")
					String saveName = UUID.randomUUID().toString();
					saveName += "_" + attachmentVO.getAttachName();
					log.info("[서비스]empNoticeFileUpload 첨부한 파일명: "
							+ attachmentVO.getAttachName());

					// 관련 메서드 만들며 주석 처리함
//					String saveAttachPath = savePath + attachmentGroupNo;
//					log.info("[서비스]empNoticeFileUpload: saveAttachPath는? " + saveAttachPath);
//					File file = new File(saveAttachPath);
//					// 경로 디렉토리 없을 시 생성하기
//					if(!file.exists()) {
//						file.mkdirs();
//					}
//					saveAttachPath += "/" + saveName;	// 파일명을 포함한 실제 업로드 경로

//					File file = new File(resourcePath + savePath, saveName);


//					그 경로 뒤에 /사용처/년/월/일/파일명
//					이렇게 저장될껀데
//					path 에는 그럼
//					년 월 일 만 들어가면되고
//					LOC 에 /사용처
//					파일명에 파일명
//					디비에 이런식으로 저장되게하면

//					savePath = savePath.replace(File.separatorChar, '/') + "/" ;
					savePath = savePath.replace(File.separatorChar, '/');

					String saveAttachPath = resourcePath + attachLoc + savePath
							+ "/" + saveName;

					MultipartFile item = attachmentVO.getItem();
					log.info("[서비스] 파일타입: " + item.getContentType());
//					String aType = item.getContentType();
					attachmentVO.setAttachType(item.getContentType());	// 파일 속성 세팅

					attachmentVO.setAttachName(saveName);	// 파일명만 세팅
					attachmentVO.setAttachmentGroupNo(attachmentGroupNo);	// 그룹넘버 세팅
					// 파일 업로드 경로 설정
//					attachmentVO.setAttachPath(saveAttachPath);
					attachmentVO.setAttachPath(savePath);	//
					attachmentVO.setAttachLoc(attachLoc);
					/////////////////////////////////////////////////
					// 여기에 AttachmentVO 각각 세팅?
					// 게시글의 파일데이터 추가
					try {
						noticeMapper.insertEmpNoticeAttachment(attachmentVO);
					}catch(Exception e) {
//						e.printStackTrace();
						log.error("[서비스]empNoticeFileUpload: 파일 업로드 중 문제 발생!", e);
					}

					// (직렬화 오류났던 곳?)
					File saveFile = new File(saveAttachPath);
//					attachmentVO.getItem().transferTo(saveFile);	// 파일 복사
					item.transferTo(saveFile);	// 파일 복사

				}	// for 닫기
			}	// if 파일크기>0 닫기
		}	// if 파일!=null 닫기
	}	// 메서드 닫기


	/**
	 * 파일 업로드를 위한 날짜별 폴더 경로 구하기
	 * @param resourcePath
	 * @param attachLoc
	 * @return String (첨부파일 경로로 사용할 문자열)
	 */
	private static String getEmpNoticeFilePaths(
			String resourcePath, String attachLoc
			) {
		// (calcPath 코드)
		Calendar cal = Calendar.getInstance();
		// DecimalFormat("00") : 두자리에서 빈자리는 0으로 채움
		String yearPath = File.separator + cal.get(Calendar.YEAR);	// 2024
		log.info("[서비스]empNoticeFileUpload: yearPath? " + yearPath);
		String monthPath = yearPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);	// 2024/04
		log.info("[서비스]empNoticeFileUpload: monthPath? " + monthPath);
		String datePath = monthPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));	// 2024/04/19
		log.info("[서비스]empNoticeFileUpload: datePath? " + datePath);

		// 연월일 구조로 폴더 생성
		makeDir(resourcePath, attachLoc, yearPath, monthPath, datePath);

		return datePath;
	}

	/**
	 * 파일 업로드를 위한 경로 생성
	 * 가변 인자 / 키워드 '...' 사용 / 타입...변수명 형태로 사용
	 * 순서대로 yearPath, monthPath, datePath가 배열로 들어가 처리
	 * @param resourcePath
	 * @param attachLoc
	 * @param paths
	 */
	private static void makeDir(
			String resourcePath, String attachLoc, String...paths
			) {
		// 이미 만들려던 폴더 구조가 존재한다면 만들 필요가 없으니 return 함
		if(new File(paths[paths.length-1]).exists()) {
			log.info("[서비스]makeDir: 해당 경로 이미 존재함");
			return;
		}

		for(String path : paths) {
			log.info("[서비스]makeDir: path? " + path);
			File dirPath = new File(resourcePath + "/" + attachLoc + path);
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
		log.info("[서비스]makeDir: 생성 완료 ");
	}

	/**
	 * 게시판 목록 조회
	 */
	@Override
	public List<EmpNoticeVO> getEmpNoticeList(PaginationVO<EmpNoticeVO> pagingVO) {
		return noticeMapper.selectEmpNoticeList(pagingVO);
	}

	/**
	 * 총 게시물 수
	 */
	@Override
	public int getEmpNoticeCount(PaginationVO<EmpNoticeVO> pagingVO) {
		return noticeMapper.selectEmpNoticeCount(pagingVO);
	}

	/**
	 * 상세조회 원본
	 */
//	@Override
//	public EmpNoticeVO selectEmpNoticeDetail(int empNoticeNo) {
//		noticeMapper.incrementViewCount(empNoticeNo);
//		return noticeMapper.selectEmpNoticeDetail(empNoticeNo);
//	}

	// 
	/**
	 * 공지사항 게시글 상세조회
	 */
	@Override
	public EmpNoticeVO selectEmpNoticeDetail(int empNoticeNo) {
		noticeMapper.incrementViewCount(empNoticeNo);
		EmpNoticeVO empNoticeVO = noticeMapper.selectEmpNoticeDetail(empNoticeNo);
		if(empNoticeVO != null) {
			// 첨부파일 정보 조회
			int attachmentGroupNo = empNoticeVO.getAttachmentGroupNo();
			List<AttachmentVO> attachFileList =  noticeMapper.selectEmpNoticeDetailFile(attachmentGroupNo);
			empNoticeVO.setAttachFileList(attachFileList);
		}
		return empNoticeVO;
	}

	// 상세조회 - 첨부파일 조회 원본
//	@Override
//	public AttachmentVO selectEmpNoticeDetailFile(int attachmentGroupNo) {
//		List<AttachmentVO> attachmentList = noticeMapper.selectEmpNoticeDetailFile(attachmentGroupNo);
//		if (attachmentList != null && !attachmentList.isEmpty()) {
//			return attachmentList;
//		}
//		return null;
//	}


	/**
	 * 글 수정 결과 반환 (원본)
	 */
	@Override
	public ServiceResult updateNotice(
			HttpServletRequest req
			, EmpNoticeVO empNoticeVO) {
		ServiceResult result = null;
		log.info("[서비스][updateNotice] 시작");
		
		if(empNoticeVO != null) {	// 등록할 글 정보가 존재한다면
			log.info("[서비스][updateNotice] empNoticeVO 있음!");

			// 첨부파일 있는지 확인
			log.info("[서비스][updateNotice] empNoticeVO.getAttachFileList(): " + empNoticeVO.getAttachFileList());
			List<AttachmentVO> attachFileList = empNoticeVO.getAttachFileList();
			log.info("[서비스][updateNotice] attachFileList: " + attachFileList);
			
			if(attachFileList != null && !attachFileList.isEmpty()) {	// 첨부파일이 있으면
//			if(ObjectUtils.isEmpty(attachFileList)) {	// 첨부파일이 있으면
				log.info("[서비스][updateNotice] 첨부파일 있음 확인!");
		
				// (기존 파일 삭제하는 로직 자리)
				// attachmentGroupNo로 attachment와 attachmentGroup에서 파일을 지우자
				// 그 후 새 파일 업로드 & 새 그룹 넘버 받고 => 글 내용 수정
				int attachmentGroupNoOld = empNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][updateNotice] 기존 첨부파일 그룹 넘버: " + attachmentGroupNoOld);
				// DB의 첨부파일 삭제(delete)
				noticeMapper.deleteOldAttachment(attachmentGroupNoOld);
				// DB의 첨부파일 그룹넘버 삭제처리(update)
				noticeMapper.deleteOldAttachGroupNo(attachmentGroupNoOld);
				// VO에 저장된 그룹넘버 초기화
				empNoticeVO.setAttachmentGroupNo(0);
		
				// (새 첨부파일 업로드)
				// (VO이용) empAttachGroupNo 등록해서 가져오기
				noticeMapper.insertEmpAttachGroupNo(empNoticeVO);
				int attachmentGroupNo = empNoticeVO.getAttachmentGroupNo();
				log.info("[서비스][updateNotice] attachmentGroupNo " + attachmentGroupNo);
				// insert할 글 내용이 담긴 VO에 attachmentGroupNo 세팅
				empNoticeVO.setAttachmentGroupNo(attachmentGroupNo);
	
				if (attachmentGroupNo > 0) {
					log.info("[서비스][updateNotice] attachmentGroupNo > 0 일때 ");
					try {
						// 파일 업로드 메서드 실행
						uploadEmpNoticeFile(
								attachFileList, attachmentGroupNo, req);
					}catch(Exception e) {
	//					e.printStackTrace();
						log.error("[서비스][updateNotice] 파일 업로드 과정 중 문제 발생!", e);
					}
	
				}	// if 'attachmentGroupNo등록' 성공했다면 -- 끝
				log.info("[서비스][updateNotice] 파일첨부 if 끝!");
			}	// 첨부파일 첨부 끝
		
		// (기존 로직: 수정 게시글 등록)
		
			int status = noticeMapper.updateNotice(empNoticeVO);
			if(status > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	/**
	 * 글 수정 결과 반환 (modal용)
	 */
	@Override
	public ServiceResult updateNoticeModal(EmpNoticeVO empNoticeVO) {
		ServiceResult result = null;
		int status = noticeMapper.updateNotice(empNoticeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	/**
	 * 글 삭제 처리
	 */
	@Override
	public ServiceResult deleteNotice(
//			HttpServletRequest req, 
			int empNoticeNo
			, int attachmentGroupNo) {
		ServiceResult result = null;
		log.info("[서비스][deleteNotice] empNoticeNo: " + empNoticeNo);
		log.info("[서비스][deleteNotice] attachmentGroupNo: " + attachmentGroupNo);
		if(attachmentGroupNo != 0) {	// 첨부파일 있으면 삭제
			noticeMapper.deleteOldAttachment(attachmentGroupNo);
			noticeMapper.deleteOldAttachGroupNo(attachmentGroupNo);
		}
		// 글 삭제 처리
		int status = noticeMapper.deleteNotice(empNoticeNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}


}
