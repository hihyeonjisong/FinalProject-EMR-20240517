<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> YNEX - Bootstrap 5 Premium Admin &amp; Dashboard Template </title>
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
	<meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

   
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico"
	type="image/x-icon">

<!-- Choices JS -->
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

<!-- Main Theme Js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

<!-- Bootstrap Css -->
<link id="style" href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Style Css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css" rel="stylesheet">

<!-- Icons Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/icons.css"
	rel="stylesheet">

<!-- Node Waves Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.css"
	rel="stylesheet">

<!-- Simplebar Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.css"
	rel="stylesheet">

<!-- Color Picker Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">

<!-- Choices Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/dragula/dragula.min.css">

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/css/jsvectormap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css"> -->

<!-- Prism CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/prismjs/themes/prism-coy.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/filepond/filepond.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-preview/filepond-plugin-image-preview.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-edit/filepond-plugin-image-edit.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/dropzone/dropzone.css">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>


<style type="text/css">

table, th, td {

    border: 1px solid black;
    margin-left: 2%;
}
tr td:first-child {
    border-left: none; /* 각 행의 첫 번째 셀의 왼쪽 테두리 제거 */
}
tr td:last-child {
    border-right: none; /* 각 행의 마지막 셀의 오른쪽 테두리 제거 */
}
td {
    padding: 6px;
}
#paper2 table, #paper2 th, #paper2 td {
    border:none;
    border-left: none;
}

</style>
</head>

<body>

        <!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xxl-10 col-xl-6">
			<button type="button" class="btn btn-warning-light btn-wave" id="diagnosisPaperBtn" data-bs-toggle="modal" data-bs-target="#diagnosisPaperModal">진단서/소견서</button>
				<!-- 진단서 모달 -->
		<div class="modal fade" id="diagnosisPaperModal" tabindex="-1" aria-labelledby="exampleModalScrollable3" data-bs-keyboard="false" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 720px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title" id="staticBackdropLabel3">진단서</h6>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="col-xxl-12 col-xl-12">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="card custom-card">
                                                <div class="card-body">
                                                    <div class="content-wrapper">
                                                        <div id="diagnosisPaperPrint">
                                                            <p>의료법 시행규칙[별지 제 5호의 2서식]<개정 2019. 9. 27.>
                                                            </p>
                                                            <h4 style="text-align: center;">진 단 서</h4>
                                                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                                <table style="margin-bottom: 10%;  margin-left: 6%">
                                                                    <tr style="border: 1px solid black;;">
                                                                        <td>등록번호 <span id="dpPatntNo">00000096</span></td><br />
                                                                    </tr>
                                                                    <tr>
                                                                        <td>연 번 호 <span id="dpReceiptNo">00000116</span></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                                <table style="width: 630px;">
                                                                    <tr>
                                                                        <td>환자의 성명 </td>
                                                                        <td id="dpName" style="width:200px;">김길동</td>
                                                                        <td>주민등록<br/>번호</td>
                                                                        <td colspan="2" id="dpRegno">980101-123456</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>환자의 주소</td>
                                                                        <td colspan="2" id="dpAddress">경기 안양시 동안구</td>
                                                                        <td colspan="2">(전화번호 : <br /><span
                                                                                id="dpTel">010-1234-4567</span>)</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center;">병 명<br/>
                                                                            <input type="radio" name="diagnosisType" data-value="DP001"/> 임상적 추정<br />
                                                                            <input type="radio" name="diagnosisType" data-value="DP002"/> 최종 진단
                                                                        </td>
                                                                        <td colspan="2">
                                                                            (주상병)
                                                                            <span id="dpPrimaryDiagnosis">요추의 염좌 및 긴장</span><br />
                                                                            (부상병)
                                                                            <span id="dpSecondDiagnosis">헐어증</span>
                                                                        </td>
                                                                        <td>질병 분류번호<br />
                                                                            <span id="dpPrimaryCode">M002</span><br />
                                                                            <span id="dpSecondCode">E003</span><br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>발병 연월일</td>
                                                                        <td>
                                                                            <input type="text" class="form-control" id="dpDiagDate" style="border: none;">
                                                                        </td>
                                                                        <td>진단 연월일</td>
                                                                        <td>
                                                                            <input type="text" class="form-control" id="dpOnsetDate" style="border: none;">
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 50px; border: none;">
                                                                        <td>
                                                                            	치료 내용 및 향후 <br />치료에 대한 소견
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <textarea class="form-control" style="height: 200px; border: none;" id="dpComment"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            	용도
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="text" class="form-control" id="dpPurpose" style="border: none;">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                           	 비고
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="text" class="form-control" id="dpRemark" style="border: none;">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div id="paper2">
                                                                    <table>
                                                                        <tr>
                                                                            <td colspan="5">
                                                                                	의료법 제 17조 및 같은 법 시행규칙 제 9조 1항에 따라 위와 같이 진단합니다.
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="5" style="text-align: center;" id="dpSysdate">
                                                                                2020년 9월 16일
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                               	 의료기관
                                                                            </td>
                                                                            <td>
                                                                                	명칭
                                                                            </td>
                                                                            <td colspan="3"> 대덕인재개발원병원 <span style="margin-left: 10%;">(직인)</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>주소</td>
                                                                            <td colspan="3">경기도 안양시 동안구 홍안대로 123</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>성명</td>
                                                                            <td id="dpDoctor">김태원 <span style="margin-left: 5%;">(서명 또는 인)</span></td>
                                                                            <td>면허번호 </td>
                                                                            <td id="dpDoctorNo">456456456 </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>전화 및 Fax </td>
                                                                            <td> (전화)</td>
                                                                            <td> 042-123-4567</td>
                                                                            <td>(팩스)</td>
                                                                            <td> 042-123-4777</td>
                                                                        </tr>
                
                                                                    </table>
                                                                </div>
                                                            </div>
                                                         </div>
                                                            <div>
                                                                <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal" style="float:right">취소</button>
                                                                <button class="btn btn-secondary shadow-secondary btn-wave" id="savePdfBtn" style="float:right">발행</button>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
							<!--진단서 모달 끝-->
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(function(){
	window.jsPDF = window.jspdf.jsPDF;
	
	//현재 날짜, 시간 출력
	// 현재 날짜와 시간을 가져오기 위해 Date 객체 생성
	var now = new Date();
	
	// 연, 월, 일, 시, 분을 가져오기
	var year = now.getFullYear();
	var month = addZero(now.getMonth() + 1); // 월은 0부터 시작하므로 1을 더함
	var day = addZero(now.getDate());
	var hours = addZero(now.getHours());
	var minutes = addZero(now.getMinutes());
	
	// 0을 추가하여 한 자리 숫자를 두 자리 숫자로 변환하는 함수
	function addZero(number) {
	    return (number < 10 ? '0' : '') + number;
	}
	
	// 출력을 위한 포맷 지정
	var formattedDateTime = year + '년' + month + '월' + day + '일  ' + hours + '시' + minutes + '분';
	
	let diagnosisPaperBtn= $("#diagnosisPaperBtn");
	let keyReceiptNo="";
	diagnosisPaperBtn.on("click", function(){
		
		console.log("클릭");
		//받을 접수번호 변수 값
		keyReceiptNo = 94;
		
			//기본값 세팅
			var dpPatntNo = $("#dpPatntNo");
			var dpReceiptNo = $("#dpReceiptNo");
			var dpName = $("#dpName");
			var dpRegno = $("#dpRegno");
			var dpAddress = $("#dpAddress");
			var dpTel = $("#dpTel");
			var dpPrimaryDiagnosis = $("#dpPrimaryDiagnosis");
			var dpPrimaryCode = $("#dpPrimaryCode");
			var dpSysdate = $("#dpSysdate");
			var dateText = year + '년' + month + '월' + day+ '일  ';
			var dpDiagDate = $("#dpDiagDate");
			var dpOnsetDate = $("#dpOnsetDate");
			var dpComment = $("#dpComment");
			var dpPurpose= $("#dpPurpose");
			var dpRemark = $("#dpRemark");
			var diagnosisType = $("#diagnosisType");

			dpSysdate.text(dateText);
			//부상병은 리스트로
			var dpSecondDiagnosis = $("#dpSecondDiagnosis");
			var dpSecondCode = $("#dpSecondCode");
			//의사정보
			var dpDoctor = $("#dpDoctor");
			var dpDoctorNo = $("#dpDoctorNo");

			$.ajax({
				url : "/doctor/getDiagnosisPaper",
				type : "POST",
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify({receiptNo : keyReceiptNo}),
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res) {
					//    				console.log("성공" + res);
					console.log(res.diagnosisPaper);

					let patntInfo = res.patntInfo; //환자정보
					let doctorInfo = res.doctorInfo; //의사정보
					let diseaseInfoList = res.diseaseInfoList; //상병리스트
					let diagnosisPaperInfo = res.diagnosisPaper; 	//진단서 입력한 리스트

					//환자정보
					dpPatntNo.text("0000"+ patntInfo.patntNo); //환자번호
					dpReceiptNo.text("0000"+ keyReceiptNo); //접수번호
					dpName.text(patntInfo.memName); //환자이름
					dpRegno.text(patntInfo.memRegno1+ " - "+ patntInfo.memRegno2); //주민등록번호
					dpAddress.text(patntInfo.memAddress1+ " "+ patntInfo.memAddress2); //주소
					dpTel.text(patntInfo.memTel); //전화번호

					//상병정보
					//주상병
					dpPrimaryDiagnosis.text(diseaseInfoList[0].disNameKr);
					dpPrimaryCode.text(diseaseInfoList[0].disNo);

					let dpSecondDiagnosisList = "<div>";
					let dpSecondCodeList = "<div>";
					//부상병
					for (var i = 1; i < diseaseInfoList.length; i++) {
						dpSecondDiagnosisList += "<p>"+ diseaseInfoList[i].disNameKr+ "</p>";
						dpSecondCodeList += "<p>"+ diseaseInfoList[i].disNo+ "</p>";
						console.log(i);
					}

					dpSecondDiagnosisList += "</div>";
					dpSecondCodeList += "</div>";

					dpSecondDiagnosis.html(dpSecondDiagnosisList);
					dpSecondCode.html(dpSecondCodeList);

					//의사정보
					dpDoctor.text(doctorInfo.memName); //의사이름
					dpDoctorNo.text(doctorInfo.empLicence); //의사이름
					
					//진단정보
					dpDiagDate.val(diagnosisPaperInfo.diagnosisPaperDiagDate.substring(0,10));
					dpOnsetDate.val(diagnosisPaperInfo.diagnosisPaperOnsetDate.substring(0,10));
					dpComment.val(diagnosisPaperInfo.diagnosisPaperContent);
					dpPurpose.val(diagnosisPaperInfo.diagnosisPaperPurpose);
					dpRemark.val(diagnosisPaperInfo.diagnosisPaperRemark);
					
					if(diagnosisPaperInfo.diagnosisType=='DP001'){
						 $('input[name="diagnosisType"][data-value="DP001"]').prop('checked', true);
					}
					if(diagnosisPaperInfo.diagnosisType=='DP002'){
						 $('input[name="diagnosisType"][data-value="DP002"]').prop('checked', true);
					}
					
				}
			});
		});
	
	$("#savePdfBtn").click(function(){
		 html2canvas($('#diagnosisPaperPrint')[0]).then(function(canvas) {
		        // 캔버스를 이미지로 변환
		        let imgData = canvas.toDataURL('image/png');

		        let margin = 10; // 출력 페이지 여백설정
		        let imgWidth = 210 - (10 * 2); // 이미지 가로 길이(mm) A4 기준
		        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		        let imgHeight = canvas.height * imgWidth / canvas.width;
		        let heightLeft = imgHeight;

		        let doc = new jsPDF('p', 'mm');
		        let position = margin;

		        // 첫 페이지 출력
		        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
		        heightLeft -= pageHeight;

		        // 한 페이지 이상일 경우 루프 돌면서 출력
		        while (heightLeft >= 20) {
		            position = heightLeft - imgHeight;
		            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		            doc.addPage();
		            heightLeft -= pageHeight;
		        }

		        // 파일 저장
		        doc.save('sample.pdf');
		    });
		});
	});
	
</script>

</html>