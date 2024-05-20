<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 헤더 -->
<!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> -->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Prism JS -->
   <!--  <script src="../assets/libs/prismjs/prism.js"></script>
    <script src="../assets/js/prism-custom.js"></script> -->
<!-- 사이드바 -->


<style>
input[type=text]:focus {
    border-color: lightblue;
}

#styleTest {
/* style="margin-top: 5px;margin-bottom: 15px;padding-left: 20px;padding-right: 20px;" */
	margin-top: 5px;
	margin-bottom: 15px;
	padding-left: 20px;
	padding-right: 20px;
}

.receiptBadge{
	position: absolute;
    right: 5%;
    top: 40%;
}


</style>


        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Start::page-header -->
               <!--  <span >&nbsp;</span> --> <!--  맨위 여백공간 -->
                <!-- <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <div>
                        <p class="fw-semibold fs-18 mb-0">원무과-접수를 진행하세요</p>
                        <span class="fs-semibold text-muted">ㅇㅇ</span>
                    </div>
                    <div class="btn-list mt-md-0 mt-2">
                        
                        <button type="button" class="btn btn-secondary-light btn-wave" data-bs-toggle="modal"
                              data-bs-target="#create-task">
                              회원등록(모달버튼)하기
                        </button>


                        
                    </div>
                </div> -->

                 <!-- End::page-header -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xxl-2 col-xl-12">
                            <div class="col-xl-12" >
                                <!-- 커스텀카드 시작 -->
                            <div class="card custom-card" style="height: 880px; 
                                margin-bottom: 12px; ">
	                            <div class="card-header justify-content-between" style="padding-right: 10px;">
	                                <div class="card-title">
	                                    	<span id="todayDate"></span><br> 예약 환자 목록
	                                </div>
	                                
	                            </div>
	                            <div class="card-body" id="reservsHTML" style="padding-left: 0px;padding-top: 5px;">
	                                <div class="accordion accordion-secondary" id="accordionSecondaryExample">
	                          <!--           <div class="accordion-item">
	                                        <h2 class="accordion-header" id="headingSecondaryOne" >
	                                             <button class="accordion-button" type="button" data-bs-toggle="collapse"
	                                                data-bs-target="#collapseSecondaryOne" aria-expanded="true"
	                                                aria-controls="collapseSecondaryOne" >
	                                                	*의사 선생님 [예약환자: 2명]
	                                            </button> 
	                                        </h2>
	                                        <div id="collapseSecondaryOne" class="accordion-collapse collapse show"
	                                            aria-labelledby="headingSecondaryOne"
	                                            data-bs-parent="#accordionSecondaryExample">
	                                             <div class="accordion-body" >
	                                                <div class="p-3 card custom-card border bg-white rounded" >
                                                    <div class="d-flex gap-2 flex-wrap align-items-center justify-content-between mb-3">
                                                    
                                                        <div class="d-flex flex-fill align-items-center">
                                                            <div class="me-2">
                                                                
                                                                <span class="avatar bg-info"> <i class="ri-team-line fs-18"></i></span>
                                                                
                                                            </div>
                                                            <div class="lh-1">
                                                                <span class="fw-semibold d-block mb-2 text-default" style="float: left;">09:00 [송현지님]
                                                                </span>
                                                                
                                                                <span class="d-block  fs-12">팔목 부상</span>
                                                           
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="d-flex gap-2">
                                                        <button type="button" class="btn btn-sm btn-light flex-fill">상세보기</button> 
                                                        <button type="button" class="btn btn-info-light btn-wave flex-fill">이동</button>
                                                    
                                                    </div>
                                                </div>
	                                            </div> 
	                                        </div> 
	                                    </div> -->
	                                   
	                                </div> 
	                            </div>
                            <div class="card-footer d-none border-top-0">
								
                            </div>
                        </div>
                                <!-- 커스텀카드 끝 -->



                            </div>
                            </div>
                            
                            
                         <div class="col-xxl-7 col-xl-12"> 
                         <div class="row">
                          <div class="col-xl-4" style="padding-left: 0px; padding-right: 0px;">
                                <!-- 커스텀카드 시작 -->
                                <div class="card custom-card" style="height: 880px; 
                                margin-bottom: 12px; ">
                                  <!-- 제목 시작 -->
                                    <div class="card-header" style=" margin-left: 10px; padding-right: 8px;">
                                    	 <div class="row" style="display: flex; align-items: center; flex-wrap: nowrap;">
										    <span class="card-title" style="padding-left: 0px;padding-right: 0px;width: 100px;">
										        	환자 상세 정보
										    </span>
										    <div style="padding-left: 5px;">
										        <button type="button" class="btn btn-secondary-light btn-wave" data-bs-toggle="modal" data-bs-target="#create-task" style="font-size: 12px;padding-right: 5px;padding-left: 5px;">
										            <img src="${pageContext.request.contextPath}/resources/assets/images/icon/free-icon-account-14502797.png" width="20px" alt="">
										            <span>&nbsp;</span> 회원등록하기
										        </button> 
										    </div>
									    </div>
								</div>
                                    <!-- 제목 끝 -->

                                    
                                    

                                    <div class="card custom-card" style="margin-bottom: 0px;">
                                      
                                      <div class="card-body">
                                          <ul class="list-group">
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                         	 이름 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memNameDetail" value=""></span>
                                                  </div>
                                              </li>
                                              
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                        	  나이 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memAgeDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   성별 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memGenderDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center" style="">
                                                      <div class="me-2 fw-semibold">
                                                       	   주민등록번호:
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memRegnoDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   전화번호 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memTelDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                      	    주소 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memAddressDetail"></span>
                                                  </div>
                                              </li>
                                              
                                              <li class="list-group-item">
                                                <div class="d-flex flex-wrap align-items-center">
                                                    <div class="me-2 fw-semibold">
                                                      	  보호자 :
                                                    </div>
                                                    <span class="fs-12 text-muted" id="ProtectorNameDetail"></span>
                                                </div>                                                                                                                                                    
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex flex-wrap align-items-center">
                                                    <div class="me-2 fw-semibold">
                                                      	  보호자번호 :
                                                    </div>
                                                    <span class="fs-12 text-muted" id="ProtectorTelDetail"></span>
                                                </div>                                                                                                                                                    
                                            </li>
                                            
 
                                          </ul>
                                          <!-- <div class="text-end">
                                        <button type="button" class="btn btn-secondary btn-wave">확인</button>
                                    </div> -->
                                    
                                      </div>  
                                                                                              
                                  </div>



                                 <!--  <div class="row mt-2">
                                    <div class="card-body d-flex justify-content-end">
                                        <input type="button" name="" class="btn btn-secondary btn-wave" id="" value="촬영">
                                    </div>
                                </div> -->



                                <div class="card-footer" style="padding-top: 12px;" >
                                    <!-- <button type="button" class="btn btn-secondary-light btn-wave" data-bs-toggle="modal"
                                    data-bs-target="#create-task">
                                    회원등록(모달버튼)하기
                                    </button>
                                    <button type="button" class="btn btn-secondary btn-wave">확인</button> -->
                                    
                                    
                                    <div style="float: right;">
                                        <button type="button" class="btn btn-secondary btn-wave" id="detailAddBtn" style="display: block;" >선택</button>
                                    </div>
                                </div>
                            </div>
                                <!-- 커스텀카드 끝 -->



                            </div>
                            
                            
                            <!--  -->
                            <div class="col-xl-8" style="height: 200px;">
                                <div class="row">
                                    <!-- <div class="col-xxl-6 col-lg-6 col-md-6">
                                        <div class="card custom-card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex align-items-top justify-content-between">
                                                    <div>
                                                        <span class="avatar avatar-md avatar-rounded bg-primary">
                                                            <i class="ti ti-users fs-16"></i>
                                                        </span>
                                                    </div>
                                                    <div class="flex-fill ms-3">
                                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                            <div>
                                                                <p class="text-muted mb-0">Total Customers</p>
                                                                <h4 class="fw-semibold mt-1">1,02,890</h4>
                                                            </div>
                                                            <div id="crm-total-customers"></div>
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                                            <div>
                                                                <a class="text-primary" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                                            </div>
                                                            <div class="text-end">
                                                                <p class="mb-0 text-success fw-semibold">+40%</p>
                                                                <span class="text-muted op-7 fs-11">this month</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <!-- <div class="col-xxl-6 col-lg-6 col-md-6">
                                        <div class="card custom-card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex align-items-top justify-content-between">
                                                    <div>
                                                        <span class="avatar avatar-md avatar-rounded bg-secondary">
                                                            <i class="ti ti-wallet fs-16"></i>
                                                        </span>
                                                    </div>
                                                    <div class="flex-fill ms-3">
                                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                            <div>
                                                                <p class="text-muted mb-0">Total Revenue</p>
                                                                <h4 class="fw-semibold mt-1">$56,562</h4>
                                                            </div>
                                                            <div id="crm-total-revenue"></div>
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                                            <div>
                                                                <a class="text-secondary" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                                            </div>
                                                            <div class="text-end">
                                                                <p class="mb-0 text-success fw-semibold">+25%</p>
                                                                <span class="text-muted op-7 fs-11">this month</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <!-- <div class="col-xxl-6 col-lg-6 col-md-6">
                                        <div class="card custom-card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex align-items-top justify-content-between">
                                                    <div>
                                                        <span class="avatar avatar-md avatar-rounded bg-success">
                                                            <i class="ti ti-wave-square fs-16"></i>
                                                        </span>
                                                    </div>
                                                    <div class="flex-fill ms-3">
                                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                            <div>
                                                                <p class="text-muted mb-0">Conversion Ratio</p>
                                                                <h4 class="fw-semibold mt-1">12.08%</h4>
                                                            </div>
                                                            <div id="crm-conversion-ratio"></div>
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                                            <div>
                                                                <a class="text-success" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                                            </div>
                                                            <div class="text-end">
                                                                <p class="mb-0 text-danger fw-semibold">-12%</p>
                                                        <span class="text-muted op-7 fs-11">this month</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- <div class="col-xxl-6 col-lg-6 col-md-6">
                                        <div class="card custom-card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex align-items-top justify-content-between">
                                                    <div>
                                                        <span class="avatar avatar-md avatar-rounded bg-warning">
                                                            <i class="ti ti-briefcase fs-16"></i>
                                                        </span>
                                                    </div>
                                                    <div class="flex-fill ms-3">
                                                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                            <div>
                                                                <p class="text-muted mb-0">Total Deals</p>
                                                                <h4 class="fw-semibold mt-1">2,543</h4>
                                                            </div>
                                                            <div id="crm-total-deals"></div>
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                                            <div>
                                                                <a class="text-warning" href="javascript:void(0);">View All<i class="ti ti-arrow-narrow-right ms-2 fw-semibold d-inline-block"></i></a>
                                                            </div>
                                                            <div class="text-end">
                                                                <p class="mb-0 text-success fw-semibold">+19%</p>
                                                                <span class="text-muted op-7 fs-11">this month</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="col-xl-12" >
                                        <div class="card custom-card" style="height: 880px;">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                    	접수하기
                                                </div>
                                                </div>
                                                <div>
                                                


                                                 <!-- 여기 시작 -->
                                                 <div class="card-body">
                                                    <div class="row gy-4"  >
                                                     
                                                     <div style="text-align: center;padding-left: 20px;padding-right: 20px;margin-top: 30px;" >
                                                        <h4 class="mb-3" style="float: left; font-weight: bold;" id="memNameReceipt">환자명 &nbsp;</h4>
                                                        <h6 style="float: left;padding-top: 10px; float:left; color: rgb(111, 109, 109);" id="memGenderReceipt">성별,</h6>
                                                        <h6 style="float: left;padding-top: 10px; color: rgb(111, 109, 109);" id="memAgeReceipt">나이</h6>
                                                        <p style="float: right; color: rgb(111, 109, 109);" id="memSignupDateReceipt" >****년 **월 **일</p>
                                                    </div>

                                                    
                                                    <div class="col-mb-12 row" style="margin-top: 5px;margin-bottom: 10px;padding-left: 20px;padding-right: 20px;">
                                                        <label for="input-text" class="form-label">주민등록번호</label><br>
                                                        <div class="col-xl-3" style="padding-right: 0px;">
                                                        <input type="text" class="form-control" id="memRegno1Receipt" style="width: 120px; float: left;" value="000000" >
                                                        </div>
                                                        
                                                         <div style="width:10px;padding-left: 35px;padding-right: 5px;margin-top:5px;" class="col-xl-1">
                                                          <span style="float: left;">&nbsp;-&nbsp;</span>
                                                         </div>
                                                       <div class="col-xl-3">
                                                        <input type="password" class="form-control" id="memRegno2Receipt" style="width: 120px;"  value="*******" >
                                                    	</div>
                                                    </div>
                                                    <!--  -->
                                                    
                                                    
                                                    <!--  -->
                                                    
                                                   <!-- <div class="col-mb-12" style="margin-top: 5px;margin-bottom: 15px;padding-left: 20px;padding-right: 20px;">
                                                        <label for="input-password" class="form-label">주민등록번호</label><br>
                                                        <input class="form-control" type="text" value="980905" id="disabled-readonlytext" 
                                                         aria-label="Disabled input example" disabled="" readonly="" style="width: 180px; float: left;">
                                                        <span style="float: left;padding-top: 10px;">&nbsp;<span >-</span>&nbsp;</span>
                                                        <input type="password" class="form-control" id="input-password" 
                                                        value="0000000" disabled style="width: 180px;">
                                                    </div> -->
                                                    <!--  -->
                                                    <div class="col-md-12" style="margin-top: 5px;margin-bottom: 5px;padding-left: 20px;padding-right: 20px;">
                                                        <label for="text-area" class="form-label">찾아오게된 경로</label> 
                                                        <textarea class="form-control" id="preDiagnosisChoice" rows="1" style="width: 390px; height: 50px;"></textarea>
                                                     </div>
                                                     
                                                      <div class="col-md-12" style="margin-top: 5px;margin-bottom: 10px;padding-left: 20px;padding-right: 20px;">
                                                        <label for="text-area" class="form-label">치료중 질환</label>
                                                        <textarea class="form-control" id="preDiagnosisDisease" rows="1" style="width: 390px; height: 50px;"></textarea>
                                                     </div>
                                                    <div style="margin-top: 5px;">
                                                        <div class="col-mb-5" style="float:left;padding-left: 10px;margin-bottom: 10px;">
                                                            <label for="input-text" class="form-label">특이체질/알러지</label>
                                                            <input type="text" class="form-control" id="preDiagnosisAllergy"  style="width: 390px; margin-right: 50px;" >
                                                        </div>
                                                        
                                                        <div class="col-mb-5" style="float:left;padding-left: 10px;padding-right: 8px;margin-bottom: 10px;" >
                                                            <label for="input-text" class="form-label">수술경험</label>
                                                            <input type="text" class="form-control" id="preDiagnosisExp"  style="width: 410px;" >
                                                        </div>
                                                    </div>
                                                       <div class="col-xl-12" style="padding-left: 20px;margin-top: 0px;margin-bottom: 5px;">
                                                        <label for="task-id" class="form-label" style="margin-bottom: 0px;">구분사항</label>
                                                        <div class="d-flex align-items-center">
                                                            <div class="form-check form-check-lg me-3">
                                                                <label class="form-check-label" for="diagnosis-checkbox">임산부</label>
                                                                <input class="form-check-input" type="checkbox" value="Y" 
                                                                 id="preDiagnosisPregnancy" onclick='getPregnancyValue(event)'>
                                                            </div>
                                                            <!-- <div class="form-check form-check-lg">
                                                                <label class="form-check-label" for="prescription-checkbox">노약자</label>
                                                                <input class="form-check-input" type="checkbox" value="" id="prescription-checkbox" >
                                                            </div> -->
                                                        </div>
                                                    </div>
                                                      
                                                    
                                                    <div class="col-md-12 " id="styleTest"  >
                                                        <label for="text-area" class="form-label">내원이유/호소증상</label>
                                                        <textarea class="form-control" id="receiptReason" rows="1" style=" height: 80px;"></textarea>
                                                     </div>
                                                    <div style="margin-top: 0px;margin-bottom: 0px;padding-left: 20px;padding-right: 20px;">
                                                        <span class="fw-semibold mb-2">진료 가능한 의사</span>
                                                          <select class="form-select"  aria-label="Default select example" id="selectDoctor"  style="width: 390px;margin-top: 10px;">
                                                               <!-- <option selected>Open this select menu
                                                              </option> -->
                                                              <%-- <c:forEach items="${doctorList }" var="List">
                                                              	<option value="${list.memNo }" >${list.memName }</option>
                                                              </c:forEach> --%>
                                                              <option id ="addSelect" value="1">선택해주세요</option>
                                                          </select><br>
                                                      </div>
    
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12" style="margin-top: 0px;">
                                                          <label for="input-text" class="form-label">수술경험</label>
                                                          <input type="text" class="form-control" id="input-text" placeholder="Text">
                                                      </div> -->
                                                      
                                                      <!-- <div class="col-mb-12">
                                                            <label for="input-text" class="form-label">치료중인 질환</label>
                                                            <input type="text" class="form-control" id="input-text" placeholder="Text">
                                                      </div><br> -->
                                                        <!-- <div class="col-mb-12">
                                                            <label for="input-text" class="form-label">특이체질/알러지</label>
                                                            <input type="text" class="form-control" id="input-text" placeholder="Text">
                                                        </div> -->
                                                     <!--  <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                          <label for="input-number" class="form-label">Type Number</label>
                                                          <input type="number" class="form-control" id="input-number" placeholder="Number">
                                                      </div> -->
                                                      
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                          <label for="input-tel" class="form-label">전화번호</label>
                                                          <input type="tel" class="form-control" id="input-tel" placeholder="+1100-2031-1233">
                                                      </div> -->
                                                      
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12" style=" margin-top: 0px;padding-left: 20px;">
                                                        <label for="disabled-readonlytext" class="form-label">접수날짜</label>
                                                          <input class="form-control" type="text" value="오늘날짜2024-04-03" id="disabled-readonlytext" aria-label="Disabled input example" disabled="" readonly="">
                                                      </div> -->
                                                      
                                                      <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12" style=" margin-top: 0px; ">
                                                         <!--  <div class="row">
                                                              <div class="col-xl-4">
                                                                  <label class="form-label">Type Color</label>
                                                                  <input class="form-control form-input-color" type="color" value="#136bd0">
                                                              </div>
                                                              <div class="col-xl-4">
                                                                  <div class="form-check">
                                                                      <p class="mb-3 px-0 text-muted">Type Checkbox</p>
                                                                      <input class="form-check-input ms-2" type="checkbox" value="" checked="">
                                                                  </div>
                                                              </div> 
                                                              <div class="col-xl-3">
                                                                  <div class="form-check">
                                                                      <p class="mb-3 px-0 text-muted">Type Radio</p>
                                                                      <input class="form-check-input ms-2" type="radio" checked="">
                                                                  </div>
                                                              </div> 
                                                          </div> -->
                                                      </div>
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                          <label for="input-file" class="form-label">Type File</label>
                                                          <input class="form-control" type="file" id="input-file">
                                                      </div> -->
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                          <label class="form-label">Type Url</label>
                                                          <input class="form-control" type="url"  name="website" placeholder="http://example.com">
                                                      </div> -->
                                                      
                                                      <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                                          <label for="input-readonlytext" class="form-label">Input Readonly Text</label>
                                                          <input type="text" readonly="" class="form-control-plaintext" id="input-readonlytext" value="email@example.com">
                                                      </div> -->
                                                      
                                                      
                                                      
                                                      
    
                                                       <!-- 버튼 -->
                                                      <div class="card-footer" style="padding-right: 10px;padding-top: 13px;margin-top: 12px;">
                                            			<button type="button" class="btn btn-teal-gradient btn-wave" style="float: right;" id="test">test</button>
                                                        <button type="button" id="receiptFinalBtn" class="btn btn-secondary btn-wave" style="float: right;" disabled="disabled">접수</button>
    
                                                        
                                                    </div>
                                                      <!-- 버튼넣기 -->
                                                    </div>
                                                  </div>


                                                <!-- 여기 끝 -->
                                              </div>

                                             <!-- 모달 여기있었음 -->
                                       <!--  -->
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
                            <!-- <div class="col-xl-12">
                              <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                  <label for="disabled-readonlytext" class="form-label" >수납일</label>
                                  <input class="form-control" type="text" value="2024-03-01" id="disabled-readonlytext" aria-label="Disabled input example" disabled="" readonly="" width="10px">
                              </div>
                            </div> -->
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
                        <div class="modal-footer" >
                          <button type="button" id="addMemberSelectBtn" class="btn btn-primary" data-bs-dismiss="modal"> 접수</button>
                          <button type="button" class="btn btn-light" data-bs-dismiss="modal">뒤로 </button>
                          <!-- <button type="button" id="addMemberBtn" class="btn btn-primary" data-bs-dismiss="modal"> 회원등록(모달속)하기</button> -->
                        </div>
                      </div>
                    </div>
                  </div>
            <!-- End::add task modal 모달끝 -->
                                       <!--  -->      

                                            </div>
                                            <div class="card-body">
                                                <div class="content-wrapper">
                                                    <div id="crm-revenue-analytics"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        </div>
                    
                    <div class="col-xxl-3 col-xl-12">
                        <div class="row">
                            <div class="col-xxl-12 col-xl-12">
                                <div class="row">
                                    <div class="col-xl-12 col-xl-6" style="padding-left: 0px;padding-right: 0px;">
                                        <!--  -->
                                        
                                    <div class="col-xxl-12 col-xl-6">
                                        <div class="card custom-card" style="height: 880px;">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                    <i class="bx bx-building-house">&nbsp;</i>
                                                   	 최근 방문 기록
                                                </div>
                                            </div>
                                            <div class="card-body recent">
                                                <div>
                                                    <ul class="list-unstyled mb-0 crm-recent-activity">
                                                        <li class="crm-recent-activity-content"  id="record-body" style="overflow-y: auto;max-height: 780px;">
                                                           
                                                        </li> 
                                                      
                                                       
                                                        
                                                    </ul>
                                                </div> 
                                               
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
                </div>
                <!-- End::row-1 -->

            </div>
        </div>
        <!-- End::app-content -->
        
       <!--  <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModal" aria-hidden="true" >
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
        </div> -->
        

    </div>

    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

   
    
</body>
<script>
//오늘 예약리스트보여쥑
var selectedReservno = 0; // 선택한 예약번호
function reloadDoctorReservList() {
$.ajax({
	type:"POST",
	url:"/admin/getDoctorsReservList",
	contentType: "application/json; charset=utf-8",
	beforeSend : function(xhr){
		 // CSRF 토큰 헤더에 추가
       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
	success:function(doctors){
		$("#reservsHTML").html("");
		console.log("doctors:",doctors);
		doctors.forEach(function(doctor){
			var newResultHtml =
    	    '<div class="card border custom-card" style="background-color:white;width: 100%;height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">'+
            '<div class="card-header" style="height: 30px; background-color: #f6feff !important">'+
            '<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">'+doctor.empName+'의사 예약'+'</span>'+
            '</div>'+
            '<div class="card-body p-3" style="width: 220px;height: 110px;margin-left: 0px;margin-bottom: 0px;padding-left: 0px;">'+
            '<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="">'+
            '<div class="d-inline-flex align-items-start position-relative pickPt">'+
            '<a href="#">'+
            '<div class="flex-grow-1 clickReservs" data-bs-detailparam="'+doctor.memNo+'"  data-newparam="'+doctor.reservNo+'" data-empno="'+doctor.empNo+'" id="detailMember" style="margin-top:-7px;">'+
            '<span class="mb-0 d-block fs-15 fw-semibold patntName ">' + doctor.memName + '</span>'+
            '<span class="fs-13 text-muted">' + doctor.memGender + ' ' + doctor.memAge + '세</span>'+'</br>'+
            '<span class="fs-13 text-muted">'+doctor.reservTime +'['+doctor.reservMemo+']' + '</span>'+
            '</div>' +
            '</a>'+
            '</div>' +
//             '<button type="button" class="btn btn-sm btn-light flex-fill" data-bs-detailparam="'+doctor.memNo+'"  data-newparam="'+doctor.reservNo+'"  id="detailMember" >내원하기</button> '+
            '<span class="fs-10 badge rounded-pill bg-secondary receiptBadge">예약대기중</span>'+
            '</div>' +
            '<input type="hidden" value="'+doctor.reservNo+'" />'+ 
            '</div>' +
            '</div>';
    	    
	        $("#reservsHTML").append(newResultHtml); // 결과를 추가할 부모 요소에 새로운 결과를 추가합니다.
	        //$("#reservsHTML").html(newResultHtml); // 결과를 추가할 부모 요소에 새로운 결과를 추가합니다.
			})
			
			$(document).on("click","#detailMember",function(){
				console.log('S : Test')
				console.log($(this).data("empno"));
				let empNo = $(this).data("empno");
				var memNo = $(this).data("bs-detailparam");
			 	console.log("memNo:", memNo);
			 	//예약번호저장 방법1
			  	var newParam = $(this).data("newparam");
			    console.log("newParam(예약번호):", newParam);
			    //전역변수에 예약번호 저장
			    selectedReservno = newParam;
			    console.log("selectedReservno확인:",selectedReservno);
				 	
			  	//예약번호저장 방법2
					// 클릭된 버튼의 부모 요소인 .card-body를 찾고, 그 안에서 input[type=hidden]을 찾습니다.
			    //var thisreservNo = $(this).closest(".card-body").find("input[type=hidden]").val();
			    //console.log("thisreservNo:", thisreservNo);
			       			 	
   			//헤더 상세보기랑 연결
	    		$('#modal-body').html();
	    		var paramValue = $(this).data('bs-detailparam');
	    		$.ajax({
	    			url : "/comm/showpatientdetail",
	    			type : "get",
	    			 data: { param: paramValue },
	    			 beforeSend: function(xhr) {
	  	    	     	   // CSRF 토큰 헤더에 추가
	  	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	  	      		},
	    			 success :function(res){
	    				console.log(res);
	    				chartRecordList = res[0];
	    				let particularList = res[1];
	    				patntInfo = res[2];
	    				protector = res[3];
//        	     				console.table(chartRecordList);
//        	     				console.table(particularList);
//        	     				console.table(patntInfo);
//        	     				console.table(protector);
	    				let html ="";
	    	             html+='<div class="row g-0">'
	    	                 +'<div class="col-5 leftmd">'
	    	                 +'<p>'
	    	                 +'<h6 style="float: left;">'
	    	                 +'<i class="bx bx-building-house" style="margin-left: 20px; font-size: 20px;"></i>'
	    	                 +'</h6>'
	    	                 +'<span class="leftmdTitle">최근방문기록</span>'
	    	                 +'</p><br><br>';
	    	                 $.each(chartRecordList, function(index, chart)
	    	                 {
	    	                 html+='<p class="leftmdContent">'+chart.chartDate+' '+chart.memName+'<br><span class="badge rounded-pill bg-dark-transparent">'+formatNumber(chart.chartNo)+'</span></p>'
	    	                 });
	    	             html+='<div style="margin-top: 50px;"></div>'
	    	                 +'<p>'
	    	                 +'<h6 style="float: left;">'
	    	                 +'<i class="bx bx-message-square-dots" style="margin-left: 20px; font-size: 20px;"></i>'
	    	                 +'</h6>'
	    	                 +'<span class="leftmdTitle">특이사항</span><br>'
	    	                 +'</p>';
	    	                 if(particularList.length > 0){
	    		                 $.each(particularList, function(index, particular){
	    		             html+='<p class="leftmdContent" style="color: black; font-weight: 500;">'
	    		                 +'<i class="bx bx-bell"></i> '
	    		                 +particular.particularDescription+'<br>'
	    	                     +'<span class="leftmdContent">'+particular.particularDate+', '+particular.particularWriter+'</span>'
	    		                 +'</p>';
	    		                 });
	    	                 }
	    	                 else{
	    	                 html +='<p class="leftmdContent" style="color: black; font-weight: 500;">'
	    		                 +'<i class="bx bx-task-x"></i>'
	    		                 +' 특이사항 기록이 존재하지 않습니다.<br>'
	    		                 +'</p>'
	    	                 }
	    	                 html+='</div>';
	    	                 html +='<div class="col-7 rightmd" >'
	    	                 +'<p>'
	    	                 +'<h6 style="float: left;">'
	    	                 +'<i class="bx bx-user" style="margin-left: 20px; font-size: 20px;"></i>'
	    	                 +'</h6>'
	    	                 +'<span class="leftmdTitle">환자 정보</span>'
	    	                 +'<span class="rightmdTime">'+patntInfo.memSignupDate+'</span>'
	    	                 +'</p>'
	    	                 +'<p class="rightmdNo">no.'+formatNumber(patntInfo.memNo)+'</p>'
	    	                 +'<p class="rightmdName">'+patntInfo.memName+'<span style="font-size: 15px;margin-left: 10px;">'+patntInfo.memGender+','+patntInfo.memAge+'세</span></p>'
	    	                 +'<p>'
	    	                 +'<span class="rightmdSubtitle" style="margin-left: 20px;">주민등록번호</span>'
	    	                 +'<span class="rightmdSubtitle" style="margin-left: 100px;">대표연락처</span>'
	    	                 +'</p>'
	    	                 +'<p>'
	    	                 +'<span class="rigtmdSubcontent" style="margin-left: 22px; ">'+patntInfo.memRegno1+'-'+patntInfo.memRegno2.substr(0,1)+'******</span>'
	    	                 +'<span class="rigtmdSubcontent" style="left: 555px; ">'+patntInfo.memTel+'</span>'
	    	                 +'</p>'
	    	                 +'<div style="margin-top: 50px;"></div>'
	    	                 +'<p>'
	    	                 +'<h6 style="float: left;">'
	    	                 +'<i class="bx bx-user-plus" style="margin-left: 20px; font-size: 20px;"></i>'
	    	                 +'</h6>'
	    	                 +'<span class="leftmdTitle">보호자</span><br>'
	    	                 +'</p>'
	    	                 +'<p>';
	    	                 if(protector != null ){
	    		            html +='<span style="margin-left: 20px;">'+protector.protectorName+'</span>'
	    		                 +'<span style="margin-left: 20px;">'+protector.protectorTel+'</span>'
	    		                 +'<span style="margin-left: 20px;">'+protector.protectorRelate+'</span>'
	    		                 +'<span style="margin-left: 20px;">'+protector.protectorDate+'</span>'
	    	                 }else{
	    	                	 html +='<span style="margin-left: 20px;"><i class="bx bx-task-x"></i> 등록된 보호자가 없습니다 !</span>'	 
	    	                 }
	    	                 html+='</p>'
	    	                 +'<p style="float: right; margin-right: 15px;">'
	    	                 +'<button class="btn btn-outline-info rounded-pill btn-wave" id="selectPatientBtn" data-bs-dismiss="modal" data-empno="'+empNo+'">선택</button>'
	    	                 +'<button class="btn btn-outline-dark rounded-pill btn-wave" data-bs-dismiss="modal" >닫기</button>'
	    	                 +'</p>'
	    	                 +'</div>'
	    					 +'</div>';
	    				$('#modal-body').html(html);
	    				
	    				
	    				
	    				
	    				
	    				let rhtml ="";
	    				rhtml+='<div class="row g-0">'
	    	                 //+'<div class="col-5 ">'
	    	                 +'<br><br>';
	    	                 $.each(chartRecordList, function(index, chart)
	    	                 {
	    	                rhtml+='<p class="leftmdContent">'+chart.chartDate+' '+chart.memName+'<br><span class="badge rounded-pill bg-dark-transparent">'+formatNumber(chart.chartNo)+'</span></p>'
	    	                 });
	    	             
	    	                 $("#r-body").html(rhtml);
	    				
	    			 }
	    			 
	    			 
	    		});
	    			 $('#modaldemo8').modal('show');
	    			 
	    			// 모달창 외부 클릭시 드롭다운토글 없애기
	    			 $('#modaldemo8').on('shown.bs.modal', function() {
	    			     $('body').on('click', function(e) {
	    			         // 모달 내부를 클릭한 경우에는 처리하지 않음
	    			         if ($(e.target).closest('.modal-content').length === 0) {
	    			             $("#dropdown-menu").hide(); // 드롭다운 메뉴 숨기기
	    			         }
	    			     });
	    			 });
	     
			
				    
				    
				    
			
		});
		
		}
	})
}


        
        $(document).ready(function(){
        	
        	var patntNo;
        	var clinicName; // 선택한 의사의 진료실
        	var selecteddoctorNo;// 선택한 의사의 empNo
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
		    
        	
        	
        	//회원등록후바로 
        	//회원상세보기에 정보띄우는 버튼 클릭 
        	$("#addMemberSelectBtn").on("click",function(){
        		$('#receiptFinalBtn').attr("disabled",false);
        		$("#detailAddBtn").css("display","none");
        		
        		
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
        				var name = res.memName;
        				var memNameDetail = $("#memNameDetail");
        				var Reg1 = res.memRegno1;
        				var Reg2 = res.memRegno2;
        				
        				patntNo = res.patntNo;
        				
        				console.log("p:"+patntNo);
        				//$('span[id=memNameDetail]').attr('value',name);
        				$('span[id=memNameDetail]').html(res.memName);
        				$('span[id=memAgeDetail]').html(res.memAge);
        				$('span[id=memGenderDetail]').html(res.memGender);
        				$('span[id=memRegnoDetail]').html(Reg1+"-"+(Reg2).substring(0,1)+"******");
        				$('span[id=memTelDetail]').html(res.memTel);
        				$('span[id=memAddressDetail]').html(res.memAddress1+res.memAddress2);
        				$('h4[id=memNameReceipt]').html(res.memName+"   ");
        				$('h4[id=memNameReceipt]').css("margin-right","10px");
        				$('h6[id=memGenderReceipt]').html(res.memGender+",");
        				$('h6[id=memAgeReceipt]').html(res.memAge);
        				$('p[id=memSignupDateReceipt]').html(formatDate(today));
        				$('#memRegno1Receipt').val(Reg1).attr("disabled",true);
        				$('#memRegno2Receipt').val(Reg2).attr("disabled",true);
        				
        				
        			}
        		})
        	})
        	
        	
	        //전체검색창>환자 상세정보에서 선택 클릭 이벤트
	        //전역변수로 선언된 환자정보 보호자정보 가져와서 상세정보에 띄워줌
	        $(document).on("click","#selectPatientBtn",function(){
	        	partiTargetNo = patntInfo.patntNo;
	        	console.log("S : 선택");
	        	let empNo = $(this).data("empno"); 
	        	// 선택 또는 닫기 버튼 클릭 이벤트 핸들러
	        	// 검색목록창 닫기
				$("#selectPatientBtn, .btn-outline-dark").click(function() {
				    $("#dropdown-menu").toggle(); // 드롭다운 메뉴 토글
				    
				    //의사는 정함
				    console.log();
				});
				
	        	
	        	
	         	//var memNo = document.getElementById("selectPatientBtn").dataset.memNo; 
	        	//console.table(memNo);
	        	//console.table(patntInfo);
	        	//console.log(patntInfo.memName);
	        	//console.log(protector.protectorName);
	        	$('span[id=ProtectorNameDetail]').empty();
	        	$('span[id=ProtectorTelDetail]').empty();
	        	
	        	$('span[id=memNameDetail]').html(patntInfo.memName);
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
	        	$('#selectDoctor').val(empNo);
	        })
        	
        	
        	//환자 상세 정보 버튼이벤트> 접수로
        	var detailAddBtn = $("#detailAddBtn");
        	detailAddBtn.on("click",function(){
				$('#receiptFinalBtn').attr("disabled",false);
        		
        		
        		$('h4[id=memNameReceipt]').html(patntInfo.memName+"   ");
				$('h4[id=memNameReceipt]').css("margin-right","10px");
				$('h6[id=memGenderReceipt]').html(patntInfo.memGender+",");
				$('h6[id=memAgeReceipt]').html(patntInfo.memAge);
				$('p[id=memSignupDateReceipt]').html(formatDate(today));
				$('#memRegno1Receipt').val(patntInfo.memRegno1).attr("disabled",true);
				$('#memRegno2Receipt').val(patntInfo.memRegno2).attr("disabled",true);
        		
        		
        		
        		partiTargetNo = patntInfo.patntNo;
        		partiTargetmemno = patntInfo.memNo;
        		console.log("민수추가한partiTargetNo(환자번호):",partiTargetNo); 
        		console.log("민수추가한partiTargetmemno(멤버번호):",partiTargetmemno);
        		
        		var memNoData ={
        				memNo:partiTargetmemno
        		}
        		
        		$.ajax({
        			type:'POST',
        			url : '/admin/getRecentRecord',
        			data :  JSON.stringify(memNoData),
        			contentType : 'application/json; charset = utf-8',
        			beforeSend: function(xhr) {
  	    	     	   // CSRF 토큰 헤더에 추가
  	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
  	      		},
        			success: function(res){
        				console.log("체키:",res);
        				
        				
        				var html = "";
        				for (var i = 0; i < res.length; i++) {
							console.log("날짜:",res[i].chartDate);
							console.log("의사이름:",res[i].memName);
							console.log("차트번호:",res[i].chartNo);
							
							var datetimeString = res[i].chartDate;
							
							// 날짜와 시간을 공백을 기준으로 분리합니다.
							var parts = datetimeString.split(" ");

							// 날짜를 연도, 월, 일로 분리합니다.
							var datePart = parts[0];
							var timePart = parts[1];

							// 시간을 시, 분으로 분리합니다.
							var timeParts = timePart.split(":");
							var hour = timeParts[0];
							var minute = timeParts[1];

							console.log("날짜:", datePart);
							console.log("시간:", hour + ":" + minute);
							console.log("상병명:",res[i].disNameKr);
							
							
						//동적으로 추가하기
						// 각각의 활동에 대한 카드를 생성하여 HTML에 추가
				        //html += '<li class="crm-recent-activity-content">';
				        html += '<div class="d-flex align-items-top">';
				        html += '<div class="me-3">';
				        html += '<span class="avatar avatar-xs bg-primary-transparent avatar-rounded">';
				        html += '<i class="bi bi-circle-fill fs-8"></i>';
				        html += '</span>';
				        html += '</div>';
				        html += '<div class="crm-timeline-content">';
				       // html += '<span class="badge rounded-pill bg-dark-transparent">'+formatNumber(res[i].chartNo)+'</span>';
				        html += '<span>' + datePart + '</span><br>';
				       // html += '<span>' + hour + ':' + minute + '</span><br>';
				        html += '<span>' + res[i].memName + '</span><br>';
				        html += '<span>' + res[i].disNameKr + '</span><br>';
				        html += '<span class="badge rounded-pill bg-dark-transparent">' +formatNumber(res[i].chartNo)+'</span>';
				        html += '</div>';
				        html += '<div class="flex-fill text-end">';
				        html += '<span class="d-block text-muted fs-11 op-7">' + hour + ':' + minute + '</span>';
				        html += '</div>';
				        html += '</div>';
				       // html += '</li>';
							
							
						}
							$("#record-body").html(html);
        			}
        			
        		})
        		
        		
        		
        		
        	})
        	

        	 
        	var selectDoctor = $("#selectDoctor");
        	// 최초에도 옵션을 채워주는 AJAX 요청
        	$.ajax({
        	    type:'POST',
        	    url:'/admin/findReceiptDoctor',
        	    contentType : "application/json; charset=utf-8",
        	    beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
        	    success:function(res){
        	        console.log("res:",res);
        	        var addSelect = $("#addSelect");
        	        console.log("addSelect",addSelect);
        	        
        	        var html = "";
        	        $.each(res,function(index,doctor){
        	        	clinicNo = doctor.clinicNo; // 진료실번호
        	        	clinicName = doctor.codeName // 진료실 이름
        	        	selecteddoctorNo = doctor.empNo // 의사의 emp_no
        	        	
        	            html += '<option value="' + selecteddoctorNo + '" data-clinic="' + clinicNo + '">' + doctor.memName + '[' + clinicName + ']</option>';
        	            		
        	         	// 새로운 옵션을 셀렉트 박스에 추가
        	            //selectDoctor.append(option);
        	         	
        	            console.log("2:"+doctor.memName+selecteddoctorNo);
        	        });
        	        
        	        selectDoctor.html(html);
        	        
        	        selectDoctor.trigger("change"); // 초기에도 selectDoctor의 change 이벤트를 발생시켜 선택한 옵션을 맨 위로 이동
        	    }
        	});
        	

        	reloadDoctorReservList();
        	
        	
        	
        	
			//최종 접수 
			//버튼눌러 접수 진행
        	var receiptFinalBtn = $("#receiptFinalBtn");
        	receiptFinalBtn.on("click",function(){
        		
        		
        		console.log("!!selectedReservno확인:",selectedReservno);
        		
        		//선택한 의사 empNO
        		var thisDoctor = $("#selectDoctor").val();
        		console.log("thisDoctor:",thisDoctor);
        		

        		// 데이터로 추가한 요소를 선택하여 해당 데이터를 가져옵니다.
        		var thisClinicNo = $("#selectDoctor option:selected").data('clinic');
        		console.log("thisClinicNo:", thisClinicNo);
        		
        		
        		//선택한 의사의 clinicNo
        		//var thisClinicNo = $("#selectDoctor").data("clinic-no");
        		//console.log("selectDoctor",selectDoctor);
        		
        		// 클래스로 추가한 요소를 선택하여 해당 데이터를 가져옵니다.
				//var thisClinicNo = $('#selectDoctor').find('.clinic-no-' + clinicNo).data('clinic-no');
				//console.log("thisClinicNo:", thisClinicNo);
        		
        		var receiptReason = $("#receiptReason").val(); // receipt_reason
        		
        		
        		if(patntNo !=null){
        			patntNo // 신규환자
        		}else{
        			patntNo = patntInfo.patntNo; //검색한 환자
        		}
        		
        		//doctorNo; // emp_no
        		clinicNo; // clinic_no
        		
        		var preDiagnosisDisease = $("#preDiagnosisDisease").val(); // pre_diagnosis_disease
        		var preDiagnosisAllergy = $("#preDiagnosisAllergy").val(); // pre_diagnosis_allery
        		var preDiagnosisExp = $("#preDiagnosisExp").val();		   // pre_diagnosis_exp
        		var preDiagnosisChoice = $("#preDiagnosisChoice").val();
        		var preDiagnosisPregnancy = $("#preDiagnosisPregnancy");
        		
        		//console.log("patntNoVal"+patntNoVal);		
        		//console.log("doctorNo"+doctorNo);
        		//console.log("clinicNo"+clinicNo);
        		//console.log("pregnancyResult"+pregnancyResult);
        		
        		var receiptPreDiagnisisData = {
        				receiptReason : receiptReason,
        				patntNo :patntNo,
        				clinicNo : thisClinicNo,
        				empNo : thisDoctor,
        				preDiagnosisChoice : preDiagnosisChoice,
        				preDiagnosisExp : preDiagnosisExp,
        				preDiagnosisDisease : preDiagnosisDisease,
        				preDiagnosisAllergy : preDiagnosisAllergy,
        				preDiagnosisPregnancy : pregnancyResult,
        				reservNo : selectedReservno
        		}
        		
        		$.ajax({
        			type:'POST',
        			url:'/admin/doReceipt',
        			data : JSON.stringify(receiptPreDiagnisisData),
        			contentType: "application/json; charset=utf-8",
        			beforeSend: function(xhr) {
 	    	     	   // CSRF 토큰 헤더에 추가
 	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
 	      		},
        			success:function(res){
        				console.log("접수번호:",res.receiptNo)
        				//접수 성공 후 예약목록 다시 로드
        				//에라이 안뜸 시연때 새로고침 해야함(예약선택해서 접수완료시 예약목록에서 안보이게)
        				reloadDoctorReservList();
        				//새로고침
        				window.location.reload(true);
        				
        				
        				
        				//
        			}
        		})
        	})
        	
        	//시연용 데이터 버튼
        	$("#test").on("click",function(){
        		$("#preDiagnosisChoice").val("지인추천으로 오게됐음");
        		$("#preDiagnosisDisease").val("고지혈증");
        		$("#preDiagnosisAllergy").val("바나나 알러지"); 
        		$("#preDiagnosisExp").val("작년에 12월에 왼쪽 발목 수술 받았음");
        		$("#receiptReason").val("길에서 넘어져 왼쪽 발목이 꺾임,통증이 매우 심하고 인대가 손상된것 같음");
        		
        	})
        	
        	//
        	
        	//let todayDate = $("#todayDate");
        	var today = new Date();
        	console.log("날짜:"+today);//Mon Apr 22 2024 15:25:19 GMT+0900
        	/* var year = today.getFullYear();
        	var month = ('0' + (today.getMonth()+1)).slice(-2);
        	var todaydateString = year + '년 ' + month  + '월 ' + day+'일' ; 
        	console.log(">>"+todaydateString); */
        	$("#todayDate").html(formatDate(today)); 
        	
        	
        })
        
        
        
        
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
        
        
        
</script>

</html>