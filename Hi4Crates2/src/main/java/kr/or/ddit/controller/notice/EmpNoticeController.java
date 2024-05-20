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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IEmpNoticeService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/emp/notice")
@Slf4j
public class EmpNoticeController {
	// 리턴할 때 tiles는 main/ 으로 시작하기
	@Inject
	private IEmpNoticeService noticeService;

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
	 * 직원용 공지사항 글쓰기 화면으로 이동
	 * @return String (경로)
	 */
	@GetMapping("/form")
	public String getEmpNoticeForm () {
		log.info("[getEmpNoticeForm] 실행");
		return "empNotice/empNoticeForm";
	}

	/**
	 * [일반] 직원용 공지사항 글쓰기 등록 처리
	 * @param empNoticeVO
	 * @param model
	 * @return String (경로)
	 */
	@PostMapping("/insert.do")
	public String registerEmpNotice (
			EmpNoticeVO empNoticeVO
			, Model model
			, HttpServletRequest req
			) {
		log.info("[컨트롤러][registerEmpNotice] 실행");
		String goPage = "";
		log.info("[컨트롤러][registerEmpNotice] Fix? " + empNoticeVO.getEmpNoticeFix());
		log.info("[컨트롤러][registerEmpNotice] VO: " + empNoticeVO);
		ServiceResult result = noticeService.postEmpNotice(req, empNoticeVO);

		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/emp/notice/detail?empNoticeNo=" + empNoticeVO.getEmpNoticeNo();
			log.info("[컨트롤러][registerEmpNotice] 새 글 등록 성공");
		}else {
			log.info("[컨트롤러][registerEmpNotice] 등록 실패");
			goPage = "empNotice/form";
		}
		return goPage;
	}

	/**
	 * [ajax] 직원용 공지사항 새 글 등록 처리
	 * @param req
	 * @param empNoticeVO
	 * @return ResponseEntity<String>
	 */
//	@PostMapping("/create.do")
//	public ResponseEntity<String> createEmpNoticeDetail (
//			HttpServletRequest req,
//			EmpNoticeVO empNoticeVO
////			, RedirectAttributes ra
//			){
//		log.info("[createEmpNoticeDetail] 실행!");
//		log.info("[createEmpNoticeDetail] empNoticeFile: " + empNoticeVO.getEmpNoticeFile());
//
//		log.info("[createEmpNoticeDetail] 새글등록 Fix?: " + empNoticeVO.getEmpNoticeFix());
//		log.info("[createEmpNoticeDetail] 새글등록 VO: " + empNoticeVO);
//
//		// 파일 등록 처리
//		ServiceResult result = noticeService.postEmpNotice(req, empNoticeVO);
//		log.info("[createEmpNoticeDetail] 새글등록 result: " + result);
//		// 등록 처리 결과에 따라 반환
//		if(result.equals(ServiceResult.OK)) {
//			log.info("[createEmpNoticeDetail] 새 글 등록 성공");
////			ra.addFlashAttribute("message", "공지사항 등록이 완료되었습니다.");
//			// VO 말고 flag로 내보내기 ("등록 성공했습니다"만!)
////			return ResponseEntity.ok().body(empNoticeVO);
//			return ResponseEntity.ok().body("upload_success");
//		}else {
//			log.info("[createEmpNoticeDetail] 등록 실패");
////			model.addAttribute("empNoticeVO", empNoticeVO);
////			model.addAttribute("message", "공지사항 새 글 등록에 실패했습니다. 다시 시도해주세요." );
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
//		}
//
//	}

	/**
	 * 직원용(내부) 공지사항: 목록 표시
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String getEmpNoticeList (
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("[getEmpNoticeList] 실행");
		PaginationVO<EmpNoticeVO> pagingVO = new PaginationVO<EmpNoticeVO>();

//		log.info("[getEmpNoticeList] 검색어가 있는 경우?"
//				+ searchWord + " | " + searchType);
		// 검색 기능 추가 자리
		if(StringUtils.isNotBlank(searchWord)) {
			log.info("[getEmpNoticeList] 검색어 if절 내부");
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}

		pagingVO.setCurrentPage(currentPage);
		int totalRecord = noticeService.getEmpNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<EmpNoticeVO> dataList = noticeService.getEmpNoticeList(pagingVO);
		pagingVO.setDataList(dataList);

		model.addAttribute("pagingVO", pagingVO);
		return "empNotice/empNoticeList";
	}

	// 직원용 공지사항 상세보기 띄우기 (비동기)
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public ResponseEntity<EmpNoticeVO> getEmpNoticeDetail(
			int empNoticeNo
			) {
		log.info("[getEmpNoticeDetail] 실행: empNoticeNo는? " + empNoticeNo);
		EmpNoticeVO empNoticeVO = noticeService.selectEmpNoticeDetail(empNoticeNo);
		return ResponseEntity.ok(empNoticeVO);
	}

	
	/**
	 * [일반] 직원용 공지사항 상세보기 띄우기
	 * @param empNoticeNo
	 * @param model
	 * @return String (경로)
	 */
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String getEmpNoticeDetailPage(
			int empNoticeNo
			, Model model
			) {
		log.info("[getEmpNoticeDetail] 실행: empNoticeNo는? " + empNoticeNo);
		String goPage = "";
		EmpNoticeVO empNoticeVO = noticeService.selectEmpNoticeDetail(empNoticeNo);
		log.info("[getEmpNoticeDetail] VO값은? " + empNoticeVO);
		model.addAttribute("empNoticeVO", empNoticeVO);
		goPage = "empNotice/empNoticeDetail";
		return goPage;
	}

	/**
	 * 직원용 공지사항 글 수정 화면이동 및 업데이트 표시
	 * @param empNoticeNo
	 * @param model
	 * @return String (경로)
	 */
	@GetMapping("/update")
	public String getEmpNoticeUpdateForm(int empNoticeNo, Model model) {
		log.info("[컨트롤러][getEmpNoticeUpdateForm] 실행");
		EmpNoticeVO empNoticeVO = noticeService.selectEmpNoticeDetail(empNoticeNo);
		log.info("[컨트롤러][getEmpNoticeUpdateForm] empNoticeVO: " + empNoticeVO);
		model.addAttribute("notice", empNoticeVO);
		model.addAttribute("status", "u");
		return "empNotice/empNoticeForm";
	}

	/**
	 * [ajax] 글 수정 버튼 눌렀을 때 status 처리 (공지사항 상세보기 모달 창에서)
	 * @param model
	 * @return ResponseEntity<String>
	 */
//	@RequestMapping("/status.do")
//	public ResponseEntity<String> changeStatusToU(
//			Model model
//			) {
//		log.info("[changeStatusToU] 실행");
//		model.addAttribute("status", "u");
//		String status = model.getAttribute("status").toString();
//		return ResponseEntity.ok().body(status);
//	}

	/**
	 * [ajax] 직원용 공지사항 등록시 status null 처리
	 * @param model
	 * @return ResponseEntity<String>
	 */
//	@RequestMapping("/reset.do")
//	public ResponseEntity<String> resetStatus(
//			Model model
//			) {
//		log.info("[resetStatus] 실행");
//		model.addAttribute("status", "");
//		String status = model.getAttribute("status").toString();
//		return ResponseEntity.ok().body(status);
//	}

	/**
	 * [일반] 글 수정 처리
	 * @param empNoticeVO
	 * @param model
	 * @param req
	 * @param ra
	 * @return String (경로)
	 */
	@PostMapping("/update.do")
	public String updateEmpNoticeDetail(
			EmpNoticeVO empNoticeVO,
			Model model,
			HttpServletRequest req,
			RedirectAttributes ra
			) {
		log.info("[컨트롤러][updateEmpNoticeDetail] 실행: Fix? " + empNoticeVO.getEmpNoticeFix());
		log.info("[컨트롤러][updateEmpNoticeDetail] 첨부파일 그룹넘버: " + empNoticeVO.getAttachmentGroupNo());
		String goPage = "";
		ServiceResult result = noticeService.updateNotice(req, empNoticeVO);
		if(result.equals(ServiceResult.OK)) {
			log.info("[updateEmpNoticeDetail] 수정 성공");
			ra.addFlashAttribute("message", "공지사항 수정이 완료되었습니다.");
			model.addAttribute("status", "");
			goPage = "redirect:/emp/notice/detail?empNoticeNo="+empNoticeVO.getEmpNoticeNo();
		}else {
			log.info("[updateEmpNoticeDetail] 수정 실패");
			model.addAttribute("empNoticeVO", empNoticeVO);
			model.addAttribute("message", "수정에 실패했습니다. 다시 시도해주세요."	);
			model.addAttribute("status", "u");
			goPage = "empNotice/empNoticeForm";
		}
		return goPage;
	}

	/**
	 * [ajax] 직원용 공지사항 글 수정 처리
	 * @param empNoticeVO
	 * @param model
	 * @param ra
	 * @return ResponseEntity<EmpNoticeVO>
	 */
//	@PostMapping("/edit.do")
//	 public ResponseEntity<EmpNoticeVO> editEmpNoticeModal
//	 		(
//	 		@RequestBody EmpNoticeVO empNoticeVO
//	 		, Model model
//	 		, RedirectAttributes ra
//	 		) {
//		log.info("[editEmpNoticeModal] 실행: Fix? " + empNoticeVO.getEmpNoticeFix());
////		log.info("[editEmpNoticeModal] VO: " + empNoticeVO);
//		ServiceResult result = noticeService.updateNoticeModal(empNoticeVO);
//		if(result.equals(ServiceResult.OK)) {
//			log.info("[editEmpNoticeModal] 수정 성공");
//			ra.addFlashAttribute("message", "공지사항 수정이 완료되었습니다.");
//			return ResponseEntity.ok().body(empNoticeVO);
//		}else {
//			log.info("[editEmpNoticeModal] 수정 실패");
//			model.addAttribute("empNoticeVO", empNoticeVO);
//			model.addAttribute("message", "수정에 실패했습니다. 다시 시도해주세요." );
//			model.addAttribute("status", "u");
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
//		}
//	}


	/**
	 * [일반] 직원용 공지사항 게시글 삭제 처리 (동기 방식)
	 * @param empNoticeNo
	 * @param req
	 * @param ra
	 * @param model
	 * @return String (경로)
	 */
	@RequestMapping("/delete")
	public String deleteEmpNoticeDetail(
			int empNoticeNo
			, int attachmentGroupNo
//			, HttpServletRequest req
			, RedirectAttributes ra
			, Model model
			) {
		log.info("[컨트롤러][deleteEmpNoticeDetail] empNoticeNo: " + empNoticeNo);
		log.info("[컨트롤러][deleteEmpNoticeDetail] attachmentGroupNo: " + attachmentGroupNo);
		String goPage = "";
		ServiceResult result = noticeService.deleteNotice(empNoticeNo, attachmentGroupNo);
		if(result.equals(ServiceResult.OK)) {
			log.info("[deleteNoticeDetail] 삭제 성공");
			ra.addFlashAttribute("message", "공지사항이 삭제되었습니다.");
			goPage = "redirect:/emp/notice/list";
		}else {
			log.info("[deleteNoticeDetail] 삭제 실패");
			ra.addFlashAttribute("message", "삭제하지 못했습니다. 다시 시도해주세요.");
			goPage = "redirect:/emp/notice/detail?empNoticeNo="+empNoticeNo;
		}
		return goPage;
	}

	/**
	 * [ajax] 직원용 공지사항 게시글 삭제 처리
	 * @param empNoticeNo
	 * @param model
	 * @return ResponseEntity<Integer>
	 */
	@PostMapping("/delete.do")
	public ResponseEntity<Integer> deleteEmpNoticeModal(
			@RequestParam(name = "empNoticeNo", defaultValue = "0") int empNoticeNo,
			@RequestParam(name = "attachmentGroupNo", defaultValue = "0") int attachmentGroupNo,
			Model model
			){
		log.info("[컨트롤러][deleteNoticeModal] empNoticeNo: " + empNoticeNo);
		log.info("[컨트롤러][deleteNoticeModal] attachmentGroupNo: " + attachmentGroupNo);
		ServiceResult result = noticeService.deleteNotice(empNoticeNo, attachmentGroupNo);
		if(result.equals(ServiceResult.OK)) {
			log.info("[deleteNoticeDetail] 삭제 성공");
			return ResponseEntity.ok().body(1); // 삭제된 항목의 수 반환
		}else {
			log.info("[deleteNoticeModal] 삭제 실패");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0); // 실패시 0 반환
		}
	}

}

