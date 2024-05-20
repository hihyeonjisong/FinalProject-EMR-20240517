package kr.or.ddit.controller.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
// import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	public static String uploadFile(
			String uploadPath, String originalFileName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		
		// UUID_원본파일명 구성
		String savedName = uuid.toString() + "_" + originalFileName;
		
		// 2024/03/06 폴더 경로를 만들고, /2024/03/06 폴더 경로를 리턴한다.
		String savedPath = calcPath(uploadPath);
		
		// 배포된 서버 업로드 경로 + /2024/03/06/ + UUID_원본파일명으로 File target을 하나 만듬
		File target = new File(uploadPath + savedPath, savedName);
		// 위에서 만들어진 경로와 파일명을 가지고 파일 복사를 진행한다.
		FileCopyUtils.copy(fileData, target);
		String formatName = originalFileName.substring(
				originalFileName.lastIndexOf(".") + 1); // 확장자 추출
		
		// \2024\03\06 경로를  /경로로 변경후 원본 파일명의 경로까지 붙인다.
		String uploadedFileName = savedPath.replace(File.separatorChar, '/') + "/" + savedName;
		
		// 확장자가 이미지 파일이면 s_가 붙은 파일의 썸네일 이미지 파일을 생성한다.
		
		  if (MediaUtils.getMediaType(formatName) != null) { 
			  makeThumbnail(uploadPath,savedPath, savedName); 
			  }
		 
		return uploadedFileName;
	}

	private static void makeThumbnail(String uploadPath, String savedPath, String savedName) throws Exception {
		// 썸네일 이미지를 만들기 위해 원본 이미지를 읽는다.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + savedPath, savedName));
		
		// 썸네일 이미지를 만들기 위한 설정을 진행
		// Method.AUTOMETIC : 최쇠 시간 내애 가장 잘 보이는 이미지를 얻기 위한 사용 방식
		// Mode.FIT_TO_HEIGHT : 이미지 방향과 상관없이 주어진 높이 내에서 가장 잘 맞는 이미지로 계산
		// targetSize : 값 100, 정사각형 사이즈로 100 x 100
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + savedPath + File.separator + "s_" + savedName;
		String formatName = savedName.substring(savedName.lastIndexOf(".") + 1);
		// s_가 붙은 썸네일 이미지 파일(경로 + s_파일명)
		File newFile = new File(thumbnailName);
		
		// s_가 붙은 썸네일 이미지가 만들어진다.
		ImageIO.write(destImg, formatName, newFile);
	}

	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR); // /2024
		// DecimalFormat("00") : 두자리에서 빈자리는 0으로 채움
		String monthPath = yearPath + File.separator + 
				new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // /2024/03
		String datePath = monthPath + File.separator + 
				new DecimalFormat("00").format(cal.get(Calendar.DATE)); // /2024/03/06
		// 년월일 폴더 구조에 의한 폴더 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}

	// 가변인자
	// 키워드 '...'를 사용한다
	// [사용법]타입...변수명 형태로 사용
	// 순서대로 yearPath, monthPath, datePath가 배열로 들어가 처리
	public static void makeDir(String uploadPath, String...paths) {
		// /2024/03/06 폴더 구조가 존재한다면 폴더를 만들 필요가 없으니 return
		// 만들려던 폴더 구조가 이미 만들어져 있으니까 return
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			// /2024/03/06과 같은 경로에 각 폴더가 없으면 각각 만들어준다.
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
}
