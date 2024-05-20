<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css">

 <!-- Sweetalerts JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/sweet-alerts.js"></script>
    

<style>
#medicineLists tbody td {
    height: 30px;
}
</style>


        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                
                <!-- Page Header Close -->

               <!-- row start -->
                <div class="row">
                    <div class="col-xl-12">
                    	
                    </div>
                     <div class="col-xl-12">
                         <div class="card custom-card" style="height: 880px;">
                            <div class="card-header">
                                <div class="card-title">
                                    	의약품 조회
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	<div id="loadingMessage"></div>
                                    <table id="medicineLists" class="table table-bordered text-nowrap w-100">
                                        <thead> 
                                            <tr>
                                                <th>약품번호</th>
                                                <th>약품명</th>
                                                <th>회사명</th>
                                                <th>투여경로</th>
                                                <th>수량</th> 
                                                <th>단위</th>  
                                                <th>가격</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                         <!-- <div class="col-xl-12">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">
                                    	신청 목록
                                </div>
                            </div>
                            <div class="card-body">
                            	test
                            </div>
                        </div>
                    </div> -->
                </div>
                    </div>
                </div>
               <!-- row end -->

            </div>
       <!--  </div> -->
        <!-- End::app-content -->

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
        
        
        <!--현흠모달참고 > 거절 모달 뜨기  -->
         <div class="modal fade" id="mediRequestOkBtn" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel1">의약품요청 반려 처리</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody">
                       <!-- <form action="/radiation/updateEqInfo" method="post" id="updateForm"> -->
                       
                       
 					<div class="card custom-card" >
 							<label for="disabled-readonlytext" class="form-label" >의약품 요청 상세보기</label>
                            
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table text-nowrap">
                                        <tbody>
                                            <tr>
                                                <td><span class="fw-semibold">신청번호 :</span></td>
                                                <td>26</td>
                                            </tr>
                                            <tr>
                                                <td><span class="fw-semibold">신청자 :</span></td>
                                                <td>신현준</td>
                                            </tr>
                                            <tr>
                                                <td><span class="fw-semibold">의약품명 :</span></td>
                                                <td>
                                                    <span class="badge bg-primary-transparent">와짜구</span>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span class="fw-semibold">수량 (단위) :</span></td>
                                                <td>
                                                   60 (정)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span class="fw-semibold">신청날짜</span></td>
                                                <td>
                                                   <span class="fw-semibold ">2024-04-20</span>
                                                </td>
                                            </tr>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                      
                       
                       
                			
				            <div class="mb-3">
				                <!-- <label for="message-text"
				                    class="col-form-label">모델명:</label>
				                <input type="text" class="form-control" id="eqModel" name="eqModel"> -->
				            </div>
				            <div class="mb-3">
				                <!-- <label for="message-text"
				                    class="col-form-label">담당자사번:</label>
				                <input type="text" class="form-control" id="eqCompany" name="eqCompany"> -->
				            </div>
				            <div class="mb-3">
				                <label for="disabled-readonlytext" class="form-label" >답변일</label>
		                            <input class="form-control" type="text" style="width: 150px;" value="2024-03-01" id="resultDate" aria-label="Disabled input example" disabled="" readonly="" width="10px">
				                   
				            </div>
				          
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">반려사유:</label>
				                <textarea class="form-control" style="resize : none; height: 200px" id="resultDisagree" name="eqDescriptioncontent"></textarea>
				            </div>
				        <!-- </form>	 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info-light btn-wave" id="updateResultBtn">등록</button>
                        <button type="button" class="btn btn-light btn-wave" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <!--현흠모달참고 > 처리하기 모달 뜨기  -->
        
        
                <!-- Start::add task modal 승인 모달시작 -->
                    <div class="modal fade" id="mediRequestProcess" tabindex="-1"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                      <div class="modal-content" style="width: 600px; margin: auto; ">
                        <!-- 모달 header -->
                        <div class="modal-header">
                          <h6 class="modal-title">의약품요청 반려 처리</h6>
                          <button type="button"  class="btn-close" data-bs-dismiss="modal"
                          	 aria-label="Close"></button>
                        </div>
                        <!-- 모달 body -->
                        <div class="modal-body px-4" style="padding-bottom: 25px;">
                          <div class="row gy-2">
                            <div class="col-xl-12 row">
	                            <div class="col-xl-4" >
	                              	<label for="signup-name" class="form-label text-default" style="font-size: 15px;">신청번호</label>
	                              	<input type="text" style="width: 100px;" class="form-control class="col-xl-12"" id="memName" name="memName" placeholder="26" readonly=""  />
	                          	 </div>
	                          	 <div class="col-xl-4" >
	                              	<label for="signup-name" class="form-label text-default" style="font-size: 15px;">신청자</label>
	                              	<input type="text" style="width: 150px;" class="form-control" id="memName" name="memName" placeholder="선의사" readonly="" />
	                          	 </div>
	                          	 <div  class="col-xl-4">
		                          	<label for="disabled-readonlytext" class="form-label" >신청일</label>
		                            <input class="form-control" type="text" style="width: 150px;" value="2024-03-01" id="disabled-readonlytext" aria-label="Disabled input example" disabled="" readonly="" width="10px">
                           		</div>
                            </div>
                            <div class="col-xl-12 row">
	                            <div class="col-xl-4" >
	                              	<label for="signup-name" class="form-label text-default" style="font-size: 15px;">약품명</label>
	                              	<input type="text" style="width: 100px;" class="form-control class="col-xl-12"" id="memName" name="memName" placeholder="26" readonly=""  />
	                          	 </div>
	                          	 <div class="col-xl-4" >
	                              	<label for="signup-name" class="form-label text-default" style="font-size: 15px;">수량</label>
	                              	<input type="text" style="width: 150px;" class="form-control" id="memName" name="memName" placeholder="선의사" readonly="" />
	                          	 </div>
	                          	 <div  class="col-xl-4">
		                          	<label for="disabled-readonlytext" class="form-label" >단위</label>
		                            <input class="form-control" type="text" style="width: 150px;" value="2024-03-01" id="disabled-readonlytext" aria-label="Disabled input example" disabled="" readonly="" width="10px">
                           		</div>
                            </div>
                        
                            <div class="col-xl-12">
                              <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                 <div style="float: left;">
	                              	<label for="signup-name" class="form-label text-default" style="font-size: 15px;">약품명</label>
	                              	<input type="text" style="width: 150px;" class="form-control" id="memName" name="memName" placeholder="이름"/>
	                          	 </div>
                              </div>
                            </div>
                            
                             <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">반려사유:</label>
				                <textarea class="form-control" style="resize : none; height: 200px" id="eqDescription" name="eqDescriptioncontent"></textarea>
				            </div> 
                          

                          </div>
                        </div>
                        <!-- 모달 body -->
                        <div class="modal-footer">
                          <button type="button" class="btn btn-light" data-bs-dismiss="modal">돌아가기 </button>
                          <!-- <button type="button" id="addMemberBtn" class="btn btn-primary" data-bs-dismiss="modal"> 회원등록(모달속)하기</button> -->
                          <button type="button" id="addMemberSelectBtn" class="btn btn-primary" data-bs-dismiss="modal"> 회원등록후 접수(모달속)하기</button>
                        </div>
                      </div>
                    </div>
                  </div>
            <!-- End::add task modal 모달끝 -->
       
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

 
    <!-- Internal Datatables JS -->
   <%--  <script src="${pageContext.request.contextPath }/resources/assets/js/datatables.js"></script> --%>

</body>
<script type="text/javascript">
	$(function() {
		//let loginMemNo = ${sessionScope.user.member.memNo} // 슬랙 캡쳐사진 참고
		//위의 memNo로 로그인한 empNo를 가져오기
		//empNo를 가져와서 
		//requestData = {에 넣어주기} 
		//(일단 수기로 넣어놨음)
		
			let table = $('#medicineLists').DataTable({
				ordering : false, 
				"lengthMenu": [[10], [7]],
				"lengthChange" : false,
				scrollY: "660px", // 원하는 높이로 지정
				"columns": [
		            { "width": "10%"}, // 첫 번째 열의 크기를 20%로 지정
		            { "width": "40%"}, // 두 번째 열의 크기를 30%로 지정
		            { "width": "15%"}, // 두 번째 열의 크기를 30%로 지정
		            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
		            { "width": "5%"}, // 두 번째 열의 크기를 30%로 지정
		            { "width": "5%"}, // 두 번째 열의 크기를 30%로 지정 
		            { "width": "10%"}// 두 번째 열의 크기를 30%로 지정, 
		        ],
				"language": {
			        "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Korean.json" // 한국어로 설정
			    }
			});
		
		function makeList() {
			 // 테이블 비우기
		    table.clear().draw();
			
			
			$.ajax({
				url : "/admin/getMedicineList",
				type : "post",
				dataType : "json",
				beforeSend: function(xhr) {
	    	     	   // CSRF 토큰 헤더에 추가
	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	      		},
				success : function(res) {
					console.log("res:",res);
					$.each(res, function(index, item) {
						//데이터가 없는경우 메세지 추가
						
						
							
							//동적으로 테이블 생성
			                table.row.add([
			                    item.mdcinNo,
			                    item.mdcinName,
			                    item.mdcinCompany,
			                    item.mdcinCourse,
			                    item.mdcinQuantity,
			                    item.mdcinUnit,
			                    item.mdcinPrice.toLocaleString('ko-KR') +"원" 
			                   
			                ]); 
							
						
						
						
		            });
					table.draw();
				}
			});
			
			
		}
		makeList();

	
		
		
		
		
	});
	
	
	
	
	
		// 6번째 열의 각 <td>에 클래스 추가 (잘 안됌)
		$('#medicineLists tbody tr').ready(function(){
			
			
		});
		
		//클릭시 그 데이터를 가져와서 모달창으로 승인/반려를 전송하기 만들기 (04/15)
	
	
	
	
	
</script>

</html>