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
#waitingList{
overflow-y:auto;
	max-width:100%;
}
#waitingList .custom-card{
	    height: 95px;
	    width: 90%;
	    margin: 5%
	}

.custom-table {

    padding-bottom: 0px;
    margin-bottom: 10px;
}	
.custom-table tbody > tr > td{

    padding-top: 5px;
    padding-bottom: 5px;

}
.custom-table tboyd > tr > td > input{

    padding-top: 3px;
    padding-bottom: 3px;
}
</style>

<body>

<!-- 	<div class="page"> -->

		<div class="main-content app-content">
			<!-- <div class="container-fluid"> -->

				<!-- Start::row-1 -->
				<div class="row" style="padding-left: 12px;">
					<div class="col-xxl-2 col-xl-12">
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card"  style="height:880px;" >
								<div class="card-header justify-content-between">
									<div class="card-title">환자목록</div>
								</div>
								<div class="card-body" id="waitingList" style="overflow-y: auto;padding-left: 0px;padding-top: 3px;">
									
								</div>
							</div>
						</div>
					</div>
					<!-- 차트 div  -->
					<div class="col-xxl-10 col-xl-12">
					
					<div id="chartView">
						<div class="row" style="background-color: white; border-radius: 1%;">
							<div class="col-xl-4" style="border-right: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xl-12" style="padding-top: 12px;">
										<div class="card custom-card"
											style="border: solid 1px rgb(229, 228, 228);height: 400px;">
											<div class="card-header justify-content-between">
												<div class="card-title">환자 상세정보</div>
											</div>
											<div class="card-body" style="margin-bottom: 10px; padding-top: 0px;">
												<div class="content-wrapper" id="patntInfoArea" style="overflow-y: auto; max-height:320px;">
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-12">
										 <div class="card custom-card" style="border: solid 1px rgb(229, 228, 228); height:370px;">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                   		검사 및 처방 오더
                                                </div>
                                        	</div>
											<div class="card-body" style="margin-top: -2%; overflow-y: auto; max-height:320px;" id="orderArea">
												<!-- 이 부분 띄우는거 수정해야함 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						
							<div class="col-xl-3" style="border-right: solid 1px rgb(229, 228, 228);height: 880px;">
								<div class="col-xl-12">
									<div class="card custom-card">
										<div class="card-header  justify-content-between">
											<div class="card-title">내원이력</div>
										</div>
										<div class="card-body" style="overflow-y: scroll; height: 360px;"  >
											<div>
                                                    <ul class="list-unstyled mb-0 crm-recent-activity">
                                                        <li class="crm-recent-activity-content"  id="record-body" style="overflow-y: auto;max-height: 780px;">
                                                           
                                                        </li>
                                                       
                                                    </ul>
                                                </div>
										</div>
									</div>
								</div>
								<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="card custom-card">
											<div class="card-header  justify-content-between">
												<div class="card-title">간호이력</div>
											</div>
											<div class="card-body" style="overflow-y: scroll; height: 300px;"  >
												<div>
	                                                    <ul class="list-unstyled mb-0 crm-recent-activity">
	                                                        <li class="crm-recent-activity-content"  id="nurse-body" style="overflow-y: auto;max-height: 780px;">
	                                                           
	                                                        </li>
	                                                        
	                                                       
	                                                    </ul>
	                                                </div>
											</div>
										</div>
								</div>
							</div>
							
							<div class="col-xl-5"
								style="border-left: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xxl-12 col-xl-12">
										<div class="row">
											<div class="col-xl-12">
												<div class="col-xl-12" style="padding-top: 12px;">
													<div class="card custom-card" style="border: solid 1px rgb(229, 228, 228); height:840px;">
			                                            <div class="card-header justify-content-between">
			                                                <div class="card-title">
			                                                   	간호 기록 일지 작성
			                                                </div>
			                                        	</div>
														<div class="card-body" style="margin-top: -2%;" id="insertChartArea">
															<table class="table table-bordered border-primary custom-table" >
																<tbody id="table">
																	<tr>
																		<th>
																			환자명
																		</th>
																		<td style="padding-top: 6px;padding-bottom: 6px;">
																			<input type="text" style="padding-top: 3px; padding-bottom: 3px;" class="form-control" id="patntName" disab readonly="readonly"/>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			작성자
																		</th>
																		<td>
																			<input type="text" class="form-control" id="empName" readonly="readonly"> 
																		</td>
																	</tr>
																	<tr>
																		<th>
																			섭취량
																		</th>
																		<td>
																			<div class="input-group">
																				<input type="text" class="form-control" id="ioIntake">
																				<span class="input-group-text">mL</span>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			배출량
																		</th>
																		<td>
																		<div class="input-group">
																			<input type="text" class="form-control" id="ioEmission">
																			<span class="input-group-text">mL</span>
																		</div>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			최고혈얍
																		</th>
																		<td>
																			<input type="text" class="form-control" id="pressureMax"> 
																		</td>
																	</tr>
																	<tr>
																		<th>
																			최저혈압
																		</th>
																		<td>
																			<input type="text" class="form-control" id="pressureMin"> 
																		</td>
																	</tr>
																	<tr>
																		<th>
																			맥박
																		</th>
																		<td>
																		<div class="input-group">
																			<input type="text" class="form-control" id="vitalPulse"> 
																			<span class="input-group-text">회</span>
																		</div>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			분당호흡
																		</th>
																		<td>
																			<div class="input-group">
																				<input type="text" class="form-control" id="respirationMin">
																				<span class="input-group-text">회</span>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			체온
																		</th>
																		<td>
																			<div class="input-group">
																				<input type="text" class="form-control" id="vitalHeat"> 
																				<span class="input-group-text">°C</span>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th>
																			내용
																		</th>
																		<td>
																			<textarea class="form-control" rows="10" cols="30" id="nursingContent"
																			style="resize : none;"></textarea> 
																		</td>
																	</tr>
																
																</tbody>
															
															</table>
															<!-- 환자 번호, 접수 번호 잘 뜨나 테스트함 -->
															<input type="hidden" id="patntNo" readonly="readonly">
															<input type="hidden" id="receiptNo" readonly="readonly">
															<input type="hidden" id="hsptlzNo" readonly="readonly">
															<!-- 환자명 : <input type="text" class="form-control" id="patntName" readonly="readonly"/>
															로그인한 사용자 자동으로 들어가게?
															작성자 : <input type="text" class="form-control" id="empName" readonly="readonly"> 
															섭취량 : <input type="text" class="form-control" id="ioIntake"> 
															배출량 : <input type="text" class="form-control" id="ioEmission"> 
															최고혈얍 : <input type="text" class="form-control" id="pressureMax"> 
															최저혈압 : <input type="text" class="form-control" id="pressureMin"> 
															맥박 : <input type="text" class="form-control" id="vitalPulse"> 
															분당호흡 : <input type="text" class="form-control" id="respirationMin"> 
															체온 : <input type="text" class="form-control" id="vitalHeat"> 
															내용 : 
															<textarea class="form-control" rows="10" cols="30" id="nursingContent"
															style="resize : none;"></textarea>  -->
															<div style="text-align : right;">
															    <button type="button" class="btn btn-sm btn-info" id="insertChartBtn" style="float:right;">작성</button>
															    <button type="button" class="btn btn-sm btn-teal-gradient btn-wave" style="float:right;" id="test">test</button>
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
				<!-- <div class="col-xxl-2 col-xl-12"> -->

			</div>
			<!-- End::row-1 -->

<!-- 		</div> -->
<!-- 	</div> -->
	<!-- End::app-content -->

	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="searchModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="input-group">
						<a href="javascript:void(0);" class="input-group-text"
							id="Search-Grid"><i
							class="fe fe-search header-link-icon fs-18"></i></a> <input
							type="search" class="form-control border-0 px-2"
							placeholder="Search" aria-label="Username"> <a
							href="javascript:void(0);" class="input-group-text"
							id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
						<a href="javascript:void(0);" class="btn btn-light btn-icon"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fe fe-more-vertical"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Another
									action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Something
									else here</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Separated
									link</a></li>
						</ul>
					</div>
					<div class="mt-4">
						<p class="font-weight-semibold text-muted mb-2">Are You
							Looking For...</p>
						<span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
					</div>
					<div class="my-4">
						<p class="font-weight-semibold text-muted mb-2">Recent Search
							:</p>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="notifications.html"><span>Notifications</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="alerts.html"><span>Alerts</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
							<a href="mail.html"><span>Mail</span></a> <a class="ms-auto lh-1"
								href="javascript:void(0);" data-bs-dismiss="alert"
								aria-label="Close"><i class="fe fe-x text-muted"></i></a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="btn-group ms-auto">
						<button type="button" class="btn btn-sm btn-primary-light">Search</button>
						<button type="button" class="btn btn-sm btn-primary">Clear
							Recents</button>
					</div>
				</div>
			</div>
		</div>
	</div>


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

	
	<!-- JSVector Maps JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>

	<!-- JSVector Maps MapsJS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/maps/world-merc.js"></script>





    <!-- Select2 Cdn -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Internal Select-2.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/select2.js"></script>
    
    


</body>
<script type="text/javascript">
	$(function() {
		
		let memberNo = ${sessionScope.user.member.memNo};
    	let empName = "${sessionScope.user.member.memName}";
    	
    	let empNo = "";
    	
    	$.ajax({
    		url : "/nurse/getEmpInfo",
    		type : "post",
    		data : JSON.stringify({ memNo : memberNo }),
    		contentType : "application/json",
    		beforeSend: function(xhr) {
    			xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		},
    		success : function(res) {
    			console.log(res);
    			empNo = res.empNo;
    		}
    	});
		
		/* $.ajax({
			url : "/nurse/getWaitingPatntList",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function(res) {
				console.log(res);
				let waitingList = $('#waitingList');
				let html = "";
				$.each(res, function(index, item) {
					html += '<div class="card border custom-card" style="background-color:white;width: 170px;height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">'+
		            '<div class="card-header" style="height: 30px; background-color: #f6feff !important">'+
		            '<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">' + item.codeName + '</span>'+
		            '</div>'+
		            '<div class="card-body p-2" >'+
		            '<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="padding-left: 10px;padding-top: 5px;">'+
		            '<div class="d-inline-flex align-items-start position-relative">'+
		            // '<a href="profile.html" class="stretched-link"></a>'+
		            '<div class="flex-grow-1 patntList" data-mem-no="' + item.memNo + '" data-patnt-no="' + item.patntNo + '"'+
		            'data-receipt-no="' + item.receiptNo + '" data-chart-no="' + item.chartNo + '">' +
		            '<span class="mb-0 d-block fs-15 fw-semibold pickPt memName">' + item.memName + '</span>'+
		            '<span class="fs-13 text-muted">' + item.memGender + ' ' + item.memAge + '세</span>'+
		            '</div>' +
		            '</div>' +
		            '<span class="fs-10 badge rounded-pill bg-secondary">' + item.ccodeName + '</span>'+
		            
		            '</div>' +
		            '<input type="hidden" value="'+item.receiptNo+'" />'+
		            '</div>' +
		            '</div>';
				});
				waitingList.html(html);
			}
		}); */
		
		// 입원환자만 불러오기
		$.ajax({
			url : "/nurse/getHospitalizeList",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function(res) {
				console.log("입원환자 왔나??");
				console.log(res);
				
				let waitingList = $('#waitingList');
				let html = "";
				$.each(res, function(index, item) {
					html += '<div class="card border custom-card" style="background-color:white;width: 170px;height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">'+
		            '<div class="card-header" style="height: 30px; background-color: #f6feff !important">'+
		            '<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">' + item.bedVO.wardVO.wardNo + "호" + '</span>'+
		            '</div>'+
		            '<div class="card-body p-2" >'+
		            '<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="padding-left: 10px;padding-top: 5px;">'+
		            '<div class="d-inline-flex align-items-start position-relative">'+
		            // '<a href="profile.html" class="stretched-link"></a>'+
		            '<div class="flex-grow-1 patntList" data-mem-no="' + item.memNo + '" data-patnt-no="' + item.patientVO.patntNo + '"'+
		            'data-receipt-no="' + item.receiptNo + '" data-chart-no="' + item.chartNo + '" data-hsptlz-no="' + item.hsptlzRecordVO.hsptlzNo + '">' +
		            '<span class="mb-0 d-block fs-15 fw-semibold pickPt memName">' + item.memName + '</span>'+
		            '<span class="fs-13 text-muted">' + item.memGender + ' ' + item.memAge + '세</span>'+
		            '</div>' +
		            '</div>' +
		            //'<span class="fs-10 badge rounded-pill bg-secondary">' + item.ccodeName + '</span>'+
		            
		            '</div>' +
		            '<input type="hidden" value="'+item.receiptNo+'" />'+
		            '</div>' +
		            '</div>';
				});
				waitingList.html(html);
			}
		});
		
		//대기 환자 클릭이벤트
		$(document).on('click', '.patntList', function() {
			console.log('대기환자클릭체킁');
			
			let memNo = $(this).data('mem-no');
			let patntNo = $(this).data('patnt-no');
			let receiptNo = $(this).data('receipt-no');
			let chartNo = $(this).data('chart-no');
			let hsptlzNo = $(this).data('hsptlz-no');
			
			getNursingRecordList(patntNo);
			
			console.log("차트 번호");
			console.log(typeof chartNo);
			console.log(chartNo);
			
			if (chartNo == null) {
				console.log("차트번호 존재 x");
			} else {
				console.log("ㄱㄱ");
				getOrder(chartNo);
			}
			
			
			let patntNoInput = $('#patntNo');
			patntNoInput.val(patntNo);
			
			 let memName = $(this).find('.memName').text();
			console.log(memName);
			
			let patntNameInput = $('#patntName');
			patntNameInput.val(memName);
			
			let empNameInput = $('#empName');
			empNameInput.val(empName);
			
			let receiptNoInput = $('#receiptNo');
			receiptNoInput.val(receiptNo);
			
			let hsptlzNoInput = $('#hsptlzNo');
			hsptlzNoInput.val(hsptlzNo);
			
			console.log(memNo);
			
			let data = {
				memNo : memNo,
				receiptNo : receiptNo
			};
			
			// 환자 상세정보
			$.ajax({
				url : "/nurse/getPatntInfo",
				type : "post",
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					console.log("환자 상세정보");
					console.log(res);
					
					// 환자 상세정보 띄울 곳 만들기
					
					let memNo = res.memNo;
					let memName = res.memName;
					let memAge = res.memAge;
					let memGender = res.memGender;
					let memRegNo1 = res.memRegno1; // 주민번호 앞자리
					let memRegNo2 = res.memRegno2; // 주민번호 뒷자리
					let memTel = res.memTel;		
					let memAddTel = res.memAddtel;	// 추가연락처
					let protectorVO = res.protectorVO;	// 보호자vo
					let preDiagnosisVO = res.preDiagnosisVO;
					
					let html = "";
					html += "<div class='p-3 border-bottom border-block-end-dashed'>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			환자명 : " ;
					html += "		</span>";
					html += "		" + memName;
					html += "	</p>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			성별 : " ;
					html += "		</span>";
					html += "		" + memGender;
					html += "	</p>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			나이 : " ;
					html += "		</span>";
					html += "		" + memAge;
					html += "	</p>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			주민등록번호 : " ;
					html += "		</span>";
					html += "		" + memRegNo1 + " - " + memRegNo2;
					html += "	</p>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			연락처 : " ;
					html += "		</span>";
					html += "		" + memTel;
					html += "	</p>";
					html += "	<p class='mb-2 text-muted'>"
					html += "		<span class='fw-semibold text-default'>";
					html += "			추가 연락처 : " ;
					html += "		</span>";
					if (memAddTel == null) {
						html += "	없음";
					} else {
						html += "	" + memAddTel;
					}
					html += "	</p>";
					html += "</div>";
					
					// 보호자 정보가 존재하는 경우
					if (protectorVO != null) {
						let protectorName = protectorVO.protectorName; // 보호자명
						let protectorTel = protectorVO.protectorTel;	// 보호자 연락처
						let protectorRelate = protectorVO.protectorRelate; // 보호자 관계
						
						html += "<div class='p-3 border-bottom border-block-end-dashed'>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			보호자명 : " ;
						html += "		</span>";
						html += "		" + protectorName;
						html += "	</p>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			보호자 연락처 : " ;
						html += "		</span>";
						html += "		" + protectorTel;
						html += "	</p>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			보호자 관계 : " ;
						html += "		</span>";
						html += "		" + protectorRelate;
						html += "	</p>";
						html += "</div>";
					} else {
						html += "<div class='p-3 border-bottom border-block-end-dashed'>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			보호자명 : " ;
						html += "		</span>";
						html += "			보호자 정보 없음"
						html += "	</p>";
						html += "</div>";
					}
					
					// 특이사항 정보가 존재하는 경우
					if (preDiagnosisVO != null) {
						console.log("특이사항 있음???");
						console.log(preDiagnosisVO);
						let preDiagnosisExp = preDiagnosisVO.preDiagnosisExp;
						let preDiagnosisDisease = preDiagnosisVO.preDiagnosisDisease;
						let preDiagnosisAllergy = preDiagnosisVO.preDiagnosisAllergy;
						
						
						html += "<div class='p-3 border-bottom border-block-end-dashed'>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			수술 경험 : " ;
						html += "		</span>";
						html += "		" + preDiagnosisExp;
						html += "	</p>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			치료중인 질환 : " ;
						html += "		</span>";
						html += "		" + preDiagnosisDisease;
						html += "	</p>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			특이체질/알러지 : " ;
						html += "		</span>";
						html += "		" + preDiagnosisAllergy;
						html += "	</p>";
						html += "</div>";
					} else {
						html += "<div class='p-3 border-bottom border-block-end-dashed'>";
						html += "	<p class='mb-2 text-muted'>"
						html += "		<span class='fw-semibold text-default'>";
						html += "			특이사항 : " ; // 문구 바꾸기
						html += "		</span>";
						html += "		없음";
						html += "	</p>";
						html += "</div>";
					}
					
					// 정보 띄우기
					let patntInfoArea = $('#patntInfoArea');
					patntInfoArea.html(html);
				}
			});
			
			// 내원이력 (수납 완료된거만) 가져오기
			$.ajax({
				url : "/nurse/getHistoryList",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(res) {
					console.log("내원이력");
					console.log(res);
					// 내원이력 리스트 추가
					// 내원 이력 없으면 없다고 표시하기
					// 데이터 있을때 나오는거 확인해서 수정해야 할듯?
					
					var html = "";
					var chartData = []; // 빈 배열 생성
					
					if (res.length == 0) {
						html += "<span>내원이력이 존재하지 않습니다.</span>";
					} else {
						 for (var i = 0; i < res.length; i++) {
						        var currentChartData = res[i].chartNo; // 현재 요소의 chartNo를 가져와 변수에 할당
	
						        // 이미 chartData 객체에 해당 chartNo가 존재한다면
						        if (chartData[currentChartData]) {
						            // 해당 chartNo의 데이터에 새로운 주상병을 추가
						            chartData[currentChartData].chartVO.disNameKr.push(res[i].chartVO.disNameKr);
						        } else {
						            // chartNo가 존재하지 않는 경우, 새로운 객체를 생성하고 주상병을 추가
						            chartData[currentChartData] = {
						                chartNo: res[i].chartNo,
						                receiptDate: res[i].receiptDate,
						                memName: res[i].memName,
						                chartVO: {
						                    disNameKr: [res[i].chartVO.disNameKr] // 주상병을 배열로 저장
						                }
						            };
						        }
						    }
	
						    console.log("chartData:", chartData); // chartData에 chartNo가 같은 요소들이 묶여 있는 것을 확인
	
						    // chartData를 HTML로 변환하여 추가
						    for (var key in chartData) {
						        var data = chartData[key];
						        var datetimeString = data.receiptDate;
						        var parts = datetimeString.split(" ");
						        var datePart = parts[0];
						        var timePart = parts[1];
						        var timeParts = timePart.split(":");
						        var hour = timeParts[0];
						        var minute = timeParts[1];
	
						        html += '<div class="d-flex align-items-top">';
						        html += '<div class="me-3">';
						        html += '<span class="avatar avatar-xs bg-primary-transparent avatar-rounded">';
						        html += '<i class="bi bi-circle-fill fs-8"></i>';
						        html += '</span>';
						        html += '</div>';
						        html += '<div class="crm-timeline-content">';
						        html += '<span>' + datePart + '</span><br>';
						        html += '<span>' + data.memName + '</span><br>';
						        for (var j = 0; j < data.chartVO.disNameKr.length; j++) {
						        	html += '<span>';
						            html += data.chartVO.disNameKr[j];
						            if (j < data.chartVO.disNameKr.length - 1) {
						                html += '</span>, <br>';
						            } else {
						                html += '</span>';
						            }
						        }
						        html += '</span><br>';
						        html += '<span class="badge rounded-pill bg-dark-transparent">' + formatNumber(data.chartNo) + '</span>';
						        html += '</div>';
						        html += '<div class="flex-fill text-end">';
						        html += '<span class="d-block text-muted fs-11 op-7">' + hour + ':' + minute + '</span>';
						        html += '</div>';
						        html += '</div>';
						    }
					}
					$("#record-body").html(html);
				}
			});
		});
		
		// 내원이력 리스트 중 하나를 클릭하면 chartNo 가져와서 order 조회하기
		$(document).on("click", ".list", function() {
			// 내원이력 차트번호 가져오기
			let chartData = {
				chartNo : 541 // 임시로 넣음
			};
			
			$.ajax({
				url : "/nurse/getHistoryInfo",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(chartData),
				contentType : "application/json",
				success : function(res) {
					console.log("내원이력");
					console.log(res);
				}
			});
			
			// 대기환자 오더 조회
		});
		
		
		function getOrder(chartNo) {
			
			let data = {
				chartNo : chartNo	
			};
			console.log("chartNo 넘어옴??");
			console.log(data);
			
			$.ajax({
				url : "/nurse/getPatntOrder",
				type : "post",
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					console.log("getOrder!!");
					console.log(res);
					
					if (res == null || res == "") {
						console.log("아무것도 안왔어요.");
					} else {
						let memName = res.memName;
						let empName = res.empName;
						let chartRecord = res.chartRecord;
						let orderList = res.orderList;
						
						// 검사 및 처방 오더 들어가는 곳
						// 이 부분 바꾸기!!
						let html = "";
						html += "담당의 : " + empName + "<br/>";
						html += "진단 내역 : " + chartRecord + "<br/>";
						
						// orderCode를 그룹화하여 처리하기 위한 객체 생성
						let orderGroups = {};

						// orderList를 순회하면서 그룹화 작업 수행
						$.each(orderList, function(index, item) {
						    let orderCode = item.orderCode;
						    let bodyCode = item.bodyCode;
						    let mdcinNames = item.mdcinNames;

						    // orderCode를 키로하여 그룹화된 객체에 추가
						    if (!(orderCode in orderGroups)) {
						        orderGroups[orderCode] = { orderCode: orderCode, bodyCodes: [], mdcinNames: [] };
						    }

						    // bodyCode 또는 mdcinNames가 존재하는 경우 해당 그룹에 추가
						    if (bodyCode != null) {
						        orderGroups[orderCode].bodyCodes.push(bodyCode);
						    }
						    if (mdcinNames != null) {
						        orderGroups[orderCode].mdcinNames.push(mdcinNames);
						    }
						});

						// 그룹화된 데이터를 기반으로 HTML 작성
						$.each(orderGroups, function(key, group) {
						    let orderCode = group.orderCode;
						    let bodyCodes = group.bodyCodes.join(', ');
						    let mdcinNames = group.mdcinNames.join(', ');

						    // bodyCode 또는 mdcinNames가 있는 경우 출력
						    if (bodyCodes !== '') {
						        html += orderCode + " - " + bodyCodes + "<br/>";
						    } else if (mdcinNames !== '') {
						        html += orderCode + " - " + mdcinNames + "<br/>";
						    } else {
						        html += orderCode + "<br/>";
						    }
						});
						
					
						let orderArea = $('#orderArea');
						orderArea.html(html);
					}
					
				}
			});
		}
		
		let insertChartBtn = $('#insertChartBtn');
		insertChartBtn.click(function() {
			let patntNo = $('#patntNo').val();
			let receiptNo = $('#receiptNo').val();
			let hsptlzNo = $('#hsptlzNo').val();
			
			// io, vital
			let ioIntake = $('#ioIntake').val();
			let ioEmission = $('#ioEmission').val();
			let pressureMax = $('#pressureMax').val();
			let pressureMin = $('#pressureMin').val();
			let vitalPulse = $('#vitalPulse').val();
			let respirationMin = $('#respirationMin').val();
			let vitalHeat = $('#vitalHeat').val();
			
			
			console.log("patntNo", patntNo);
			console.log("receiptNo", receiptNo);
			let nursingContent = $('#nursingContent').val();
			
			console.log("nursingContent", nursingContent);
			
			// io, vital 추가하기
			let data = {
				empNo : empNo,
				patntNo : patntNo,
				receiptNo : receiptNo,
				empNo : empNo,
				nursingContent : nursingContent,
				hsptlzRecordVO : {
					hsptlzNo : hsptlzNo,
					
				},
				ioVO : {
					ioIntake : ioIntake,
					ioEmissions : ioEmission
				},
				vitalVO : {
					pressureMax : pressureMax,
					pressureMin : pressureMin,
					vitalPulse : vitalPulse,
					respirationMin : respirationMin,
					vitalHeat : vitalHeat
				}
				
			};
			
			// 간호기록 차트 다시하기
			$.ajax({
				url : "/nurse/insertNursingRecord",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(res) {
					console.log(res);
					if (res) {
						alert("차트 등록 성공");
						$('#insertChartArea input, #insertChartArea textarea').val('');
						location.reload();
					}
				}
			});
		});
		
		// 간호기록 불러오기
		function getNursingRecordList(patntNo) {
			
			console.log("환자번호 가져와지는지?", patntNo);
			$.ajax({
				url : "/nurse/getNursingRecordList",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify({ patntNo : patntNo }),
				contentType : "application/json",
				success : function(res) {
					console.log("간호기록 불러오기");
					console.log(res);
					if (res.length == 0) {
						$("#nurse-body").html("간호 기록 내역이 존재하지 않습니다.");
					} else {
						$.each(res, function (index, item) {
							
							console.log("간호기록보기 : ",item)
							// 간호기록 상세
							let memName = item.memName;
							let empName = item.empName;
							let nursingRecord = item.nursingRecord;
							let nursingDate = item.nursingDate;
							let nursingContent = item.nursingContent;
							
							let ioIntake = item.ioIntake; 
							let ioEmissions = item.ioEmissions;
							
							let pressureMax = item.pressureMax; 
							let pressureMin = item.pressureMin;
							let respirationMin = item.respirationMin; 
							let vitalPulse = item.vitalPulse;
							let vitalHeat = item.vitalHeate
							
							$("#nurse-body").html("["+(index+1)+"]    "
									+formatDate(item.nursingDate) +"<br>"+"작성자 : "+  item.empName
									+"<br>"+"섭취량 : "+item.ioIntake	+"mL<br>"+"배출량 : "+	item.ioEmissions 
									+"mL<br>"+"최고혈압 : "+item.pressureMax	+"<br>"+"최저혈압 : "+	item.pressureMin
									+"<br>"+"맥박 : "+item.vitalPulse	+"회<br>"+"분당호흡 : "+	item.respirationMin + "회<br>"+"체온 : "+item.vitalHeat
									+"°C<br>"+"내용       : "+item.nursingContent
							);
							//$("#").html(item.nursingContent);
							//$("#").html(item.nursingDate); 
							
							
							
						});
					}
				}
			});
		}
		
		$('#test').click(function() {
			console.log("test click!!!");
			$('#ioIntake').val("1200");
			$('#ioEmission').val("1000");
			$('#pressureMax').val("120");
			$('#pressureMin').val("80");
			$('#vitalPulse').val("79");
			$('#respirationMin').val("17");
			$('#vitalHeat').val("36.8");
			$('#nursingContent').val("특이사항 없음");
		});
	});
	
	

</script>


</html>