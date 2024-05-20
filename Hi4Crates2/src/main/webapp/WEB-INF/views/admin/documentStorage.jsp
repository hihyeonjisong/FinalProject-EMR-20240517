<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<style type="text/css">

#documentTable_info {
	display: none;
}
</style>
 <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">
                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xxl-12 col-xl-12">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="row">
                                    <div class="col-xl-12">
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="card custom-card">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                   		 문서함
                                                </div>
                                            </div>
                                            <div class="card-body" style="height: 800px;">

                                                    <div class="row" style="border-top: solid 1px rgb(229, 228, 228);">
                                                    <div class="col-xl-3" style="border-right: solid 1px rgb(229, 228, 228); height: 40px; display: flex; align-items: center;">
                                                        <div><h6 style="display: inline;" id="patntName"> </h6><span id="patntRegNo1"></span><span id="patntGender"></span></div>
                                                    </div>
                                                    <div class="col-xl-9" ></div>
                                                </div>
                                                <div class="row" style="border-top: solid 1px rgb(229, 228, 228);">
                                                    <div class="col-xl-3" style="border-right: solid 1px rgb(229, 228, 228);">
                                                        <div >
<!--                                                             	진료일시 -->
                                                        </div>
                                                        <div>
	                                                        <ul class="dropdown" >
<!-- 	                                                            <li><a class="dropdown-item" href="#">2023-01-03</a></li> -->
	                                                        </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-9">
                                                    <div class="table-responsive">
                                                        <table id="documentTable" class="table table-bordered text-nowrap w-100">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width:400px;" >구분</th>
                                                                    <th>환자이름</th>
                                                                    <th>생년월일</th>
<!--                                                                     <th>내용</th> -->
                                                                    <th>일시</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="listBody">
                                                 				<c:forEach items="${documentList}" var="document">
	                                                           		 <tr>
	                                                           		 	<c:set var="attachLoc" value="${document.attachLoc}"/>
	                                                           		 	<c:if test="${attachLoc eq '/chartImg'}">
<!-- 	                                                                    	<td>x-ray/환부이미지/진단서</td> -->
	                                                                    	<td><a href="#" class="showImg" data-attachloc="${document.attachLoc }" data-attachname="${document.attachName}" data-attachpath="${document.attachPath }">

	                                                                    <c:out value="환부이미지"></c:out></a></td>
	                                                                    </c:if>
	                                                                    <td>${document.memName}</td>
	                                                                    <td>${document.memRegno1}</td>
	                                                                    <td>${document.attachDate}</td>
	                                                                 </tr>
                                                                 </c:forEach>
                                                                  <c:forEach items="${diagnosisPaperList}" var="diagnosisPaper">
														            <tr>
														            	<c:set var="type" value="${diagnosisPaper.diagnosisType}"/>
<%-- 														              	<c:choose> --%>
<%-- 														                    <c:when test="${type == 'DT001'}"> --%>
														                        <td><a href="#" class="showDiagnosisPaper" data-value="${diagnosisPaper.receiptNo}">진단서</a></td>
<%-- 														                    </c:when> --%>
<%-- 														                    <c:when test="${type == 'DT002'}"> --%>
<!-- 														                        <td>소견서</td> -->
<%-- 														                    </c:when> --%>
<%-- 														                    <c:otherwise> --%>
<!-- 														                        <td></td> -->
<%-- 														                    </c:otherwise> --%>
<%-- 														                </c:choose> --%>
														                <td>${diagnosisPaper.memName}</td>
														                <td>${diagnosisPaper.memRegno1}</td>
														                <td>${diagnosisPaper.diagnosisPaperIssueDate}</td>
														            </tr>
														        </c:forEach>
														        <c:forEach items="${radiationList}" var="radiation">
														            <tr>
														                <td><a href="#" class="showRadiationList" data-chartno="${radiation.chartNo}" data-attachno="${radiation.attachNo}">x-ray</a></td>
														                <td>${radiation.memName}</td>
														                <td>${radiation.memRegno1}</td>
														                <td>${radiation.attachDate}</td>
														            </tr>
														        </c:forEach>
                                                            </tbody>
                                                        </table>
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
                        </div>
                    </div>
                </div>
				<!-- 진단서 모달 -->
		<div class="modal fade mydia" id="diagnosisPaperModal" tabindex="-1" aria-labelledby="exampleModalScrollable3" data-bs-keyboard="false" aria-hidden="true">
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
                                                                <table style="margin-bottom: 10%;  margin-left: 6%" class="diagnosisTable">
                                                                    <tr style="border: 1px solid black;;">
                                                                        <td>등록번호 <span id="dpPatntNo">00000096</span></td><br />
                                                                    </tr>
                                                                    <tr>
                                                                        <td>연 번 호 <span id="dpReceiptNo">00000116</span></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                                <table style="width: 630px;" class="diagnosisTable">
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
                                                                            <input type="checkbox" name="diagnosisType" data-value="DP001" readonly/> 임상적 추정<br />
                                                                            <input type="checkbox" name="diagnosisType" data-value="DP002" readonly/> 최종 진단
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
                                                                            <input type="text" class="form-control" id="dpDiagDate" style="border: none;" readonly >
                                                                        </td>
                                                                        <td>진단 연월일</td>
                                                                        <td>
                                                                            <input type="text" class="form-control" id="dpOnsetDate" style="border: none;" readonly >
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 50px; border: none;">
                                                                        <td>
                                                                            	치료 내용 및 향후 <br />치료에 대한 소견
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <textarea class="form-control" style="height: 200px; border: none;" id="dpComment" readonly ></textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            	용도
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="text" class="form-control" id="dpPurpose" style="border: none;" readonly >
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                           	 비고
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="text" class="form-control" id="dpRemark" style="border: none;" readonly >
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
                                                                <button type="button" class="btn btn-outline-light btn-wave" data-bs-dismiss="modal" style="float:right; margin-left:2px;">취소</button>
                                                                <button class="btn btn-outline-secondary btn-wave" id="savePdfBtn" style="float:right">발행</button>
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
                <!-- End::row-1 -->

<script type="text/javascript">

$(function(){
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
	
    window.jsPDF = window.jspdf.jsPDF;
    
  //환부이미지
    $(document).on("click",".showImg",function(event){
        
        event.preventDefault();
        
//         attach = JSON.parse($(this).data("value"));
        
        let attachLoc = $(this).data("attachloc");
        let attachName = $(this).data("attachname");  
        let attachPath = $(this).data("attachpath");
        
        console.log("attachPath" +attachPath );
        console.log("attachLoc" +attachLoc );
        
        var selFileName = attachLoc + attachPath.replaceAll("\\", "/") +"/" + attachName;
        
        var fileView = "width=1300, height=700, menubar = no, tollbar=no";
        
        var newWidowView = window.open("","_blank", fileView);
        
        var chartFileElement = document.createElement("img");
        
        chartFileElement.src="/file/displayDocumentFile?fileName="+selFileName;
        chartFileElement.alt = "img";
        chartFileElement.width="1300";
        chartFileElement.height = "700";
        chartFileElement.id = "chartImg";
        
        var pdfBtn = document.createElement("button");
        pdfBtn.textContent = "PDF출력";
        pdfBtn.classList.add("btn");
        pdfBtn.classList.add("btn-outline-dark");
        pdfBtn.classList.add("btn-wave");
        
        newWidowView.document.body.appendChild(chartFileElement);
        newWidowView.document.body.appendChild(pdfBtn);
        
     	// 버튼 위치 조정 (오른쪽으로 이동)
        pdfBtn.style.position = "absolute";
        pdfBtn.style.right = "10px"; // 오른쪽 여백 설정
        pdfBtn.style.top = "10px"; // 위쪽 여백 설정

        chartFileElement.onload = function() {
            pdfBtn.addEventListener("click", function() {
                window.jsPDF = window.jspdf.jsPDF;
                html2canvas(chartFileElement).then(function(canvas) {
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
        };
    }); 
 
  //진단서띄우기
  $(document).on("click", ".showDiagnosisPaper", function(event){
	  
	  console.log('dd',partiTargetNo);
	  
	  event.preventDefault();
	  
	  let t = $('.mydia');
	  let receiptNo = $(this).data("value");
	  
	  $(".mydia").modal("toggle");
	  
		//기본값 세팅
		var dpPatntNo = t.find("#dpPatntNo");
		var dpReceiptNo = t.find("#dpReceiptNo");
		var dpName = t.find("#dpName");
		var dpRegno = t.find("#dpRegno");
		var dpAddress = t.find("#dpAddress");
		var dpTel = t.find("#dpTel");
		var dpPrimaryDiagnosis = t.find("#dpPrimaryDiagnosis");
		var dpPrimaryCode = t.find("#dpPrimaryCode");
		var dpSysdate = t.find("#dpSysdate");
		var dateText = year + '년' + month + '월' + day+ '일  ';
		var dpDiagDate = t.find("#dpDiagDate");
		var dpOnsetDate = t.find("#dpOnsetDate");
		var dpComment = t.find("#dpComment");
		var dpPurpose= t.find("#dpPurpose");
		var dpRemark = t.find("#dpRemark");
		var diagnosisType = t.find("#diagnosisType");

		dpSysdate.text(dateText);
		//부상병은 리스트로
		var dpSecondDiagnosis = t.find("#dpSecondDiagnosis");
		var dpSecondCode = t.find("#dpSecondCode");
		//의사정보
		var dpDoctor = t.find("#dpDoctor");
		var dpDoctorNo = t.find("#dpDoctorNo");

		$.ajax({
			url : "/doctor/getDiagnosisPaper",
			type : "POST",
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify({receiptNo : receiptNo}),
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
				dpReceiptNo.text("0000"+ receiptNo); //접수번호
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
  
  //pdf변환
  $("#savePdfBtn").on("click",function(){
	  window.jsPDF = window.jspdf.jsPDF;
	  console.log("실행!");
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
		        doc.save('진단서.pdf');
		    });
		});
  
  //엑스레이 사진 띄우기
  
   $(document).on("click", ".showRadiationList", function(event){ 
	   event.preventDefault();
	   
	   let chartNoRadi = $(this).data("chartno");
	   let attachNoRadi = $(this).data("attachno");
	    
	    // 새 창의 속성 설정
	    var windowFeatures = "width=1300,height=700,menubar=no,toolbar=no";
	    
	    // 새 창 열기
	    var newWindow = window.open("", "_blank", windowFeatures);
	    

	        // 이미지 요소 생성
	        var imgElement = document.createElement("img");
	        imgElement.src = "/file/showRadiationFile/"+attachNoRadi;
	        imgElement.alt = "img";
	        imgElement.width = "400";
	        imgElement.height = "600";
	        imgElement.classList.add("rounded-circle");
	        imgElement.style.border = "1px solid black"; // 보더의 두께와 색상 설정
	        
	        //pdf출력
	        var pdfBtnRadi = document.createElement("button");
	        pdfBtnRadi.textContent = "PDF출력";

	        // 새 창의 document에 이미지 추가
	        newWindow.document.body.appendChild(imgElement);        
	        newWindow.document.body.appendChild(pdfBtnRadi);

	        imgElement.onload = function() {
	        	pdfBtnRadi.addEventListener("click", function() {
	                window.jsPDF = window.jspdf.jsPDF;
	                html2canvas(imgElement).then(function(canvas) {
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
	        };

	    if (window.screen) {
	        var left = (window.screen.width - 1300) / 2;
	        var top = (window.screen.height - 700) / 2;
	        newWindow.moveTo(left, top);
	    }
	   
   });
  
  
  //선택환자번호
  $(document).on("click","#selectPatientBtn",function(){
	 
	console.log(partiTargetNo);	//선택환자번호
	let patntNo = partiTargetNo;
	
	//뒤에 테이블 바디 날리기
	$('.listBody').remove();
	//다시 검색했을 때 이미 추가되어 있는 영역 날리기
	 $('.dropdown').empty();
	
	
	$.ajax({
		url : "/document/getPatntDocument",
		type : "POST",
		contentType : 'application/json',
		dataType : 'json',
		data : JSON.stringify({patntNo : patntNo}),
		beforeSend: function(xhr) {
             // CSRF 토큰 헤더에 추가
            xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
 		},
		success : function(res) {	
			console.log(res.patntInfo.memGender);
			let chartList = res.patntInfo; //해당 환차 차트 리스트 
			//환자 기본정보 세팅
			$("#patntName").text(chartList[0].memName);	//환자이름
			$("#patntRegNo1").text(chartList[0].memRegno1);	//환자생년월일
			$("#patntGender").text(chartList[0].memGender);	//환자생년월일
			
			//진료일시 세팅
			let dayListHtml = "";
			
			$.each(chartList, function(index, item){
				dayListHtml +='<li><a class="dropdown-item" href="#" data-value="'+item.receiptNo+'">'+item.chartDate.substring(0,10)+'</a></li>'
			});
			   $('.dropdown').append(dayListHtml);
		}

		}); 
  }); 
  
  //날짜 클릭시 접수번호로 해당하는 파일들 불러오기
  let html = "";
  $(document).on("click", ".dropdown-item", function(){
	  
	console.log("여기" +html);
	 let receiptNo = $(this).data("value");	//접수번호
	 
		$.ajax({
			url : "/document/getPatntFile",
			type : "POST",
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify({receiptNo : receiptNo}),
			beforeSend: function(xhr) {
	             // CSRF 토큰 헤더에 추가
	            xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	 		},
			success : function(res) {
				
				let chartFileList = res.chartFileList;
				let diagnosisPaperList = res.diagnosisPaperList;
				let radiationList = res.radiationList;
				
				
				html = "";
				html += "<tbody class='listBody'>";
					// chartFileList에 대한 forEach 루프
					$.each(chartFileList, function(index, item){
					    if (item.attachLoc === '/chartImg') {
					        html += "<tr>";
					        html += "<td><a href='#' class='showImg' data-attachloc='"+item.attachLoc+"' data-attachname='"+item.attachName+"' data-attachpath='"+item.attachPath+"'>환부이미지</a></td>";
					        html += "<td>"+item.memName+"</td>";
					        html += "<td>"+item.memRegno1 +"</td>";
					        html += "<td>"+item.attachDate +"</td>";
					        html += "</tr>";
					    }
					});
					
					// diagnosisPaperList에 대한 forEach 루프
					$.each(diagnosisPaperList, function(index, item){
					        html += "<tr>";
					        html += "<td><a href='#' class='showDiagnosisPaper' data-value='"+item.receiptNo+"'>진단서</a></td>";
					        html += "<td>"+item.memName+"</td>";
					        html += "<td>"+item.memRegno1 +"</td>";
					        html += "<td>"+item.diagnosisPaperIssueDate +"</td>";
					        html += "</tr>";
					});
					
					// radiationList에 대한 forEach 루프
					$.each(radiationList, function(index, item){
					        html += "<tr>";
					        html += "<td><a href='#' class='showRadiationList' data-chartno='"+item.chartNo+"' data-attachno='"+item.attachNo+"'>x-ray</a></td>";
					        html += "<td>"+item.memName+"</td>";
					        html += "<td>"+item.memRegno1 +"</td>";
					        html += "<td>"+item.attachDate +"</td>";
					        html += "</tr>";
					});
				
				html += "</tbody>";
				$('.listBody').remove();
				$('#documentTable').append(html);
			}
	  
  		});
	});
  
  // 진단서 체크박스 이벤트 차단
  $('input[type="checkbox"]').click(function() {
      return false;
  });
});
//진단서 체크박스 하나만 선택하게(라디오버튼처럼)
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("diagnosisType");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
	

</script>

</html>