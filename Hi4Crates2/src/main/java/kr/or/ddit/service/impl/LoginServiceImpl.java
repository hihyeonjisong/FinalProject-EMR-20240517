package kr.or.ddit.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.AuthMapper;
import kr.or.ddit.mapper.IFileMapper;
import kr.or.ddit.mapper.IMainAdminMapper;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.service.ILoginService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.MemberAuth;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements ILoginService {
	
	@Inject
	public PasswordEncoder pe;
	
	@Inject
	private IFileMapper fileMapper;
	
	@Inject
	private ILoginService loginService;
	
	@Inject
	public MemberMapper testMapper;
	
	@Inject
	public IMainAdminMapper adminMapper;
	
	@Inject
	public AuthMapper authMapper;
	
	@Override
	public ServiceResult signup(MemberVO tm, HttpServletRequest req) {
		tm.setMemPw(pe.encode(tm.getMemPw()));
		tm.setMemRegno1(tm.getMemRegno().split("-")[0]);
		tm.setMemRegno2(tm.getMemRegno().split("-")[1]);
		
		int checkRegno = Integer.parseInt(tm.getMemRegno2().substring(0,1));
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		log.info(year+"");
		int age = 0;
		if(checkRegno ==1 || checkRegno ==2) {
			age = Integer.parseInt(tm.getMemRegno1().substring(0,2));
			age = age + 1900;
			age = year - age + 1;
			if(checkRegno == 1) tm.setMemGender("남성");
			if(checkRegno == 2) tm.setMemGender("여성");
		}else if(checkRegno ==3 || checkRegno == 4) {
			age = Integer.parseInt(tm.getMemRegno1().substring(0,2));
			age = age + +2000;
			age = year - age + 1;
			if(checkRegno == 3) tm.setMemGender("남성");
			if(checkRegno == 4) tm.setMemGender("여성");
		}
		tm.setMemAge(age);
		
		log.info(tm.getMemGender());
		log.info(tm.getMemTel());
		
		
		MultipartFile file = tm.getFile();
		log.info("타입 : "+file.getContentType());
		log.info("이름 : " +file.getName());
		log.info("사이즈 : "+file.getSize());
		log.info("저장이름 : "+tm.getImgData());
		AttachmentVO fileVO = new AttachmentVO();
		
		fileVO.setAttachType(file.getContentType());
		fileVO.setAttachName(tm.getImgData().substring(tm.getImgData().lastIndexOf("/")+1));
		fileVO.setAttachSize(file.getSize());
		fileVO.setAttachPath(tm.getImgData().substring(0, tm.getImgData().lastIndexOf("/")+1));
		fileVO.setAttachLoc("/profileImg");
		
		fileMapper.attachmentGroup(fileVO);
		fileMapper.uploadProfileImg(fileVO);
		tm.setAttachmentGroupNo(fileVO.getAttachmentGroupNo());
		int result = testMapper.signup(tm);
		
		
		// AUTH -> 대기중으로 만들기
		authMapper.insertEmpAuth(tm.getMemNo());
		
		if(result > 0 ) return ServiceResult.OK;
		else return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult checkId(String checkId) {
		
		int result = testMapper.checkId(checkId);
		
		if(result > 0) return ServiceResult.FAILED;
		else return ServiceResult.OK;
	}

	@Override
	public String getAccessTokenFromKakao(String client_id, String code) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id="
				+client_id+"&code=" + code;
		URL url = new URL(reqUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
		// json형태의 String을 map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
			
		log.info("Response Body " + result);
		
		String accessToken = (String) jsonMap.get("access_token");
		String refreshToken = (String) jsonMap.get("refresh_token");
		String scope = (String) jsonMap.get("scope");
		
		log.info("accessToken " +  accessToken);
		log.info("refreshToken " + refreshToken);
		log.info("scope " + scope);
		
		
		return accessToken;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String accessToken) throws Exception {

		// 로그인한 사용자 정보를 담을 hashMap
		// 사용자 정보 중 null인 것이 있을 수 있기 때문에 hashMap 사용
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		int responseCode = conn.getResponseCode();
		log.info("responseCode " + responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String line = "";
		String result = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		log.info("Request Body!!! : " + result);
		
		// json형태의 String을 map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
		});
		
		// 카카오 계정 정보를 가져와서 map으로 변환
		Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
		System.out.println("####kakao_account" + kakao_account);
		
		String id = (String) jsonMap.get("id").toString();	//id(숫자)
		String name = (String) kakao_account.get("name").toString();
		String email = kakao_account.get("email").toString();	// 이메일
		String phone = kakao_account.get("phone_number").toString();	// 휴대폰 번호 (+82 10-1111-1111)
		String birthYear = kakao_account.get("birthyear").toString();	// 태어난 연도
		String birthDay = kakao_account.get("birthday").toString();		// 태어난 날짜
		String gender = kakao_account.get("gender").toString();			// 성별
		
		String kakaoPhone = phone.replace("+82 ", "0");
		String kakaoRegNo1 = birthYear.substring(2) + birthDay;
		log.info("###주번앞자리" + kakaoRegNo1);
		String kakaoGender = "남자";
		if(gender == "female") {
			kakaoGender = "여자";
		}
		
		MemberVO kakaoMember = new MemberVO();
		kakaoMember.setMemId(id);
		kakaoMember.setMemName(name);
		kakaoMember.setMemEmail(email);
		kakaoMember.setMemTel(kakaoPhone);
		kakaoMember.setMemRegno1(kakaoRegNo1);
		kakaoMember.setMemGender(kakaoGender);
		kakaoMember.setMemPw("카카오로그인");
		kakaoMember.setMemRegno2("1234567");
		kakaoMember.setMemType("test");
		
		userInfo.put("id", id);
		userInfo.put("email", email);
		userInfo.put("name", name);
		userInfo.put("phone", phone);
		userInfo.put("birthyear", birthYear);
		userInfo.put("birthday", birthDay);
		
		System.out.println("서비스 userInfo" + userInfo);
		
		// 저장되어 있는지 확인
		MemberVO memberVO = loginService.findkakao(id);
		
		// result null 이면 저장 안되어있는거라서 정보를 저장.
		if(memberVO == null) {
			System.out.println("로그인 정보 없음");
			// 저장하기 위해 respository로 이동
			 int status = loginService.kakaoInsert(kakaoMember);
			// 정보 저장 후 컨트롤러에 정보를 보냄
			 log.info("##카카오 자동회원가입 성공 status" + status);
				// 이 순간부터 kakaoMember.getMemNo();
				int kakaoNo = kakaoMember.getMemNo();
				MemberVO member = new MemberVO();
				member.setMemNo(kakaoNo);
				MemberAuth auth = new MemberAuth();
				auth.setAuthName("ROLE_USER");
				auth.setMemNo(kakaoNo);
				authMapper.insertAuth(auth);
				adminMapper.enrollPatient(member);
		}else {
			 System.out.println("로그인 정보 있음");
		// 카카오로그인 정보가 있는 상태에서 바로 로그인 할 수 있게 해야함
		}
		
		
		return userInfo;
	}

	@Override
	public MemberVO findkakao(String memId) {
		MemberVO memberVo = testMapper.find(memId);
		return memberVo;
	}

	@Override
	public int kakaoInsert(MemberVO kakaoMember) {
		
		return testMapper.kakaoInsert(kakaoMember);
	}

	@Override
	public String findId(MemberVO memberVo) {
		//String id = testMapper.findId(memberVo).getMemId();
		return testMapper.findId(memberVo);
	}

	@Override
	public String checkCount(MemberVO memberVo) {
		
		return testMapper.checkCount(memberVo);
	}

	@Override
	public int updatePw(MemberVO memberVo) {
		memberVo.setMemPw(pe.encode(memberVo.getMemPw()));
		return testMapper.updatePw(memberVo);
	}

	@Override
	public ServiceResult pSignUp(MemberVO tm) {
		tm.setMemPw(pe.encode(tm.getMemPw()));
		tm.setMemRegno1(tm.getMemRegno().split("-")[0]);
		tm.setMemRegno2(tm.getMemRegno().split("-")[1]);
		
		int checkRegno = Integer.parseInt(tm.getMemRegno2().substring(0,1));
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		log.info(year+"");
		int age = 0;
		if(checkRegno ==1 || checkRegno ==2) {
			age = Integer.parseInt(tm.getMemRegno1().substring(0,2));
			age = age + 1900;
			age = year - age + 1;
			if(checkRegno == 1) tm.setMemGender("남성");
			if(checkRegno == 2) tm.setMemGender("여성");
		}else if(checkRegno ==3 || checkRegno == 4) {
			age = Integer.parseInt(tm.getMemRegno1().substring(0,2));
			age = age + +2000;
			age = year - age + 1;
			if(checkRegno == 3) tm.setMemGender("남성");
			if(checkRegno == 4) tm.setMemGender("여성");
		}
		tm.setMemAge(age);
		
		log.info(tm.getMemGender());
		log.info(tm.getMemTel());
		log.info("포스트코드 --------------------------"+tm.getMemPostcode());
		int res = testMapper.pSignup(tm);
		int memNo = tm.getMemNo();
		MemberAuth auth = new MemberAuth();
		auth.setAuthName("ROLE_USER");
		auth.setMemNo(memNo);
		authMapper.insertAuth(auth);
		adminMapper.enrollPatient(tm);
		
		if(res>0) return ServiceResult.OK;
		if(res==0) return ServiceResult.FAILED;
		return null;
	}
}
