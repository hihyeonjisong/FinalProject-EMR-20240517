<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



<style type="text/css">
.ui-autocomplete {
  max-height: 200px;
  overflow-y: auto;
  /* prevent horizontal scrollbar */
  overflow-x: hidden;
  height: auto;
}

.ui-menu-item div.ui-state-hover,
.ui-menu-item div.ui-state-active {
  color: #ffffff;
  text-decoration: none;
  background-color: #f6B664;
  border-radius: 0px;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  background-image: none;
  border:none;
}



/* 레이블과 입력 요소를 가로로 배열하기 위한 CSS */
/* #wardList label {
    display: inline-block;
    width: 100px; //레이블의 너비 조정 
}

#wardList input,
#hospitalRoomList {
    display: inline-block;
    width: calc(100% - 120px); //입력 요소의 너비 조정 
} */

</style>



	


	<!-- Loader -->
	<%-- <div id="loader">
		<img
			src="${pageContext.request.contextPath }/resources/assets/images/media/loader.svg"
			alt="">
	</div> --%>
	<!-- Loader -->


		<div class="main-content app-content">
			<div class="container-fluid">

				<!-- Start::page-header -->


				<!-- End::page-header -->
				<!-- Start::row-1 -->
				<div class="row" >
					
					<!-- 차트 div  -->
					<div class="col-xxl-12 col-xl-12">
					
					<!-- 차트 상세 -->
					<div id="chartView">
						<div class="row" style="border-radius: 1%;">
							<div class="col-xl-2">
								<div class="row">
									<div class="col-xl-12" style="padding-right: 0px;">
										<div class="card custom-card"
											style="border: solid 1px rgb(229, 228, 228);margin-bottom: 12px;height:880px;">
											<div class="card-header justify-content-between" style="padding-top: 13px;padding-bottom: 13px; padding-right: 12px;">
												<div class="card-title">입/퇴원</div>
												<button id="testBtn" class="btn btn-sm btn-success" style="width:70px; height:25x;float:right;" data-bs-toggle="modal" data-bs-target="#exampleModal">대기확인</button>
											</div>
											<div class="card-body">
												<div id="waitingList">
												
												</div>
												<div id="wardList" style="padding-bottom: 12px;">
													<input type="hidden" id="orderNoInput" />
													<label  class="col-form-label">환자명:</label>
													<input type="text" class="form-control" id="inputName" readonly="readonly"/>
													<label  class="col-form-label">성별 :</label>
													<input type="text" class="form-control" id="inputGender" readonly="readonly"/>
													<label  class="col-form-label">나이 :</label>
													<input type="text" class="form-control" id="inputAge" readonly="readonly"/>
													<label  class="col-form-label">젼화번호 :</label>
													<input type="text" class="form-control" id="inputTel" readonly="readonly"/>
													<label  class="col-form-label">주소 :</label>
													<input type="text" class="form-control" id="inputAddress" readonly="readonly"/>
													<label  class="col-form-label">호실 선택 :</label>
													<select class="form-select"  id="hospitalRoomList">
														<option disabled selected>호실을 선택하세요</option>
														<option value="101">101호</option>
														<option value="102">102호</option>
														<option value="201">201호</option>
														<option value="202">202호</option>
														<option value="301">301호</option>
														<option value="302">302호</option>
													</select>
													<label class="col-form-label">병상 선택 :</label>
													<input type="text" class='form-control' id="bedNoInp" readonly="readonly">
													<div id="leaveReasonArea">
													</div>
												</div>
												<div id="btnArea">
													<!-- <button type="button" class="btn btn-sm btn-success" style="float: right;" id="insertHsptlz">입원</button> -->
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-12">
										<!-- <div class="card custom-card"
											style="border: solid 1px rgb(229, 228, 228);">
											<div class="card-header justify-content-between">
												<div class="card-title">차트 작성(임시)</div>
											</div>
											<div class="card-body">
												<input type="hidden" id="patntNoInp"/>
												<input type="hidden" id="receiptNoInp"/>
												<input type="hidden" id="hsptlzNoInp"/>
												환자명 : <input type="text" class="form-control" id="memNameInp"/>
												차트 내용 : <textarea class="form-control" style="resize : none;" id="nursingContent"></textarea>
												I/O<br/>
												섭취량 : <input type="text" class="form-control" id="ioIntake"/>
												배출량 : <input type="text" class="form-control" id="ioEmission"/>
												<h6>바이탈</h6><br/>
												혈압<br/>
												최고 : <input type="text" class="form-control" id="pressureMax"/>
												최저 : <input type="text" class="form-control" id="pressureMin"/>
												맥박 : <input type="text" class="form-control" id="vitalPulse"/>
												분당 호흡 : <input type="text" class="form-control" id="respirationMin"/>
												체온 : <input type="text" class="form-control" id="vitalHeat"/>
												<button type="button" class="btn btn-sm btn-info" id="insertBtn">insert</button>
											</div>
										</div> -->
									</div>
								</div>
						</div>
						<div class="col-xl-10" style="border-right: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xl-12" style="height: 50vh;">
										<div class="card custom-card" style="/* border: solid 1px rgb(229, 228, 228); */height:880px;">
											<div class="card-header  justify-content-between">
												 <div class="card-title float-left">입원실 현황</div>  
												 <div class="d-inline-block" id="countArea">
												 	
												 </div>
    											 <div class="border d-inline-block"> 
													<label class="form-label" >*구분</label>&nbsp;
													<span>
														<img class='inuse-bed' src='/resources/assets/img/inuse_bed.png' width='50px' height='50px'/> 사용중
													</span>
													&nbsp;&nbsp; 
													<span>
														<img class='empty-bed' src='/resources/assets/img/empty_bed.png' width='50px' height='50px'/> 사용가능
													</span>
												</div>
											</div>
											<div class="card-body overflow-y-auto" style="height: 500px;"  >
												
												<div class="accordion accordion-border-dark accordions-items-seperate" id="accordionprimaryborderExample">
													<div id="roomArea">
													
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
				<!-- <div class="col-xxl-2 col-xl-12"> -->

			</div>
			<!-- End::row-1 -->

		</div>
	</div>
	<!-- End::app-content -->

	<!-- 입원 대기 환자 조회 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel1">입/퇴원 대기 환자 리스트</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody">
                    	입원
                    	<table class="table">
                    		<thead>
	                    		<tr style="text-align: center;">
	                    			<th style="width: 25%">환자명</th>
	                    			<th style="width: 30%">환부</th>
	                    			<th style="width: 30%">담당의</th>
	                    			<th style="width: 15%"></th>
	                    		</tr>
                    		</thead>
                    		<tbody id="modalTbody">
                    		</tbody>
                    	</table>
                    	퇴원
                    	<table class="table">
                    		<thead>
	                    		<tr style="text-align: center;">
	                    			<th style="width: 25%">환자명</th>
	                    			<th style="width: 30%">환부</th>
	                    			<th style="width: 30%">담당의</th>
	                    			<th style="width: 15%"></th>
	                    		</tr>
                    		</thead>
                    		<tbody id="modalLeaveTbody">
                    		</tbody>
                    	</table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
		<!-- 입원 대기 환자 조회 모달 끝 -->
		
		<!-- 입원 환자 상세조회 모달  시작 -->
		<div class="modal fade" id="hsptlzPatntInfoModal" tabindex="-1"
            aria-labelledby="hsptlzPatntInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="hsptlzPatntInfoModalLabel">입원 환자 상세정보</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="patntModalBody">
	                    <div class="tab-pane show active text-muted" id="home1" role="tabpanel">
							<ul class="list-group">
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">환자명 :</div>
										<span class="fs-12 text-muted" id="nameSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">나이 :</div>
										<span class="fs-12 text-muted" id="ageSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">성별 :</div>
										<span class="fs-12 text-muted" id="genderSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">환부 :</div>
										<span class="fs-12 text-muted" id="bodyCodeSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">보호자명 :</div>
										<span class="fs-12 text-muted" id="protectorSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">보호자 연락처 :</div>
										<span class="fs-12 text-muted" id="protectorTelSpan"></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="d-flex flex-wrap align-items-center">
										<div class="me-2 fw-semibold">입원일 : </div>
										<span class="fs-12 text-muted" id="startDateSpan"></span>
									</div>
								</li>
							</ul>
						</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
		<!-- 입원 환자 상세조회 모달  끝 -->
	
	
	<!-- Footer Start -->

	<!-- Footer End -->

	


	<!-- Scroll To Top -->

	<!-- Scroll To Top -->

	

	<!-- Prism JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/prismjs/prism.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/prism-custom.js"></script>

	<!-- Filepond JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond/filepond.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-encode/filepond-plugin-file-encode.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-edit/filepond-plugin-image-edit.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-transform/filepond-plugin-image-transform.min.js"></script>


	<!-- Dropzone JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/dropzone/dropzone-min.js"></script>

	<!-- Fileupload JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/fileupload.js"></script>

	<!-- Custom JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>


	<!-- JSVector Maps JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>

	<!-- JSVector Maps MapsJS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/maps/world-merc.js"></script>



	<!-- CRM-Dashboard -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/crm-dashboard.js"></script>


	<!-- Custom-Switcher JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>

    <!-- JQuery Cdn -->
    <!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
    
    <!-- Select2 Cdn -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Internal Select-2.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/select2.js"></script>
    
    


</body>
<script type="text/javascript">
var leaveData = {};
	$(function() {
		let orderNoInput = $('#orderNoInput');
		let hospitalRoomList = $('#hospitalRoomList');
		
		hospitalRoomList.change(function() {
			let wardNo = $(this).val();
			getWardInfo(wardNo);
			getBedCount(wardNo);
			
			let bedNoInp = $('#bedNoInp');
			bedNoInp.val("");
		});
		
		function getHospitalizeList() {
			$.ajax({
				url : "/nurse/getHospitalizeList",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					let hospitalizeList = $('#hospitalizeList');
					let html = "";
					$.each(res, function(index, item) {
						console.log(item);
						let bedVO = item.bedVO;
						let bedNo = bedVO.bedNo;
						let wardNo = bedVO.wardVO.wardNo;
						
						let empVO = item.empVO;
						let empNo = empVO.empNo;
						let empName = item.empName;
						
						let memNo = item.memNo;
						console.log("memNo", memNo);
						
						let memName = item.memName;
						let memAge = item.memAge;
						let memGender = item.memGender;
						
						let patientVO = item.patientVO;
						let patientNo = patientVO.patntNo;
						
						html += "<tr class='tr' style='text-align: center;' data-hsptlz-no='" + item.hsptlzRecordVO.hsptlzNo + "' data-bed-no='" + item.bedVO.bedNo + "'>";
						html += "	<td>" + wardNo + "(" + bedNo + ")";
						html += "		<input type='hidden' value='" + memNo + "'/></td>";
						html += "	<td>" + memName;
						html += "		<input type='hidden' value='" + patientNo + "'/></td>";
						html += "	<td>" + empName + "</td>"
						html += "	<td><button class='btn btn-sm btn-info'>퇴원</td>";
						html += "</tr>"
					});
					hospitalizeList.html(html);
					
				}
			});
		}
		
		getHospitalizeList();
		
		 $('#hospitalizeList').on('click', '.tr', function() {
	            console.log("Clicked tr:", $(this));
	            let memNo = $(this).find('td').eq(0).find('input').val();
	            let patntNo = $(this).find('td').eq(1).find('input').val();
	            
				console.log("patntNo : " + patntNo);
				console.log("memNo : " + memNo);
				let data = {
					patntNo : patntNo
				}
				// 비동기로 입원환자 정보 추가하기
				$.ajax({
					url : "/nurse/getHospitalizePatntInfo",
					type : "post",
					beforeSend: function(xhr) {
				        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					contentType : "application/json",
					data : JSON.stringify(data),
					success : function(res) {
						console.log("response!!");
						console.log(res);
						orderNo = res.orderVO.orderNo;
						let html = "";
						let hsptlzPatntInfo = $('#hsptlzPatntInfo');
						let patntName = res.memName;
						let patntAge = res.memAge;
						let patntGender = res.memGender;
						let empName = res.empName;
						let hsptlzDate = res.hsptlzRecordVO.hsptlzStartdate;
						let vitalInfo = res.vitalVO;
						html += patntName + "<br/>";
						html += patntAge + "세<br/>";
						html += patntGender + "<br/>";
						html += empName + "<br/>";
						html += hsptlzDate + "<br/>";
						if (vitalInfo != null) {
							let pressureMax = vitalInfo.pressureMax;
							let pressureMin = vitalInfo.pressureMin;
							let vitalDate = vitalInfo.vitalDate;
							let vitalHeat = vitalInfo.vitalHeat;
							let vitalPulse = vitalInfo.vitalPulse;
							console.log(vitalDate);
							html += "바이탈 정보<br/>"
							html += vitalDate + "<br/>";
							html += pressureMax + "<br/>";
							html += pressureMin + "<br/>";
							html += vitalHeat + "<br/>";
							html += vitalPulse + "<br/>";
						}
						hsptlzPatntInfo.html(html);
						
						let patntNoInp = $('#patntNoInp');
						patntNoInp.val(res.patntNo);
						let hsptlzNoInp = $('#hsptlzNoInp');
						hsptlzNoInp.val(res.hsptlzRecordVO.hsptlzNo);
						let receiptNoInp = $('#receiptNoInp');
						receiptNoInp.val(res.receiptNo);
						let memNameInp = $('#memNameInp');
						memNameInp.val(res.memName);
					}
				});
				
				// 임시
				$(document).on('click', '.btn-info', function(event) {
				    event.stopPropagation();
				    // 퇴원 버튼을 클릭한 경우 수행할 작업 추가
				    
				    let tdElement = $(this).closest('td');

				    // <td>의 부모인 <tr> 요소를 찾습니다.
				    let trElement = tdElement.closest('tr');
				    
				    console.log(trElement);

				    // <tr> 요소에서 data 속성을 가져옵니다.
				    let hsptlzNo = trElement.data('hsptlz-no'); // your-data-attribute는 실제 사용하는 데이터 속성의 이름으로 대체해야 합니다.
					let bedNo = trElement.data('bed-no');
				    
				    let data = {
				    	hsptlzRecordVO : {
					    	hsptlzNo : hsptlzNo,
					    	hsptlzLeavereason : "퇴원 사유" // 퇴원사유 쓰는곳 추가하고 수정할 예정
				    	},
				    	bedVO : {
					    	bedNo : bedNo
				    	}
				    };
				    
				    $.ajax({
				    	url : "/nurse/leaveHospitalize",
				    	type : "post",
				    	beforeSend: function(xhr) {
					        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
						},
				    	data : JSON.stringify(data),
				    	contentType : "application/json",
				    	success : function(res) {
							console.log(res);
							// 목록 다시 띄우기
							getHospitalizeList();
						}
				    });
				    
				});
				
				// 환자 정보 불러오기
				/* let memNoData = {
					memNo : memNo	
				}
				$.ajax({
			    	url : "/nurse/getMemberInfo",
			    	type : "post",
			    	contentType : "application/json",
			    	data : JSON.stringify(memNoData),
			    	success : function(res) {
						console.log(res);
					    let inputName = $('#inputName');
					    let inputGender = $('#inputGender');
					    let inputAge = $('#inputAge');
					    let inputAddress = $('#inputAddress');
					    let inputTel = $('#inputTel');
					    let inputBodyCode = $('#inputBodyCode');
					    
					    let patntNo = res.memNo;
					    let patntName = res.memName;
					    let patntAge = res.memAge;
					    let patntGender = res.memGender;
					    let patntAddress = res.memAddress1 + " " + res.memAddress2;
					    let patntTel = res.memTel;
					    
					    inputName.val(patntName);
					    inputGender.val(patntGender);
					    inputAge.val(patntAge);
					    inputAddress.val(patntAddress);
					    inputTel.val(patntTel);
					    inputBodyCode.val("test");	
					    console.log("orderNo", orderNo);
					    orderNoInput.val(orderNo);
					    
					    // 이용 가능한 호실만 불러오기
					    $.ajax({
					    	url : "/nurse/getAvailableBedList",
					    	type : "post",
					    	success : function(res) {
								let html = "";
								$.each(res, function (index, item) {
									let bedNo = item.bedNo;
									let wardNo = item.wardVO.wardNo;
									html += "<option>" + wardNo + "(" + bedNo + ")" + "</option>"
								});
								hospitalRoomList.html(html);
							}
					    })
					    
					}
			    }); */
			    
			    // 입원환자 차트 작성
			    
	     });
		 
		 function getWardInfo(wardNo) {
			$.ajax({
				url : "/nurse/getWardInfo",
				type : "post",
				data : JSON.stringify({ wardNo : wardNo }),
				contentType : "application/json",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					let wardList = $('#wardList');
					let html = "";
					console.log("입원실 정보");
					console.log(res);
					
					html += "<table class='table'>";
					html += "	<tr>"
					html += "		<th>"
					html += "			" + wardNo + "호"
					html += "		</th>"
					html += "	</tr>"
					$.each(res, function(index, item) {
						console.log("입원실 정보 하나씩");
						console.log(item);
						let bedNo = item.bedVO.bedNo;
						let bedStatus = item.bedVO.bedStatus;
						if (index % 2 === 0) {
			                html += "<tr>";
			            }
			            
			            // 침대 번호와 상태를 번갈아가면서 셀로 추가
			            if (bedStatus == '사용가능') {
			                html += "<td style='text-align: center;'><img class='empty-bed' src='/resources/assets/img/empty_bed.png' width='100px' height='100px' data-bed-no='" + bedNo + "'/></td>";
			            } else {
			                html += "<td style='text-align: center;'>";
			                html += "	<img class='inuse-bed' src='/resources/assets/img/inuse_bed.png' width='100px' height='100px' data-bed-no='" + bedNo + "' data-bs-toggle='modal' data-bs-target='#hsptlzPatntInfoModal'/>"
			                html += "	<br/><span>" + item.memName + "(" + item.memAge + "세, " + item.memGender + ")" + "</span>";
			                html += "</td>";
			            }
			            
			            // 홀수 인덱스이거나 마지막 아이템인 경우 행 닫기
			            if (index % 2 === 1 || index === res.length - 1) {
			                html += "</tr>";
			            }
					});
					html += "</table>";
					let roomArea = $('#roomArea');
					roomArea.html(html);
				}
			});
		}
		
		
		
		// 사용중인 침대 td에 클릭 이벤트 추가
		$(document).on('click', 'td img.inuse-bed', function() {
		    // 클릭된 이미지의 data-bed-no 속성 값을 가져옴
		    let bedNo = $(this).data('bed-no');
		    // 가져온 값 사용 예시
		    console.log("Bed Number:", bedNo);
		    
		    $('ul.list-group li.list-group-item span').text('');
		    // 해당 침대를 사용중인 환자 불러오기
		    $.ajax({
		    	url : "/nurse/getUsingBedPatntInfo",
		    	type : "post",
		    	data : JSON.stringify({ bedNo : bedNo }),
		    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
		    	contentType : "application/json",
		    	success : function(res) {
					console.log(res);
					let memNo = res.memNo;
					let memName = res.memName;
					let memAge = res.memAge;
					let memGender = res.memGender;
					
					let hsptlzList = res.hsptlzList;
					
					/* let hsptlzRecordVO = res.hsptlzRecordVO;
					console.log(hsptlzRecordVO);
					let hsptlzStartdate = hsptlzRecordVO.hsptlzStartdate;
					let orderList = res.orderList; */
					
					
					
					
					let bodyCodeText = "";
					let hsptlzStartdate = "";
					$.each(hsptlzList, function(index, item) {
						console.log(item);
						let bodyCode = item.orderVO.bodyCode;
						console.log(bodyCode);
						if (index == hsptlzList.length - 1) {
							bodyCodeText += bodyCode;
						} else {
							bodyCodeText += bodyCode + ', ';
						}
						console.log(bodyCodeText);
						hsptlzStartdate = item.hsptlzStartdate;
					});
					
					// 오더코드 퇴원인지 확인
					/* let allOD010 = true;
					$.each(orderList, function(index, item) {
						if (item.orderNo !== 'OD010') {
				            allOD010 = false;
				            return false; // 루프 종료
				        }
					}); */
					
					
					let protectorVO = res.protectorVO;
					
					// 모달에 사용자 정보 넣기
					let nameSpan = $('#nameSpan');
					let ageSpan = $('#ageSpan');
					let genderSpan = $('#genderSpan');
					let bodyCodeSpan = $('#bodyCodeSpan');
					let protectorSpan = $('#protectorSpan');
					let protectorTelSpan = $('#protectorTelSpan');
					let startDateSpan = $('#startDateSpan');
					
					nameSpan.text(memName);
					ageSpan.text(memAge + "세");
					genderSpan.text(memGender);
					bodyCodeSpan.text(bodyCodeText);
					startDateSpan.text(hsptlzStartdate.split(" ")[0]);
					
					
					if (protectorVO != null) {
						// protectorVO null 아닌 경우에만
						let protectorName = protectorVO.protectorName;
						let protectorTel = protectorVO.protectorTel;
						protectorSpan.text(protectorName);
						protectorTelSpan.text(protectorTel);
					}
					
				}
		    });
		    
		});
		
		// 비어있는 침대 td에 클릭 이벤트 추가
		$(document).on('click', 'td img.empty-bed', function() {
		    // 클릭된 이미지의 data-bed-no 속성 값을 가져옴
		    let bedNo = $(this).data('bed-no');
		    // 가져온 값 사용 예시
		    console.log("Empty Bed Number:", bedNo);
		    
			let bedNoInp = $('#bedNoInp'); 
			
			bedNoInp.val(bedNo);
			
			  // 이전에 선택된 침대의 스타일을 초기화
		    $('td img.empty-bed').parent().css('background-color', 'transparent');
		    $('td img.empty-bed').parent().css('border', 'transparent');
		    $('td img.empty-bed').parent().css('box-shadow', '0 0 0px rgba(0, 0, 0, 0)');
		    
		    // 클릭된 침대의 배경색을 변경
		    $(this).parent().css('background-color', '#73b2ff3b');
		    $(this).parent().css('border', '2px solid grey');
		    $(this).parent().css('box-shadow', '0 0 10px rgba(0, 0, 0, 0.5)');
			
		});
		
		
		// 입원 대기환자 불러오기
		let testBtn = $('#testBtn');
		testBtn.click(function() {
			$.ajax({
				url : "/nurse/getHospitalizeOrder",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					console.log("입원대기환자 불러오기");
					console.log(res);
					let modalTbody = $('#modalTbody');
					let html = "";
					$.each(res, function (index, item) {
						console.log(item);
						
						let memNo = item.memNo;
						let memName = item.memName;
						let empName = item.empName;
						
						
						let orderList = item.orderList;
						// let orderVO = item.orderVO;
						// let orderNo = orderVO.orderNo;
						
						// let bodyCode = orderVO.bodyCode;
						// let orderCode = orderVO.orderCode;
						
						// let patientVO = item.patientVO;
						// let patntNo = patientVO.patntNo;
						
						html += "<tr style='text-align : center;'>"
						html += "	<td>" + memName;
						html += "		<input type='hidden' value='" + memNo + "'/></td>"
						html += "	<td>";
						// 이 부분 수정하기 chartNo로 바꾸던가
						$.each(orderList, function(index, item) {
							console.log(item);
							html += "	<span data-order-no='" + item.orderNo + "'>" + item.bodyCode + "</span><br/>";
						});
						html += "	<td>" + empName + "</td>"
						//html += "	<td><a href='javascript:void(0);' class='btn btn-icon btn-sm btn-warning-light' data-button='hsptlzInsert' data-bs-dismiss='modal'><i class='ri-edit-line'></i></a></td>";
						html += "<td><button class='btn btn-sm btn-info'><a href='javascript:void(0);' data-button='hsptlzInsert' data-bs-dismiss='modal'>선택</a></button></td>";

						html += "</tr>"
					});
					modalTbody.html(html);
				}
			});
			// 현재 입원중인 환자 퇴원오더 조회(입원중이면서 퇴원하지 않은)
			$.ajax({
				url : "/nurse/getLeaveOrder",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					console.log("퇴원환자 목록!!");
					console.log(res);
					let modalLeaveTbody = $('#modalLeaveTbody');
					let html = "";
					if (res.length == 0) {
						// 리스트 없는 경우 추가할거 있으면 하기
					}
					$.each(res, function (index, item) {
						console.log(item);
						
						let memNo = item.memNo;
						let memName = item.memName;
						let empName = item.empName;
						let patntNo = item.patntNo;
						
						
						let orderList = item.orderList;
						// let orderVO = item.orderVO;
						// let orderNo = orderVO.orderNo;
						
						// let bodyCode = orderVO.bodyCode;
						// let orderCode = orderVO.orderCode;
						
						// let patientVO = item.patientVO;
						
						
						html += "<tr style='text-align : center;'>"
						html += "	<td>" + memName;
						html += "		<input type='hidden' value='" + memNo + "'/></td>"
						html += "	<td>";
						// 이 부분 수정하기 chartNo로 바꾸던가
						$.each(orderList, function(index, item) {
							console.log(item);
							html += "	<span data-order-no='" + item.orderNo + "'>" + item.bodyCode + "</span><br/>";
						});
						html += "	<td>" + empName + "</td>"
						html += "	<td><a href='javascript:void(0);' class='btn btn-icon btn-sm btn-warning-light' data-button='hsptlzLeave' data-bs-dismiss='modal'><i class='bi bi-box-arrow-right'></i></a></td>";
						html += "</tr>"
					});
					modalLeaveTbody.html(html);
				}
			});
		});
		
		let dataValues = [];
		// 입원 input에 데이터 넣기, orderNo 모두 가져와서 데이터  배열로 보내야함
		$(document).on('click', '[data-button="hsptlzInsert"]', function() {
			dataValues = [];
			var $row = $(this).closest('tr');

		    // <tr> 내부의 각 <td> 요소의 값을 가져와 변수에 저장
		    let memNo = $row.find('td:nth-child(1)').find('input').val();
		    // let orderNo = $row.find('td:nth-child(2) span').data('order-no');
		    let modalTbody = $('#modalTbody');
		    let spanElements = $row.find('span');
		    console.log(spanElements)
		    
			spanElements.each(function() {
			    let dataOrderNo = $(this).data('order-no');
			    dataValues.push(dataOrderNo);
			});
			console.log(dataValues);
		    
		    
		    // console.log("orderNo");
		    // console.log(orderNo);
		    
		    let data = {
		    	memNo : memNo	
		    };
		    
		    // 데이터 가져와서  input에 넣기
		    $.ajax({
		    	url : "/nurse/getMemberInfo",
		    	type : "post",
		    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
		    	contentType : "application/json",
		    	data : JSON.stringify(data),
		    	success : function(res) {
					console.log(res);
				    let inputName = $('#inputName');
				    let inputGender = $('#inputGender');
				    let inputAge = $('#inputAge');
				    let inputAddress = $('#inputAddress');
				    let inputTel = $('#inputTel');
				    // let inputBodyCode = $('#inputBodyCode');
				    
				    let patntNo = res.memNo;
				    let patntName = res.memName;
				    let patntAge = res.memAge;
				    let patntGender = res.memGender;
				    let memAddress1 = res.memAddress1;
				    let memAddress2 = res.memAddress2;
				    let patntAddress = "";
				    
				    if (memAddress2 != null) {
					    patntAddress = res.memAddress1 + " " + res.memAddress2;
					} else {
					    patntAddress = res.memAddress1;
					}
				    
				    let patntTel = res.memTel;
				    
				    
				    inputName.val(patntName);
				    inputGender.val(patntGender);
				    inputAge.val(patntAge);
				    inputAddress.val(patntAddress);
				    inputTel.val(patntTel);
				    // orderNoInput.val(orderNo);
				    
				    let btnArea = $('#btnArea');
				    btnArea.html('');
				    btnArea.html('<button type="button" class="btn btn-sm btn-success" style="float: right;" id="insertHsptlz">입원</button>');
				    
				    
				    // 이용 가능한 호실만 불러오기
				    /* $.ajax({
				    	url : "/nurse/getAvailableBedList",
				    	type : "post",
				    	beforeSend: function(xhr) {
					        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
						},
				    	success : function(res) {
							let html = "";
							$.each(res, function (index, item) {
								let bedNo = item.bedNo;
								let wardNo = item.wardVO.wardNo;
								html += "<option>" + wardNo + "(" + bedNo + ")" + "</option>"
							});
							// hospitalRoomList.html(html);
						}
				    }) */
				    
				}
		    });
		    

		});
		
		// 퇴원 input에 데이터 넣기
		$(document).on('click', '[data-button="hsptlzLeave"]', function() {
			var $row = $(this).closest('tr');

		    // <tr> 내부의 각 <td> 요소의 값을 가져와 변수에 저장
		    let memNo = $row.find('td:nth-child(1)').find('input').val();
		    console.log(memNo);
		    
		    let data = {
		    	memNo : memNo	
		    };
		    
// 		    let leaveData = {};
		    $.ajax({
		    	url : "/nurse/getHsptlzByMemNo",
		    	type : "post",
		    	data : JSON.stringify(data),
		    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
		    	contentType : "application/json",
		    	success : function(res) {
					console.log(res);
					// 가져온 데이터 퇴원쪽에 넣기
					// 입원/퇴원 영역 어떻게 할지 고민하기
					let memNo = res.memNo;
					let memName = res.memName;
					let memAge = res.memAge;
					let memGender = res.memGender;
					let memTel = res.memTel;
					let memAddress1 = res.memAddress1;
					let memAddress2 = res.memAddress2;
					let chartNo = res.chartNo;
					let receiptNo = res.receiptNo;
					console.log("접수번호 떴냐??");
					console.log(receiptNo);
					
					let hsptlzStartdate = res.hsptlzStartdate;
					let bedNo = res.bedVO.bedNo;
					let wardNo = res.bedVO.wardVO.wardNo;
					
					console.log("호실 떴냐?")
					console.log(wardNo);
					
					let memAddress = "";
					if (memAddress2 != null) {
						memAddress = memAddress1 + " " + memAddress2;
					} else {
						memAddress = memAddress1;
					}
					// 입퇴원 여기서부터
					// 버튼 영역에 퇴원버튼 추가
					// input에 데이터 넣고 퇴원처리 후 침대 update하고 리스트 다시 띄우기
					
					let inputName = $('#inputName');
				    let inputGender = $('#inputGender');
				    let inputAge = $('#inputAge');
				    let inputAddress = $('#inputAddress');
				    let inputTel = $('#inputTel');
				    
				    inputName.val(memName);
				    inputGender.val(memGender);
				    inputAge.val(memAge);
				    inputAddress.val(memAddress);
				    inputTel.val(memTel);
				    
				    leaveData = {
				    	chartNo : chartNo,
				    	receiptNo : receiptNo,
				    	bedVO : {
				    		bedNo : bedNo
				    	},
				    	memNo : memNo,
				    	hsptlzRecordVO : {}
				    };
				    
				    console.log(leaveData);
				    // 퇴원 버튼 추가
				    let btnArea = $('#btnArea');
				    btnArea.html('');
				    btnArea.html('<button type="button" class="btn btn-sm btn-info" style="float: right;" id="leaveHsptlz">퇴원</button>');
				    
				    let leaveReasonArea = $('#leaveReasonArea');
				    let leaveHtml = "<label class='col-form-label'>퇴원 사유</label><textarea class='form-control' style='resize : none;' id='leaveReason'></textarea>";
				    leaveReasonArea.html('');
				    leaveReasonArea.html(leaveHtml);
				    console.log("추가 안됨???");
				    
				    // select 변경
				    $("#hospitalRoomList").val(wardNo).change();
				    
				}
		    });
		    
		});
		
		let insertHsptlz = $('#insertHsptlz');
		$(document).on('click', '#insertHsptlz', function() {
			
			console.log(dataValues);
			
			let hospitalRoomList = $('#hospitalRoomList');
			let wardNo = hospitalRoomList.val();
			let hospitalRoomListVal = hospitalRoomList.val();
			console.log(hospitalRoomListVal);
			
			let bedNo = $('#bedNoInp').val();
			// let bedNo = extractNumberInParentheses(hospitalRoomListVal);
			
			console.log(bedNo);
			console.log(wardNo);
			
			// 여기 다시 확인
			let jsonArray = [];
			dataValues.forEach(item => {
				console.log(item);
			    let jsonObject = {
			        bedVO: {
			        	bedNo : bedNo
			        },
			        orderVO : {
			        	orderNo : item
			        }
			        // 필요한 만큼 추가할 수 있습니다.
			    };
			    jsonArray.push(jsonObject);
			});
			console.log("jsonArray 생성");
			console.log(jsonArray);
			/* let data = {
					bedVO : {
						bedNo : bedNo
					},
					orderVO : {
						orderNo : orderNo
					}
				}; */
			$.ajax({
				url : "/nurse/insertHospitalize",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				data : JSON.stringify(jsonArray),
				success : function(res) {
					console.log(res);
					if (res) {
						getWardInfo(wardNo);
						getBedCount(wardNo);
					}
				}
			});
		});
		
		$(document).on('click', '#leaveHsptlz', function() {
			// 퇴원
			// chartNo만 있으면 퇴원 가능할듯
			let hsptlzLeavereason = $('#leaveReason').val();
			console.log(hsptlzLeavereason);
			console.log(leaveData);
			
			// json 추가 안됨
			leaveData.hsptlzRecordVO.hsptlzLeavereason = hsptlzLeavereason; // 퇴원 사유 가져와서 넣기
			
			console.log(leaveData);
			
			$.ajax({
				url : "/nurse/leaveHospitalize",
				type : "post",
				data : JSON.stringify(leaveData),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					console.log(res);
					// 퇴원 완료되었으면 알림 띄워주고 새로고침?이나 다른 동작 하기
					// 실패 시...
					if (res) {
						alert("퇴원 처리가 완료되었습니다.");
						location.reload();
 					} else {
 						alert("오류가 발생했습니다. 다시 한번 확인해주세요.");
 					}
				}
			});
			
		});
		
		let updateHsptlz = $('#updateHsptlz');
			updateHsptlz.click(function() {
			
		});
		
		let insertBtn = $('#insertBtn');
		insertBtn.click(function() {
			console.log("click!!");
			
			let patntNoVal = $('#patntNoInp').val();
			let hsptlzNoVal = $('#hsptlzNoInp').val();
			let receiptNoVal = $('#receiptNoInp').val();
			let nursingContentVal = $('#nursingContent').val();
			let ioIntake = $('#ioIntake').val();
			let ioEmission = $('#ioEmission').val();
			console.log(ioIntake);
			console.log(ioEmission);
			let pressureMax = $('#pressureMax').val();
			let pressureMin = $('#pressureMin').val();
			let vitalPulse = $('#vitalPulse').val();
			let respirationMin = $('#respirationMin').val();
			let vitalHeat = $('#vitalHeat').val();
			console.log(vitalHeat);
			
			let data = {
				patntNo : patntNoVal,
				hsptlzRecordVO : {
					hsptlzNo : hsptlzNoVal	
				},
				receiptNo : receiptNoVal,
				nursingContent : nursingContentVal,
				ioVO : {
					ioIntake : ioIntake,
					ioEmission : ioEmission
				},
				vitalVO : {
					pressureMax : pressureMax,
					pressureMin : pressureMin,
					vitalPulse : vitalPulse,
					respirationMin : respirationMin,
					vitalHeat : vitalHeat
				}
			};
			
			// 등록
			$.ajax({
				url : "/nurse/insertNuringRecord",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(res) {
					console.log(res);
				}
			});
			
		});
		
		function extractNumberInParentheses(str) {
		    // 정규 표현식 패턴 설정: 괄호로 둘러싸인 숫자
		    let regex = /\((\d+)\)/;
		    // 문자열에서 정규 표현식과 일치하는 부분을 찾음
		    let match = regex.exec(str);
		    // 괄호 안의 숫자 반환, 없으면 null 반환
		    return match ? match[1] : null;
		}
		
		
		// memNo로 입원 정보 가져오기
		/* $.ajax({
			url : "/nurse/getHsptlzByMemNo",
			type : "post",
			data : JSON.stringify({ memNo : memNo }),
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			contentType : "application/json",
			success : function(res) {
				console.log(res);
			}
		});
		 */
		 
		 function getBedCount(wardNo) {
			 $.ajax({
				url : "/nurse/getBedCount",
				type : "post",
				data : JSON.stringify({ wardNo : wardNo }),
			 	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					let totalCount = 0;
					let availableCount = 0;
					let usingCount = 0;
					$.each(res, function(index, item) {
						console.log(item);
						totalCount = item.totalCount;
						if (item.bedStatus == 'BS001') {
							availableCount = item.statusCount;					
						} 
						
						if (item.bedStatus == 'BS002') {
							usingCount = item.statusCount;
						}
					});
					// 총 침대 갯수, 사용가능 침대 갯수, 사용중인 침대 갯수 띄워주기
					console.log(totalCount);
					console.log(availableCount);
					console.log(usingCount);
					
					// 000호 - 사용가능 - 3/6, 사용중 - 3/6 형식 변경 필요함
					let countArea = $('#countArea');
					let html = "";
					html += "<span>";
					html += "	" + wardNo + "호 - ";
					html += "사용가능" + availableCount + "/" + totalCount;
					html += ", 사용중" + usingCount + "/" + totalCount;
					html += "</span>";
					countArea.html(html);
				}
			 });
		 }
	});
</script>


</html>