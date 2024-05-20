package kr.or.ddit.controller.notice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IPatientNoticeService;
import kr.or.ddit.vo.PaginationVO;
import kr.or.ddit.vo.PatientNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/patient/notice")
public class PatientNoticeController {
	
	@Inject
	private IPatientNoticeService noticeService;

	/**
	 * 서버에 저장되어 있는 업로드 경로 
	 * 클라이언트 (브라우저) 에서는 접근이 불가능 하다.
	 */
	@Resource(name = "uploadPath")
	private String resourcePath;

	/**
	 * 서버에 저장되어 있는 파일 경로와 파일 명을 파라메터로 넘겨서 바이너리 코드로 전달
	 * @param filePath
	 * @param fileName
	 * @return byte[]
	 * @throws IOException
	 */
	@RequestMapping(value = "/imageView.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public @ResponseBody ResponseEntity<byte[]> imageView(

			@RequestParam(name = "filePath", required = false) String filePath,
			@RequestParam(name = "fileName", required = false) String fileName

	) throws IOException {
		
		// 파일을 화면에 출력을 하고자 할때 클라이언트에서 요청된 파일명으로 출력이 되도록 해더 정보를 변경
		HttpHeaders headers = new HttpHeaders();
		// 첨부파일이라는 해더 정보에 주입
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 파일명이 보이도록 처리
		headers.add("Content-Disposition", "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		// FileUtils.readFileToByteArray = 서버에 저장되어 있는 파일정보를 읽어서 byte 배열로 변환을 하여서 요청된 클라이언트에게 반환을 한다.
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(
				
				FileUtils.readFileToByteArray(new File(resourcePath + filePath, fileName)),
				headers, HttpStatus.CREATED
				
				);
		return entity;

	}

	/**
	 * 전체 공지사항: 목록 표시
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String getPatntNoticeList (
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("[컨트롤러][getPatntNoticeList] 실행");
		PaginationVO<PatientNoticeVO> pagingVO = new PaginationVO<PatientNoticeVO>();

		// 검색 기능 자리
		if(StringUtils.isNotBlank(searchWord)) {
			log.info("[컨트롤러][getPatntNoticeList] 검색어 if절 내부");
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}

		pagingVO.setCurrentPage(currentPage);
		int totalRecord = noticeService.getPatntNoticeCount(pagingVO);
		log.info("[컨트롤러][getPatntNoticeList] totalRecord? " + totalRecord);
		pagingVO.setTotalRecord(totalRecord);

		List<PatientNoticeVO> dataList = noticeService.getPatntNoticeList(pagingVO);
		log.info("[컨트롤러][getPatntNoticeList] 목록불러왔니? " + dataList);
		pagingVO.setDataList(dataList);

		model.addAttribute("pagingVO", pagingVO);
		return "patntNotice/patntNoticeList";
	}
	
	
	/**
	 * 전체 공지사항 글쓰기 화면으로 이동
	 * @return String (경로)
	 */
	@GetMapping("/form")
	public String getPatntNoticeForm () {
		log.info("[컨트롤러][getPatntNoticeForm] 실행");
		return "patntNotice/patntNoticeForm";
	}
	
	/**
	 * 전체 공지사항 글쓰기 등록 처리
	 * @param patntNoticeVO
	 * @param model
	 * @return String (경로)
	 */
	@PostMapping("/insert.do")
	public String registerPatntNotice (
			PatientNoticeVO patntNoticeVO
			, Model model
			, HttpServletRequest req
			) {
		log.info("[컨트롤러][registerPatntNotice] 실행");
		String goPage = "";
		log.info("[컨트롤러][registerPatntNotice] Fix? " + patntNoticeVO.getPatntNoticeFix());
		log.info("[컨트롤러][registerPatntNotice] VO: " + patntNoticeVO);
		ServiceResult result = noticeService.postPatntNotice(patntNoticeVO, req);

		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/patient/notice/detail?patntNoticeNo=" + patntNoticeVO.getPatntNoticeNo();
			log.info("[컨트롤러][registerPatntNotice] 새 글 등록 성공");
		}else {
			log.info("[컨트롤러][registerPatntNotice] 등록 실패");
			goPage = "patntNotice/form";
		}
		return goPage;
	}
	
	
	/**
	 * 전체 공지사항 상세보기 띄우기
	 * @param patntNoticeNo
	 * @param model
	 * @return String (경로)
	 */
	@GetMapping("/detail")
	public String getPatntNoticeDetailPage(
			int patntNoticeNo
			, Model model
			) {
		log.info("[컨트롤러][getPatntNoticeDetail] 실행: patntNoticeNo는? " + patntNoticeNo);
		String goPage = "";
		PatientNoticeVO patntNoticeVO = noticeService.selectPatntNoticeDetail(patntNoticeNo);
		log.info("[getPatntNoticeDetail] VO값은? " + patntNoticeVO);
		model.addAttribute("patntNoticeVO", patntNoticeVO);
		goPage = "patntNotice/patntNoticeDetail";
		return goPage;
	}

	/**
	 * 전체 공지사항 글 수정 화면이동 및 업데이트 표시
	 * @param patntNoticeNo
	 * @param model
	 * @return String (경로)
	 */
	@GetMapping("/update")
	public String getPatntNoticeUpdateForm(
			int patntNoticeNo
			, Model model
			) {
		log.info("[컨트롤러][getPatntNoticeUpdateForm] 실행");
		PatientNoticeVO patntNoticeVO = noticeService.selectPatntNoticeDetail(patntNoticeNo);
		log.info("[컨트롤러][getPatntNoticeUpdateForm] patntNoticeVO: " + patntNoticeVO);
		model.addAttribute("notice", patntNoticeVO);
		model.addAttribute("status", "u");
		return "patntNotice/patntNoticeForm";
	}




	/**
	 * [일반] 글 수정 처리
	 * @param patntNoticeVO
	 * @param model
	 * @param req
	 * @param ra
	 * @return String (경로)
	 */
	@PostMapping("/update.do")
	public String updatePatntNoticeDetail(
			PatientNoticeVO patntNoticeVO
			, HttpServletRequest req
			, RedirectAttributes ra
			, Model model
			) {
		log.info("[컨트롤러][updatePatntNoticeDetail] 실행: Fix? " + patntNoticeVO.getPatntNoticeFix());
		log.info("[컨트롤러][updatePatntNoticeDetail] 첨부파일 그룹넘버: " + patntNoticeVO.getAttachmentGroupNo());
		String goPage = "";
		ServiceResult result = noticeService.modifyPatntNoticeDetail(req, patntNoticeVO);
		if(result.equals(ServiceResult.OK)) {
			log.info("[updatePatntNoticeDetail] 수정 성공");
			ra.addFlashAttribute("message", "공지사항 수정이 완료되었습니다.");
			model.addAttribute("status", "");
			goPage = "redirect:/patnt/notice/detail?patntNoticeNo="+patntNoticeVO.getPatntNoticeNo();
		}else {
			log.info("[updatePatntNoticeDetail] 수정 실패");
			model.addAttribute("patntNoticeVO", patntNoticeVO);
			model.addAttribute("message", "수정에 실패했습니다. 다시 시도해주세요."	);
			model.addAttribute("status", "u");
			goPage = "patntNotice/patntNoticeForm";
		}
		return goPage;
	}



	/**
	 * [일반] 직원용 공지사항 게시글 삭제 처리 (동기 방식)
	 * @param patntNoticeNo
	 * @param req
	 * @param ra
	 * @param model
	 * @return String (경로)
	 */
	@RequestMapping("/delete")
	public String deletePatntNoticeDetail(
			@RequestParam(required = true) int patntNoticeNo
			, @RequestParam(required = false) int attachmentGroupNo
			, RedirectAttributes ra
			, Model model
			) {
		log.info("[컨트롤러][deletePatntNoticeDetail] patntNoticeNo: " + patntNoticeNo);
		log.info("[컨트롤러][deletePatntNoticeDetail] attachmentGroupNo: " + attachmentGroupNo);
		String goPage = "";
		ServiceResult result = noticeService.deletePatntNoticeDetail(
						patntNoticeNo, attachmentGroupNo);
		if(result.equals(ServiceResult.OK)) {
			log.info("[deleteNoticeDetail] 삭제 성공");
			ra.addFlashAttribute("message", "공지사항이 삭제되었습니다.");
			goPage = "redirect:/patient/notice/list";
		}else {
			log.info("[deleteNoticeDetail] 삭제 실패");
			ra.addFlashAttribute("message", "삭제하지 못했습니다. 다시 시도해주세요.");
			goPage = "redirect:/patient/notice/detail?patntNoticeNo="+patntNoticeNo;
		}
		return goPage;
	}

	/**
	 * [ajax] 직원용 공지사항 게시글 삭제 처리
	 * @param patntNoticeNo
	 * @param model
	 * @return ResponseEntity<Integer>
	 */
//	@PostMapping("/delete.do")
//	public ResponseEntity<Integer> deletePatntNoticeModal(
//			@RequestParam(name = "patntNoticeNo", defaultValue = "0") int patntNoticeNo,
//			@RequestParam(name = "attachmentGroupNo", defaultValue = "0") int attachmentGroupNo,
//			Model model
//			){
//		log.info("[컨트롤러][deleteNoticeModal] patntNoticeNo: " + patntNoticeNo);
//		log.info("[컨트롤러][deleteNoticeModal] attachmentGroupNo: " + attachmentGroupNo);
//		ServiceResult result = noticeService.deleteNotice(patntNoticeNo, attachmentGroupNo);
//		if(result.equals(ServiceResult.OK)) {
//			log.info("[deleteNoticeDetail] 삭제 성공");
//			return ResponseEntity.ok().body(1); // 삭제된 항목의 수 반환
//		}else {
//			log.info("[deleteNoticeModal] 삭제 실패");
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0); // 실패시 0 반환
//		}
//	}
	
	
}
