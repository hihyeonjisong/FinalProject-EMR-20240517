package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	private int memNo;
	private String memId;
	private String memPw;
	private String memPw2;
	private String oldMemPw;
	private String memEmail;
	private String memName;
	private int memAge;
	private String memGender;
	private String memRegno;
	private String memRegno1;
	private String memRegno2;
	private String memTel;
	private String memAddtel;
	private String memPostcode;
	private String memAddress1;
	private String memAddress2;
	private String memSignupDate;
	private String memType;
	private String memSocial;
	private String empJob;
	private String memWithDraw;
	private String memWithDrawReason;
	private String memWithDrawDate;
	
	private List<MemberAuth> authList;

	
	// patntNo 가져오기 위한 컬럼 추가
	private PatientVO patientVO;
	
	//대기환자불러오기 위한 컬럼 추가
	// 장소
	private String codeName;
	private String codeNo;
	// 장소 코드
	private String historyLoc;
	// 상태
	private String ccodeName;
	
	// 대기환자 order name불러오기 위한 컬럼 추가
	private String orderName;
	//방사선 대기환자의 오더의 바디코드명을 불러옴_0502
	private String bodyName;
	
	// chart 정보 불러오기 위한 컬럼 추가
	private String chartNo;
	private String chartDate;
	private String chartRecord;
	
	// order bodyCode 임시추가
	private String bodyCode;
	
	// 의사 이름 컬럼 임시추가
	private String docName;
	// (물리치료도 사용중)
	
	// 의사 전문 분야 담기 위한 리스트
	private List<RealmVO> realmList;
	private List<DoctorCareerVO> careerList;
	
	// 첨부파일 그룹번호
	private int attachmentGroupNo;
	// 첨부파일 
	private MultipartFile file;
	private String imgData;
	
	private AttachmentVO fileVO;
	
	// 의사 개인정보 불러오기
	private EmpVO empVO;
	//진료차트 불러오기 위한 컬럼 추가
	private int patntNo;
	private int receiptNo;
	private String receiptDate;
	private String receiptReason;
	
	//접수하기위해 담당의컬럼 추가
	private int empNo;
	private String clinicNo;//진료실번호 
	
	// 입원환자 리스트 불러오기 위한 컬럼 추가
	private BedVO bedVO;
	private String empName;
	
	// 환자 바이탈 정보 불러오기위한 vo추가
	private VitalVO vitalVO;
	
	// 입원 정보 가져오기위한  vo추가
	private HospitalizationRecordVO hsptlzRecordVO;
	
	// 환자 오더 정보 담기위한 vo추가
	private OrderVO orderVO = new OrderVO();
	
	// 오더 정보 여러개(bodyCode 여러개 가져오게 하기 위함) 가져오기 위한 리스트 추가
	private List<OrderVO> orderList;
	
	// 방사선실 정보를 담기위한 vo추가
	private RadiationRoomVO radiationRoomVO;
	
	// 간호기록 내용 담기위한 간호기록내용 컬럼 추가
	private String nursingContent;
	
	private String attachName;
	private String attachPath;
	
	private IOVO ioVO;
	private int result;
	
	// 물리치료 환자 정보 및 위치.상태 조회를 위해 다른 VO 추가
	private HistoryVO historyVO = new HistoryVO();	// nullpointer 오류 방지 위한 객체 초기화
	private ChartVO chartVO = new ChartVO();
	private ReceiptVO receiptVO = new ReceiptVO();
	private String historyStatus;
	private int orderNo;
//	private List<String> bodyCodes;
	private List<MemberVO> bodyCodes;
	private List<OrderVO> orderCodes;
	private int chartNumber;
//	private List<String> bodyCommonCodes;
	private List<String> bodyCommonNames;
//
	// 환자 수 차트 가져오는 vo추가
	private int manCount;
	private int womanCount;
	private int statisticsYear;
	private int statisticsMonth;
	
	// 보호자 정보와 특이사항 불러올 vo추가
	private ProtectorVO protectorVO;
	private ParticularVO particularVO;
	
	// 입원기록 리스트
	private List<HospitalizationRecordVO> hsptlzList;
	
	// 환자 예진표 불러오기 위한 vo
	private PreDiagnosisVO preDiagnosisVO;
	
	// 의사 소속과
	private String empDepartment;
	
}
