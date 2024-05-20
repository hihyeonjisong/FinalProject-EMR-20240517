<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath }/resources/select2/select2.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Sweetalerts JS -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/sweet-alerts.js"></script>
    
<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.css">
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.css"
	rel="stylesheet">
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
  background-color: rgb(35 183 229 /70%);
  border-radius: 0px;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  background-image: none;
  border:none;
}

.medicineStyle {
	display: inline-block; 
	width: 40px; 
	float: right; 
	margin-right: 30px; 
	border: none; 
	border-bottom: 1px solid lightgray; 
	text-align: right; 
	direction: rtl;
}

.select2-container--default .select2-selection--multiple .select2-selection__choice {
    background-color: rgb(35 183 229) !important;
    color: #fff !important;
    border: 1px solid rgb(35 183 229) !important;
    border-radius: .15rem !important;
    margin-block-start: .375rem !important;
}
.select2-container--default .select2-results__option--selected {
  background-color: rgb(35 183 229 /50%) !important;
  color: $white !important;

  &.select2-results__option--highlighted {
    background-color: rgb(35 183 229 /50%) !important;
    color: $white !important;
  }
}
.select2-selection__choice__remove .select2-selection__choice__remove:hover, .select2-selection__choice__remove:focus {
 	background-color: rgb(35 183 229) !important;
    color: $white !important;
}


.nav-link {
    border-block-end: 3px solid transparent !important;
    &:hover {
    color: rgb(35 183 229) !important;
  }
  }
.nav-link.active {
    background-color: transparent !important;
    border-block-end: 3px solid rgb(35 183 229) !important;
    color: rgb(35 183 229) !important;
  }

.nav-link {
  &:focus,
  &:hover {
    color: rgb(35 183 229) !important;
  }
}




</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/jstree.min.js"></script>
<!-- <link rel="stylesheet" href="//static.jstree.com/3.3.15/assets/bootstrap/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/themes/default/style.min.css" />


<div class="main-content app-content">
            <div class="container-fluid">

				<!-- Start::row-1 -->
				<div class="row">
					<div class="col-xxl-2 col-xl-12" style="margin-right:-5px;">
							<div class="card custom-card" style="margin-top:-1px;">
								<div class="card-header justify-content-between">
									<div class="card-title">환자목록</div>
								</div>
								<div class="card-body" id="waitingList" style="padding: 0.5rem; height: 830px; overflow-y: scroll;">
								</div>
							</div>
					</div>
					<!-- 차트 div  -->
					<div class="col-xxl-10 col-xl-12">
<!-- 					대덕병원 로고 -->
						<div id="logo">
						   <div class="col-xl-12 mx-auto d-flex align-items-center justify-content-center" style="height: 500px;">
						    <div class="position-relative">
                                 <div style="text-align: center; margin-top:300px;">
                                     <img src="${pageContext.request.contextPath }/resources/assets/logo/상하조합형_black.png" alt="로고" class="mx-auto" style="max-width: 600px;">
                                 </div>
                              </div>
						   </div>
						</div>
						<!--처음화면 영역-->
						<div id="previewPatient" style="display: none;">
                            <div class="col-xl-12 mx-auto d-flex align-items-center justify-content-center" style="height: 500px;">
                                <div class="position-relative">
                                    <div style="text-align: center;">
                                        <img src="${pageContext.request.contextPath }/resources/assets/img/doctorMainChart.png" alt="의료진이미지" class="mx-auto" style="max-width: 600px;">
                                    </div>
                                    <div class="card custom-card overflow-hidden" style="margin-bottom: -300px; width: 600px; margin-top: -30px;">
                                        <div class="card-body">
                                            <p class="mb-1 text-muted"  id="previewDoctor"><span class="badge bg-info-transparent" id="previewLoc"></span>
                                                <i class="las la-stethoscope mb-3"></i> 
                                            </p>
                                            <h5 class="fw-semibold d-inline-block mb-2" id="previewMemName"> </h5>
                                            <p class="fw-semibold text-muted d-inline-block mb-3" id="previewMemGender"></p>
                                            <p class="fw-semibold text-muted d-inline-block mb-3" id="previewMemAge"></p>
                                            <p class="text-muted mb-3">생년월일  : <span class="text-muted" id="previewMemRegno1"></span></p>
                                            <p class="text-muted mb-3">내원사유  : <span class="text-muted mb-3" id="previewReceiptReason"></span></p>
                                            <p class="text-muted mb-3">수술경험  : <span class="text-muted mb-3" id="preDiagnosis1"></span></p>
                                            <p class="text-muted mb-3">치료중질환  : <span class="text-muted mb-3" id="preDiagnosis2"></span></p>
                                            <p class="text-muted mb-3">특이체질/알러지  : <span class="text-muted mb-3" id="preDiagnosis3"></span></p>
                                            <button type="button" class="btn btn-outline-info btn-wave" id="startChart" style="float: right;">진료시작</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           </div>
                        <!-- 처음화면 영역 끝 -->
					
					<!-- 차트 상세 -->
					<div id="chartView" style="display: none;">
						<div class="row" style="background-color: white; border-radius: 1%;">
							<div class="col-xl-3" style="border-right: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xl-12">
										<div class="card custom-card">
											<div class="card-body">
												<div class="row">
<!-- 													<div -->
<!-- 														class="col-xxl-3 col-xl-2 col-lg-3 col-md-3 col-sm-4 col-4 d-flex align-items-center justify-content-center ecommerce-icon secondary px-0"> -->
<!-- 														<span class="rounded p-3 bg-secondary-transparent"> <svg -->
<!-- 																xmlns="http://www.w3.org/2000/svg" -->
<!-- 																class="svg-white secondary" height="24px" -->
<!-- 																viewBox="0 0 24 24" width="24px" fill="#000000"> -->
<!-- 																<path d="M0 0h24v24H0V0z" fill="none" /> -->
<!-- 																<path -->
<!-- 																	d="M12 6c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2m0 10c2.7 0 5.8 1.29 6 2H6c.23-.72 3.31-2 6-2m0-12C9.79 4 8 5.79 8 8s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 10c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" /></svg> -->
<!-- 														</span> -->
<!-- 													</div> -->
													<div
														class="col-xxl-9 col-xl-10 col-lg-9 col-md-9 col-sm-8 col-8 px-0" >
														<div class="mb-2">
															<span
																class="badge bg-secondary-transparent text-secondary px-1 py-2 fs-10"></span>
														</div>
														<div class="text-muted mb-1 fs-12">
															<span class="text-dark fw-semibold fs-20 lh-1 vertical-bottom" id="chartPatientName">
<!-- 																김환자 -->
															</span>
														</div>
														
															<p class="fs-12 mb-0">
																<span id="chartPatientGender"></span>
																<span id="chartPatientAge"></span>세
																<span id="chartPatientRegno1"></span>
															</p>
															<!-- 남, 23세(1999-09-09)  --> 
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-12">
									<div class="card custom-card">
										<div class="card-header  justify-content-between">
											<div class="card-title">내원이력</div>
<!-- 											<div class="dropdown"> -->
<!-- 												<a aria-label="anchor" href="javascript:void(0);" class="btn btn-icon btn-sm btn-light" -->
<!-- 													data-bs-toggle="dropdown" aria-expanded="false">  -->
<!-- 													<i class="fe fe-more-vertical"></i> -->
<!-- 												</a> -->
<!-- 											</div> -->
										</div>
										<div class="card-body" style="overflow-y: scroll; height: 500px; margin-right:-20px; margin-left:-20px; "  >
											<div class="accordion accordion-border-dark accordions-items-seperate" id="accordionprimaryborderExample">
<!-- 												내원이력 동적생성 영역 -->
											</div>
										</div>
									</div>
								</div>
								<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								</div>
							</div>
							<div class="col-xl-6">
								<div class="row">
									<div class="col-xl-12" style="margin-bottom: -3%;"> 
										<div class="card custom-card">
											<div class="card-header justify-content-between">
												<div class="card-title" id="currentTime">2024-03-24 14:00</div>
											</div>

										</div>
									</div>
									<div class="col-xl-12">
										<div class="card custom-card"
											style="border: solid 1px rgb(229, 228, 228);">
											<div class="card-header justify-content-between">

												<div class="card-title">진료기록</div>
<!-- 												<div class="dropdown"> -->
<!-- 													<a href="javascript:void(0);" class="p-2 fs-12 text-muted" -->
<!-- 														data-bs-toggle="dropdown" aria-expanded="false"> View -->
<!-- 														All<i -->
<!-- 														class="ri-arrow-down-s-line align-middle ms-1 d-inline-block"></i> -->
<!-- 													</a> -->
<!-- 													<ul class="dropdown-menu" role="menu"> -->
<!-- 														<li><a class="dropdown-item" -->
<!-- 															href="javascript:void(0);">Today</a></li> -->
<!-- 														<li><a class="dropdown-item" -->
<!-- 															href="javascript:void(0);">This Week</a></li> -->
<!-- 														<li><a class="dropdown-item" -->
<!-- 															href="javascript:void(0);">Last Week</a></li> -->
<!-- 													</ul> -->
<!-- 												</div> -->
											</div>
											<div class="card-body">
												<div class="content-wrapper">
													<div id="crm-revenue-analytics">
														<textarea class="form-control" id="chartRecord" wrap="hard" rows="7"></textarea>
														<div class="col-xl-12">
															<div class="card custom-card">
																<div class="card-header">
																	<div class="card-title">사진 첨부</div>
																</div>
															<form method="post" action="/doctor/insertImg" id="imgForm" enctype="multipart/form-data">
																<div class="form-group">
																	<div class="custom-file">
																		<input type="file" class="form-control form-control-sm" id="chartFile" name="chartFile" multiple="multiple"> 
																			<label class="custom-file-label" for="customFile"></label>
																	</div>
																	<div class="uploadedList"></div>
																</div>
																<sec:csrfInput />
															</form>
<!-- 																<div -->
<!-- 																     class="dropzone" -->
<!-- 																     id="my-dropzone"> -->
<!-- 																 </div> -->
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-12" style="margin-top: -2.5%;">
										 <div class="card custom-card" style="border: solid 1px rgb(229, 228, 228);">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                   		진단 및 처방
                                                </div>
                                                <div class="">
                                                <button class="btn btn-secondary-light btn-sm btn-wave waves-effect waves-light" data-bs-toggle="modal"
                                                data-bs-target="#insert-orderGroup" id="orderSetInsertBtn">
                                                    <i class="ri-add-line me-1 align-middle"></i>오더세트 등록
                                                </button>
                                            </div>
                                        </div>
                                        
                                         <!--오더세트 등록 모달 시작-->
                                                <div class="modal fade" id="insert-orderGroup" aria-labelledby="insert-orderGroupLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h6 class="modal-title" id="insert-orderGroupLabel">오더세트 등록</h6>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body px-4">
                                                                <div class="row gy-3">
                                                                    <div class="col-xl-12">
                                                                        <label for="orderName" class="form-label">오더세트명</label>
                                                                        <input type="text" class="form-control" id="orderName" placeholder="Enter Name">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-sm btn-primary" id="createOrderName" >등록</button>
                                                                <button type="button" class="btn btn-sm btn-light" data-bs-dismiss="modal" id="closeModal">취소</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <!--오더세트 등록 모달 끝-->
                                        
											<div class="card-body" style="margin-top: -2%;">
												<ul class="nav nav-pills nav-style-3 diagnosisUl" role="tablist">
	                                                <li class="nav-item">
	                                                    <a class="nav-link active" data-bs-toggle="tab" role="tab" aria-current="page" id="searchDiseases"
	                                                    href="#searchDiseases" aria-selected="true">상병</a>
	                                                </li>
	                                                <li class="nav-item">
	                                                    <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page" id="searchMedicine"
	                                                    href="#searchMedicine" aria-selected="true">약물</a>
	                                                </li>
	                                                <li class="nav-item">
	                                                    <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page" id="searchSurgery"
	                                                    href="#searchSurgery" aria-selected="true">수술</a>
	                                                </li>
	                                                <li class="nav-item">
	                                                    <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page" id="selectHospitalization"
	                                                    href="#selectHospitalization" aria-selected="true">입/퇴원</a>
	                                                </li>

	                                            </ul><br/> 
												<div class="input-group mb-3" style="margin-top: -2%;" id="searchBoxArea">
													<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchBox" aria-label="Recipient's username" aria-describedby="button-addon2">
												</div>
												<div class="input-group mb-3" style="margin-top: -2%; display: none;" id="hospitalizationCheck">
									                <div class="form-check form-check-lg d-flex align-items-center">
									                    <input type="checkbox" class="form-check-input  ml-2" name="hospitalizationSel" id="hospitalization" data-value="OD004" value="4">
									                    <label class="form-check-label" for="hospitalization"  style="border-bottom: 2px solid rgb(35 183 229);"> 입원 </label>
									                    <input type="checkbox" class="form-check-input" name="hospitalizationSel" id="dischargeCheck" data-value="OD010" style="margin-left: 100px;">
									                    <label class="form-check-label" for="dischargeCheck"  style="border-bottom: 2px solid rgb(35 183 229);"> 퇴원 </label>
									                </div>
												</div>
												
												
												<div class="content-wrapper" style="height: 100px;">
													<div id="crm-revenue-analytics">
														<div class="kanban-tasks-type new">
                                                        <div class="kanban-tasks" id="new-tasks">
                                                            <div id="new-tasks-draggable" data-view-btn="new-tasks">
                                                            <span class="badge rounded-pill bg-danger-transparent" style="pointer-events: none;">주상병</span>
                                                                <span id="primaryDisease" style="pointer-events: none;"></span>
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                    </div>
                                                    <div class="kanban-tasks-type todo">
                                                        <div class="kanban-tasks" id="todo-tasks" data-simplebar="init">
                                                            <div id="todo-tasks-draggable" data-view-btn="todo-tasks">
<!--                                                              <span class="badge rounded-pill bg-danger-transparent" id="secondDiseaseSpan" style="pointer-events: none;">부상병</span> -->
                                                                <span style="pointer-events: none;" id="secondDisease"></span>
                                                            </div>
                                                        </div>
                                                    </div>
														<div>
															<span id="medicinePrescription"></span><br/>
														</div>
														<div id="addOrderSurgery">
														</div>
														<div id="addOrderHospitalization">
														</div>
														<div>
<!-- 															<span class="badge rounded-pill bg-success-transparent m-2">물리치료</span> -->
															<div class="mb-2">
																 <label class="" for="bodyPart"><span class="badge rounded-pill bg-secondary-transparent">환부</span> </label>
																 <select class="js-example-basic-multiple" name="bodyPartList2" id="bodyPartList2" multiple="multiple">
																	<option value="B001">어깨/Shoulder</option>
																	<option value="B002">팔/Elbow</option>
																	<option value="B003">손목/Wrist</option>
																	<option value="B004">엄지/Thumb</option>
																	<option value="B005">손가락/Finger</option>
																	<option value="B006">고관절/Hip</option>
																	<option value="B007">무릎/Knee</option>
																	<option value="B008">발목/Ankle</option>
																	<option value="B009">경추/Cervical</option>
																	<option value="B010">흉추/Thoracic</option>
																	<option value="B011">요추/Lumbar</option>
																	<option value="B012">엉치/Sacrum</option>
																	<option value="B013">꼬리뼈/Coccyx</option>
																</select>
															</div>
															<div class="mb-2">
																<label for="ptSelect"><span class="badge rounded-pill bg-secondary-transparent">치료처방</span></label>
																 <select class="js-example-basic-multiple" name="ptSelect" id="ptSelect" multiple="multiple">
																	<option value="OD003">온열치료</option>
																	<option value="OD008">초음파치료</option>
																	<option value="OD009">충격파치료</option>
																</select>
															
															</div>
														</div>
												
													</div>

													<div class="btn-list">
<!-- 														<button type="button" -->
<!-- 															class="btn btn-secondary-light btn-wave" -->
<!-- 															data-bs-toggle="modal" -->
<!-- 															data-bs-target="#exampleModalScrollable3">진단서</button> -->
														<button type="button" class="btn btn-warning-light btn-wave" id="diagnosisPaperBtn" data-bs-toggle="modal" >진단서</button>
<!-- 														<button type="button" class="btn btn-success-light btn-wave" id="requestPT" data-bs-toggle="modal" data-bs-target="#requestPTModal">물리치료요청</button> -->
<!-- 														<button type="button" class="btn btn-danger-light btn-wave" id="collaborationBtn" data-bs-toggle="modal" data-bs-target="#collaboration" style="float:right;">협진요청</button> -->
														<button type="button"class="btn btn-secondary-light btn-wave"id="insertChartBtn" style="float: right;">진료완료</button>
														<button type="button" class="btn btn-danger-light btn-wave" id="collaborationBtn" style="float:right;">협진요청</button>
													</div>
													<div>
														<br>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
								<!--물리치료요청 모달 시작-->
<!-- 								<div class="modal fade" id="requestPTModal" tabindex="-1" -->
<!-- 									aria-labelledby="exampleModalScrollable2" -->
<!-- 									data-bs-keyboard="false" aria-hidden="true"> -->
<!-- 									<div class="modal-dialog modal-dialog-centered"> -->
<!-- 										<div class="modal-content"> -->
<!-- 											<div class="modal-header"> -->
<!-- 												<h6 class="modal-title" id="staticBackdropLabel2">물리치료 요청</h6> -->
<!-- 												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 											</div> -->
<!-- 											<div class="modal-body"> -->
<!-- 												<div class="row"> -->
<!-- 													<div class="card custom-card"> -->
<!-- 														<div class="card-body"> -->
<!-- 															<div class="card-body" style="padding: 0;"> -->
<!-- 																<div class="form-check form-check-md d-flex align-items-center"> -->
<!-- 																	<input class="form-check-input" type="checkbox" name="ptSelect" data-value="OD003" id="OD003">  -->
<!-- 																	<label class="form-check-label" for="OD003" style="margin-right: 10%;"> 온열치료 </label>  -->
<!-- 																	<input class="form-check-input" type="checkbox" name="ptSelect" data-value="OD008" id="OD008"> -->
<!-- 																	<label class="form-check-label" for="OD008" style="margin-right: 10%;"> 초음파치료</label>  -->
<!-- 																	<input class="form-check-input" type="checkbox" name="ptSelect" data-value="OD009" id="OD009"> -->
<!-- 																	<label class="form-check-label" for="OD009"> 충격파치료 </label> -->
<!-- 																</div> -->
<!-- 																<label class="" for="ptSelect">치료방법</label> -->
<!-- 																 <select class="js-example-basic-multiple" name="ptSelect" id="ptSelect" multiple="multiple"> -->
<!-- 																	<option value="OD003">온열치료</option> -->
<!-- 																	<option value="OD008">초음파치료</option> -->
<!-- 																	<option value="OD009">충격파치료</option> -->
<!-- 																</select> -->

<!-- 																<br /> -->
<!-- 																 <label class="" for="bodyPart">촬영부위</label> -->
<!-- 																 <select class="js-example-basic-multiple" name="bodyPartList2" id="bodyPartList2" multiple="multiple"> -->
<!-- 																	<option value="B001">어깨/Shoulder</option> -->
<!-- 																	<option value="B002">팔/Elbow</option> -->
<!-- 																	<option value="B003">손목/Wrist</option> -->
<!-- 																	<option value="B004">엄지/Thumb</option> -->
<!-- 																	<option value="B005">손가락/Finger</option> -->
<!-- 																	<option value="B006">고관절/Hip</option> -->
<!-- 																	<option value="B007">무릎/Knee</option> -->
<!-- 																	<option value="B008">발목/Ankle</option> -->
<!-- 																	<option value="B009">경추/Cervical</option> -->
<!-- 																	<option value="B010">흉추/Thoracic</option> -->
<!-- 																	<option value="B011">요추/Lumbar</option> -->
<!-- 																	<option value="B012">엉치/Sacrum</option> -->
<!-- 																	<option value="B013">꼬리뼈/Coccyx</option> -->
<!-- 																</select> -->
<!-- 															</div> -->
<!-- 															<button type="button" class="btn btn-outline-primary btn-wave mt-2 mb-2" data-bs-dismiss="modal" aria-label="Close" id="ptBtn" style="float: right;">입력</button> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<!--물리치료 모달 끝-->

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
                                        <div id="crm-revenue-analytics">
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
                                                        <td class="text-nowrap" style="text-align: center;">환자의 성명 </td>
                                                        <td id="dpName">김길동</td>
                                                        <td class="text-nowrap" style="text-align: center;">주민등록<br/>번호</td>
                                                        <td class="text-nowrap" colspan="2" id="dpRegno">980101-123456</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-nowrap" style="text-align: center;">환자의 주소</td>
                                                        <td colspan="2" id="dpAddress">경기 안양시 동안구</td>
                                                        <td colspan="2">(전화번호 : <br /><span id="dpTel">010-1234-4567</span>)</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        	<div style="text-align: center;">병 명<br /></div>
                                                            <input class="text-nowrap" type="checkbox" name="diagnosisType" data-value="DP001" onclick='checkOnlyOne(this)'/>임상적추정<br />
                                                            <input class="text-nowrap" type="checkbox" name="diagnosisType" data-value="DP002" onclick='checkOnlyOne(this)'/>최종진단
                                                        </td>
                                                        <td colspan="2">
                                                            (주상병)
                                                            <span id="dpPrimaryDiagnosis"></span><br />
                                                            (부상병)
                                                            <span id="dpSecondDiagnosis"></span>
                                                        </td>
                                                        <td class="text-nowrap" > 질병 분류번호<br />
                                                            <span id="dpPrimaryCode">M002</span><br />
                                                            <span id="dpSecondCode">E003</span><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-nowrap" style="text-align: center;">발병 연월일</td>
                                                        <td>
                                                            <input type="text" class="form-control" id="dpDiagDate" placeholder="0000-00-00" style="border: none;">
                                                        </td>
                                                        <td class="text-nowrap" style="text-align: center;">진단 연월일</td>
                                                        <td>
                                                            <input type="text" class="form-control" id="dpOnsetDate" placeholder="0000-00-00" style="border: none;">
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 50px; border: none;">
                                                        <td class="text-nowrap" style="text-align: center;">
                                                            	치료 내용 및  <br/>향후 치료에 <br/>대한 소견
                                                        </td>
                                                        <td colspan="4">
                                                            <textarea class="form-control" style="height: 200px; border: none;"
                                                                id="dpComment"></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center;"> 용도 </td>
                                                        <td colspan="4">
                                                            <input type="text" class="form-control" id="dpPurpose" style="border: none;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center;">  비고 </td>
                                                        <td colspan="4">
                                                            <input type="text" class="form-control" id="dpRemark" style="border: none;">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div id="paper2">
                                                    <table class="diagnosisTable">
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
                                                            <td> 의료기관 </td>
                                                            <td> 명칭 </td>
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
                                            <div>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="float:right">취소</button>
                                                <button class="btn btn-secondary shadow-secondary btn-wave" id="diagnosisPaperSendBtn" style="float:right">작성</button>
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
<!--진단서 모달 끝-->
							<!-- 협진요청 모달 시작 -->
							<div class="modal fade" id="collaboration" tabindex="-1" aria-labelledby="collaboration" data-bs-keyboard="false"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="col-xl-12"></div>
                            <div class="card custom-card">
                                <div class="modal-header">
                                    <div class="card-title">협진요청</div>
                                </div>
                                <div class="modal-body px-4">
                                    <div class="row gy-3">
                                        <div class="col-xl-12">
                                            <p class="fw-semibold mb-2"> 환자명 : <span id="collabo_patientName">김환자 </span><span id="collabo_patientBirth">960101 </span><span id="collabo_gender">남 </span></p>
<!--                                             <p class="fw-semibold mb-2"> -->
<!--                                                 	주상병 : <span id="collabo_disease">손목터널</span> -->
<!--                                             </p> -->
                                            <p class="fw-semibold mb-2">협진 요청 의사 : <span id="collaboDoctorName"></span></p>
<!--                                             <select class="form-control" data-trigger name="choices-single-default" id="selectDoctor"> -->
<!--                                                 <option value="">의사선택</option> -->
<!--                                                 <option value="4">김태원</option> -->
<!--                                                 <option value="2">선민수</option> -->
<!--                                                 <option value="3">최현흠</option> -->
<!--                                             </select> -->
											<p class="fw-semibold mb-2">협진 메모</p>
                                            <textarea class="form-control" id="collabo_comment" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary btn-wave mt-2 mb-2" id="collaboRequestBtn">요청</button>
                                        <button type="button" class="btn btn-outline-primary btn-wave mt-2 mb-2" data-bs-dismiss="modal" id="closeColaboModal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
							<!-- 협진요청 모달 끝 -->
<!-- 							방사선검사결과 -->
							<div class="col-xl-3"
								style="border-left: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xxl-12 col-xl-12">
										<div class="row">
											<div class="col-xl-12 col-xl-6">
												<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
													<div class="card custom-card">
														<div class="card-header justify-content-between">
															<div class="card-title">검사결과</div>
															<div>
																<button type="button" class="btn btn-sm btn-outline-secondary btn-wave" id="requestRadiationBtn" data-bs-toggle="modal" data-bs-target="#requestRadiationModal" style="float: right; height:80%; font-size: smaller;">검사요청</button>
															</div>
														</div>
														<div class="card-body">
															<ul class="list-unstyled">
																<!-- list-unstyled 클래스 추가 -->
																<div  id="radiationRecord">
																	<li class="mail-type">
																		<a href="javascript:void(0);">
																			<div class="d-flex align-items-center">
																				<span class="me-2 lh-1"> 
																					<i class="ri-inbox-archive-line align-middle fs-14"></i>
																				</span> 
																				<span class="flex-fill text-nowrap"> 검사 결과가 존재하지 않습니다</span><br>
																			</div>
																		</a>
																	</li>
																</div>
															</ul>

<!-- 															<div> -->
<!-- 																<button type="button" class="btn btn-outline-info rounded-pill btn-wave" id="requestRadiationBtn" data-bs-toggle="modal" data-bs-target="#requestRadiationModal" style="float: right;">검사요청</button> -->
<!-- 															</div> -->
														</div>	
													</div>
												</div>
<!-- 검사요청 모달 시작 -->
<div class="modal fade" id="requestRadiationModal" tabindex="-1" aria-labelledby="exampleModalScrollable2" data-bs-keyboard="false" aria-hidden="true">
    <!-- Scrollable modal -->
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="staticBackdropLabel2">방사선 검사 요청</h6>
                <button type="button" class="btn-close" id="radiationCloseBtn" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="card custom-card" >
                    	<form action="/doctor/orderRadiation" method="post" id="orderRadiation">
	                    	<input type="hidden" name="patntNo" id="patntNo" value="">
	                    	<input type="hidden" name="receiptNo" id="receiptNo" value="">
                        	<div class="card-body">
                            <div class="card-body" style="padding: 0;">
                                <div class="form-check form-check-md d-flex align-items-center"> 
                                    <input class="form-check-input" type="radio" data-value="OD002" name="checkTechnique">
                                    <label class="form-check-label" for="xray" style="margin-right: 40px;">
                                        X-RAY
                                    </label>
                                    <input class="form-check-input" type="radio" data-value="OD001" name="checkTechnique">
                                    <label class="form-check-label" for="MRI">
                                        MRI
                                    </label>
                                </div>
                                <br />
                                <label class="" for="bodyPart">촬영부위</label>
                                <select class="js-example-basic-multiple" name="bodyPartList" id="bodyPartList" multiple="multiple">
                                    <option value="B001">어깨/Shoulder</option>
                                    <option value="B002">팔/Elbow</option>
                                    <option value="B003">손목/Wrist</option>
                                    <option value="B004">엄지/Thumb</option>
                                    <option value="B005">손가락/Finger</option>
                                    <option value="B006">고관절/Hip</option>
                                    <option value="B007">무릎/Knee</option>
                                    <option value="B008">발목/Ankle</option>
                                    <option value="B009">경추/Cervical</option>
                                    <option value="B010">흉추/Thoracic</option>
                                    <option value="B011">요추/Lumbar</option>
                                    <option value="B012">엉치/Sacrum</option>
                                    <option value="B013">꼬리뼈/Coccyx</option>
                                </select>
                            </div>
                
	                            <button type="button" class="btn btn-outline-secondary btn-wave mt-2 mb-2" id="radiationSendBtn" style="float: right;">전송
	                            </button>		
                        	</div>
                        	<sec:csrfInput />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 검사요청 모달 끝 -->
												<div class="card custom-card" style="border: solid 1px rgb(229, 228, 228); margin-bottom: 0%">
													<div class="card-header  justify-content-between">
                                            			<div class="card-title">
                                              				 오더세트
                                            			</div>
                                            			
                                        			</div>
	                                       			 <div class="card-body" style="max-height: 300px; overflow-y: auto;">
			                                            <ul class="dropdown" id="orderSetList" style="list-style-type: none; padding-left: 0px;">
					                                        <li><a class="dropdown-item" href="#" data-groupOrderNo ="그룹오더넘버">그룹오더이름</a></li>
			                                            </ul>
	                                        		</div>
												</div>
												<br/>
												<button type="button" class="btn btn-teal-gradient btn-wave" id="test">test</button>
												
									<!-- /수정중/오더세트 펼쳐지게 하는거 추가중 -->			
<!-- 												<div class="card custom-card" style="border: solid 1px rgb(229, 228, 228); margin-bottom: 0%"> -->
<!-- 													<div class="card-header  justify-content-between"> -->
<!--                                             			<div class="card-title" id="selOrderSetName"> -->
<!--                                               				 여기에 오더세트 이름이 들어감 -->
<!--                                             			</div> -->
<!--                                         			</div> -->
<!-- 	                                       			 <div class="card-body" style="max-height: 600px; overflow-y: auto;"> -->
<!-- 			                                            <ul class="dropdown" id="selOrderSetContent" style="list-style-type: none; padding-left: 0px;"> -->
<!-- 					                                        <li><a class="dropdown-item" href="#" data-groupOrderNo ="주상병">주상병</a></li> -->
<!-- 					                                        <li><a class="dropdown-item" href="#" data-groupOrderNo ="부상병">부상병</a></li> -->
<!-- 					                                        <li><a class="dropdown-item" href="#" data-groupOrderNo ="약물">약물</a></li> -->
<!-- 			                                            </ul> -->
<!-- 	                                        		</div> -->
<!-- 												</div> -->
								<!-- 오더세트 펼쳐지게 하는거 추가중 끝-->			

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

<div class="modal fade" id="treemodal" tabindex="-1"
                                        aria-labelledby="exampleModalSmLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="exampleModalSmLabel">병원 조직도
                </h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body" id="jstree">
                
            </div>
        </div>
    </div>s
</div>



	
	<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/simplebar.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/dragula/dragula.min.js"></script>
       <!-- Internal Task  JS -->
       <script src="${pageContext.request.contextPath }/resources/assets/js/task-kanban-board.js"></script>
    
    <!-- Select2 Cdn -->
<!--     <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
    <script src="${pageContext.request.contextPath }/resources/select2/select2.min.js"></script>

    <!-- Internal Select-2.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/select2.js"></script>
    
<script type="text/javascript">

$(function() {
// 	//부상병 span 태그 보이고, 안보이고
// 	var siblingElement = $("#secondDisease").next();
	
// 	$("#secondDiseaseSpan").css("display", "none");
	
//진료기록 입력
$("#test").on("click",function(){
	$("#chartRecord").val("주요 증상: 오른쪽 무릎 관절에서 발생하는 통증\n"
			+"통증 특성: 원위부 및 앞·뒤쪽 국한, 통증 강도는 7/10 정도\n"
			+"특이 사항: 앉아 있는 상태에서 일어날 때와 계단 오르기 시 특히 통증이 심함\n"
			+"기타 증상: 보행 시 충돌음 발생\n"
			+"신체 검사 및 소견:\n"
			+"무릎 관절 부위: 감각 이상 없음, 운동 범위 정상\n"
			+"체중 이동 시: 충돌음 관찰\n"
			+"진단 및 치료 계획:\n"
			+"초기 진단: X-선 및 기능적 평가 권고\n"
			+"추가적인 치료 방향 검토 중\n"
			+"참고 사항:\n"
			+"후속 방문 예약: 다음 주에 재평가 예정\n");
});




// 	모달창 select2 오류 해결
	$('#bodyPartList').select2({
		dropdownParent: $('#requestRadiationModal')    
	});
	
	$("#ptSelect").on("change", function(){
		 $(this).select2("close");
	});
	

	//방사선 요청 버튼 클릭시 인풋값들 비워주기
	// 입력 요소의 값 초기화
    $('input[name="checkTechnique"]:checked').prop("checked", false);
    $('#bodyPartList').val('');
	//현재 날짜, 시간 출력
	// 현재 날짜와 시간을 가져오기 위해 Date 객체 생성
	var now = new Date();
	
	// 연, 월, 일, 시, 분을 가져오기
	var year = now.getFullYear();
	var month = addZero(now.getMonth() + 1); // 월은 0부터 시작하므로 1을 더함
	var day = addZero(now.getDate());
	var hours = addZero(now.getHours());
	var minutes = addZero(now.getMinutes());
	
	// 출력을 위한 포맷 지정
	var formattedDateTime = year + '년 ' + month + '월 ' + day + '일  ' + hours + '시 ' + minutes + '분 ';
	
	// 현재 날짜와 시간을 출력
	console.log("현재 시간: " + formattedDateTime);
	$("#currentTime").html(formattedDateTime);
	
	
	// 0을 추가하여 한 자리 숫자를 두 자리 숫자로 변환하는 함수
	function addZero(number) {
	    return (number < 10 ? '0' : '') + number;
	}
	
	//입퇴원창 hide/show
	var searchBox=$("#searchBoxArea");
	var hospitalizationCheck=$("#hospitalizationCheck");
	
	function showHospitalizationBox(){
		hospitalizationCheck.show();
		searchBox.hide();
	}
	
	function hideHospitalizationBox(){
		searchBox.show();
		hospitalizationCheck.hide();
	}
	//영역 선언
	var primaryDiseaseArea = $('#primaryDisease'); //주상병 텍스트 입력 영역
	var secondaryDiseaseArea = $('#secondDisease'); //부상병 텍스트 입력 영역
	var medicinePrescription = $('#medicinePrescription');
	

    //환자정보미리보기
    var previewLoc = $("#previewLoc");
    var previewDoctor = $("#previewDoctor");
    var previewMemName = $("#previewMemName");
    var previewMemGender = $("#previewMemGender");
    var previewMemAge = $("#previewMemAge");
    var previewMemRegno1 = $("#previewMemRegno1");
    var previewReceiptReason = $("#previewReceiptReason");
    var preDiagnosis1 = $("#preDiagnosis1");
    var preDiagnosis2 = $("#preDiagnosis2");
    var preDiagnosis3 = $("#preDiagnosis3");
    var preDiagnosis4 = $("#preDiagnosis4");
    
    //진료시작버튼
    var startChart = $("#startChart");
    
    var chartPatientName=$('#chartPatientName');
    var chartPatientGender=$('#chartPatientGender');
    var chartPatientAge=$('#chartPatientAge');
    var chartPatientRegno1=$('#chartPatientRegno1');
    
    let chartNo=0;

    //방사선요청
    var radiationSendBtn =$("#radiationSendBtn");
    var sendPatntNo="";			//환자번호
    let keyReceiptNo="";		//접수번호
//     var sendReceiptNo="";		//접수번호
	let radiationAttachNo=[];	//방사선 첨부파일 번호 담기
    
    //파일등록
	var chartFile = $("#chartFile"); 
	var imgForm = $("#imgForm");
    
    //대기환자 목록
    function getWaitingList(){
    $.ajax({
        url: '/doctor/getWatingList', // 서버의 엔드포인트 URL을 여기에 입력
        type: 'GET',
        dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
        beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
        success: function(data) {
	
            //환자리스트 뽑기
            var html = '';
            $.each(data, function(index, item) {
                html += '<div class="card border custom-card" style="background-color: white; margin-block-end: 0.5rem; !important">';
                html += '    <div class="card-header"  style="height: 30px; background-color: #f6feff !important">';
                html += '           <span class="fw-semibold fs-13" style="position: absolute; left: 12px; top: 7px;">' + item.codeName + '</span>';
                html += '    </div>'; 
                html += '    <div class="card-body p-2">';
                html += '              <div class="d-flex justify-content-between align-items-start mb-2 flex-wrap"  style="">';
                html += '                <div class="d-inline-flex align-items-start position-relative">';
                html += '              <a href="#" id="watingMemName" data-memNo="'+item.memNo+'">';
                html += '                  <div class="flex-grow-1">';
                html += '                    <span class="mb-0 d-block fs-15 fw-semibold">' + item.memName + '</span></a>';
                html += ' 					<span class="fs-13 text-muted">' + item.memGender + ', ' + item.memAge + '세</span>';
                html += ' 				 </div>';
                html += ' 				 </div>';
            						if(item.ccodeName=="진료중"){
                html += ' 				 <span class="fs-10 badge rounded-pill bg-secondary">' + item.ccodeName + '</span>';
            						}
            						if(item.ccodeName=="대기중"){
            	html += ' 				 <span class="badge rounded-pill bg-outline-secondary">' + item.ccodeName + '</span>';
            						}
                html += '                  	 </div>';                                                     
                html += '                  	 </div>';                                                     
                html += '                  	</div>';                                                     
                	
            });
            
            // HTML 업데이트
            $('#waitingList').html(html);
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText); // 에러 처리
        }
    });
    }
 // 페이지 로드 후 처음 한 번 요청을 실행
    getWaitingList();

    // 3초마다 비동기 요청 반복 실행
//     setInterval(getWaitingList, 10000);
	
    //진료실
    let locNum="";
	// 환자 클릭시 미리보기 화면 띄우기
     $('body').on('click','#watingMemName',function(event){
    
    	event.preventDefault();
    	
    	$('#previewPatient').css('display','block');
    	$('#chartView').css('display','none');
    	$('#logo').css('display','none');
    	
    	
    	//입력값들 비워주기
    	$("#chartRecord").val(''); 
	   	let inputs = document.querySelectorAll('input');
	    inputs.forEach(function(input) {
	        input.value = ''; 
	    });
        primaryDiseaseArea.nextAll().remove(); //영역 다 비우기
        secondaryDiseaseArea.nextAll().remove(); //영역 다 비우기
        medicinePrescription.nextAll().remove(); //영역 다 비우기
		$(".uploadedList").empty();
    	
    	
    	var memNo = $(this).attr('data-memNo');
    	
    	$.ajax({
   		 	url: '/doctor/patientPreview', // 서버의 엔드포인트 URL을 여기에 입력
   	        type: 'POST',
   	     	contentType: 'application/json',
   	        dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
   	     	data: JSON.stringify({ memNo: memNo }),
   	     	beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},

   	        success: function(data) {
   	        	console.log("미리보기" + data.preDiagnosisVO);
   	        	var patientPreview = data.patientPreview;
   	        	var preDiagnosisVO = data.preDiagnosisVO;
   	        	
   	     	previewLoc.text(patientPreview.codeName);	//진료실이름	
        	previewMemName.text(patientPreview.memName); //환자이름
        	previewMemGender.text(patientPreview.memGender); //환자성별
        	previewMemAge.text(patientPreview.memAge); //환자나이
        	previewMemRegno1.text(patientPreview.memRegno1); //생년월일
        	previewReceiptReason.text(patientPreview.receiptReason); //방문사유
        	
        	preDiagnosis1.text(preDiagnosisVO.preDiagnosisExp);	//수술경험
        	preDiagnosis2.text(preDiagnosisVO.preDiagnosisDisease);	//수술경험
        	preDiagnosis3.text(preDiagnosisVO.preDiagnosisAllergy);	//수술경험
        	preDiagnosis4.text(preDiagnosisVO.preDiagnosisPregnancy);	//수술경험
        	
        	console.log ("접수번호" + patientPreview.receiptNo);
        	console.log ("환자번호 " + patientPreview.patntNo);
        	
			partiTargetNo = patientPreview.patntNo;
			getPartiAjax(partiTargetNo);
        	
        	startChart.attr('data-memNo', patientPreview.memNo); //버튼에 memNo 담아서 진료차트 열게 하기
			startChart.attr('data-receiptNo', patientPreview.receiptNo); //버튼에 접수번호 담아서 환자 히스토리 바꾸기
			startChart.attr('data-historyLoc', patientPreview.codeNo); //버튼에 접수번호 담아서 환자 히스토리 바꾸기
			
			startChart.attr('data-chartNo', patientPreview.chartNo); //버튼에 차트넘버 담아서 방사선 촬영 갔따온 사람 구분하기
			startChart.attr('data-chartRecord', patientPreview.chartRecord); //버튼에 차트기록 담아서 방사선 촬영 갔따온 사람 채워주기
   	        }, error : function(){console.log("에러발생")}
   		})
    	
    })
    let historyLoc="";
    // 진료시작시 차트 열어서 환자기본정보 담아서 진료차트 비동기로 띄우기
     $('body').on('click','#startChart',function(event){
    	 
    	event.preventDefault();
    	
    	var memNo = $(this).attr('data-memNo');
    	keyReceiptNo = $(this).attr('data-receiptNo');
    	historyLoc = $(this).attr('data-historyLoc');	//환자히스토리
    	console.log("환자위치"+historyLoc);
    	var chartRecordVal = $(this).attr('data-chartRecord');
    	
    	let data = {
    			memNo : memNo,
    			receiptNo : keyReceiptNo,
    			historyLoc : historyLoc
    	}
    	
    	$('#previewPatient').css('display','none');
    	$('#chartView').css('display','block');
    	
    	//차트넘버 플래그
    	let chartNoFlag = $(this).attr('data-chartNo');	
    	console.log("차트번호 : " + chartNoFlag);
    	console.log("차트기록 : " + chartRecordVal);
    	//만약 chartNo가 있으면 방사선 촬영을 갔다 왔으면...
    	if(chartNoFlag> 0){
    		//진료차트 채워주기
    		$("#chartRecord").val(chartRecordVal);
    		chartNo=chartNoFlag;
    		console.log("타냐");
    	}else{
    		chartNo=0;
    	}
    	
    	//차트안에 환자이름
     	$.ajax({
   		 	url: '/doctor/patientPreview', 
   	        type: 'POST',
   	     	contentType: 'application/json',
   	        dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
   	     	data: JSON.stringify(data),
   	     	beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
	            xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	     	},
   	        success: function(data) {
   	        chartPatientName.text(data.patientPreview.memName); //환자이름
   	    	chartPatientGender.text(data.patientPreview.memGender); //환자성별
   	    	chartPatientAge.text(data.patientPreview.memAge); //환자나이
   	    	chartPatientRegno1.text(data.patientPreview.memRegno1); //환자생년월일
   	    	//차트내에서 쓰일 변수 담기
   	    	sendPatntNo = data.patientPreview.patntNo;
   	    	keyReceiptNo = data.patientPreview.receiptNo;
   	    	
   	    	getWaitingList();
   	        }
   		})
   		
   		//차트안에 지난진료이력
   		 $.ajax({
   		 	url: '/doctor/patientChart', 
   	        type: 'POST',
   	     	contentType: 'application/json',
   	        dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
   	     	data: JSON.stringify({ memNo: memNo }),
   	     	beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},

   	        success: function(data) {
   	        
   	        	var chartList = data.chartList;
   	        	var diseaseMap = data.diseaseMap;
   	        	var medicineMap = data.medicineMap;
   	        	var ptMap = data.ptMap;
   	        	var bodyMap = data.bodyMap;
   	        	
    	        // 서버에서 받은 데이터를 처리하여 HTML 업데이트
   	            var html = '';
   	            $.each(chartList, function(index, item) {
   	            	
   	            	html += "        <div class='accordion-item mb-2'>";
   	            	html += "            <h2 class='accordion-header' id='headingleftOne" + index + "'>";
   	            	html += "        		<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapseleftOne" + index + "' aria-expanded='true' aria-controls='collapseleftOne" + index + "'>" + formatDate(item.chartDate) + "</button>";
   	            	html += "            </h2>";
   	            	html += "    		<div id='collapseleftOne" + index + "' class='accordion-collapse collapse' aria-labelledby='headingleftOne" + index + "' data-bs-parent='#accordioniconLeftExample'>";
   	            	html += "                <div class='accordion-body'>";
   	            	html += "                    <div style='white-space: pre-line;'>";
//    	            	html += "                        <span class='badge rounded-pill bg-secondary-transparent'>진료기록</span><br/>";
   	            	html += "						<i class='bi bi-clipboard2-pulse'></i>"				
   	            	html += "                        "+item.chartRecord;
   	            	html += "                    </pre>";
   	            $.each( diseaseMap[item.chartNo], function(index1, item1) {
   	            	if(index1==0){
   	            		html += "                    <div>";
// 	   	            	html += "                        <span class='badge rounded-pill bg-danger-transparent'>주상병</span><br/>";
	   	            	html += "						<i class='bx bx-plus-medical'></i>";
	   	            	html += "                        "+item1.disNameKr;
	   	            	html += "                    </div>";
	   	            	html += "                    <div>";
// 	   	            	html += "                        <span class='badge rounded-pill bg-danger-transparent'>부상병</span><br/>";
	   	            	html += "  					 </div>";
   	            	}
   	            	if(index1 != 0){
   	            		html += "                    <div>";
	   	            	html += "						<i class='bx bx-plus-medical'></i>";
	   	            	html += "                        "+item1.disNameKr;
	   	            	html += "                    </div>";
   	            	}
   	            });
   	            	html += "                    <div>";
//    	            	html += "                        <span class='badge rounded-pill bg-info-transparent'>처방</span><br/>";
   	            	
   	             $.each( medicineMap[item.chartNo], function(index2, item2) {
   	            	html +="<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-capsule' viewBox='0 0 16 16'>";
   	            	html +="<path d='M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z'/>";
   	            	html +="</svg>";
   	            	html +=item2.mdcinName +"<br/>";
   	             });
   	             	html +="</div><div>";
	   	          $.each( ptMap[item.chartNo], function(index3, item3) {
	 	            	html +=item3.codeName +"<br/>";
	 	             });
	   	      		 html +="</div><div>";
	   	          $.each( bodyMap[item.chartNo], function(index4, item4) {
	 	            	html +="<i class='las la-hand-holding-heart'  style='font-size: 1.2em;'></i>";
	 	            	html +=item4.codeName +"<br/>";
	 	             });
   	            	html += "                    </div>";
   	            	html += "                </div>";
   	            	html += "            </div>";
   	            	html += "        </div>";
   	            	html += "        </div>";
   	            	
   	            });
//    	            HTML 업데이트
   	            $('#accordionprimaryborderExample').html(html);
   	            
	   	      // 클릭된 아코디언 열고 닫기
	   	         $('.accordion-button').on('click', function() {
	   	          var target = $(this).attr('data-bs-target');
	   	          var isOpen = $(target).hasClass('show');
	   	          if (isOpen) {
	   	        	$('.accordion-collapse').collapse('hide');
	   	          } else {
	   	              $('.accordion-collapse').collapse('hide');
	   	              $(target).collapse('show');
	   	          }
	   	      });
   	        	
   	        }
   		})
   		

   		//방사선 검사 자료
		//차트넘버로 방사선 기록 부르기
		let radiationRecord = $("#radiationRecord"); //리스트 입력 영역
		
		$.ajax({
   		 	url: '/doctor/getRadiationRec', // 서버의 엔드포인트 URL을 여기에 입력
   	        type: 'POST',
   	     	contentType: 'application/json',
   	        dataType: 'json', 
   	     	data: JSON.stringify({chartNo : chartNo}),
	   	     beforeSend: function(xhr) {
	             // CSRF 토큰 헤더에 추가
	            xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	 		},
   	        success: function(res) {
				console.log("방사선 결과"+res);
				var html="";
					html += '<li class="mail-type">' +
	// 			   					 '<a href="#">' +
				   						 '<div class="d-flex align-items-center">' +
				   							 '<span class="me-2 lh-1">' +
				   								 '<i class="ri-inbox-archive-line align-middle fs-14"></i>' +
				    						'</span>' +
				  							  '<span class="flex-fill text-nowrap"> '+res[0].rocRecordcontent+'</span><br>' +
				    					'</div>' +
	// 			   					 '</a>' +
				   			 '</li>';
				$.each(res, function(index, item) {
					radiationAttachNo.push(item.attachNo);
				});
				
// 				if(res !=""){
					html += '<div style="float:right; color: #00a8ed;""><a href="#" id="showRadiationImg">판독소견  <i class="bi bi-box-arrow-up-right"></i></a></div>'
// 				}
				
				radiationRecord.html(html);
   	        }
			
		})

   		//오더세트리스트 비동기
   		getOrderSetList();
		
   	  });
	
    //차트조회 끝
    //방사선 이미지창 띄우기
   $('body').on("click", "#showRadiationImg", function(event){
    event.preventDefault();
    console.log("여기서 차트번호 : " + chartNo);
    console.log("여기서 담은 어태치번호 "+ radiationAttachNo);
    
    // 새 창의 속성 설정
    var windowFeatures = "width=1300,height=700,menubar=no,toolbar=no";
    
    // 새 창 열기
    var newWindow = window.open("", "_blank", windowFeatures);
    
    // 각 첨부 파일 번호를 순회하며 이미지 생성
    radiationAttachNo.forEach(function(item) {
        // 이미지 요소 생성
        var imgElement = document.createElement("img");
        imgElement.src = "/file/showRadiationFile/"+item;
        imgElement.alt = "img";
        imgElement.width = "400";
        imgElement.height = "600";
        imgElement.classList.add("rounded-circle");
        imgElement.style.border = "1px solid black"; // 보더의 두께와 색상 설정

        // 새 창의 document에 이미지 추가
        newWindow.document.body.appendChild(imgElement);
    });
    if (window.screen) {
        var left = (window.screen.width - 1300) / 2;
        var top = (window.screen.height - 700) / 2;
        newWindow.moveTo(left, top);
    }

});


//  방사선 검사요청(비동기)
    radiationSendBtn.on("click", function(){
    	let patntNo = sendPatntNo;		//환자번호 담기
    	keyReceiptNo = keyReceiptNo; //접수번호 담기
    	let chartRecordRadiation = $("#chartRecord").val(); //진료기록
		let selectedBodyParts = [];
    	let checkTechnique = $("input[name='checkTechnique']:checked").data("value");
    	
    	$('#bodyPartList option:selected').each(function() {
    	    selectedBodyParts.push($(this).val());
    	});
    	
    	let data = {
    			patntNo : patntNo,
    			receiptNo : keyReceiptNo,
    			checkTechnique :checkTechnique,
    			bodyPartList : selectedBodyParts,
    			chartRecord : chartRecordRadiation
    	}
    	
	 	$.ajax({
   		 	url: '/doctor/orderRadation', // 서버의 엔드포인트 URL을 여기에 입력
   	        type: 'POST',
   	     	contentType: 'application/json',
   	        dataType: 'text', 
   	     	data: JSON.stringify(data),
   	     	beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},

   	        success: function(res) {
   				alert("요청성공!");
   				
   				$("#radiationCloseBtn").click();
//    				getWaitingList();
   				window.location.reload();
   				
   	        }
   		});
    	
    });

  	//진단 및 처방 검색 오토컴플릿
	var arr=[];
	// 상병(1), 약물(2), 수슬(3), 입퇴원(4) 선택 flag로 사용
	var searchFlag=0;	
	function loadDisease(){
	     $.ajax({
            type : 'GET',
            url: '/doctor/diseaseSearch',
            dataType : 'json',
            beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		},
            success : function(data) {
                // 서버에서 json 데이터 response 후 목록 추가
               	for(var i=0 ; i<data.length; i++){
               		arr[i]= data[i].disNo + " " + data[i].disNameKr;
               	}
            }
  		});
	}
	loadDisease();	// 환자를 선택 후, 진료시작 시에 최초의 상병 데이터를 arr변수에 로드해놓는다.
	
	//검색입력창 클릭시 값 비우기
	$("#searchBox").on("click",function(){
		$("#searchBox").val('');
	});
	
	// ul - li 요소를 클랬하고 요소 체크 후, 서버에서 값 가져오기(상병, 약물, 수술, 입퇴원)
// 	$(".diagnosisUl").on("click", "li", function(){
// 		console.log($(this).html());
		
// 		// 내가 선택한 flag가 어떤 항목인지를 확인하기 위해서 href속성 값을 가져온다.
// 		var href = $(this).find("a").attr("href");
		
// 		checkType(href);
		
// 		$('#searchBox').val('');	// 검색창 초기화
		
// 	});
	
	
	
// 	function checkType(href){
// 		 console.log("2, checkType arr 데이터 가져오기 갯수 : " + arr.length);
// 		arr = [];
// 		if(href.includes("Diseases")){
// 			searchFlag = 1;	// 상병
// 			$.ajax({
// 	            type : 'GET',
// 	            url: '/doctor/diseaseSearch',
// 	            dataType : 'json',
// 	            success : function(data) {
// 	                // 서버에서 json 데이터 response 후 목록 추가
//                 	for(var i=0 ; i<data.length; i++){
//                 		arr[i]= data[i].disNo + " " + data[i].disNameKr;
//                 	}
//                 	console.log("3, 상병 arr 데이터 가져오기 갯수 : " + arr.length);
// 	            }
//       		});
// 		}else if(href.includes("Medicine")){
// 			searchFlag = 2;	// 약물
// 			$.ajax({
// 	            type : 'GET',
// 	            url: '/doctor/medicineSearch',
// 	            dataType : 'json',
// 	            success : function(data) {
// 	                // 서버에서 json 데이터 response 후 목록 추가
//                 	for(var i=0 ; i<data.length; i++){
//                 		arr[i]=data[i].mdcinNo + " " + data[i].mdcinName;
//                 	}
//                 	 console.log("4, 약물 arr 데이터 가져오기 갯수 : " + arr.length);
//                 	 $("#searchBox").autocomplete("instance").options.source = arr;
// 	            }
//         	});
// 		}else if(href.includes("Surgery")){
// 			searchFlag = 3;	// 수술
// 			$.ajax({
// 				type : 'GET',
// 				url : '/doctor/surgerySearch',
// 				dataType : 'json',
// 				success : function(data) {
// 					// 서버에서 json 데이터 response 후 목록 추가
// 					for (var i = 0; i < data.length; i++) {
// 						arr[i] = data[i].surgeryKindCode + " "
// 								+ data[i].surgeryKindName;
// 					}
// 				}
// 			});
// 		}else{
// 			searchFlag = 4;	// 입퇴원
// 		}
		
// 	}
	
	
	 //상병검색
	  var diseaseTab = document.querySelector('a[href="#searchDiseases"]');
	  diseaseTab.addEventListener('click', function (event) {
		  hideHospitalizationBox();
		  searchFlag = 1;
			$('#searchBox').val('');	
			
	      $.ajax({
            type : 'GET',
            url: '/doctor/diseaseSearch',
            dataType : 'json',
            beforeSend: function(xhr) {
                      // CSRF 토큰 헤더에 추가
                     xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
          		},
            success : function(data) {
            	for(var i = 0; i < arr.length; i++) {
					arr[i] = "";
				}
                // 서버에서 json 데이터 response 후 목록 추가
               	for(var i=0 ; i<data.length; i++){
               		arr[i]= data[i].disNo + " " + data[i].disNameKr;
               	}
            },
            error: function(xhr, status, error) {
                console.error("AJAX 오류: " + status + ", " + error);
            }
          		
     	});
});
	 //약물검색
	 var medicineTab = document.querySelector('a[href="#searchMedicine"]');
	 medicineTab.addEventListener('click', function (event) {
		 hideHospitalizationBox();
		 searchFlag = 2;
		 $('#searchBox').val('');
	        $.ajax({
	            type : 'GET',
	            url: '/doctor/medicineSearch',
	            dataType : 'json',
	            beforeSend: function(xhr) {
	                      // CSRF 토큰 헤더에 추가
	                     xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	          		},
	            success : function(data) {
	            	for(var i = 0; i < arr.length; i++) {
						arr[i] = "";
					}
	                // 서버에서 json 데이터 response 후 목록 추가
	               	for(var i=0 ; i<data.length; i++){
	               		arr[i]=data[i].mdcinNo + " " + data[i].mdcinName;
	               	}
	            }
	       	});
		});


	//수술검색
		var surgeryTab = document.querySelector('a[href="#searchSurgery"]');
		surgeryTab.addEventListener('click', function(event) {
			hideHospitalizationBox();
			searchFlag = 3;
			$('#searchBox').val('');
			console.log("수술검색 선택!!");
			$.ajax({
				type : 'GET',
				url : '/doctor/surgerySearch',
				dataType : 'json',
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(data) {
					for(var i = 0; i < arr.length; i++) {
						arr[i] = "";
					}
					// 서버에서 json 데이터 response 후 목록 추가
					for(var i = 0; i < data.length; i++) {
						arr[i] = data[i].surgeryKindCode + " "+ data[i].surgeryKindName;
					}
				}
			});
		});
	
		//입/퇴원선택
		let hospitalizationAreaHtml="";	//입퇴원 추가영역
		let hospitalizationSend="";	//입퇴원 전송할 코드
		
		var hospitalizationTab = document.querySelector('a[href="#selectHospitalization"]');
		hospitalizationTab.addEventListener('click', function(event) {
			
			showHospitalizationBox();
			
			searchFlag = 4;
			$('#searchBox').val('');
			console.log("입퇴원 선택");
		});
	 	$('#hospitalization').change(function(){
			console.log($(this))
			let val = $(this).data('value');
			
			   if ($(this).prop('checked')) {
		            addToOrder("입원수속");
		            hospitalizationSend=$(this).data('value');
		        } else {
		            removeFromOrder("입원수속");
		            hospitalizationSend='';
		        }
			   console.log("담긴값"+ hospitalizationSend);
		});
	 	$('#dischargeCheck').change(function(){
			console.log($(this))
			let val = $(this).data('value');
			
			   if ($(this).prop('checked')) {
		            addToOrder("퇴원수속");
		            hospitalizationSend=$(this).data('value');
		        } else {
		            removeFromOrder("퇴원수속");
		            hospitalizationSend='';
		        }
			   console.log("담긴값"+ hospitalizationSend);
			
		});
	 	

		// 		var medicineList = [];	//처방약 리스트 배열
		var medicineSelect = ""; //
		var medicineData = {}; //처방약을 제이슨형식으로 담은 데이터
		var medicineName = ""; //처방약 이름 밸류값
		var medicineNo = ""; //처방약 번호 키값
// 		var medicinePrescription = $('#medicinePrescription');
		
		//수술처방관련
		var surgerySelect = ""; //
		var surgeryData = {}; //
		var surgeryName = ""; //
		var surgeryNo = ""; //
		var addOrderSurgery = $('#addOrderSurgery');

		var primaryDisease = "";
		var primaryDiseaseData = {}; //주상병을 제이슨형식으로 담은 데이터
		var primaryDiseaseName = ""; //주상병 이름 밸류값
		var primaryDiseaseNo = ""; //주상병 번호 키값

		var secondaryDisease = "";
		var secondaryDiseaseList = []; //부상병 리스트 배열
		var secondaryDiseaseNoList = []; //부상병 번호 배열
		var secondaryDiseaseData = {}; //부상병을 제이슨형식으로 담은 데이터
		var secondaryDiseaseName = ""; //부상병 이름 밸류값
		var secondaryDiseaseNo = ""; //부상병 번호 키값

		$("#searchBox").autocomplete({
							maxShowItems : 5,
							source : arr,
							select : function(event, ui) { //검색 리스트에서 해당 필드 선택시 select 이벤트 발생
							// 	            console.log(ui);
							// 	            console.log(ui.item.label);
							// 	            console.log(ui.item.value);
							// 	            console.log(ui.item.test);
							
							//선생님수정
// 							if(searchFlag == 1){	// 상병
// 								console.log("검색 후 상병 들어옴");
								
// 								//주상병 영역이 비어있을때 
// 								if (primaryDiseaseArea.next().length === 0) {
// 									var primaryDiseaseAreaHtml = ""; //주상병 입력 텍스트
// 									primaryDisease = ui.item.label;
// 									primaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"
// 											+ primaryDisease
// 											+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
// 									primaryDiseaseArea
// 											.after(primaryDiseaseAreaHtml);

// 									$('#searchBox').val('');

// 								} else { //부상병 영역에 추가
// 									var secondaryDiseaseAreaHtml = ""; //부상병입력 텍스트
// 									secondaryDisease = ui.item.label; //부상병 입력
// 									secondaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"
// 											+ secondaryDisease
// 											+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
// 									secondaryDiseaseArea
// 											.after(secondaryDiseaseAreaHtml);
// 									$('#searchBox').val('');
// 								}
							
// 							}else if(searchFlag == 2){	// 약물
// 								console.log("검색 후 약물 들어옴");
							
// 								var medicineAreaHtml = "";
// 								medicineSelect = ui.item.label;
// 								medicineAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"
// 										+ medicineSelect
// 										+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
// 								medicinePrescription.after(medicineAreaHtml);
// 								$('#searchBox').val('');
							
// 							}else if(searchFlag == 3){	// 수술
// 								console.log("검색 후 수술 들어옴");
// 							}else{	// 입퇴원
// 								console.log("검색 후 입퇴원 들어옴");
// 							}
							// 원본
// 								if (diseaseTab.classList.contains('active')) {
// 									//주상병 영역이 비어있을때 
// 									if (primaryDiseaseArea.next().length === 0) {
// 										var primaryDiseaseAreaHtml = ""; //주상병 입력 텍스트
// 										primaryDisease = ui.item.label;
// 										primaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px; transition: transform 0.3s ease-in-out; cursor: move;'>"
// 																+ "<i class='bx bx-plus-medical'></i> "
// 																+ primaryDisease
// 																+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
// 										primaryDiseaseArea.after(primaryDiseaseAreaHtml);

// 										$('#searchBox').val('');

// 									} else { //부상병 영역에 추가
// 										var secondaryDiseaseAreaHtml = ""; //부상병입력 텍스트
// 										secondaryDisease = ui.item.label; //부상병 입력
// 										secondaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px; transition: transform 0.3s ease-in-out; cursor: move;'>"
// 												+ "<i class='bx bx-plus-medical'></i> "
// 												+ secondaryDisease
// 												+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
// 										secondaryDiseaseArea.after(secondaryDiseaseAreaHtml);
// 										$('#searchBox').val('');
// 									}

								

							if (diseaseTab.classList.contains('active')) {
								    // 주상병 영역이 비어있을 때
								    if (primaryDiseaseArea.next().length === 0) {
								        var primaryDiseaseAreaHtml = ""; // 주상병 입력 텍스트
								        primaryDisease = ui.item.label;
								        primaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'>"
								                                + "<i class='bx bx-plus-medical'></i> "
								                                + primaryDisease
								                                + "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
								        primaryDiseaseArea.after(primaryDiseaseAreaHtml);
	
								        $('#searchBox').val('');
								    } else { // 부상병 영역에 추가
								    
								        var secondaryDiseaseAreaHtml = ""; // 부상병 입력 텍스트
								        secondaryDisease = ui.item.label; // 부상병 입력
								        secondaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'>"
								                                    + "<i class='bx bx-plus-medical'></i> "
								                                    + secondaryDisease
								                                    + "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
								        secondaryDiseaseArea.after(secondaryDiseaseAreaHtml);

								        
								        $('#searchBox').val('');
								    }

						
								} else if (medicineTab.classList.contains('active')) {
									var medicineAreaHtml = "";
									medicineSelect = ui.item.label;
									let medicineSelNo =medicineSelect.substring(0,medicineSelect.indexOf(' ')); //약물 번호
									let medicineSelName =medicineSelect.substring(medicineSelect.indexOf(' ') + 1); //약물이름
									medicineAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'><span class='targetSpan'>"
											+"<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-capsule' viewBox='0 0 16 16'>"
						   	            	+"<path d='M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z'/>"
						   	            	+"</svg>  "
											+"<span class='selmediNo' style='display:none;'>" +medicineSelNo+"</span>" + medicineSelName
											+ "</span><a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a>"
											+ "<input class='medicineStyle' type='text' id='prescriptionTotal' style='margin-right:7px' placeholder='정'>"
											+ "<input class='medicineStyle' type='text' id='prescriptionFrequency' style='margin-right:7px' placeholder='회'>"
											+ "<input class='medicineStyle' type='text' id='prescriptionDay' style='margin-right:7px' placeholder='일'></div>";
									medicinePrescription.after(medicineAreaHtml);
									$('#searchBox').val('');
									
								} else if(surgeryTab.classList.contains('active')){
									var surgeryAreaHtml = "";
									surgerySelect = ui.item.label;
									surgeryAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'>"
									+"<i class='ri-pulse-fill'></i>"
										+ surgerySelect
										+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
										addOrderSurgery.after(surgeryAreaHtml);
									$('#searchBox').val('');
								}
							},
							focus : function(event, ui) { //한글 오류 방지
								return false;
							},
							minLength : 1,
							autoFocus : true,
							classes : {
								'ui-autocomplete' : 'highlight'
							},
							delay : 500,
							position : {
								my : 'right top',
								at : 'right bottom'
							},
							close : function(event) {
								console.log(event);
							}
						});


		//선택항목 삭제
		document.addEventListener('click', function(event) {
			if (event.target.id === 'deleteSel') {
				event.preventDefault(); // 기본 동작 방지
				console.log("삭제!!!!!!");
				var parentDiv = event.target.closest('.card'); // 클릭된 "X" 버튼의 부모 요소인 div.card를 찾습니다.
				parentDiv.remove(); // 부모 요소를 삭제합니다.
			}
		});

		//진료완료버튼을 눌러서 진료차트 생성
		var medicineNoList = []; //처방약번호
		var surgeryNo=""; //수술 번호
		let chartFiles = []; // 사진첨부 시 저장할 파일 공간

		$("#insertChartBtn").on("click",function() {
			
			if (confirm("진료를 완료하시겠습니까?")) {
			    // 삭제 작업 실행
			    console.log("진료가 완료되었습니다.");
			}
			
		
			//진료차트 테이블
			var chartRecord = $("#chartRecord").val(); //진료기록
			var receiptNo = keyReceiptNo; //접수번호
			var patntNo = sendPatntNo; //환자번호//진단내역 테이블
			//주상병
			var primaryDiseaseSend = $("#primaryDisease").next("div").text().trim(); //주상병 번호와 이름
			primaryDiseaseName = primaryDiseaseSend.substring(primaryDiseaseSend.indexOf(' ') + 1); // 주상병 이름
			primaryDiseaseNo = primaryDiseaseSend.substring(0,primaryDiseaseSend.indexOf(' ')); // 주상병 번호
			primaryDiseaseData[primaryDiseaseNo] = primaryDiseaseName; // JSON 형식의 데이터에 키와 값을 추가
			//부상병
			var secondaryDiseaseSend = [];
			var secondaryDiseaseSel = "";
			var divCountDisease = $("#secondDisease").siblings("div").length;

			for (var i = 0; i < divCountDisease; i++) {
				secondaryDiseaseSel = $("#secondDisease").nextAll("div").eq(i).text().trim()
				secondaryDiseaseSend.push(secondaryDiseaseSel); //부상병 번호와 이름
				secondaryDiseaseName = secondaryDiseaseSel.substring(secondaryDiseaseSel.indexOf(' ') + 1); // 부상병 이름
				secondaryDiseaseNo = secondaryDiseaseSel.substring(0, secondaryDiseaseSel.indexOf(' ')); // 부상병 번호
				secondaryDiseaseNoList.push(secondaryDiseaseNo); //부상병번호 배열형식(오더세트등록에서 쓰임)
				secondaryDiseaseData[secondaryDiseaseNo] = secondaryDiseaseName; // JSON 형식의 데이터에 키와 값을 추가
			}

			//오더테이블
			//처방약오더
			var medicineSend = [];	
			var medicineSel = "";
			var divCountMedicine = $("#medicinePrescription").siblings("div").length;
			
			var medicineListSend = [];
			let medicineSelList = $("#medicinePrescription").nextAll("div");
			console.table(medicineSelList);
			$.each(medicineSelList, function(idx, medicineSel){
				 medicineNo = $(medicineSel).find('.selmediNo').text().trim().split(' ')[0];
				 medicineNoList.push(medicineNo);
				 let prescriptionDay = $(medicineSel).find("#prescriptionTotal").val();
				 let prescriptionFrequency = $(medicineSel).find("#prescriptionFrequency").val();
				 let prescriptionTotal = $(medicineSel).find("#prescriptionDay").val();
				 
				 let dayListItem = {
						 
						 mdcinNo : medicineNo,
						 prescriptionDay : parseInt(prescriptionDay),
						 prescriptionFrequency : parseInt(prescriptionFrequency),
						 prescriptionTotal : parseInt(prescriptionTotal)
				 }
				 
				 medicineListSend.push(dayListItem);
			});

			//물리치료 오더
				//치료방법 담기
				var selectPt=[];
				$('#ptSelect option:selected').each(function(){
					selectPt.push($(this).val());
				});
				//치료부위 담기
				var selectBody=[];
				$('#bodyPartList2 option:selected').each(function(){
					selectBody.push($(this).val());
				});

			//수술오더
			var surgerySend = [];
			var surgerySel = "";
			var divCountsurgery = $("#addOrderSurgery").siblings("div").length;

// 			for (var i = 0; i < divCountsurgery; i++) {
// 				surgerySel = $("#addOrderSurgery").nextAll("div").eq(i).text().trim()
				surgerySel = $("#addOrderSurgery").next("div").eq(0).text().trim();
				surgerySend.push(surgerySel); //수술 번호와 이름
				surgeryName = surgerySel.substring(surgerySel.indexOf(' ') + 1); // 수술이름
				surgeryNo = surgerySel.substring(0,surgerySel.indexOf(' ')); // 수술 번호
// 			}

			//주상병 널값체크
			if(primaryDiseaseNo ==""){
				alert("주상병을 입력하세요");
				return;
			}
			
			// 일, 회, 정 널값 체크
			medicineListSend.forEach(function(item, index) {
			    if (isNaN(item.prescriptionDay)||isNaN(item.prescriptionFrequency)||isNaN(item.prescriptionTotal)) {
			    	console.log("약물수량확인");
			        alert("약물수량을 입력하세요");
			        return;
			    }
			});
			
			// 환부 널값체크
			if(selectBody.length===0){
				alert("환부를 선택하세요");
				return;
			}
	
			var formData = new FormData();
			
			formData.append("chartNo", chartNo);
			formData.append("chartRecord", chartRecord);
			formData.append("receiptNo", keyReceiptNo);
			formData.append("patntNo", patntNo);
			formData.append("primaryDiseaseNo", primaryDiseaseNo);
			formData.append("secondaryDiseaseNoList",secondaryDiseaseNoList);
			formData.append("surgeryNo", surgeryNo);
			formData.append("selectPtList", selectPt);
			formData.append("selectBodyList", selectBody);
			formData.append("hospitalizationOrder", hospitalizationSend);	//수술처방
			
			formData.append("historyLoc",historyLoc);	//입원실 거르기 위한 폼데이터
			
			for (var i = 0; i < chartFiles.length; i++) {
				formData.append("chartFile", chartFiles[i]);
			}
			
			// medicineListSend 배열의 각 요소를 반복하여 FormData에 추가
			medicineListSend.forEach(function(item, index) {
			    formData.append("medicineListSend[" + index + "].mdcinNo", item.mdcinNo);
			    formData.append("medicineListSend[" + index + "].prescriptionDay", item.prescriptionDay);
			    formData.append("medicineListSend[" + index + "].prescriptionFrequency", item.prescriptionFrequency);
			    formData.append("medicineListSend[" + index + "].prescriptionTotal", item.prescriptionTotal);
			});
			

			console.log("선택방법" + selectPt);
			console.log("선택부위" + selectBody);
			console.table(medicineListSend);
			
			$.ajax({
				url : '/doctor/insertChart',
				type : 'POST',
				contentType : false,
				processData : false,
				dataType : 'text',
				data : formData,
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res) {
					//차트넘버가져오기
					location.href = "/doctor/mainChart";

				}
			});
		});

		//오더세트모달 띄우는 버튼 누르면 입력값 비우기
		$("#OrderSetInsertBtn").on("click", function() {
			$("#orderName").val('');

		});
		//오더세트 등록
		var groupOrderName = ""; //오더세트 명
		$("#createOrderName").on("click",function() {
			groupOrderName = $("#orderName").val(); //그룹오더 이름
			//진단내역 테이블
			//주상병
			var primaryDiseaseSend = $("#primaryDisease").next("div").text().trim(); //주상병 번호와 이름
			primaryDiseaseName = primaryDiseaseSend.substring(primaryDiseaseSend.indexOf(' ') + 1); // 주상병 이름
			primaryDiseaseNo = primaryDiseaseSend.substring(0,primaryDiseaseSend.indexOf(' ')); // 주상병 번호
			primaryDiseaseData[primaryDiseaseNo] = primaryDiseaseName; // JSON 형식의 데이터에 키와 값을 추가
			//부상병
			var secondaryDiseaseSend = [];
			var secondaryDiseaseSel = "";
			var divCountDisease = $("#secondDisease").siblings("div").length;

			for (var i = 0; i < divCountDisease; i++) {
				secondaryDiseaseSel = $("#secondDisease").nextAll("div").eq(i).text().trim()
				secondaryDiseaseSend.push(secondaryDiseaseSel); //부상병 번호와 이름
				secondaryDiseaseName = secondaryDiseaseSel.substring(secondaryDiseaseSel.indexOf(' ') + 1); // 부상병 이름
				secondaryDiseaseNo = secondaryDiseaseSel.substring(0, secondaryDiseaseSel.indexOf(' ')); // 부상병 번호
				secondaryDiseaseNoList.push(secondaryDiseaseNo); //부상병번호 배열형식(오더세트등록에서 쓰임)
				secondaryDiseaseData[secondaryDiseaseNo] = secondaryDiseaseName; // JSON 형식의 데이터에 키와 값을 추가
			}

			//오더테이블
			//처방약오더
			let medicineSelList2 = $("#medicinePrescription").nextAll("div");
			let medicineNoList2=[];
			
			$.each(medicineSelList2, function(idx, medicineSel){
				let medicineNo = $(medicineSel).find('.selmediNo').text().split(' ')[0];
				medicineNoList2.push(medicineNo); 
			});

			var data = {
				groupOrderName : groupOrderName,
				primaryDiseaseNo : primaryDiseaseNo, //주상병번호
				secondaryDiseaseNoList : secondaryDiseaseNoList, //부상병번호 리스트
				medicineNoList : medicineNoList2
			};

			$.ajax({
				url : '/doctor/insertGroupOrder', // 서버의 엔드포인트 URL을 여기에 입력
				type : 'POST',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res) {
					alert('등록 성공');
					$("#closeModal").click();
					getOrderSetList();
				}
			});
		});
		


		//오더세트 조회
		var dropdownItems = document.querySelectorAll('.orderList');
		var groupOrderNo = "";
		// 각각의 요소에 대해 클릭 이벤트를 추가
		// li 요소를 클릭할 때마다 색깔로 표시
		$('.dropdown-item').on('click', function() {
			// 모든 li 요소의 클래스를 초기화
			$('.dropdown-item').removeClass('active');
			// 현재 클릭한 li 요소에 active 클래스 추가
			$(this).addClass('active');
		});

		$("#orderSetList").on("click",".orderList",
		function(event) {
			event.preventDefault(); // 기본 동작 방지
			
			//영역 비우기
			primaryDiseaseArea.nextAll().remove(); 
			secondaryDiseaseArea.nextAll().remove(); 
			medicinePrescription.nextAll().remove(); 
			
			//수정중
			// 클릭된 요소에서 그룹오더 넘버 가져오기
			groupOrderNo = this
					.getAttribute('data-groupOrderNo');

			$.ajax({
				url : '/orderSet/detail',
				type : 'POST',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify({
					groupOrderNo : groupOrderNo
				}),
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res) {
					
					var orderSetName = res.orderSetName;	//오더세트이름
					var diseaseList = res.orderSetDiseaseList;	//오더세트질병리스트
					var medicineList = res.orderSetMedicineList;	//오더세트 약물리스트

					$.each(diseaseList,function(index,item) {
						var getPrimaryDiseaseAreaHtml = "";
						var getSecondaryDiseaseAreaHtml = "";
// 						$("#selOrderSetName").after(res.orderSetName);
// 						let selOrderSetContent = $("#selOrderSetContent");

						if (index == 0) {
							getPrimaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'>"
									+"<i class='bx bx-plus-medical'></i>"
									+ item.disNo
									+ " "
									+ item.disNameKr
									+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
							primaryDiseaseArea.after(getPrimaryDiseaseAreaHtml);
						
						}
						if (index != 0) {
							getSecondaryDiseaseAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'>"
									+ "<i class='bx bx-plus-medical'></i>"
									+ item.disNo
									+ " "
									+ item.disNameKr
									+ "<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
							secondaryDiseaseArea.after(getSecondaryDiseaseAreaHtml);
						}
					});
					$.each(medicineList,function(index,item) {
						var getMedicineAreaHtml = "";
						getMedicineAreaHtml += "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'><span class='targetSpan'>"
								+"<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='currentColor' class='bi bi-capsule' viewBox='0 0 16 16'>"
			   	            	+"<path d='M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z'/>"
			   	            	+"</svg>  "
			   	            	+"<span class='selmediNo' style='display:none;'>" +item.mdcinNo+"</span>" + item.mdcinName
// 								+ item.mdcinNo
// 								+ " "
// 								+ item.mdcinName
								+ "</span><a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a>"
								+ "<input class='medicineStyle' type='text' style='margin-right: 7px;' id='prescriptionTotal' placeholder='정'>"
								+ "<input class='medicineStyle' type='text' style='margin-right: 7px;' id='prescriptionFrequency' placeholder='회'>"
								+ "<input class='medicineStyle' type='text' style='margin-right: 7px;' id='prescriptionDay' placeholder='일'></div>";
						medicinePrescription.after(getMedicineAreaHtml);
					});

					// 	   	         $('#insert-orderGroup').on('show.bs.modal', function (e) {
					// 	 	            // 모달이 열릴 때 실행되는 부분
					// 	 	            $('#orderName').val(orderSetName);
					// 	 	        });

				}
			});
		});
		//파일등록
		//Open 파일을 변경했을 때 발동 (파일을 선택했을때)
		chartFile.on("change",function(event) {
			console.log(event);
			var files = event.target.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				// 			console.log("이거 찍히는 파일 이름" + file.name); // 파일 체크
				var formData = new FormData();
				formData.append("file", file);
				chartFiles.push(file);
				$.ajax({
					url : "/file/uploadAjaxChart",
					type : "post",
					data : formData,
					//받고싶은 데이터 타입
					dataType : "text",
					//직렬화방지
					processData : false,
					//enc타입 활용하기 위해
					contentType : false,
					beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            		},
					success : function(data) {
						var idx = data.indexOf("_") + 1;
						console.log("데이터값 : " + data);
						var fileName = data.substr(idx);
						console.log("이거 파일이름 값" + fileName);
						var str = "";
						if (checkImageType(data)) { //이미지면 이미지태그를 이용하여 출력
							str += "<div style='position: relative; background-color: black; display: inline-block;'>";
							str += "    <a href='#' id='imgClick'"
									+ " data-value='"
									+ fileName + "' data-value2='"+data+"'>";
							str += "        <img src='/file/displayFileChart?fileName="
									+ getThumbnailName(data)
									+ "' style='width: 100px; height: 100px;'>";
							str += "    </a>";
							str += "    <span style='position: absolute; top: 5px; right: 5px; color: white; cursor: pointer;'>X</span>";
							str += "</div>";
// 						if (checkImageType(data)) { //이미지면 이미지태그를 이용하여 출력
// 							str += "<div style='position: relative; background-color: black; display: inline-block;'>";
// 							str += "    <a href='/file/displayFileChart?fileName="
// 									+ data
// 									+ "' data-value='"
// 									+ fileName + "'>";
// 							str += "        <img src='/file/displayFileChart?fileName="
// 									+ getThumbnailName(data)
// 									+ "' style='width: 100px; height: 100px;'>";
// 							str += "    </a>";
// 							str += "    <span style='position: absolute; top: 5px; right: 5px; color: white; cursor: pointer;'>X</span>";
// 							str += "</div>";
						} else {
							str += "<div style='position: relative; background-color: black; display: inline-block;'>";
							str += "    <a href='/file/displayFileChart?fileName="
									+ data
									+ "' data-value='"
									+ fileName + "'>";
							str += "        <img src='/file/displayFileChart?fileName="
									+ getOriginalName(data)
									+ "' style='width: 100px; height: 100px;'>";
							str += "    </a>";
							str += "    <span style='position: absolute; top: 5px; right: 5px; color: white; cursor: pointer;'>X</span>";
							str += "</div>";
						}
						$(".uploadedList").append(str);
					}
				});
				}
		});

		
		
		//썸네일 클릭시 크게 띄워주기
		$("body").on("click", "#imgClick", function(event){
			event.preventDefault();
			var selFileName = $(this).data("value2");
			console.log("클릭파일이름 : " +selFileName);
			
			var chartFileView = "width=1300, height=700, menubar=no, toolbar=no";
			
			var newWidowView = window.open("","_blank", chartFileView);
// 			newWindow.document.body.style.backgroundColor = "black";
			
			var chartFileElement = document.createElement("img");
			
			chartFileElement.src="/file/displayFileChart?fileName="+selFileName;
			chartFileElement.alt = "img";
			chartFileElement.width="1300";
			chartFileElement.height = "700";
			
			newWidowView.document.body.appendChild(chartFileElement);
			
		});

		//업로드 한 파일의 'X'를 클릭했을때
		$(".uploadedList").on("click", "span", function() {
			$(this).parent("div").remove();
			var selFileName = $(this).siblings("a").data("value");
			console.log("선택한 파일이름 " + selFileName);
			for (var i = 0; i < chartFiles.length; i++) {
				console.log("이거 파일차트이름들" + chartFiles[i].name);
				if (String(chartFiles[i].name) === String(selFileName)) {
					console.log("선택한 파일이름 " + selFileName);
					chartFiles.splice(i, 1); // 해당 파일을 배열에서 삭제
					break;
				}
			}
			// 		console.log("이거임 " + $(this).siblings("a").data("value"));
			console.log("이게 차트파일 " + chartFiles);

		});

		// 파일명 추출
		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}

		//임시 파일로 썸네일 이미지 만들기(폴더에서 s_가 붙은 썸네일을 찾아옴)
		function getThumbnailName(fileName) {
			var front = fileName.substr(0, 12); // /2024/03/06/ 폴더
			var end = fileName.substr(12); //뒤 파일명
			console.log("front : " + front);
			console.log("end : " + end);
			return front + "s_" + end;
		}

		// 이미지 파일인지 확인
		function checkImageType(fileName) {

			//정규 표현식을 사용하여 이미지 파일 확장자를 나타내는 패턴을 정의한다.
			// /와 /i 사이에 있는 jpg|gif|png|jpeg는 이미지 파일 확장자를 나타내며, 
			// i 플래그는 대소문자를 구분하지 않도록 설정
			var pattern = /jpg|gif|png|jpeg/i;

			return fileName.match(pattern); // 패턴과 일치하면 true(이미지구나?)
		}

		var collaboPatientName = $("#collabo_patientName"); //협진요청할 환자이름
		var collaboPatientBirth = $("#collabo_patientBirth"); //협진요청할 환자 생년월일
		var collaboGender = $("#collabo_gender"); //협진요청할 환자 성별
		var collaboDisease = $("#collabo_disease"); //주상병

		var selectDoctor = $("#selectDoctor"); //요청대상의사
		var collaboComment = $("#collabo_comment"); // 요청 메모
		var collaboRequestBtn = $("#collaboRequestBtn"); //협진요청 전송버튼
		var respDoctor = ""; //대상의사 직원번호



		//진단서 등록 버튼
		$("#diagnosisPaperBtn").on("click",function() {
			
				//받을 접수번호 변수 값
				console.log("진단서 접수번호  : " + keyReceiptNo);

				//기본값 세팅
				let dpPatntNo = $("#dpPatntNo");
				let dpReceiptNo = $("#dpReceiptNo");
				let dpName = $("#dpName");
				let dpRegno = $("#dpRegno");
				let dpAddress = $("#dpAddress");
				let dpTel = $("#dpTel");
				let dpPrimaryDiagnosis = $("#dpPrimaryDiagnosis");	//주상병
				let dpPrimaryCode = $("#dpPrimaryCode");
				let dpSysdate = $("#dpSysdate");
				let dateText = year + '년' + month + '월' + day+ '일  ';

				dpSysdate.text(dateText);
				
				//부상병은 리스트로
				let dpSecondDiagnosis = $("#dpSecondDiagnosis");
				let dpSecondCode = $("#dpSecondCode");
			
				//의사정보
				let dpDoctor = $("#dpDoctor");
				let dpDoctorNo = $("#dpDoctorNo");
				
				//주상병, 부상병은 방금 입력한 값 들어가게 하기
				//주상병
				let primaryDiseaseSend = $("#primaryDisease").next("div").text().trim(); //주상병 번호와 이름
				primaryDiseaseName = primaryDiseaseSend.substring(primaryDiseaseSend.indexOf(' ') + 1); // 주상병 이름
				primaryDiseaseNo = primaryDiseaseSend.substring(0,primaryDiseaseSend.indexOf(' ')); // 주상병 번호
				

				//부상병
				let secondaryDiseaseSend = [];
				let secondaryDiseaseSel = "";
				let divCountDisease = $("#secondDisease").siblings("div").length;
				let secondaryDiseaseNameList =[];
				let secondaryDiseaseNoList2 = [];
				
				for (var i = 0; i < divCountDisease; i++) {
					secondaryDiseaseSel = $("#secondDisease").nextAll("div").eq(i).text().trim()
					secondaryDiseaseSend.push(secondaryDiseaseSel); //부상병 번호와 이름
					secondaryDiseaseName = secondaryDiseaseSel.substring(secondaryDiseaseSel.indexOf(' ') + 1); // 부상병 이름
					secondaryDiseaseNo = secondaryDiseaseSel.substring(0, secondaryDiseaseSel.indexOf(' ')); // 부상병 번호
					secondaryDiseaseNoList2.push(secondaryDiseaseNo); //부상병 번호 배열
					secondaryDiseaseNameList.push(secondaryDiseaseName);	//부상병 이름 배열
				}

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
						console.table(res);

						let patntInfo = res.patntInfo; //환자정보
						let doctorInfo = res.doctorInfo; //의사정보
						let diseaseInfoList = res.diseaseInfoList; //상병리스트
						//환자정보
						dpPatntNo.text("0000"+ patntInfo.patntNo); //환자번호
						dpReceiptNo.text("0000"+ keyReceiptNo); //접수번호
						dpName.text(patntInfo.memName); //환자이름
						dpRegno.text(patntInfo.memRegno1+ " - "+ patntInfo.memRegno2); //주민등록번호
						dpAddress.text(patntInfo.memAddress1+ " "+ patntInfo.memAddress2); //주소
						dpTel.text(patntInfo.memTel); //전화번호
						
						//의사정보
						dpDoctor.text(doctorInfo.memName); //의사이름
						dpDoctorNo.text(doctorInfo.empLicence); //의사이름

						//상병정보
						//주상병
						dpPrimaryDiagnosis.text(primaryDiseaseName.slice(0,-1));
						dpPrimaryCode.text(primaryDiseaseNo);
						
					   //부상병
					   	dpSecondDiagnosisHtml ="";
						dpSecondCodeHtml="";
						console.log("부상병 : "+ secondaryDiseaseNameList);
						
						for (var i = 0; i < secondaryDiseaseNoList2.length; i++) {
							dpSecondDiagnosisHtml +="<div>"+secondaryDiseaseNameList[i].slice(0,-1)+"</div>";
							dpSecondCodeHtml +="<div>" + secondaryDiseaseNoList2[i] + "</div>";
						}
						dpSecondDiagnosis.html(dpSecondDiagnosisHtml); 
						dpSecondCode.html(dpSecondCodeHtml);
						
						$('#diagnosisPaperModal').modal('show');
					}
				});
			});
		// 등록 끝
		
		//진단서 발행 버튼 이벤트
		$("#diagnosisPaperSendBtn").on("click",function() {
			let selectedValue = '';
			let diagnosisValue = $("input[name='diagnosisType']:checked").data("value");
			
			if(diagnosisValue ==null){
				alert("진단타입을 선택해주세요");
			}
			

			let dpDiagDate = $("#dpDiagDate").val();
			let dpOnsetDate = $("#dpOnsetDate").val();
			let dpComment = $("#dpComment").val();
			let dpPurpose = $("#dpPurpose").val();
			let dpRemark = $("#dpRemark").val();
			let paperType = "DT001";
			let diagnosisType = diagnosisValue;
			keyReceiptNo; //접수번호

			let data = {
				diagnosisPaperContent : dpComment,
				diagnosisPaperPurpose : dpPurpose,
				diagnosisPaperType : paperType,
				receiptNo : keyReceiptNo,
				diagnosisPaperRemark : dpRemark,
				diagnosisPaperDiagDate : dpDiagDate,
				diagnosisPaperOnsetDate : dpOnsetDate,
				diagnosisType : diagnosisType
			}

			$.ajax({
				url : "/doctor/insertDiagnosisPaper",
				type : "POST",
				data : JSON.stringify(data),
				contentType : 'application/json',
				dataType : "text",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res) {
					console.log("성공!");
					$("#diagnosisPaperModal").modal("toggle");
				}
			});
		});


		
		//협진요청버튼
		$('#collaborationBtn').click(function(){
			
			console.log("협진요청시작함");	
			
			let patntNo = sendPatntNo;	//환자번호
			keyReceiptNo;	//접수번호
			let chartRecordCollabo = $("#chartRecord").val();	//진료기록
			
			console.log("환자번호 " + patntNo);
			console.log("환자번호 " + keyReceiptNo);
			console.log("환자번호 " + chartRecordCollabo);
			
			let data = {
					patntNo : patntNo,
					receiptNo : keyReceiptNo,
					chartRecord : chartRecordCollabo
					}
			
			$('#collaboRequestBtn').data("patntno", patntNo);
			$('#collaboRequestBtn').data("receiptno", keyReceiptNo);
			
// 			협진 요청 차트생성
			$.ajax({
				url : "/doctor/collaboChart",
				type: "post",
				contentType: 'application/json',
				dataType: 'text',
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
		            // CSRF 토큰 헤더에 추가
		           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success: function(res){
					console.log("차트생성완료");
				
				}
			 
			});
			
			$.ajax({
				url : "/doctor/meeting/getEmpList",
				type : "post",
				beforeSend: function(xhr) {
				        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					// 아이콘 수정하고 클릭이벤트 추가해서 회의 방제 설정하고 초대코드 생성해서 실시간 알림 하면 될듯?
					// 아이콘 empJob에 따라서 변경해주기
					console.table(res);
					$("#jstree").jstree({
			            'core': {
			                'data': res,
			                "check_callback": true,
			                themes: {
			                    dots: false // 노드 사이의 점을 표시할지 여부
			                }
			            }
			        });
					$('#treemodal').modal("show");
				}
			});
		})			
//		 			let selectedNodes = {};
					$('#jstree').on("select_node.jstree", function (e, data) {
						let node = data.node;						
				    	let empNo = node.id;
				    	let text = node.text;
				    	
						swal.fire({
							title : "협진 요청",
							text : text+" 님께 협진 요청을 보내시겠습니까?",
							icon : "info",
							showCancelButton : true,
							confirmButtonColor : "#3085d6",
							cancelButtonColor : "#d33",
							confirmButtonText : "확인",
							cancelButtonText : "취소"
						}).then((result) => {
							if(result.isConfirmed){
								$('#treemodal').modal('hide');
								$('#collaboration').modal('show');
								
								collaboPatientName.text(chartPatientName.text() + " ");
								collaboPatientBirth.text("(" + chartPatientRegno1.text() + ") ");
								collaboGender.text(chartPatientGender.text());
								$('#collaboDoctorName').text(text);
								console.log(sendPatntNo);
								console.log("요청하셨습니다.");
							}
						})
				    	
				    	console.log("empNo : " + empNo);
				    	console.log("text : " + text);
					
					$('#collaboRequestBtn').on("click",function(){
						let myNo = ${sessionScope.user.member.memNo};
						let collaboReqContent = $('#collabo_comment').val();
						let patntNo = $('#collaboRequestBtn').data("patntno");
						let receiptNo = $('#collaboRequestBtn').data("receiptno");
						
						let requestData = {
								"collaboDr" : empNo,
								"collaboReqContent" : collaboReqContent,
								"empNo" : myNo,
								"patntNo" : patntNo,
								"receiptNo" : receiptNo
						}
						console.table(requestData);
						$.ajax({
							url : "/doctor/reqCollaboration",
							data : JSON.stringify(requestData),
							type : "post",
							contentType : "application/json; charset=utf-8",
							beforeSend: function(xhr) {
		                        // CSRF 토큰 헤더에 추가
		                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		            		},
		            		success:function(res){
		            			console.log(res);
		            			
		            			let reqCollaboNo = parseInt(res);
		            			console.log(reqCollaboNo);
		            			requestData["reqCollaboNo"] = reqCollaboNo;
		            			requestData["code"] = "reqCollabo";
		            			
		            			ws.send(JSON.stringify(requestData));
		            			
		            			location.reload();
		            			
		            		}
						});
					});
				}) 	
//		 		    	if (!selectedNodes[empNo]) {
//		 		            selectedNodes[empNo] = text;
//		 		            // 선택한 노드 정보를 div 영역에 추가
//		 		            // 추가된 사용자에게 알림 전송하기(초대링크 보내주기)
//		 		            $("#inviteList").append("<div><input type='hidden' value='" + empNo + "' />" + text + "</div>");
//		 		        }
				    });
					
// 	});
//오더세트 비동기로 부르는함수
function getOrderSetList() {
	$.ajax({
		url : "/doctor/getOrderSetList",
		type : "GET",
		contentType : "json",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success : function(data) {
	
			let orderSetList = data;
			let html = '';
			$.each(orderSetList, function(index, item) {
	
				html += "<li>"
					+"<a class='dropdown-item orderList' href='#' data-groupOrderNo ='"+item.groupOrderNo+"'><i class='ri-folder-2-line fs-16'></i>&nbsp"
					+item.groupOrderName
					+ "</a></li>";
	
			});
			$("#orderSetList").html(html);
		}
	});
}


function addToOrder(item) {
    // 이미 추가된 요소가 있는지 확인
    if (!orderContains(item)) {
        hospitalizationAreaHtml = "<div class='card custom-card m-2' style='display: inline-block; width:100%; height: 30px;'><i class='ri-hotel-bed-line'></i>" + item + "<a href='#' class='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
        $('#addOrderHospitalization').after(hospitalizationAreaHtml);
    }
}
function removeFromOrder(item) {
	
	 $('#addOrderHospitalization').after('');
}

function orderContains(item) {
    // addOrder 요소 안에 item이 이미 존재하는지를 확인하는 로직을 작성하세요.
    var orderItems = document.querySelectorAll('.custom-card');
    for (var i = 0; i < orderItems.length; i++) {
        if (orderItems[i].textContent.trim() === item) {
            return true;
        }
    }
    return false;
}
$(document).on("click", ".deleteSel", function(){
	event.preventDefault();
	$(this).closest("div").remove();
});



$(document).ready(function() {
    $('.draggable').on('dragstart', function(event) {
    	console.log("드래그시작")
        // 드래그 시작 시 스타일 변경
        $(this).css('opacity', '0.5'); // 투명도 조절 등 원하는 스타일 적용
    });

    // 드래그 종료 시 스타일 초기화
    $('.draggable').on('dragend', function(event) {
		console.log("드래그 종료")    	
        $(this).css('opacity', '1'); // 원래의 투명도로 복원
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