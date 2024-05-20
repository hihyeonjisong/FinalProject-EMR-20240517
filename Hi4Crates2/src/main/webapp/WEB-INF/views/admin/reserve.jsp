<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 헤더 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> -->

<!-- Sweetalerts JS -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/sweet-alerts.js"></script>
    
<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.css">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 사이드바 -->


<style>
input[type=text]:focus {
    border-color: lightblue;
}
.custom-select option {
 	font-size: 16px; /* 원하는 글꼴 크기로 조정 */
    margin-bottom: 5px; /* 원하는 간격으로 조정 */
}

</style>


        <!--Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Start::page-header -->
                
                 <!-- End::page-header -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xxl-8 col-xl-12">
                        <div class="row">
                            <div class="col-xl-3" >
                                <!-- 커스텀카드 시작 -->
                                <div class="card custom-card" style="height: 880px;  margin-bottom: 12px; ">
                                  <!-- 제목 시작 -->
                                    <div class="card-header justify-content-between" >
                                        <div class="card-title">
                                          	  환자 상세 정보
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-secondary-light btn-wave" data-bs-toggle="modal"
                                            data-bs-target="#create-task">
                                            <img src="${pageContext.request.contextPath}/resources/assets/images/icon/free-icon-account-14502797.png" width="20px" alt="">
                                            <span>&nbsp</span>
                                           	  회원등록하기</button>
                                        </div>
 
                                    </div>
                                    <!-- 제목 끝 -->



 								<div class="card custom-card" style="margin-bottom: 0px;padding-left: 0px;padding-top: 0px;padding-right: 0px;">
                                      
                                      <div class="card-body" style="padding-left: 10px;padding-right: 10px;">
                                          <ul class="list-group">
                                              <li class="list-group-item" style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                         	 이름 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memNameDetail" value=""></span>
                                                  </div>
                                              </li>
                                              
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                        	  나이 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memAgeDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   성별 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memGenderDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   주민등록번호:
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memRegnoDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   전화번호 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memTelDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                      	    주소 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memAddressDetail"></span>
                                                  </div>
                                              </li>
                                              
                                              <li class="list-group-item"  style="padding-left: 10px;">
                                                <div class="d-flex flex-wrap align-items-center">
                                                    <div class="me-2 fw-semibold">
                                                      	  보호자 :
                                                    </div>
                                                    <span class="fs-12 text-muted" id="ProtectorNameDetail"></span>
                                                </div>                                                                                                                                                    
                                            </li>
                                            <li class="list-group-item"  style="padding-left: 10px;">
                                                <div class="d-flex flex-wrap align-items-center">
                                                    <div class="me-2 fw-semibold">
                                                      	  보호자번호 :
                                                    </div>
                                                    <span class="fs-12 text-muted" id="ProtectorTelDetail"></span>
                                                </div>                                                                                                                                                    
                                            </li>
                                            
                                          </ul>
                                    
                                      </div>  
                                                                                              
                                  </div>


                                <div class="card-footer" style="padding-top: 12px;" >
                                    <div style="float: right;">
                                        <button type="button" class="btn btn-secondary btn-wave" id="detailAddBtn">선택</button>
                                    </div>
                                </div>
                            </div>
                                <!-- 커스텀카드 끝 -->
                            </div>

					            <!-- !!!!!!!!!!!!!!!!!!!!여기부터   -->
					            <div class="col-xl-9" style="height: 270px;padding-left: 0px;padding-right: 0px;" >
					                <div class="row">
					                    <!--******* 접수하기 카드박스 -->
					                        <div class="col-xl-12" style="height: 880px" >
					
					                            <!-- 여기 시작 -->
					                            <!-- 달력넣음 -->
					                            <div class="col-xl-12">
					                                <div class="card custom-card"  style=" height: 880px">
					                                    <div class="card-header">
					                                        <div class="card-title ">의사별 시간표</div>
					                                        
														    <!-- 전체의사 드롭박스 -->
														    <div class="btn-group my-1 " style="float: right;">
															    <button class="btn btn-light btn-sm select-doctorname" type="button" >
															         	조회할 의사 선택
															    </button>
															    <button type="button"
															        class="btn btn-sm btn-light dropdown-toggle dropdown-toggle-split"
															        data-bs-toggle="dropdown" aria-expanded="false">
															        <span class="visually-hidden">Toggle Dropdown</span>
															    </button>
															    <ul class="dropdown-menu" id="doctorList">
															    </ul>
															</div>
														    <!-- 전체의사 드롭박스 -->
															
					                                        
					                                    </div>
						                                    <div class="card-body"  style="padding-left: 10px;padding-right: 10px;">
		                                        <!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
		                                        			<div id="calendar" style="width: 600px; height: 700px;" ></div>
			
						                                    </div>
					                                </div>
					                            </div>
					                            <!-- 달력끝 -->
					                            
										</div>
					                    <!--******** 접수하기 박스 끝 -->
					                                                
					            <table style="width: 100px; height: 100px;">
					
					            </table>
					            <!-- <div class="card-body">
					                <div class="content-wrapper">
					                    <div id="crm-revenue-analytics">zzz</div>
					                </div>
					            </div> -->
					        </div>
					    </div>
					    <!-- !!!!!!!!!!!!!!!!!!!!여기까지   -->
                   <!-- Start::add task modal 모달시작 -->
				 <div class="modal fade" id="create-task" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                      <div class="modal-content" style="width: 600px; margin: auto; ">
                        <!-- 모달 header -->
                        <div class="modal-header">
                          <h6 class="modal-title">회원등록</h6>
                          <button type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- 모달 body -->
                        <div class="modal-body px-4" style="padding-bottom: 25px;">
                          <div class="row gy-2">
                            <div class="col-xl-4">
                              <label for="signup-name" class="form-label text-default" style="font-size: 15px;">이름</label>
                              <input type="text" style="width: 150px;" class="form-control" id="memName" name="memName" placeholder="이름"/>
                            </div>
                            <!-- <div class="col-xl-4">
                              <label for="task-name" class="form-label" style="font-size: 15px;">나이</label>
                              <input type="text" class="form-control"  id="task-name" placeholder="Task Name" value="27세"/>
                            </div> -->
                            <!-- <div class="col-xl-4">
                              <label for="task-id" class="form-label" style="font-size: 15px;">담당의</label>
                              <input type="text" class="form-control" id="task-id" placeholder="Task ID" value="김태원" />
                            </div> -->
                            <div class="col-xl-12">
                                <label for="signup-regno" class="form-label text-default" style="font-size: 15px;">주민등록번호</label><br>
                                <input type="text" name="memRegno1" class="form-control" id="memRegno1" style="width: 100px; float: left;"
                                    placeholder="980905" maxlength="6" pattern="[0-9]{6}" required="required" onkeyup="next(this.value,6,'memRegno2')"/>
 							    <span style="float: left;padding-top: 1%;">&nbsp;-&nbsp;</span>
                                <input type="password" name="memRegno2" class="form-control" id="memRegno2" style="width: 100px; float: left;"
                                    placeholder="0000000" maxlength="7" pattern="[0-9]{7}" required="required"/>
                            </div>
                            <div>
                                <label for="signup-tel" class="form-label text-default" style="font-size: 15px;">휴대폰번호1</label><br>
                                <!-- <input type="text" class="form-control" id="memPhone"
                                    placeholder=" 010-0000-0000"> -->
                                    <input type="text" id="tel1" class="form-control" max="3" pattern="[0-9]{3}" style="width: 100px; float: left;"
                                    required="required" placeholder="010" onkeyup="next(this.value,3,'tel2');" />
                                    <span style="float: left;padding-top: 1%;">&nbsp;-&nbsp;</span>
                                    <input type="text" id="tel2" class="form-control" max="4" pattern="[0-9]{4}" style="width: 100px; float: left;"
                                    required="required" placeholder="1234" onkeyup="next(this.value,4,'tel3');">
                                    <span style="float: left;padding-top: 1%;">&nbsp;-&nbsp;</span>
                                    <input type="text" id="tel3" class="form-control" max="4" pattern="[0-9]{4}" style="width: 100px; float: left;"
                                    required="required" placeholder="5678" >
                            </div>
                            <div class="col-xl-12">
                                    <label for="signup-add" class="form-label text-default" style="font-size: 15px;">우편번호</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control form-control-sm" id="memPostcode" 
                                        placeholder="우편번호" required="required">
                                        <button type="button" class="btn btn-secondary btn-flat" onclick="DaumPostCode()">우편번호 찾기</button>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <label for="signup-add" class="form-label text-default" style="font-size: 15px;">주소선택</label>
                                    <input type="text" class="form-control form-control-md" id="memAddress1" 
                                        placeholder="주소를 입력해주세요" required="required">
                                </div>
                                <div class="col-xl-12">
                                    <label for="signup-add2" class="form-label text-default" style="font-size: 15px;">상세주소</label>
                                    <input type="text" class="form-control form-control-md" id="memAddress2"
                                        placeholder="상세주소를 입력해주세요" required="required">
                                </div>
                          </div>
                        </div>
                        <!-- 모달 body -->
                        <div class="modal-footer">
                          <button type="button" id="addMemberSelectBtn" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
                          <button type="button" class="btn btn-light" data-bs-dismiss="modal">뒤로 </button>
                          <!-- <button type="button" id="addMemberBtn" class="btn btn-primary" data-bs-dismiss="modal"> 회원등록(모달속)하기</button> -->
                        </div>
                      </div>
                    </div>
                  </div>
                 <!-- End::add task modal 모달끝 -->

                        <!-- 캘린더모달 -->
                        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModal" aria-hidden="true">
                            <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                <div class="input-group">
                                    <a href="javascript:void(0);" class="input-group-text" id="Search-Grid"><i class="fe fe-search header-link-icon fs-18"></i></a>
                                    <input type="search" class="form-control border-0 px-2" placeholder="Search" aria-label="Username">
                                    <a href="javascript:void(0);" class="input-group-text" id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
                                    <a href="javascript:void(0);" class="btn btn-light btn-icon" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fe fe-more-vertical"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">Separated link</a></li>
                                    </ul>
                                </div>
                                <div class="mt-4">
                                    <p class="font-weight-semibold text-muted mb-2">Are You Looking For...</p>
                                    <span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                                    <span class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                                    <span class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                                    <span class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                                </div>
                                <div class="my-4">
                                    <p class="font-weight-semibold text-muted mb-2">Recent Search :</p>
                                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                                    <a href="notifications.html"><span>Notifications</span></a>
                                    <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                                    </div>
                                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                                    <a href="alerts.html"><span>Alerts</span></a>
                                    <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                                    </div>
                                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
                                    <a href="mail.html"><span>Mail</span></a>
                                    <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                                    </div>
                                </div>
                                </div>
                                <div class="modal-footer">
                                <div class="btn-group ms-auto">
                                    <button type="button" class="btn btn-sm btn-primary-light">Search</button>
                                    <button type="button" class="btn btn-sm btn-primary">Clear Recents</button>
                                </div>
                                </div>
                            </div>
                            </div>
                        </div>
 
                        </div>
                    </div>
                    <div class="col-xxl-4 col-xl-12">
                        <div class="row">
                            <div class="col-xxl-12 col-xl-12">
                                <div class="row">
                                    <div class="col-xl-12 col-xl-6" style="padding-right: 0px;">
                                       
                                       
                                        <!-- 달력밑내용 -->
					                            
										<div class="card custom-card" style="height: 380px;margin-bottom: 10px;">
					                            <div class="card-header justify-content-between">
					                                <div class="card-title">
					                                    <span id="reservDate">____년 __월 __일 </span>  
					                                    <span>[</span>
					                                    <span id="reservDoctor">___ </span> 
					                                    <span>]</span>
					                                    <span>예약환자 <span id="resultlength"> 0</span> 명</span>
					                                </div>
					                                
					                            </div>
					                            <div class="card-body p-0">
					                                <div class="table-responsive">
					                                    <table class="table text-nowrap" id="reservationTable">
					                                        <thead>
					                                            <tr>
					                                                <th style="padding-left: 10px;">예약번호</th>
					                                                <th style="padding-left: 0px;">시간</th>
					                                                <th>환자명</th>
					                                                <th>방문목적</th>
					                                                <th>수정/삭제</th>
					
					                                            </tr>
					                                        </thead>
					                                        <tbody>
					                                            <tr>
					                                            <td colspan="5">예약된 정보가 없습니다.</td>
					                                            </tr>
					                                            
					                                            
					                                        </tbody>
					                                    </table>
					                                </div>
					                            </div>
					                        </div>
										                            
					              <!-- 달력밑내용 -->
                                       
                                       
                                       
                                       
                                        
                                    <div class="col-xxl-12 col-xl-6" style="height:550px;">
                                        <div class="card custom-card" style="height:490px;">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                    <i class="bx bx-receipt">&nbsp;</i>
                                                    	예약하기
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div>
                                				<!-- 예약하기 표 넣기 -->
                                				
												<!--변경테이블  -->
												<div class="table-responsive">
                                                    <table class="table text-nowrap table-bordered border-primary">
                                                         
                                                        <tbody id="table">
                                                            <tr>
                                                                <th scope="row" class="me-2 fw-semibold" >
                                                                    	담당의
                                                                </th>
                                                                <td >
                                                                	<input type="hidden" id="ID" disabled="disabled" />
                                                                	<input type="text" class="form-control" id="reserveDoctorName"  style="width: 250px;float: left;padding-top: 4px;padding-bottom: 3px;" value="김의사" >
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row" class="me-2 fw-semibold">
                                                               	     환자명
                                                                </th>
                                                                 <td >
                                                                	<input type="text" class="form-control" id="reservePatientName"  style="width: 250px;float: left;padding-top: 4px;padding-bottom: 3px;">
                                                                    	
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row" class="me-2 fw-semibold">
                                                                    	예약일
                                                                </th>
                                                                 <td >
                                                                	<input type="text" class="form-control" id="startDate"  style="width: 250px;float: left;padding-top: 4px;padding-bottom: 3px;" value="2024-04-01" >
                                                                </td>
                                                            </tr>
                                                           
                                                            <!-- 시간 셀렉트박스 -->
                                                            <tr>
	                                                            <th scope="row" class="me-2 fw-semibold">
	                                                            	시작시간
	                                                            </th>
	                                                            <td>
		                                                            <select name="reservation_time" 
		                                                             id="reservStarttime" class="form-select custom-select">
																		<!-- <option value="">원하는 진료시간을 선택하세요.</option> -->
																		 <option selected></option>
																		<!-- 9:00부터 12:00까지 -->
																		<optgroup label="오전">
																			<option value="09:00">9:00</option>
																			<option value="09:30">9:30</option>
																			<option value="10:00">10:00</option>
																			<option value="10:30">10:30</option>
																			<option value="11:00">11:00</option>
																			<option value="11:30">11:30</option>
																			<!-- <option value="12:00">12:00</option> -->
																		</optgroup>
																		<!-- 13:00부터 18:00까지 -->
																		<optgroup label="오후">
																			<option value="13:00">13:00</option>
																			<option value="13:30">13:30</option>
																			<option value="14:00">14:00</option>
																			<option value="14:30">14:30</option>
																			<option value="15:00">15:00</option>
																			<option value="15:30">15:30</option>
																			<option value="16:00">16:00</option>
																			<option value="16:30">16:30</option>
																			<option value="17:00">17:00</option>
																			<option value="17:30">17:30</option>
																		</optgroup>
																	</select>
																</td>
                                                             </tr>
                                                            
                                                            <!-- 시간 셀렉트박스 -->
                                                            
                                                           
                                                            <tr>
                                                                <th scope="row" class="me-2 fw-semibold">
                                                                  		 예약 메모
                                                                </th>
                                                                 <td >
                                                                	<input type="text" class="form-control" id="reservMemo" style="width: 250px;float: left;padding-top: 4px;padding-bottom: 3px;" value="" >
                                                                </td>
                                                            </tr>
                                                           
                                                            
                                                        </tbody>
                                                    </table>
                                                    <div style="margin-top: 10px" >
	                                                   	<button type="button" id="insertBtn" class="btn btn-secondary btn-wave" style="float:right;">저장</button>
	                                                    <span style="margin:4px; float: right;"></span>
	                                                   <!--  <button type="button" id="updateBtn" class="btn btn-secondary btn-wave" style="float:right;">수정</button>
	                                                    <span style="margin:4px; float: right;"></span> -->
	                                                    <!-- <button type="button" id="deleteBtn" class="btn btn-secondary btn-wave" style="float:right;">삭제</button> -->
	                                                	</div>
	                                                </div>
												
												<!--변경테이블  -->
												
												
												
                                				
                                				<!-- 예약하기 표 넣기 -->
                                            </div>
                                        </div>
                                    </div>

                                        <!--  -->
                                    </div>
                                    <div class="col-xxl-12 col-xl-6">
                   
                                    </div>
                                    <!--  -->

                                    <!--  -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End::row-1 -->

            </div>
        </div>
        <!-- End::app-content -->
        
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModal" aria-hidden="true" >
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body">
                  <div class="input-group">
                    <a href="javascript:void(0);" class="input-group-text" id="Search-Grid"><i class="fe fe-search header-link-icon fs-18"></i></a>
                    <input type="search" class="form-control border-0 px-2" placeholder="Search" aria-label="Username">
                    <a href="javascript:void(0);" class="input-group-text" id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
                    <a href="javascript:void(0);" class="btn btn-light btn-icon" data-bs-toggle="dropdown" aria-expanded="false">
                      <i class="fe fe-more-vertical"></i>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Separated link</a></li>
                    </ul>
                  </div>
                  <div class="mt-4">
                    <p class="font-weight-semibold text-muted mb-2">Are You Looking For...</p>
                    <span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                  </div>
                  <div class="my-4">
                    <p class="font-weight-semibold text-muted mb-2">Recent Search :</p>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                      <a href="notifications.html"><span>Notifications</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                      <a href="alerts.html"><span>Alerts</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
                      <a href="mail.html"><span>Mail</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <div class="btn-group ms-auto">
                    <button type="button" class="btn btn-sm btn-primary-light">Search</button>
                    <button type="button" class="btn btn-sm btn-primary">Clear Recents</button>
                  </div>
                </div>
              </div>
            </div>
        </div>
        

    </div>

    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

    
</body>
<script>
	//캘린더부분
	let calendarEl = document.getElementById('calendar');	// calendar 영역
    let calendar = "";
    let allDay = "";	// 이벤트 종일 여부값을 넣을 변수
    
    let id = $('#ID');					// input id="Id"
    let title = $('#title2');			// input id="title"
    let startTime = $('#startTime');	// input id="startTime"
    let startDate = $('#startDate');	// input id="startDate"
    
    //예약하기 추가/수정/삭제 카드부분
    let reserveDoctorName = $('#reserveDoctorName');	// input id="reserveDoctorName"
    let reservePatientName = $('#reservePatientName');	// input id="reservePatientName"
    let reservMemo = $('#reservMemo');
    let reservStarttime = $('#reservStarttime');
    let table = $('#table');			// tbody의 id="table"
    
    
    //예약하기 추가/수정/삭제 버튼
    let insertBtn = $('#insertBtn');	// 등록버튼
    let updateBtn = $('#updateBtn');	// 수정버튼
    let deleteBtn = $('#deleteBtn');	// 삭제버튼
    
    let inputs = table.find('input');	// 테이블 내의 input요소들
    
	inputs.val("");						// input요소들의 value값을 초기화
	
	// 전역으로 선택한 의사번호선언 ->선택한 날의 예약 리스트 불러올때 emp_no 필요
	let whatEmpNo; 
	
	// 회원등록 or 검색 한 회원이름 담아 예약하기카드창에 환자명에 보여줌
	let enrollMemName; 
	
	let patientMemNo;
	
	//예약리스트를 수정하기에 필요한 요소들
	let target1Val; // 예약리스트에서 선택한 요소의 예약번호
	let targetmemVal; // 예약리스트에서 선택한 요소의 환자번호
	let target2Val; // 예약리스트에서 선택한 요소의 환자이름
	
	
	let calendarKey; // 캘린더키
	
	let flag = false; // 예약 아이콘눌렀을때 flag를 true로 바꿈 > 하나의 [등록]버튼으로 수정/추가 둘다 하기 위해서

	
	// FullCalendar를 화면에 띄우는 함수. 등록, 수정, 삭제될 때마다 변동사항을 화면에 띄우기 위함
    function loadCalendar(emp) {	
    	console.log("loadCalender파라미터emp : "+emp);
    	whatEmpNo = emp.empNo;
		let data = {"empNo" : whatEmpNo};
		$.ajax({
        	url : "/admin/loadData",
        	type : "post",
        	data : JSON.stringify(data),
        	contentType:"application/json;charset=utf-8",
        	beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},
        	success : function (res) {
        		console.log("res : ",res);
        		
        		
    		    calendar = new FullCalendar.Calendar(calendarEl, {
    		        events: res,	// event(Controller에서 JSONArray로 전달한 값을 대입)
    		        initialView: 'dayGridMonth',	// FullCalendar가 처음 로드되었을때 뷰 설정
    		        headerToolbar : {				// 헤드툴바 설정
    		        	center : "title",			
    		        	left : "dayGridMonth", //timeGridWeek,timeGridDay
    		        },
    		        expandRows : true,
    		        selectable : true, // 달력 일자 드래그 설정가능
    				droppable : true,	// 드롭 가능 여부 설정
    				editable : true,	// 수정 가능 여부 설정
    				nowIndicator: true, // 현재 시간 마크
    				//navLinks : true,	// 링크 활성화 여부 설정
    				
    				
    				
    				 dateClick: function(info) {
    					console.log("데이타클릭");
    					
    					var msg = info.dayEl.querySelector(".fc-event-title").innerHTML;
    					if(msg == "연가"){
						     startDate.val("");
    						 Swal.fire({
						            icon: 'error',
						            title: '선택한 날짜는 예약불가',
						            text: '날짜를 다시 선택해주세요',
						        })
						        
    						//alert("하지망");
    						
    					}
    					//console.log(info.dayEl.querySelector(".fc-event-title"));
    					    					
    					//info.event.setProp('editable',false);
    					//info.event.setProp('select',false);
    				  }
    				, 
    				
    				 eventClick: function(info) {
    					 if(info.event.title == "연가"){
    						 Swal.fire({
						            icon: 'error',
						            title: '선택한 날짜는 예약불가',
						            text: '날짜를 다시 선택해주세요',
						        })
    					 }
    			     },
    				//* 달력 칸을 선택했을 경우 > 예약리스트목록 (이벤트 선택 x)
    				select : function(info) {
    					//만약 title이 연가라면 alert띄운다
    					console.log("체킁:", info);
    					console.log("title체킹");
    					
    					//여기부분 자름 잠시 함수 분리테스트하려고
    					console.log(info);
    					//inputs.val(""); 				// input 초기화
    					startDate.val(info.startStr);
    					console.log("클릭날짜: "+info.startStr);
    					let clickDate = info.startStr;
    					
    					let data = {
    							"clickDate":clickDate,
    							"empNo":whatEmpNo
    							};
    					
    					// 선택한 날의 예약리스트 불러오기
    					$.ajax({
    						type:"POST",
    						url:"/admin/showDateReserve",
    						data:JSON.stringify(data),
    						contentType:"application/json;charset = utf-8",
    						beforeSend: function(xhr) {
    		  	    	     	   // CSRF 토큰 헤더에 추가
    		  	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		  	      		},
    						success:function(res){
    							//테이블 초기화 ??
    							//$('#reservationTable').html(res);
    							
    							
    							console.log("res pp : ",res);
    							//셀렉트박스 초기화
    							$("#reservStarttime option").prop("disabled",false).css("background-color", "white");
    							
    							// 시간 값을 담을 배열
    							var reservedTimes = [];
    							
    							// 배열에 담아서 셀렉트박스속 예약시간과 비교하기
    							for (var i = 0; i < res.length; i++) {
									console.log("예약시간",res[i].reservTime);
									reservedTimes.push(res[i].reservTime);
								}
    							
    							// 셀렉트 박스의 각 옵션 값과 reservedTimes 배열에 있는 값 비교하여 중복되는 값은 disabled, 배경색회색 처리
    							$("#reservStarttime option").each(function(){
    								
    								if(reservedTimes.includes($(this).val())){
    									$(this).prop("disabled",true).css("background-color", "#cccccc");
    									
    								}
    								
    							})
    							
    							console.log();
    							
    							
    							let length = res.length;
    							// let selectedDoctorName = res[0].empName;
    							console.log("길이:"+length);
    							
    							//title이 연가일경우
    							//경고 띄워줌
    							if(res.title==='연가'){
    								alert("dd");
    								//$('#reservationTable tbody').tableBody.append("연가라고요!!");
    							}
    							
    							
    								//화면 오른쪽위의 
    								//캘린더 상세보기카드 제목부분 - 날짜, 선택한의사이름, 예약환자수
    								$('#reservDate').text(formatDate(info.startStr));
    								$('#reservDoctor').text(emp.memName); // 의사이름
    								$('#resultlength').html(length);
    								
    								//화면 오른쪽하단의
    								//예약하기 카드 - 의사이름
    								reserveDoctorName.val(emp.memName);
    								
    								var tableBody = $('#reservationTable tbody');
    								
    								tableBody.empty();
    								
    								
    								// 예약 목록 오름차순 
    								//방법1 : 쿼리에서 order by ~ asc 
    								//방법2 : 함수로 오름차수정렬해줌
    								// res 배열을 시간에 따라 정렬하는 함수
									/* function sortByTime(a, b) {
									    // 시간 문자열을 Date 객체로 변환하여 비교
									    var timeA = new Date('1970/01/01 ' + a.reservTime);
									    var timeB = new Date('1970/01/01 ' + b.reservTime);
									    console.log(timeA);
									    console.log(timeB);
									    
									    // 오름차순 정렬을 원하면 a-b, 내림차순 정렬을 원하면 b-a
									    return timeA - timeB;
									}
									
									// res 배열을 시간에 따라 정렬!!
									res.sort(sortByTime);
									*/
									    								
    								
    								
    								//동적으로
    								//오른쪽 위의 예약 리스트 생성하기
    								if(res.length>0){
    									for (var i = 0; i < res.length; i++) {
    										
    										calendarKey = res[i].calendarKey;
    										console.log("calendarKey : "+calendarKey);
    										
    										var selectReservmemno = res[i].memNo;
    										
    										//console.log("예약리스트에서 선택한 예약의 환자번호");
    										//console.log(selectReservmemno);
    										
											var paddedNumber = pad(res[i].reservNo,3); 
												
											var row = '<tr>'+
											 '<td style="padding-left: 15px;"><div class="d-flex align-items-center"><span class="reservMemno" style="display: none;">'+res[i].memNo+'</span><span class="badge bg-primary-transparent reservNo">' + paddedNumber + '</span></div></td>' +
									            '<td style="padding-left: 0px;"><span class="fw-semibold reservedTime">' + res[i].reservTime + '</span></td>' +
									            '<td><span class="fw-semibold text-primary reservMemname">' + res[i].memName + '</span></td>' +
									            '<td><div class="fw-semibold reservMemo">' + res[i].reservMemo + '</div></td>' +
									            '<td><div class="btn-list">' +
									            '<button class="btn btn-sm btn-icon btn-info-light btn-wave waves-effect waves-light" name="reservEditBtn" ><i class="ri-edit-line"></i></button>' +
									            '<button class="btn btn-sm btn-icon btn-danger-light btn-wave waves-effect waves-light" name="reservDeleteBtn"><i class="ri-delete-bin-line"></i></button>' +
									            '</div></td>' +
									            '</tr>'
									            ;
									            tableBody.append(row);
									            
									            
									            
											}
										
    								}else{
    									tableBody.html('<tr><td colspan="5">예약된 정보가 없습니다.</td></tr>');
    								}
    						}
    						
    					})

    					
    				},
    				
    				locale: 'ko' // 한국어 설정
    		    });
    		    
    		    // calendar 띄우기
    			calendar.render();
    		}
        });
	}
	
  	//숫자를 001형식으로 나오게하는 함수
	function pad(num, size){
		var s = num +"";
		while (s.length<size)s = "0"+s; 
		return s;
	}
  	
    
    // calendar를 띄우는 함수
    //loadCalendar();
    
    /* insertBtn.on("click",function(){
	console.log("dd");
	console.log(title.val()); //11ㅎㅇ
	console.log(id.val());
	console.log(startTime.val()); //11:32
	console.log(startDate.val()); //2024-04-01
	console.log(reserveDoctorName.val()); //김의사
	console.log(reservePatientName.val()); //김다애
	console.log(table.val());
	}) 
     */
     
    // 예약하기 추가 버튼 클릭 이벤트
    insertBtn.on("click",function() {
    	
    	//flag가 false: 예약일정 추가기능
    	if(flag==false){
    		
    	
    	/* 예약하기 추가 버튼 */
			let start = "";
			let end = "";
			let event = "";
			console.log("예약하기 추가버튼")
			console.log("empNo : "+ whatEmpNo);
			console.log("memNo : "+ patientMemNo);
			console.log("reservDate : "+ startDate.val());
			console.log("reservTime : "+ reservStarttime.val());
			console.log("reservMemo : "+ reservMemo.val());
			
			// 형태바꿔서 VO변수에 저장
			// 캘린더테이블에 추가할 컬럼 :2024-04-17T09:10
			var calStartdate = startDate.val()+" "+reservStarttime.val();
			console.log("calStartdate : "+calStartdate);
			
			
			let data = {
					empNo: whatEmpNo,
					memNo: patientMemNo,
					reservDate: startDate.val(),
					reservTime: reservStarttime.val(),
					reservMemo: reservMemo.val(),
					calStartdate : calStartdate
			};
			
			//캘린더에 일정 등록하기
			$.ajax({
				url : "/admin/insertEvent",
				method : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
				success : function(res) {
					if (res) {
						alert("일정 등록 성공!");
						// FullCalendar를 다시 로드
						loadCalendar(selectedDoctor);
						
						//새로고침
        				//window.location.reload(true);
						$("#memNameDetail").html("");
						$("#memAgeDetail").html("");
						$("#memGenderDetail").html("");
						$("#memRegnoDetail").html("");
						$("#memTelDetail").html("");
						$("#memAddressDetail").html("");
						$("#ProtectorNameDetail").html("");
						$("#ProtectorTelDetail").html("");
						
						$("#reserveDoctorName").val("");
						$("#reservePatientName").val("");
						$("#startDate").val("");
						$("#reservStarttime").val("");
						$("#reservMemo").val(""); 
						
						$("#memName").val("");
						$("#memRegno1").val("");
						$("#memRegno2").val("");
						$("#tel1").val("");
						$("#tel2").val("");
						$("#tel3").val("");
						$("#memPostcode").val("");
						$("#memAddress1").val("");
						$("#memAddress2").val("");
						
						
						
						
						
						//의사 이름 클릭이벤트 다시 이어가도록
					} else {
						alert("일정 등록에 실패했습니다!");
					} 
					
				}
			});
		/* 예약하기 추가 버튼 */
		
		
		
    	}else{//flag가 true: 예약일정 수정기능
    		
    		
    		
    	/* 예약하기 수정 버튼 */
	    	alert("수정");
	        let reserveDoctorNameVal = reserveDoctorName.val();	// input id="reserveDoctorName"
	        let reservePatientNameVal = reservePatientName.val();	// input id="reservePatientName"
	        let reservMemoVal = reservMemo.val();
	        let startDateVal= startDate.val();
	        let reservStarttimeVal = reservStarttime.val();
	        //target1Val; // (수정할) 예약 번호
	        
	        console.log("수정정보들");
	        
	     	//예약리스트를 수정하기에 필요한 요소들
	        
	      	console.log(targetmemVal); // 예약리스트에서 선택한 요소의 환자번호
	      	console.log(target2Val); // 예약리스트에서 선택한 요소의 환자이름
	      	console.log(target1Val); // 수정리스트에서 누른 요소의 예약번호
	      	
			console.log("empNo : "+ whatEmpNo); // 달력눌렀을때 뜨는 의사의 직원번호 
			//console.log("memNo : "+ patientMemNo);  // 환자 상세정보확인 눌렀을때의 환자 번호
	      	console.log(reserveDoctorNameVal);
	      	console.log(reservePatientNameVal);
	      	console.log(reservMemoVal); //수정 정보 
	      	console.log(startDateVal); // 수정시 다시 누른 날짜
	      	console.log(reservStarttimeVal);// 수정시 다시 누른 시간
	      	
	      	reservMemo.html(target2Val);
	      	
	      	var calStartdate = startDateVal +" "+ reservStarttimeVal;
	      	console.log("수정 calendarKey: "+calendarKey);
	      	
	      	var editData = {
	      			reservNo : target1Val,
	      			reservDate :  startDateVal,
	      			reservTime :  reservStarttimeVal,
	      			reservMemo :  reservMemoVal,
	      			
	      			empNo :  whatEmpNo ,
	      			memNo :  targetmemVal,
	      			
	      			empName :  reserveDoctorNameVal,
	      			memName :  reservePatientNameVal,
	      			calStartdate : calStartdate,
	      			calendarKey : calendarKey
	      	} 
	      	
	      	$.ajax({
	      		type: 'POST',
	      		url: '/admin/updateClinicReservation',
	      		data: JSON.stringify(editData),
	      		contentType: "application/json; charset=utf-8",
	      		beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
	      		success:function(res){
	      			console.log(res)
	      			
	      			//수정flag false로 초기화 해줌
	      			flag = false;
	      			//실시간으로 캘린더 로딩되면서 뜸
	      			loadCalendar(selectedDoctor);
	      			
	      			//새로고침
    				window.location.reload(true);
	      			
	      			// 목록 부분 리로드가 어려움 
    				/* $("#memNameDetail").html("");
					$("#memAgeDetail").html("");
					$("#memGenderDetail").html("");
					$("#memRegnoDetail").html("");
					$("#memTelDetail").html("");
					$("#memAddressDetail").html("");
					$("#ProtectorNameDetail").html("");
					$("#ProtectorTelDetail").html("");
					
					$("#reserveDoctorName").val("");
					$("#reservePatientName").val("").attr("");
					$("#startDate").val("");
					$("#reservStarttime").val("");
					$("#reservMemo").val("");  */
	      		}
	      		
	      	})
      	/* 예약하기 수정 버튼 */
    		
    	}
		
		
	}); 
    

    
    // 예약하기  삭제버튼 클릭 이벤트
    deleteBtn.click(function() {
		let idVal = id.val();
		$.ajax({
			url : "/admin/deleteEvent",
			data : idVal,
			method : "post",
			contentType : "application/text; charset=utf-8",
			beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},
			success : function(res) {
				if (res) {
					alert("삭제 성공!");
					// FullCalendar를 다시 로드
					loadCalendar();
					
					//새로고침
    				window.location.reload(true);
					/* $("#memNameDetail").html("");
					$("#memAgeDetail").html("");
					$("#memGenderDetail").html("");
					$("#memRegnoDetail").html("");
					$("#memTelDetail").html("");
					$("#memAddressDetail").html("");
					$("#ProtectorNameDetail").html("");
					$("#ProtectorTelDetail").html("");
					
					$("#reserveDoctorName").val("");
					$("#reservePatientName").val("");
					$("#startDate").val("");
					$("#reservStarttime").val("");
					$("#reservMemo").val("");  */
					
					
					
				} else {
					alert("삭제 실패!");
				} 
			}
		});
	});
	
    // 이벤트 수정함수 
    // input으로 입력한 값으로 수정하는 것 이외에 reSize, drop되었을 때에도 이벤트가 수정될 수 있도록
    // 함수를 따로 만들어두었음
    // data : 수정할 정보 데이터
    function update(data) {
		$.ajax({
			url : "/updateEvent",
			data : JSON.stringify(data),
			method : "post",
			contentType : "application/json; charset=utf-8",
			beforeSend: function(xhr) {
   	     	   // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     		},
			success : function(res) {
				if (res) {
					alert("수정 성공!");
					// FullCalendar를 다시 로드
					loadCalendar();
				} else {
					alert("수정 실패!");
				} 
			}
		});
	}
	
        	// 선택한 의사 정보를 저장할 변수
        	let selectedDoctor={};
        	
        	// 의사를 선택하면 해당 의사의 캘린더 표시
            $(document).on("click", "#doctorList .dropdown-item", function() {
                selectedDoctor.empNo = $(this).data("empno");
                selectedDoctor.memName = $(this).text();
                
                console.log("선택한 의사 넘버 : "+selectedDoctor.empNo);
                console.log("선택한 의사 이름 : "+selectedDoctor.memName);
                //예약하기 카드박스에 선택한 의사 이름 뜨게하기
                reserveDoctorName.val(selectedDoctor.memName);
                //토글박스에 선택한 의사 이름 뜨게하기
                $(".select-doctorname").html(selectedDoctor.memName);
                
                
                // 여기서 선택된 의사의 캘린더를 표시하는 로직을 추가합니다.
                // 예를 들어, 선택된 의사의 empNo를 사용하여 해당 의사의 캘린더를 표시하는 함수를 호출합니다.
                loadCalendar(selectedDoctor);
            });
        	
        	
   //**************************************************     	
        	
	//지도부분
    $(function(){
        var mapContainer = null;
        var map = null;
        var geocoder = null;
    })

    function DaumPostCode() {
			new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('memPostcode').value = data.zonecode;
							document.getElementById("memAddress1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("memAddress2").focus();
						}
					}).open();
		}

    
		//일정 글자수 이상일때 nextId로 포커스가 이동 (주민번호, 폰번호)
        function next(val, len,nextId){
            if(val.length == len){
                document.getElementById(nextId).focus();
            }
        }
		
		
		let pregnancyResult ='';
		//임신체크여부 값 가져오기
		function getPregnancyValue(event){
			if(event.target.checked){
				pregnancyResult = event.target.value;
			}else{
				pregnancyResult = '';
			}
			
		}
        
        $(document).ready(function(){
        	
        	var patntNo;
        	var clinicName; // 선택한 의사의 진료실
        	var doctorNo;// 선택한 의사의 empNo
        	var clinicNo; // 진료실번호
        	
        	//날짜-월-일
		    var today = new Date();

		    var year = today.getFullYear();
		    var month = ('0' + (today.getMonth() + 1)).slice(-2);
		    var day = ('0' + today.getDate()).slice(-2);
		    console.log(year);

		    var dateString = year + '년' + month  + '월' + day+'일';

		    //console.log(dateString);
		    // 결과 : 2021년05월30일
		    
        	
        	
        	//회원등록후바로 회원상세보기에 정보띄우는 버튼 클릭 
        	$("#addMemberSelectBtn").on("click",function(){
        		var memNameVal = $("#memName").val();
        		var memRegno1Val = $("#memRegno1").val();
        		var memRegno2Val = $("#memRegno2").val();
        		var tel1Val = $("#tel1").val();
        		var tel2Val = $("#tel2").val();
        		var tel3Val = $("#tel3").val();
        		var memPostcodeVal = $("#memPostcode").val();
        		var memAddress1Val = $("#memAddress1").val();
        		var memAddress2Val = $("#memAddress2").val();
        		console.log(memPostcodeVal);
        		
        		
        		
        		var memberData = {
        				memName : memNameVal,
        				memRegno : memRegno1Val +memRegno2Val,
        				memRegno1 : memRegno1Val,
        				memRegno2 : memRegno2Val,
        				memTel : tel1Val+"-"+tel2Val+"-"+tel3Val,
        				memPostcode : memPostcodeVal,
        				memAddress1 : memAddress1Val,
        				memAddress2 : memAddress2Val
        		};
        		
        		$.ajax({
        			type : 'post',
        			url : '/admin/enrollMember',
        			data : JSON.stringify(memberData),
        			contentType : "application/json; charset=utf-8",
        			beforeSend: function(xhr) {
   	    	     	   // CSRF 토큰 헤더에 추가
   	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
   	      		},
        			success : function(res){
        				//console.log(res.memName);
        				enrollMemName = res.memName; // 회원등록한 회원이름
        				var memNameDetail = $("#memNameDetail");
        				var Reg1 = res.memRegno1;
        				var Reg2 = res.memRegno2;
        				patientMemNo = res.memNo;
        				patntNo = res.patntNo;
        				
        				console.log("patientMemNo:"+res.memNo);
        				console.log("pNo:"+patntNo);
        				console.log("mName:"+enrollMemName);
        				//$('span[id=memNameDetail]').attr('value',name);
        				$('span[id=memNameDetail]').html(enrollMemName);
        				$('span[id=memAgeDetail]').html(res.memAge);
        				$('span[id=memGenderDetail]').html(res.memGender);
        				$('span[id=memRegnoDetail]').html(Reg1+"-"+(Reg2).substring(0,1)+"******");
        				$('span[id=memTelDetail]').html(res.memTel);
        				$('span[id=memAddressDetail]').html(res.memAddress1+res.memAddress2);
        				$('h4[id=memNameReceipt]').html(res.memName+"   ");
        				$('h4[id=memNameReceipt]').css("margin-right","10px");
        				$('h6[id=memGenderReceipt]').html(res.memGender+",");
        				$('h6[id=memAgeReceipt]').html(res.memAge);
        				$('p[id=memSignupDateReceipt]').html("dateString");
        				$('#memRegno1Receipt').val(Reg1).attr("disabled",true);
        				$('#memRegno2Receipt').val(Reg2).attr("disabled",true);
        				
        				
        			}                            
        		})
        	})
        	
        	
	        //전체검색창>환자 상세정보에서 선택 클릭 이벤트
	        //전역변수로 선언된 환자정보 보호자정보 가져와서 상세정보에 띄워줌
	        $(document).on("click","#selectPatientBtn",function(){
	         	//var memNo = document.getElementById("selectPatientBtn").dataset.memNo; 
	        	//console.table(memNo);
	        	//console.table(patntInfo);
	        	//console.log(patntInfo.memName);
	        	//console.log(protector.protectorName);
	        	
	        	console.log("환자멤버번호:"+patntInfo.memNo)
	        	patientMemNo = patntInfo.memNo;
	        	
	        	$('span[id=ProtectorNameDetail]').empty();
	        	$('span[id=ProtectorTelDetail]').empty();
	        	
	        	$('span[id=memNameDetail]').html(patntInfo.memName);
	        	enrollMemName = patntInfo.memName; // 검색창에서 선택한회원 이름을 예약하기카드창에 가져와야해서
				$('span[id=memAgeDetail]').html(patntInfo.memAge);
				$('span[id=memGenderDetail]').html(patntInfo.memGender);
				$('span[id=memRegnoDetail]').html(patntInfo.memRegno1+"-"+(patntInfo.memRegno2).substring(0,1)+"******");
				$('span[id=memTelDetail]').html(patntInfo.memTel);
				$('span[id=memAddressDetail]').html(patntInfo.memAddress1+patntInfo.memAddress2);
				if(protector !=null){
		        	$('span[id=ProtectorNameDetail]').html(protector.protectorName);
		        	$('span[id=ProtectorTelDetail]').html(protector.protectorTel);
				}else{
		        	$('span[id=ProtectorNameDetail]').html("*보호자 정보없음");
		        	$('span[id=ProtectorTelDetail]').html("*보호자 정보없음");
				}
	        	
	        	})
	        	
	        //환자 상세 정보 버튼이벤트> 예약하기로
        	var detailAddBtn = $("#detailAddBtn");
	        //확인 버튼 클릭시
        	detailAddBtn.on("click", function(){
        		//alert("dd");
        		//let memNameDetail = $("#memNameDetail").val();
        		console.log("예약할환자이름********11"+enrollMemName);
        		//카드예약부분 초기화 이벤트
        		reserveDoctorName.val("");
        		reservePatientName.attr("disabled",false).val("");
        		startDate.val("");
        		reservStarttime.val("");
        		reservMemo.val("");
        		
        		// 환자 이름 채우기
        		reservePatientName.val(enrollMemName);
        		//console.log("patntInfo:"+patntInfo);
        		//reservePatientName.val(patntInfo.memName+"   ");
				//$('h4[id=memNameReceipt]').css("margin-right","10px");
				//$('#memRegno2Receipt').val(patntInfo.memRegno2).attr("disabled",true);
        	})
        	
        	
        	//동적으로 생긴 예약리스트
        	//예약리스트 수정!아이콘 클릭시 
        	//수정 sweet-alert 창 뜨고 수정하도록
        	$(document).on("click","button[name='reservEditBtn']",function(){
        		
        		let targetmem = $(this).closest('tr').find('.reservMemno');
        		//예약접수한 환자의번호 전역 선언
        		targetmemVal = targetmem.html();
        		//let target = $(this).closest('tr'); // 결과      :    01619:28이하얀하얀 부상 
        		
        		let target1 = $(this).closest('tr').find('.reservNo'); 
        		let targetTime = $(this).closest('tr').find('.reservedTime'); 
        		let target2 = $(this).closest('tr').find('.reservMemname');
        		let target3 = $(this).closest('tr').find('.reservMemo'); 
        		
        		//예약접수번호 target1Val 전역으로 뺌
        		target1Val =  target1.html(); // 016 (접수번호)
        		let targetTimeVal =  targetTime.html(); // 07:18
        		
        		//예약접수한 환자의이름 전역으로 뺌
        		target2Val =  target2.html(); // 이하얀
        		let target3Val =  target3.html(); // 하얀 부상
        		console.log("targetmemVal : "+targetmemVal);
        		console.log("target1Val : "+target1Val);
        		console.log(targetTimeVal);
        		//console.log(target3.html());
        		//console.log(target3Val);\
        		
        		
        		//예약번호 보기좋게 006으로 해놓은것을
        		//다시 원래예약No로 가져오기위함
        		if(target1Val.substr(0,1)=='0'){ // 016이면 16
        			target1Val = target1Val.substr(1,2);
        		}else if(target1Val.substr(0,2)=='00'){ //006이면 6
        			target1Val = target1Val.substr(2,1);
        		}
        		
        		
        		
        		//sweet-alert 창 띄우기 (수정)
			        const swalWithBootstrapButtons = Swal.mixin({
				        customClass: {
				            confirmButton: 'btn btn-success ms-2',
				            cancelButton: 'btn btn-danger'
				        },
				        buttonsStyling: false
				    });
			        swalWithBootstrapButtons.fire({
			            title: '예약을 수정하시겠습니까?',
			            //text: "You won't be able to revert this!",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonText: '확인',
			            cancelButtonText: '뒤로',
			            reverseButtons: false
			        }).then((result) => {
			            /* Read more about handling dismissals below */
			            result.dismiss === Swal.DismissReason.cancel
			            if(result.isConfirmed) {
			                console.log("수정확인11");
			                
			                //수정시 flage를 true로 변경
			                flag = true;
			                
			        		//포커스 이동
			        		reserveDoctorName.focus();
			        		//reserveDoctorName.focus().css({"background-color": "blue"});
			        		//깜박거림
			        		 /* setInterval(function () {
			        			 reserveDoctorName.toggle();
			        		    }, 200); */
			        		    
			        		console.log("메모 : "+target3Val);
			        		reservePatientName.val(target2Val); 
			        		reservePatientName.attr("disabled",true); //
			        		reservMemo.val(target3Val);
			        		reservStarttime.val(targetTimeVal);
			      
			            }
			        })
			    
        	});
        	
        	
        	//동적으로 생긴 예약리스트
        	//예약리스트 삭제! 아이콘 클릭시 
        	//수정 sweet-alert 창 뜨고 수정하도록
        	$(document).on("click","button[name='reservDeleteBtn']",function(){
        		
        		alert("Dd");
        		let target1 = $(this).closest('tr').find('.reservNo'); 
        		target1Val =  target1.html(); // 016 (접수번호)
        		console.log("target1Val : "+target1Val);
        		
        		//예약번호 보기좋게 006으로 해놓은것을
        		//다시 원래예약No로 가져오기위함
        		if(target1Val.substr(0,1)=='0'){ // 016이면 16
        			target1Val = target1Val.substr(1,2);
        		}else if(target1Val.substr(0,2)=='00'){ //006이면 6
        			target1Val = target1Val.substr(2,1);
        		}
        		
        		
        		
        		//sweet-alert 창 띄우기 (수정)
        		
			        const swalWithBootstrapButtons = Swal.mixin({
			            customClass: {
			                confirmButton: 'btn btn-success ms-2',
			                cancelButton: 'btn btn-danger'
			            },
			            buttonsStyling: false
			        })
			        swalWithBootstrapButtons.fire({
			            title: '예약을 삭제하시겠습니까?',
			            //text: "You won't be able to revert this!",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonText: '확인',
			            cancelButtonText: '뒤로',
			            reverseButtons: false
			        }).then((result) => {
			            /* Read more about handling dismissals below */
			            result.dismiss === Swal.DismissReason.cancel
			            if(result.isConfirmed) {
			                console.log("삭제확인11");
			                console.log(target1Val);
			               	let data = {
			               		"reservNo" : target1Val,
			               		"calendarKey" : calendarKey
			               	};
			        		$.ajax({
			        			type:"POST",
			        			url:"/admin/deleteClinicReservation",
			        			data: JSON.stringify(data),
			        			contentType : "application/json;charset=utf-8",
			        			beforeSend: function(xhr) {
			   	    	     	   // CSRF 토큰 헤더에 추가
			   	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			   	      		},
			        			success:function(res){
			        				console.log(res)
			        				
			        				//삭제 성공시 캘린더에 결과 load하기위함
			        				loadCalendar(selectedDoctor);
			        				
			        				//삭제 성공시 클릭했던 날짜의 예약리스트에 삭제가 반영되도록
			        				//clickCalDate(info);
			        				
			        				
			        				}
			        			})
			        		}
			        		 
			      
			        		    
			            }
			        )
			    
        		
        		
        	});
        	
        	
        	

        	
        	//드롭박스에서 전체 의사 목록 출력
        	$.ajax({
        		url:"/admin/showdoctorList",
        		type: "POST",
        		contentType: "application/json; charset=utf-8",
        		beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
        		success:function(res){
        			var doctors = res;
        			for (var i = 0; i < doctors.length; i++) {
						var doctor = doctors[i];
        				console.log("드롭박스 의사: "+doctors[i].memName);
						 var option = "<li><a class='dropdown-item' href='javascript:void(0);' data-empno='" + doctor.empNo + "'>" + doctor.memName + "</a></li>";
				            $("#doctorList").append(option);
					}
        		}
        	})
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
            
        })
        
        
        
</script>

</html>