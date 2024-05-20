package kr.or.ddit.controller.attachment;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.utils.MediaUtils;
import kr.or.ddit.controller.utils.UploadFileUtils;
import kr.or.ddit.service.IMainChartService;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.impl.MainChartServiceImpl;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RocRecordVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/file")
@Controller
@Slf4j
public class FileController {

	@Inject
	private IMemberService memberService;
	
	@Inject
	private IMainChartService mainChartService;
	
	@Resource(name="uploadPath")
	private String resourcePath;
	
	@PostMapping(value="/uploadAjax" , produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws IOException, Exception{
		log.info("originalFileName>>> " + file.getOriginalFilename());
		String savedName = UploadFileUtils.uploadFile(resourcePath + "/profileImg", file.getOriginalFilename(), file.getBytes());
		log.info(savedName);
		return new ResponseEntity<String>(savedName,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/showprofile/{memNo}")
	public ResponseEntity<byte[]> showProfile(@PathVariable int memNo) throws IOException{
		MemberVO member = memberService.getMemberInfo(memNo);
		String path = member.getAttachPath() + member.getAttachName();
		return display(path);
	}
	
	
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> display(String fileName) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		log.info("fileName >>> "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream(resourcePath + "/profileImg" + fileName);
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Dispostion", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	
	}
	/**
	 * 차트에서 이미지
	 * @author jjinny
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@PostMapping(value="/uploadAjaxChart" , produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjaxChart(MultipartFile file) throws IOException, Exception{
		log.info("originalFileName>>> " + file.getOriginalFilename());
		String savedName = UploadFileUtils.uploadFile(resourcePath + "/chart", file.getOriginalFilename(), file.getBytes());
		log.info(savedName);
		
		return new ResponseEntity<String>(savedName,HttpStatus.OK);
	}
	
	/**
	 * 차트에서 이미지
	 * @author jjinny
	 * @param fileName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/displayFileChart", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFileChart(String fileName){
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName(dispalyFile) : " + fileName);
		
		//확장자명
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		//ex)image/png
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			//요청된 파일을 읽기 위한 파일 입력 스트림을 생성
			in = new FileInputStream(resourcePath + "/chart" + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				//파일을 다운로드 받게 해주는 코드
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" +
				 new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
						headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	}

	//방사선 이미지
	@ResponseBody
	@GetMapping("/showRadiationFile/{attachNo}")
	public ResponseEntity<byte[]> showRadiationFile(@PathVariable int attachNo) throws IOException{
		RocRecordVO rocRecordVO = mainChartService.getRadiationFile(attachNo);
		String path = rocRecordVO.getAttachPath() +"/"+ rocRecordVO.getAttachName();
		return displayRadiationFile(path);
	}
	
	
	//방사선 이미지
	@ResponseBody
	@GetMapping("/displayRadiationFile")
	public ResponseEntity<byte[]> displayRadiationFile(String fileName) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		log.info("fileName >>> "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream(resourcePath + fileName);
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Dispostion", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	
	}
	//문서함에서 이미지
	@ResponseBody
	@RequestMapping(value = "/displayDocumentFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayDocumentFile(String fileName){
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName(dispalyFile) : " + fileName);
		
		//확장자명
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		//ex)image/png
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			//요청된 파일을 읽기 위한 파일 입력 스트림을 생성
			in = new FileInputStream(resourcePath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				//파일을 다운로드 받게 해주는 코드
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" +
				 new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
						headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	}



	
	
}
