package kr.or.ddit.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.equipment.listController;
import kr.or.ddit.service.IDocumentStorageService;
import kr.or.ddit.vo.DiagnosisPaperVO;
import kr.or.ddit.vo.DocumentStorageVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/document")
public class DocumentStorageCotroller {
	
	@Inject
	IDocumentStorageService documentService;
	
	//전체 문서함 리스트
	@GetMapping("/getList")
	public String showDocumentStorage(Model model) {
		
		//환부리스트
		List<DocumentStorageVO> documentList = documentService.getList();
		
		//진단서리스트
		List<DiagnosisPaperVO> diagnosisPaperList = documentService.getDiagnosisPaperList();
		
		//방사선 이미지 리스트
		List<DocumentStorageVO> radiationList = documentService.getradiationList();
		
		model.addAttribute("documentList",documentList);
		model.addAttribute("diagnosisPaperList",diagnosisPaperList);
		model.addAttribute("radiationList",radiationList);
		
		return "admin/documentStorage";
	}
	
	//검색환자 정보
	@ResponseBody
	@PostMapping("/getPatntDocument")
	public ResponseEntity<Map<String,Object>> getPatntDocument(@RequestBody Map<String, Integer> map){
		
		int patntNo = map.get("patntNo");
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<MemberVO> memberChartList = documentService.getPatntInfo(patntNo);
		
		resultMap.put("patntInfo", memberChartList);
		
		return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK );
	}
	
	//선택 접수번호에 해당하는 파일들
	@ResponseBody
	@PostMapping("/getPatntFile")
	public ResponseEntity<Map<String,Object>> getPatntFile(@RequestBody Map<String, Integer> map){
		
		int receiptNo = map.get("receiptNo");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//환부리스트
		List<DocumentStorageVO> chartFileList = documentService.getSelChartImgList(receiptNo);
		
		//진단서리스트
		List<DiagnosisPaperVO> diagnosisPaperList = documentService.getSelDiagnosisPaperList(receiptNo);
		
		//방사선 리스트
		List<DocumentStorageVO> radiationList = documentService.getSelRadiagionList(receiptNo);
		
		resultMap.put("chartFileList", chartFileList);
		resultMap.put("diagnosisPaperList", diagnosisPaperList);
		resultMap.put("radiationList", radiationList);
		
		return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK );
	}
	
	
	
}
