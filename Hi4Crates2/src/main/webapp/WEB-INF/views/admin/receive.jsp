<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">

<!-- 헤더 -->

<!-- Sweetalerts JS -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/sweet-alerts.js"></script>
    
<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.css">


<style>
input[type=text]:focus {
    border-color: lightblue;
}
.custom-select option {
 	font-size: 16px; /* 원하는 글꼴 크기로 조정 */
    margin-bottom: 5px; /* 원하는 간격으로 조정 */
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
               
                 <!-- End::page-header -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xxl-2">
                        <div class="row">
                            <div class="col-xl-12" style="padding-right: 12px;">
                                <!-- 커스텀카드 시작 -->
                                <div class="card custom-card" style="height: 880px;  margin-bottom: 12px; ">
                                  <!-- 제목 시작 -->
                                    <div class="card-header justify-content-between" >
                                        <div class="card-title">
                                          	  수납 대기 목록
                                        </div>
                                       
                                    </div>
                                    <!-- 제목 끝 -->



                       			 
                       			 <!-- 대기환자 카드 시작 -->
						        <!-- Start::app-content -->
						        <div id="placeReserveList" style='overflow-y: auto;max-height: 800px;'>
						        
						     
								</div>
						        
						   
						        <!-- End::app-content -->
                       			 
                       			 <!-- 대기환자 카드 끝 -->
								
                            </div>
                                <!-- 커스텀카드 끝 -->
                            </div>
                          </div>
                        </div>
                            
						<div class="col-xxl-5">
					            <!-- !!!!!!!!!!!!!!!!!!!!여기부터   -->
					            <div class="col-xl-12" style="height: 270px;" >
					                <div class="row">
					                    <!--******* 접수하기 카드박스 -->
					                        <div class="col-xl-12" style="height: 880px;padding-right: 0px;padding-left: 0px;" >
					
					                            <!-- 여기 시작 -->
					                            <!-- 달력넣음 -->
					                            <div class="col-xl-12">
					                                <div class="card custom-card"  style=" height: 880px">
					                                    <div class="card-header">
					                                        <div class="card-title ">수납</div>
					                                    </div>
					                                    <div class="card-body">
					                                    
					                                    
					                                    <div class="card border custom-card" style="margin-top: 0px;margin-bottom: 5px;">
					                                    	<div class="card custom-card ">
					                                    		<div class="card-header" style="padding-top: 0px;padding-bottom: 5px;margin-top: 10px;" >
					                                    			<span class="fw-semibold"> <span id="receiveName" class="fw-semibold">***</span>환자 받을금액</span>
					                                    		</div>
					                                    		
					                                    	</div>
					                                    	<div class="card-body" style="padding-top: 0px;">
					                                    		<!-- div>
					                                    			<span>환자부담 총액   </span><span id="sumCost">350000원</span>
					                                    		</div> -->
					                                    		
					                                    		
					                                    		<!--  -->
					                                    		<div style="padding-bottom: 20px;">
							                                          <ul class="list-group" >
							                                          	<li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                      	<span>진료비용 : </span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="jrCost"></span><span class="me-2 fw-semibold">원</span>
							                                                  	  </div>
							                                                  </div>
							                                              </li>
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                      	<span>MRI비용 : </span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="MRICost"></span><span class="me-2 fw-semibold">원</span>
							                                                  	  </div>
							                                                  </div>
							                                              </li>
							                                              
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                        <span>XRAY비용 :</span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="XRAYCost"></span><span class="me-2 fw-semibold">원</span>
							                                                 	  </div>
							                                                  </div>
							                                              </li>
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	 <span>물리치료 :</span> 
							                                                      </div>
							                                                      <div>
							                                                     	 <span id="muliCost"></span><span class="me-2 fw-semibold">원</span>
							                                                      </div>
							                                                  </div>
							                                              </li>
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	   <span>수술비용 :</span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="surgeryCost"></span><span class="me-2 fw-semibold">원</span>
							                                                      </div>
							                                                  </div>
							                                              </li>
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	   <span>입원비용 :</span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="hpCost"></span><span class="me-2 fw-semibold">원</span>
							                                                      </div>
							                                                  </div>
							                                              </li>
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	   <span>약처방 비용 :</span> 
							                                                      </div>
							                                                      <div>
							                                                      	<span id="medicineCost"></span><span class="me-2 fw-semibold">원</span>
							                                                      </div>
							                                                  </div>
							                                              </li>
							                                            
							                                          </ul>
							                                         </div>
					                                          
					                                          	
					                                          
					                                          
					                                          
					                                          
							                                          <div style="padding-bottom: 20px;">
							                                           <ul class="list-group">
							                                              
							                                              <li class="list-group-item">
							                                                  <div class="d-flex flex-column">
																			    <div class="form-check">
																			        <label class="form-check-label me-2 fw-semibold text-primary" for="diaCheck">
																			            	진단서 [ 10,000원 ]
																			        </label>
																			        <input class="form-check-input " type="checkbox" value="Y" id="diaPaper">
																			    </div>
																			   <div class="form-check">
																			        <label class="form-check-label me-2 fw-semibold text-primary" for="soCheck">
																			            	소견서 [ 1000원  ]
																			        </label>
																			        <input class="form-check-input" type="checkbox" value="Y" id="soPaper">
																			    </div>  
																			    <!-- <div class="form-check">
																			        <label class="form-check-label me-2 fw-semibold text-primary" for="priCheck">
																			           		처방전 
																			        </label>
																			        <input class="form-check-input" type="checkbox" value="Y" id="priPaper">
																			    </div> -->
																			</div>  
							                                              </li>
							                                             <li class="list-group-item">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	 <span>자료발급비용 :</span>
							                                                      </div>
							                                                      
							                                                       <div class="form-check">
																					    <span id="finalDataCost"></span><span class="me-2 fw-semibold">원</span>
																				  </div>
							                                                  </div>
							                                              </li> 
							                                              
							                                          </ul>
							                                         </div>
							                                         
							                                         <div>
							                                           <ul class="list-group">
							                                              
							                                             <li class="list-group-item" >
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	 <span>총금액 :</span>
							                                                      </div>
							                                                      
							                                                       <div class="form-check">
																					    <span id="sumCost" class="me-2 fw-semibold text-info"></span><span class="me-2 fw-semibold text-info">원</span>
																				  </div>
							                                                  </div>
							                                              </li> 
							                                              
							                                              <li class="list-group-item" >
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	 <span>공단부담금:</span>
							                                                      </div>
							                                                      
							                                                       <div class="form-check">
																					    <span id="discount" class="me-2 fw-semibold text-danger"></span><span class="me-2 fw-semibold text-danger">원</span>
																				  </div>
							                                                  </div>
							                                              </li> 
							                                                
							                                             <li class="list-group-item" style="background-color: #effbff;">
							                                                  <div class="d-flex flex-wrap align-items-center  justify-content-between">
							                                                      <div class="me-2 fw-semibold">
							                                                       	 <span>환자부담총금액:</span>
							                                                      </div>
							                                                      
							                                                       <div class="form-check">
																					    <span id="lastCost" class="me-2 fw-semibold text-info"></span><span class="me-2 fw-semibold text-info">원</span>
																				  </div>
							                                                  </div>
							                                              </li> 
							                                              
							                                              
							                                              
							                                          </ul>
							                                         </div>
					                                          
					                                          
					                                    		
					                                    		<!--  -->
					                                    		
					                                    	</div>
					                                    
					                                    </div>
					                                    
						                               <!-- 테스트로 넣어봄 -->     
										    <div class="card custom-card"  style="margin-bottom: 12px;">
				                        	</div>
						                  	<button type="button" id="addPayBtn" class="btn btn-info btn-wave"  style="float: right;" data-bs-toggle="modal" data-bs-target="#payModal">결제</button>
						                               <!-- 테스트로 넣어봄 -->         		 
		
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- 달력끝 -->
					                            
										</div>
					                    <!--******** 접수하기 박스 끝 -->
					                                                
					            <table style="width: 100px; height: 100px;">
					
					            </table>
					           
					        </div>
					    </div>
					    <!-- !!!!!!!!!!!!!!!!!!!!여기까지   -->
                 

                     
 
                        </div>
                    <div class="col-xxl-5 ">
                        <div class="row">
                            <div class="col-xxl-12 col-xl-12">
                                <div class="row">
                                    <div class="col-xl-12 col-xl-6" style="padding-right: 5px;">
                                       
                                       
                                        <!-- 문서카드내용 -->
					                            
										<div class="card custom-card" style="height: 450px;margin-bottom: 12px;">
					                            <div class="card-header justify-content-between">
					                                <div class="card-title">
					                                    	<span></span> <span>결제내역</span>
					                                </div>
					                                
					                            </div>
					                            
					                            
					                            <!-- 결제방식  -->
                            
		                            	<div class="card border custom-card" style="width:460px;margin-left: 20px;margin-top: 20px;">
		                                   	<div class="card custom-card">
		                                   		<div class="card-header" style="padding-top: 0px;padding-bottom: 5px;margin-top: 10px;">
		                                   			<span></span> <span class="fw-semibold"> 결제내역</span>
		                                   			
		                                   		</div>
		                                   	</div>
		                                   	<div class="card-body">
		                                   	 		<table class="table text-nowrap table-bordered border-primary">
		                                                        <thead>
		                                                            <tr>
		                                                                <th scope="col">날짜</th>
		                                                                <th scope="col">수납금액</th>
		                                                                <th scope="col">결제방식</th>
		                                                            </tr>
		                                                        </thead>
		                                                        <tbody id="table-body">
		                                                        		<tr >
		                                                                    <td colspan="3" style="text-align: center;">결제내역이 없습니다</td>
		                                                                </tr>
		                                                            
		                                               </tbody>
		                                           </table>
		                                           <span>&nbsp</span>
		                                           
		                                           <table class="table text-nowrap table-bordered border-primary">
		                                                       <!--  <thead>
		                                                            <tr>
		                                                                <th scope="col">날짜</th>
		                                                                <th scope="col">수납금액</th>
		                                                                <th scope="col">결제방식</th>
		                                                                
		                                                            </tr>
		                                                        </thead> -->
		                                                        <tbody>
		                                                         	<tr>
		                                                                <th scope="row" class="fw-semibold">
		                                                                    	결제금액
		                                                                </th>
		                                                                <td>
		                                                                    <span id="payResPrice"></span><span>원</span>
		                                                                </td>
		                                                                
		                                                            </tr>
		                                                            <tr>
		                                                                <th scope="row" class="fw-semibold">
		                                                                    	남은금액
		                                                                </th>
		                                                                <td>
		                                                                    <span id="payLeftPrice"></span><span>원</span>
		                                                                </td>
		                                                                
		                                                            </tr>
		                                                            
		                                               </tbody>
		                                           </table>
		                                   	</div>
							            </div>
							            
                            <!-- 결제방식  -->
                            
					                            
					                             
					                        </div>
										                            
					              <!-- 문서카드내용 -->
                                       
                                       
                                       
                                       
                                        
                                    <div class="col-xxl-12 col-xl-6" style="height:550px;">
                                    
                                    
                                      
                                    
                                    <!--  -->
                                <div class="card custom-card" style="height:417px;">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                    <i class="bx bx-receipt">&nbsp;</i>
                                                    	문서발급
                                                </div>
                                            </div>
                                            
                                            	<div class="card-body p-0">
					                              <!--  <i class="ti ti-file-text"></i> <span class="fw-semibold">진단서 </span><span id="diagStatus" class="text-danger">[출력불가]</span> -->
					                           <div>
					                           	<button type="button" id="diagBtn" class="btn btn-info-light btn-m btn-wave" style=" margin-left: 20px; margin-top: 20px; width:460px;"><i class="ti ti-file-text" style="font-size: 15px;"  >&nbsp;<span class="fw-semibold">진단서요청하기 </span></i> </button>
					                           </div>
					                           <br>
					                           <div>
					                           	<button type="button" id="soBtn" class="btn btn-info-light btn-m btn-wave" style=" margin-left: 20px; margin-top: 20px; width:460px;"><i class="ti ti-file-text" style="font-size: 15px;" >&nbsp;<span class="fw-semibold">소견서요청하기 </span></i> </button>
					                           </div>
					                          <!--  <div>
					                           	<button type="button" id="cheoBtn" class="btn btn-info-light btn-m btn-wave" style="margin-left: 20px;margin-top: 40px;width:460px;"><i class="ti ti-file-text" style="font-size: 15px;" >&nbsp;<span class="fw-semibold">처방전요청하기 </span></i> </button>
					                           </div> -->
					                           <!-- <span id="diagStatus" class="text-danger">[출력불가]</span> -->
					                            </div>
					                            <!--  <div class="card-body p-0">
					                               <i class="ti ti-file-text"></i><span class="fw-semibold">소견서 </span><span id="soStatus" class="text-success">[출력가능]</span>
					                            </div> -->
					                            <!--  <div class="card-body p-0">
					                               <i class="ti ti-file-text"></i><span class="fw-semibold">처방전 </span><span id="priStatus" class="text-success">[출력가능]</span>
					                            </div> -->
                            
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

    </div>


   <!--현흠모달  -->
                        
                         <div class="modal fade" id="payModal" tabindex="-1"
					            aria-labelledby="exampleModalLabel" aria-hidden="true">
					            <div class="modal-dialog">
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <!-- <h6 class="modal-title" id="exampleModalLabel1">결제방식 추가(모달)</h6>
					                        <button type="button" class="btn-close" data-bs-dismiss="modal"
					                            aria-label="Close"></button> -->
					                    </div>
					                    <div class="modal-body" id="modalBody" style="padding-left: 25px;padding-right: 25px;">
					                       <!-- <form action="/radiation/updateEqInfo" method="post" id="updateForm"> -->
					                       		<input type="hidden" id="eqNo" name="eqNo" />
					                			<div class="mb-3">
					                				
									                <label for="recipient-name"
									                    class="col-form-label">남은금액: </label>
									                <input type="text" style="background-color:rgb(230 230 237);" class="form-control" value="" id="leftCost" name="leftCost">
									            </div>
									             <div class="mb-3">
									                <label for="message-text"
									                    class="col-form-label">결제 방식:</label>
									                    <select class="form-select" id="selectPay" name="selectPay">
									                		<option value="1">카드</option>
									                		<option value="2">현금</option>
									                		<option value="3">부분</option>
									                	</select>
									            </div>
									            <div class="mb-3">
									           	  <div class="row"> 
													    <div class="col-xl-4">
													        <label style="width:200px;" for="message-text" class="col-form-label">결제금액 :<button class="btn btn-outline-dark btn-sm btn-wave" id="allCost">전체금액</button></label>
													    </div>
													    <div class="col-xl-9">
													        
													    </div>
													</div>
									                    
									                    
									                <input type="text" class="form-control" id="payCard" name="payCard">
<!-- 									                <label for="message-text" -->
<!-- 									                    class="col-form-label">현금(모달) :   </label> -->
<!-- 									                <button class="btn btn-outline-dark btn-sm btn-wave" id="allCost">전체금액</button> -->
									                <input type="text" class="form-control" id="payMoney" name="payMoney" style="display:none;">
									                
									            </div>
									            <div class="mb-3" id="selecthalbu" >
									                <label for="message-text"
									                    class="col-form-label">할부 선택:</label>
									                    <select class="form-select" id="payMonth" name="payMonth">
									                		<option value="1">일시불</option>
									                		<option value="2">3개월</option>
									                	</select>
									            </div>
									           
									        <!-- </form>	 -->
					                    </div>
					                    <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" id="updateBtn" data-bs-dismiss="modal">확인</button>
					                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
					                    </div>
					                </div>
					            </div>
					        </div>
                        <!--현흠모달  -->
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

    
    
</body>
<script>
let loginMemNo = ${sessionScope.user.member.memNo}
//수납대기목록 보여주는부분  함수로 뺌
function showReservs(){
	
    $.ajax({
    	method: 'POST',
    	url : '/admin/getReceiveList',
    	contentType:'application/json; charset=utf-8',
    	beforeSend : function(xhr){
    		 // CSRF 토큰 헤더에 추가
            xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
    	success : function(res){
    		$("#placeReserveList").html("");
    		console.log("수납대기목록결과",res);
    		
    		 // 받아온 데이터에 대해 반복문을 돌며 HTML을 생성하고 추가합니다.
    	    res.forEach(function(item) {
    	    	
    	    
    		console.log("체킹킹");
    		console.log(item.receiptNo);
    		var newResultHtml =
    	    '<div class="card border custom-card" style="background-color:white;width: 92%;height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">'+
            '<div class="card-header" style="height: 30px; background-color: #f6feff !important">'+
            '<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">수납대기실</span>'+
            '</div>'+
            '<div class="card-body p-3" style="width: 175px;height: 110px;margin-left: 0px;margin-bottom: 0px;padding-left: 0px;">'+
            '<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="">'+
            '<div class="d-inline-flex align-items-start position-relative pickPt">'+
            '<div class="flex-grow-1">'+
            '<span class="mb-0 d-block fs-15 fw-semibold patntName ">' + item.memName + '</span>'+
            '<span class="fs-13 text-muted">' + item.memGender + ' ' + item.memAge + '세</span>'+
            '</div>' +
            '</div>' +
            '<span class="fs-10 badge rounded-pill bg-secondary" receiptBadge>수납대기중</span>'+
            
            '</div>' +
            '<input type="hidden" value="'+item.receiptNo+'" />'+
            '</div>' +
            '</div>';
    	    
    	    
    		
    		        $("#placeReserveList").append(newResultHtml); // 결과를 추가할 부모 요소에 새로운 결과를 추가합니다.
    		
    		
    		
    	    })
    		
    		
    	}
    })    
    
}


$(document).ready(function(){
	let priceSum = 0;  // 환자부담총액
	let discount = 0;  // 공단부담금
	let lastPrice = 0; // 받을 금액
	
	let pickReceiptNo =0;// 접수번호 (선택한)
	
	let MRIPrice = 0;
	let XRAYPrice = 0;
	let mulliPrice = 0;
	let hpPrice = 0;
	let surgeryPrice =0;
	let medicineSum = 0;
	let jrCost = 9500;
	
	//수납대기목록 보여주는 함수
	showReservs();
 
     
    //수납대기환자 클릭 이벤트
    //접수번호를 가져와서 수납하기
    $(document).on("click",".pickPt",function(){
    	//영수증결제내역 초기화
    	$("#table-body").html("");
    	
    	$("#payResPrice").html("");
    	$("#payLeftPrice").html("");
    	//console.log($(this).closest('.card-body').find('input[type="hidden"]').val());
    	pickReceiptNo = $(this).closest('.card-body').find('input[type="hidden"]').val(); // 접수번호
    	
    	//환자이름 가져와서 수납내역에 띄우려고
    	let patntName = $(this).closest('.card-body').find('.patntName').text();
    	$("#receiveName").html(patntName);
    	
    	
    	console.log("접수번호체킁>>",pickReceiptNo);
//     	pickReceiptNo = 6;
    	
    	let data ={
    			"receiptNo": pickReceiptNo
    	}
    	
    	//접수번호로 물리치료 가져오기 (갯수 가져오기) - rNo 6으로 테스트
    	$.ajax({
    		url : "/admin/getPrice",
    		method : "post",
    		data : JSON.stringify(data),
    		contentType : "application/json; charset=utf-8",
    		beforeSend: function(xhr) {
    	     	   // CSRF 토큰 헤더에 추가
                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
      		},
    		success: function(res){
    			console.log("가격데이터들 : ",res); 
    			let MRICnt = res.MRICnt;//MRI 횟수_
    			let XRAYCnt = res.XRAYCnt;//XRAY 횟수_
    			let mulliCnt = res.mulliCnt;//물리 횟수_
    			let wardPrice = res.wardPrice;//병실하루당가격
    			
    			
    			//입원일이 하루보다 적다면 입원일 1일로 치기 (되는지 확인 안해봤음)
    			if(res.hpday<0){
    				res.hpday = 1;
    			}
    			let hpday = res.hpday; // 총 입원일수_
    			surgeryPrice = res.surgeryPrice;//수술가격_
    			medicineSum = res.medicineSum; // 처방약품비
    			
    			//let surgeryPrice = res.surgeryPrice;//수술가격_
    			
    			console.log("MRICnt",MRICnt);
    			console.log("XRAYCnt:",XRAYCnt);
    			console.log("mulliCnt:",mulliCnt);
    			console.log("wardPrice:",wardPrice);
    			console.log(hpday);
    			console.log(surgeryPrice);
    			console.log(medicineSum);
    			/* let MRIPrice = 0;
    			let XRAYPrice = 0;
    			let mulliPrice = 0;
    			let hpPrice = 0;
    			let surgeryPrice =0; */
    			//let priceSum = 0;  //전역으로뺌
    			priceSum += surgeryPrice;
    			priceSum += medicineSum;
    			priceSum += jrCost;
    			
    			if(MRICnt!=0){
    				MRIPrice = MRICnt*400000;
    				priceSum += MRIPrice;
    			}
    			console.log("MRIPrice:",MRIPrice);
    			if(XRAYCnt!=0){
    				XRAYPrice = XRAYCnt*10000;
    				priceSum += XRAYPrice;
    			}
    			console.log("XRAYPrice:",XRAYPrice)
    			if(mulliCnt!=0){
    				mulliPrice = mulliCnt*20000;
    				priceSum += mulliPrice;
    			}
    			console.log("mulliPrice:",mulliPrice)
    			if(hpday!=0){
    				hpPrice = hpday*wardPrice;
    				priceSum += hpPrice;
    			}
    			console.log("hpPrice:",hpPrice)
    			
    			console.log("priceSum:",priceSum)
    			
    			discount = Math.floor(priceSum * 0.6);
    			console.log("discount",discount);
    			
    			
    			lastPrice = priceSum-discount;
    			
    			//jrCost = addComma(jrCost); 
    			//jrCost = jrCost.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    			
    			
    			$("#jrCost").html(addComma(jrCost));
    			$("#MRICost").html(addComma(MRIPrice));
    			$("#XRAYCost").html(addComma(XRAYPrice));
    			$("#muliCost").html(addComma(mulliPrice));
    			$("#surgeryCost").html(addComma(surgeryPrice));
    			$("#medicineCost").html(addComma(medicineSum));
    			$("#hpCost").html(addComma(hpPrice));
    			$("#sumCost").html(addComma(priceSum));
    			$("#discount").html(addComma(discount));
    			$("#lastCost").html(addComma(lastPrice));
    			
    			
    			
    			}
    		})
    		
    		
    	
    	});
    
    
    //진단서 체크여부 값 가져오기
    let diaPaperValue='';
    let diaPrice = 10000;
    let soPrice = 1000;
    
    let dataPriceSum = 0;
    let dataPriceSum2 = 0;
    let finalDataPrice =0;
    
    
    //let dataPriceSum = 0;//
    
 	// 진단서 체크박스가 클릭되었을 때 실행될 함수
    $('#diaPaper').change(function(){
    	
    	dataPriceSum = 0;
    	
        var isChecked = $(this).prop('checked');
        diaPaperValue = isChecked ? 'Y' : 'N'; // 체크됐으면 'Y', 아니면 'N'
        console.log("진단서 값: " + diaPaperValue);
        if(diaPaperValue=='Y'){
        	dataPriceSum += diaPrice;// +10000
			
        }else{
        	dataPriceSum -= diaPrice;// -10000
        }
        console.log("dataPriceSum:",dataPriceSum);
        priceSum+=dataPriceSum;
        finalDataPrice+=dataPriceSum
        lastPrice = priceSum-discount;
        $("#sumCost").html(addComma(priceSum));
        $("#finalDataCost").html(addComma(finalDataPrice));
        $("#lastCost").html(addComma(lastPrice));
        
        
        
        
        // 이어서 필요한 작업을 수행할 수 있음
    });
 	
 	$('#soPaper').change(function(){
 		dataPriceSum2 = 0;
 		
 		  var isChecked = $(this).prop('checked');
 	        diaPaperValue = isChecked ? 'Y' : 'N'; // 체크됐으면 'Y', 아니면 'N'
 	        console.log("소견서 값: " + diaPaperValue);
 	        if(diaPaperValue=='Y'){
 	        	dataPriceSum2 += soPrice;// +1000
 				
 	        }else{
 	        	dataPriceSum2 -= soPrice;// -1000
 	        }
 	        console.log("dataPriceSum:",dataPriceSum2);
 	        priceSum+=dataPriceSum2;
 	        finalDataPrice+=dataPriceSum2;
 	        lastPrice = priceSum-discount;
 	        $("#sumCost").html(addComma(priceSum));
 	        $("#finalDataCost").html(addComma(finalDataPrice));
 	        $("#lastCost").html(addComma(lastPrice));
 	        
 		
 	})
 	
 	/* 결제방식추가 모달 */
 	
 	$("#addPayBtn").on("click",function(){
 		var payLeftPrice = $("#payLeftPrice").html();
 		console.log("모달payLeftPrice",payLeftPrice);
 		var putHtml = lastPrice.toString()+"원";
 		$("#leftCost").val(addComma(putHtml));
 		
 		
 		// 식 추가하기!!
	 	//let leftCostVal = lastPrice; // 남은금액 : 받을금액 - 결제한금액    
	 	//let leftCostHtml = leftCostVal +"원";
	 	//console.log("leftCostVal:",leftCostVal);
	 	//남은금액 보여주기
	 	//$("#leftCost").val(leftCostHtml);
	 	
	 	
	 	//확인버튼 이벤트
	 	$("#updateBtn").on("click",function(){
	 		alert("결제가 완료되었습니다");
	 		console.log("확인버튼");
		 	var selectedPay = $("#selectPay option:selected").val(); // 카드:1, 현금:2, 부분결제:3
		 	console.log("selectedPay:",selectedPay);
	 		
		 	var payMoney = parseInt($("#payMoney").val() || 0,10); //payMoney :  현금입력한 금액
		    var payCard = parseInt($("#payCard").val()|| 0,10); // payCard : 카드입력한 금액
		    
		    console.log("payMoney:",payMoney);
		    console.log("payCard:",payCard);
		    
		 	// 결제입력한 총금액
		 	var sum = payMoney + payCard;
		 	console.log("sum:",sum);
		 	
		 	//남은금액
	 		//let leftCostVal = lastPrice-payMoney; // 남은금액 : 받을금액 - 결제한금액 
	 		//let resultCost = parseInt($("#lastCost").val());
		 	//console.log("resultCost:",resultCost);
	 		//let leftCostVal = resultCost-sum; // 남은금액 : 받을금액 - 결제한금액    
	 		//let leftCostHtml = leftCostVal +"원";
	 		//console.log("leftCostVal:",leftCostVal);
	 		//console.log("leftCostHtml:",leftCostHtml);
	 		
		 	//전체금액 클릭 이벤트
		 	/* $("#allCost").on("click",function(){
		 		$("#payMoney").val(leftCostHtml);
		 	}) */
		 	
		 	console.log("pickReceiptNo: ",pickReceiptNo);
		 	
	 		
	 		$("#payResPrice").html(addComma(lastPrice)); //  결제한 금액
	 		//$("#payLeftPrice").html(leftCostVal);//남은 금액
	 		
		 	
		 	
		 	if(selectedPay==1){ // 카드
		 		var receiveType = "RT001"
		 	}else if(selectedPay==2){ //현금
		 		var receiveType = "RT002"
		 	}else if(selectedPay==3){
		 		var receiveType = "RT003" // 부분
		 	}
		 	
		 	console.log("receiveType: ",receiveType)
		 	
		 	var data ={
		 			"receiveCard":payCard,
		 			"receiveCash":payMoney,
	 				"receiveType":receiveType,
	 				"receiveCost":sum,
	 				"receiveCostSum":sum,
	 				"empNo":loginMemNo,
	 				"receiptNo":pickReceiptNo,
	 				"mriPrice" : MRIPrice ,
					"xrayPrice" : XRAYPrice,
					"mulliPrice" : mulliPrice,
					"hpPrice" : hpPrice,
					"surgeryPrice" :surgeryPrice 
		 			}
		 	
	 		
	 		$.ajax({
	 			
	 			method:'post', 
	 			url:'/admin/doPay',
	 			data:JSON.stringify(data),
	 			contentType:'application/json; charset=utf-8',
	 			beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
	 			success:function(res){
	 				
	 				console.log("res:",res);
	 				console.log("결제후 success");
	 				
	 				
	 				showReservs();
	 				
	 				var paidMoney = $("#payMoney").val();// 모달창에서 입력한값
	 				
	 				
	 				console.log("sum",sum);
	 				$("#payResPrice").html(addComma(lastPrice));//결제내역의 결제s금액 채우기
	 				
	 				//남은금액
	 				var notPaidMoney = parseInt($("#lastCost").val()) - paidMoney;
	 				if (!isNaN(notPaidMoney)) {
	 				    console.log("남은금액notPaidMoney:", notPaidMoney);
	 				} else {
	 				    notPaidMoney = 0;
	 				    console.log("남은금액notPaidMoney:", notPaidMoney);
	 				}
	 				$("#payLeftPrice").html(addComma(notPaidMoney)); //결제내역의 남은금액에 전역 lastCost채우기
	 				$("#leftCost").val(addComma(notPaidMoney)); //모달창속 남은금액
	 				
	 				
	 				
	 				//동적으로 테이블 만들기
	 				var tbodyHTML = "";
	 				
	 				console.log("동적으로 만들기");
	 				console.log("selectedPay:",selectedPay);
	 				
	 				var payText ="";
	 				var date = getToday();
	 				console.log(date);
	 				
	 				if(selectedPay==1){ // 카드만
	 					payText = "카드";
	 					tbodyHTML += "<tr>";
	 					tbodyHTML += "<td>"+formatDate(date)+"</td>";
	 					tbodyHTML += "<td>"+addComma(lastPrice)+"</td>";
	 					tbodyHTML += "<td>"
			 			tbodyHTML += "<span class='badge bg-info' >"+'카드'+"</span>"
			 			tbodyHTML += "</td>";
	 					tbodyHTML += "</tr>"; 
	 			 	}else if(selectedPay==2){ // 현금만
	 			 		payText = "현금";
	 					tbodyHTML += "<tr>";
	 					tbodyHTML += "<td>"+formatDate(date)+"</td>";
	 					tbodyHTML += "<td>"+addComma(lastPrice)+"</td>";
	 					tbodyHTML += "<td>"
			 			tbodyHTML += "<span class='badge bg-success' >"+'현금'+"</span>"
			 			tbodyHTML += "</td>";
	 					tbodyHTML += "</tr>";
	 			 		
	 			 	}else if(selectedPay==3){ // 카드 + 현금
	 					tbodyHTML += "<tr>";
	 					tbodyHTML += "<td>"+formatDate(date)+"</td>";
	 					tbodyHTML += "<td>"+addComma(payCard)+"</td>";
	 					tbodyHTML += "<td>"
	 					tbodyHTML += "<span class='badge bg-info' >"+'카드'+"</span>"
	 					tbodyHTML += "</td>";
	 					tbodyHTML += "</tr>";
	 					tbodyHTML += "<tr>";
	 					tbodyHTML += "<td>"+date+"</td>";
	 					tbodyHTML += "<td>"+addComma(payMoney)+"</td>";
	 					tbodyHTML += "<td>"
		 				tbodyHTML += "<span class='badge bg-success' >"+'현금'+"</span>"
		 				tbodyHTML += "</td>";
	 					tbodyHTML += "</tr>";
	 			 	}
	 				
	 				$("#table-body").html(tbodyHTML);
	 				
	 				//창닫고 비워주기
	 				$("#receiveName").html("");
	 				$("#finalDataCost").html("");
	 				$("#sumCost").html("");
	 				$("#discount").html("");
	 				$("#lastCost").html("");
	 				$("#MRICost").html("");
	 				$("#XRAYCost").html("");
	 				$("#muliCost").html("");
	 				$("#surgeryCost").html("");
	 				$("#hpCost").html("");
	 				$("#jrCost").html("");
	 				$("#medicineCost").html("");
	 				$("#diaPaper").prop("checked",false);
	 				$("#soPaper").prop("checked",false);
	 				$("#priPaper").prop("checked",false);
	 				// 입력 필드를 활성화 상태로 변경
	 				$("#leftCost").prop("disabled", false);
	 				// 값을 초기화
	 				$("#leftCost").val("");
	 				// 입력 필드를 다시 비활성화 상태로 변경
	 				$("#leftCost").prop("disabled", true);
	 				$("#payCard").val("");
	 				$("#payMoney").val(""); 
	 				
	 				
	 				
	 			}
	 			
	 		})
	 	})
 	
 	})
 	
 	$("#diagBtn").on("click",function(){
 		alert("진단서요청이 완료되었습니다");
		console.log(pickReceiptNo);
		let memNo = ${sessionScope.user.member.memNo}
		let data = {
			"code" : "docuRequest",
			"receiptNo" : pickReceiptNo
		}
		ws.send(JSON.stringify(data));
		console.log(memNo);
	});
 	
 	//전체금액 버튼
 	$("#allCost").on("click",function(){
 		var putHtml = lastPrice.toString()+"원";
 		if($('#selectPay').val() ==='1'){
 			$("#payCard").val(addComma(putHtml));
 		}else if($('#selectPay').val()==='2'){
 			$("#payMoney").val(addComma(putHtml));
 		}
 		
 	})
 	
    	
    });

function getToday(){
	var date  = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);
	
	return year +"-"+ month +"-"+ day;
}

    
    
   
$('#selectPay').change(function(){
	$('#payMoney').val("");
	$('#payCard').val("");
	console.log("체인지");
	if($(this).val() === '1'){
		
		$('#payMoney').css("display", "none");
		$('#payCard').css("display","block");
		$('#allCost').css("display","block");
		$("#selecthalbu").css("display","block"); 
	}
	if($(this).val() === '2'){
		$('#payMoney').css("display", "block");
		$('#payCard').css("display","none");
		$('#allCost').css("display","block");
		$("#selecthalbu").css("display","none");
	}
	if($(this).val() === '3'){
		$('#payMoney').css("display", "block"); 
		$('#payCard').css("display","block");
		$('#allCost').css("display","none");
		$("#selecthalbu").css("display","none");
	}
}); 

function addComma(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
    
    
    
    
        
</script>

</html>