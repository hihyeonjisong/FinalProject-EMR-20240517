<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css">

<!-- Sweetalerts JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/sweet-alerts.js"></script>
    
<style>
#equiptmentRequests tbody td {
    height: 30px;
}
</style>


<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
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
                                    	장비  수리 신청 목록
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	<div id="loadingMessage"></div>
                                    <table id="equiptmentRequests" class="table table-bordered text-nowrap w-100">
                                        <thead> 
                                            <tr>
                                                <th>신청번호</th>
                                                <th>장비번호</th>
                                                <th>장비명</th>
                                                <th>모델명(제조사)</th>
                                                <th>기기상태</th>
                                                <th>사용장소</th>
                                                <th>요청자</th>
                                                <th>요청날짜</th>  
                                                <th>요청상태</th>  
                                                <th>승인/거절</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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
        
        
        
        
         <!-- Start::add task modal 승인 모달시작 -->
                    <div class="modal fade" id="mediRequestProcess" tabindex="-1"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                      <div class="modal-content" style="width: 600px; margin: auto; ">
                        <!-- 모달 header -->
                        <div class="modal-header">
                          <h6 class="modal-title">장비 수리 요청 반려 처리</h6>
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
                          

                            <!-- <div class="col-xl-12">
                              <label for="task-id" class="form-label">보험가입여부</label>
                              <div class="d-flex align-items-center">
                                  <div class="form-check form-check-lg me-3">
                                      <label class="form-check-label" for="diagnosis-checkbox">진단서</label>
                                      <input class="form-check-input" type="checkbox" value="" id="diagnosis-checkbox" checked="">
                                  </div>
                                  <div class="form-check form-check-lg">
                                      <label class="form-check-label" for="prescription-checkbox">처방전</label>
                                      <input class="form-check-input" type="checkbox" value="" id="prescription-checkbox" checked="">
                                  </div>
                              </div>
                            </div> -->
                         
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
            
            
             <!--현흠모달참고 > 거절 모달 뜨기  -->
         <div class="modal fade" id="mediRequestOkBtn" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog"  style="margin-top: 150px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel1">장비 수리 요청 반려 처리</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody" style="padding-top: 0px; padding-left: 20px;padding-right: 20px;">
                       <!-- <form action="/radiation/updateEqInfo" method="post" id="updateForm"> -->
                       
                       
 					<div class="card custom-card" >
 							
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
let loginMemNo = ${sessionScope.user.member.memNo}

	$(function(){
		
		let table = $('#equiptmentRequests').DataTable({
						ordering : false,
						"lengthMenu": [[10], [10]],
						"lengthChange" : false,
						scrollY: "660px", // 원하는 높이로 지정
						"columns": [
				            { "width": "3%"}, // 첫 번째 열의 크기를 20%로 지정
				            { "width": "3%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "15%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
				            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정,
				            { "width": "20%"} //
				        ],
						"language": {
					        "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Korean.json" // 한국어로 설정
					    }
					});
				
			function makeList() {
				 // 테이블 비우기
			   table.clear().draw();
				
		
				 //장비수리신청 목록 가져오기
				$.ajax({
					url : "/admin/getEquipmentRequestList" ,
					type : "post",
					dataType : "json",
					beforeSend: function(xhr) {
	  	    	     	   // CSRF 토큰 헤더에 추가
	  	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	  	      		},
					success : function(res) {
						console.log(res);
						$.each(res,function(index,item){
							
							//신청상태가 승인/거절이 아닌 대기중인리스트만 뜨는 조건
							if(item.resultName !='승인'&& item.resultName !=='반려'){
								
								var date = item.repairDate;
								date = date.split(" ");
								console.log("날짜앞에:",date[0]);
								var requestDate = date[0];
								
							table.row.add([
								item.repairNo,
								item.eqNo,
								item.eqName,
								item.eqModel+'('+item.eqCompany+')',
								item.statusName,
								item.locName,
								item.repairPersonName,
								requestDate,
								item.resultName,
								(item.resultName !='승인') && (item.resultName !='반려')?'<button class="btn btn-info-light btn-wave" id="repairAdmitBtn" data-equip-request-no="'+item.repairNo+'" data-empno="'+item.repairPerson+'" >승인</button><button class="btn btn-danger-light btn-wave" data-bs-toggle="modal" data-bs-target="#mediRequestOkBtn" id="repairRefuseBtn" data-equip-request-num="'+item.repairNo+'" data-empno="'+item.repairPerson+'" >거절</button>' : null
								
								
							]);
							}
							
						});
						table.draw();
						
					}
				});
				
				
			}
	
			makeList();
	
			//승인 버튼 눌렀을때 이벤트
			$(document).on("click","#repairAdmitBtn",function(){
					let target = $(this).data("empno");
				 const swalWithBootstrapButtons = Swal.mixin({
		                customClass: {
		                    confirmButton: 'btn btn-success ms-2',
		                    cancelButton: 'btn btn-danger'
		                },
		                buttonsStyling: false
		            })
		            
		            // 승인 버튼 누른
		            // 의료장비 수리요청 번호
		            let repairClickno = $(this).data('equip-request-no');
				 	
				 	console.log("의료장비 수리요청 번호");
				 	console.log(repairClickno);
				 
					Swal.fire({
			                title: '요청을 수락하시겠습니까?',
			                text :'확인을 누르면 신청처리가됩니다',
			                /* 'question' */
			                icon: 'warning',
			                showCancelButton : true,
			                confirmButtonText : '수락',
			                cancelButtonText :'뒤로',
			                reverseButtons : false
			            }).then((result)=>{
			                result.dismiss ===Swal.DismissReason.cancel
			                if(result.isConfirmed){
			                    console.log("승인확인");
			                    
			                    console.log(repairClickno);
			                    
			                    var repairData ={
			                    		repairNo : repairClickno, // 장비수리요청 번호
			                    		empNo : loginMemNo // 일단 memNo 보내고 컨트롤러에서 empNo꺼내보냄
			                    }
			                    
			                    //수리요청 승인하기
			                    $.ajax({
			                    	type: 'POST',
			                    	url: '/admin/equipRepairAdmit',
			                    	data: JSON.stringify(repairData),
			                    	contentType: "application/json; charset=utf-8",
			                    	beforeSend: function(xhr) {
			       	    	     	   // CSRF 토큰 헤더에 추가
			       	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			       	      		},
			                    	success: function(res){
			                    		
			                    		let notidata = {
			                    				"code" : "agree",
			                    				"content" : "당신의 수리 요청이 승인되었습니다.",
			                    				"empNo" : target
			                    		}
			                    		ws.send(JSON.stringify(notidata));
			                    		
			                    		console.log(res);
			                    		makeList();
			                    		
			                    	}
			                    })
			                    
			                    
			                    
			                    
			                }else{
			                    console.log("승인취소");
			                }
			            })
			            
				
			});
			
			$(document).on("click","#repairRefuseBtn",function(){
				let target = $(this).data("empno");
				let refuseNo = $(this).data('equip-request-num');
				console.log("거절번호:"+refuseNo);
				
				
				$("#updateResultBtn").on("click",function(){
					let resultDisagree = $("#resultDisagree").val();
					console.log(resultDisagree);
					
					var refuseData = {
							repairNo : refuseNo,
							repairResultagree : 'AS003',
							repairResultdisagree : resultDisagree,
							empNo :loginMemNo // 일단 전역 memNo보내고 컨트롤러에서 empNo가져오기
					}
					
					$.ajax({
						type: 'POST',
                    	url: '/admin/equipRepairRefuse',
                    	data: JSON.stringify(refuseData),
                    	contentType: "application/json; charset=utf-8",
                    	beforeSend: function(xhr) {
       	    	     	   // CSRF 토큰 헤더에 추가
       	                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
       	      		},
                    	success: function(res){
                    		console.log("거절 결과");
                    		console.log(res);
                    		
                    		if(res==true){
                    			
                    			const swalWithBootstrapButtons = Swal.mixin({
    				                customClass: {
    				                    confirmButton: 'btn btn-success ms-2' ,
    				                    cancelButton: 'btn btn-danger'
    				                },
    				                //confirmButton :'data-bs-dismiss="modal" aria-label="Close"',
    				                buttonsStyling: false
    				            })
    				            
    				            
    				            
    				            Swal.fire({
				                title: '반려하시겠습니까?',
				                text :'확인을 누르면 신청처리가됩니다',
				                /* 'question' */
				                icon: 'warning',
				                showCancelButton : true,
				                confirmButtonText : '수락',
				                cancelButtonText :'뒤로',
				                reverseButtons : false
				            }).then((result)=>{
				                result.dismiss ===Swal.DismissReason.cancel
				                if(result.isConfirmed){
				                    console.log("승인확인");
				                    
				                    //sweet-alert 닫기
				                    Swal.close()
				                    //모달닫기
				                    $('#mediRequestOkBtn').modal('hide');
				                    
				                    let notidata = {
				                    		"code" : "disagree",
				                    		"content" : "당신의 수리 요청이 반려되었습니다.",
				                    		"empNo" : target
				                    }
				                    ws.send(JSON.stringify(notidata));
				                    //다시띄워주기
				                    makeList();
				                  
				                    
				                }else{
				                    console.log("승인취소");
				                }
				            })
				            
                    		}
                    		
                    	}
                    		
					})
					
					
				})
				
			})
			
			
			$('#mediRequestOkBtn').on('hidden.bs.modal', function () {
			    // 모달 배경 숨기기
			    $('.modal-backdrop').remove();
			});
			
			
	
	
	});
	
	
	// 6번째 열의 각 <td>에 클래스 추가 (잘 안됌)
	$('#equiptmentRequests tbody tr').ready(function(){
		
	});
	


</script>

</html>