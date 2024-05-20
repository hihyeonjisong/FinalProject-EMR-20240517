package kr.or.ddit.controller.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CKEditorImageUpload {

	// CKEditor 본문에 이미지 업로드
	@RequestMapping(value="/imageUpload.do")
	public String imageUpload(
			HttpServletRequest req
			, HttpServletResponse resp
			, MultipartHttpServletRequest multiFile
			) {
		// CKEditor 4: json 데이터를 구성해서 리턴
		JsonObject json = new JsonObject();	// Json 객체 생성 (gson)
		PrintWriter printWriter = null;		// 외부 응답으로 내보낼 객체 (io)
		OutputStream out = null;			// 본문에 추가할 이미지를 파일로 생성할 객체 (io)
		long limitSize = 1024 * 1024 * 10;	// 업로드 파일 최대 크기 (10MB)
		
		// CkEditor: key로 'upload' 사용
		MultipartFile file = multiFile.getFile("upload");
		
		// 파일이 반드시 존재하는 경우:
		// 1) 객체가 null이 아님, 2) 사이즈가 0보다 큼, 3) 파일명이 공백이 아님
		if(file != null && file.getSize() > 0 && 
				StringUtils.isNotBlank(file.getName())) {
			// 데이터의 MIME 타입이 'image/'를 포함한 이미지 파일인지 체크
			if(file.getContentType().toLowerCase().startsWith("image/")) {
				// 업로드한 파일 사이즈가 설정한 최대 크기보다 클 때
				if(file.getSize() > limitSize) {
					JsonObject jsonMsg = new JsonObject();
					JsonArray jsonArr = new JsonArray();
					jsonMsg.addProperty("message", "10MB 미만의 이미지만 업로드 가능합니다.");
					jsonArr.add(jsonMsg);
					json.addProperty("uploaded", 0);
					json.add("error", jsonArr.get(0));
					
					resp.setCharacterEncoding("UTF-8");
					try {
						printWriter = resp.getWriter();
					} catch (IOException e) {
						e.printStackTrace();
						log.error("파일 용량 초과로 이미지 업로드 불가 ");
					}
					printWriter.println(json);
					
				}else {		// 업로드 제한 용량 이하의 이미지 파일일 때
					// 객체!=null + 파일사이즈>0 + 파일명!="" + 적정용량
					// 업로드 처리
					try {
						String fileName = file.getName();	// 파일명 획득
						byte[] bytes = file.getBytes();	// 파일 데이터 획득
						// 파일 업로드 경로: 나중에 변경 필요
						String uploadPath =	
								req.getServletContext().getRealPath("/resources/img");
						// 파일 경로 생성 설정
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						// UUID 활용해 파일명 지정 (나중에 경로 바꾸면서 변경?)
						fileName = UUID.randomUUID().toString() + "_" + fileName;
						uploadPath += "/" + fileName + ".jpg";
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/img/"
								+ fileName + ".jpg";
						
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						
						printWriter.println(json);
					}catch (IOException e) {
						e.printStackTrace();
						log.error("파일 업로드 도중 오류 발생");
					}finally {
						if(out != null) {
							try {
								out.close();
							} catch (IOException e) {
								e.printStackTrace();
								log.error("파일 업로드 과정 종료 중 오류 발생");
							}
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}	// finally 닫음
				
				}	// 파일용량if절 else 닫음

			}	// if 이미지파일 닫음
		}	// if 파일이 존재하는 경우 닫음
		return null;	// 비정상 상황에만 null 리턴
	}	// imageUpload 클래스 닫음
}
