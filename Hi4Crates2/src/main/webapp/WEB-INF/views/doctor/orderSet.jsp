<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
  background-color: rgb(35 183 229);
  border-radius: 0px;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  background-image: none;
  border:none;
}

.dropdown-item.active {
    font-weight: 700;
    border-radius: 19px;
}

.nav.nav-style-3 {
  .nav-link {
    border-radius: 0;
  }
  .nav-link {
    border-block-end: 3px solid transparent;
    &:hover {
    color: rgb(35 183 229);
  }
  }
  .nav-link.active {
    background-color: transparent;
    border-block-end: 3px solid rgb(35 183 229);
    color: rgb(35 183 229);
  }
}

.nav-link {
  &:focus,
  &:hover {
    color: rgb(35 183 229);
  }
}

.dropdown-item {
  color: $default-text-color;
  white-space: unset;
  padding: 0.5rem 0.9375rem;
  font-size: 0.8125rem;
  font-weight: 500;

  &:not(.active) {
    &:hover,
    &:focus,
    &:active {
      color: rgb(35 183 229);
      background-color: rgb(35 183 229 / 12%)
      
    }
  }
  &.active {
    background-color: rgb(71 211 255 / 12%) !important;
  }
}

</style>

        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Start::row-1 -->
                <div class="row g-2">
                    <div class="col-xxl-10 col-xl-12">
                        <div class="row" style="background-color: white; border-radius: 1%; height: 800px; margin-left: 1px;">
                          <div class="col-xl-4" style="border-right: solid 1px rgb(229, 228, 228);">
                                <div class="col-xl-12">
                                    <div class="card custom-card">
                                        <div class="card-header  justify-content-between" style="padding:0.7rem;">
                                            <div class="card-title">
                                              		 오더세트
                                            </div>
                                            <button class="btn btn-info-ghost btn-wave btn-sm" id="addOrderSet" style="float: right;">
                                                    <i class="ri-add-line me-1 align-middle"></i>추가
                                            </button>
                                        </div>
                                        <div class="card-body" style="height: 700px; overflow-y: auto;">
                                            <ul class="dropdown"  style="list-style-type: none; padding-left: 0px;">
		                                        <c:forEach items="${orderSetList }" var="orderSet">
		                                                <li><a class="dropdown-item" href="#" data-groupOrderNo ="${orderSet.groupOrderNo}"><i class='ri-folder-2-line fs-16' style="margin-right:5px;"></i>${orderSet.groupOrderName}</a></li>
		                                        </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                                <div class="col-xl-8"> 
                                    <div class="row">
                                        
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="card custom-card">
                                            <div class="card-header justify-content-between">
                                                <div class="card-title">
                                                   	 진단 및 처방
                                                </div>
                                                <div class="">
                                                <!--오더세트 등록 모달 시작-->
                                                <div class="modal fade" id="insert-orderGroup" tabindex="-1" aria-labelledby="insert-orderGroupLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h6 class="modal-title" id="insert-orderGroupLabel">오더세트 등록</h6>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body px-4">
                                                                <div class="row gy-3">
                                                                    <div class="col-xl-12">
                                                                        <label for="orderName" class="form-label">오더세트명</label>
                                                                        <input type="text" class="form-control" id="orderName" value="" placeholder="Enter Name">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-outline-secondary btn-wave btn-sm" data-bs-dismiss="modal" id='modOrderName'>수정</button>
                                                                <button type="button" class="btn btn-sm btn-info" id="createOrderName">등록</button>
                                                                <button type="button" class="btn btn-sm btn-light" data-bs-dismiss="modal" id='closeModal'>취소</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <!--오더세트 등록 모달 끝-->
                                            </div>
                                        </div>
                                        <div class="card-body" style="margin-top: -2%; height: 720px;">
                                            <ul class="nav nav-pills nav-style-3" role="tablist">
	                                                <li class="nav-item">
	                                                    <a class="nav-link active" data-bs-toggle="tab" role="tab" aria-current="page"
	                                                    href="#searchDiseases" aria-selected="true">상병</a>
	                                                </li>
	                                                <li class="nav-item">
	                                                    <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
	                                                    href="#searchMedicine" aria-selected="true">약물</a>
	                                                </li>
	                                            </ul><br/>
												<div class="input-group mb-3" style="margin-top: -2%;">
													<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchBox" aria-label="Recipient's username" aria-describedby="button-addon2">
												</div>
                                                    <div class="btn-list">
                                                        <button type="button" class="btn btn-outline-secondary btn-wave btn-sm" id="addOrdersetBtn" data-bs-toggle="modal" data-bs-target="#insert-orderGroup"  style="float: right;">등록</button>
                                                        <button type="button" class="btn btn-outline-secondary btn-wave btn-sm"  data-bs-toggle="modal" data-bs-target="#insert-orderGroup" id="modOrdersetBtn" style="float: right;">수정</button>
                                                        <button type="button" class="btn btn-outline-danger btn-wave btn-sm" id="delOrdersetBtn" style="float: right;">삭제</button>
                                                    </div>
                                                    <br/>
												<div class="content-wrapper" style="height: 100px;">
													<div id="crm-revenue-analytics">
														<div class="kanban-tasks-type new">
                                                        <div class="kanban-tasks" id="new-tasks">
                                                            <!-- <span class="badge rounded-pill bg-danger-transparent" style="pointer-events: none;">주상병</span> -->
                                                            <div id="new-tasks-draggable" data-view-btn="new-tasks">
                                                                <span class="badge rounded-pill bg-danger-transparent m-2" id="primaryDisease" style="pointer-events: none;">주상병</span>
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                    </div>
                                                    <div class="kanban-tasks-type todo">
                                                        <div class="kanban-tasks" id="todo-tasks">
                                                            <div id="todo-tasks-draggable" data-view-btn="todo-tasks">
                                                                <span class="badge rounded-pill bg-danger-transparent m-2" style="pointer-events: none;" id="secondDisease">부상병</span><br/>
                                                            </div>
                                                        </div>
                                                    </div>
														<div>
															<span class="badge rounded-pill bg-info-transparent m-2" id="medicinePrescription">처방</span><br/>
														</div>
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
                                
                        </div>  
                        </div>
                    </div>
                    <!-- <div class="col-xxl-2 col-xl-12"> -->
                    
                </div>
                <!-- End::row-1 -->

            </div>
        </div>
        <!-- End::app-content -->
        

<script src="${pageContext.request.contextPath }/resources/assets/libs/dragula/dragula.min.js"></script>
       <!-- Internal Task  JS -->
<script src="${pageContext.request.contextPath }/resources/assets/js/task-kanban-board.js"></script>
    
<script type="text/javascript">
$(function(){
	$('#modOrdersetBtn').hide();
	$('#delOrdersetBtn').hide();
	$('#modOrderName').hide();
	
	//진단 및 처방 검색 오토컴플릿
	let arr=[];
	var searchFlag=true;
	if(searchFlag){
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
	
	  //상병검색
	  var diseaseTab = document.querySelector('a[href="#searchDiseases"]');
	  diseaseTab.addEventListener('click', function (event) {
		searchFlag=true;
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
	                // 서버에서 json 데이터 response 후 목록 추가
	                	for(var i=0 ; i<data.length; i++){
	                		arr[i]= data[i].disNo + " " + data[i].disNameKr;
	                	}
	            }
        	});
		});
	 //약물검색
	 var medicineTab = document.querySelector('a[href="#searchMedicine"]');
	 medicineTab.addEventListener('click', function (event) {
		 searchFlag=false;
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
		                // 서버에서 json 데이터 response 후 목록 추가
		                	for(var i=0 ; i<data.length; i++){
		                		arr[i]=data[i].mdcinNo + " " + data[i].mdcinName;
		                	}
		            }
	        	});
			});
// 		var medicineList = [];	//처방약 리스트 배열
		var medicineSelect="";	//
	 	var medicineData ={};	//처방약을 제이슨형식으로 담은 데이터
	 	var medicineName="";	//처방약 이름 밸류값
	 	var medicineNo="";		//처방약 번호 키값
	 	var medicinePrescription = $('#medicinePrescription');
	 	
	 	var primaryDisease="";
	 	var primaryDiseaseData ={};	//주상병을 제이슨형식으로 담은 데이터
	 	var primaryDiseaseName="";		//주상병 이름 밸류값
	 	var primaryDiseaseNo="";		//주상병 번호 키값
	 	var primaryDiseaseArea = $('#primaryDisease');	//주상병 텍스트 입력 영역
	 	
	 	var secondaryDisease="";
		var secondaryDiseaseList = [];	//부상병 리스트 배열
	 	var secondaryDiseaseNoList=[];	//부상병 번호 배열
	 	var secondaryDiseaseData ={};	//부상병을 제이슨형식으로 담은 데이터
	 	var secondaryDiseaseName="";		//부상병 이름 밸류값
	 	var secondaryDiseaseNo="";		//부상병 번호 키값
	 	var secondaryDiseaseArea = $('#secondDisease');	//부상병 텍스트 입력 영역

	 	
	    $("#searchBox").autocomplete({
	    	maxShowItems: 5,
	       	source : arr,
	        select : function(event, ui) {	//검색 리스트에서 해당 필드 선택시 select 이벤트 발생
// 	            console.log(ui);
// 	            console.log(ui.item.label);
// 	            console.log(ui.item.value);
// 	            console.log(ui.item.test);

	            if (diseaseTab.classList.contains('active')) {

	            	//주상병 영역이 비어있을때 
		    	 	if (primaryDiseaseArea.next().length === 0){	
	            		var primaryDiseaseAreaHtml = "";	//주상병 입력 텍스트
	            		primaryDisease=ui.item.label;
	            		primaryDiseaseAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+primaryDisease+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
		            	primaryDiseaseArea.after(primaryDiseaseAreaHtml);
		            	
		            	$('#searchBox').val('');
		            	
	            	}else{									//부상병 영역에 추가
		            	var secondaryDiseaseAreaHtml ="";	//부상병입력 텍스트
		            	secondaryDisease = ui.item.label;	//부상병 입력
	            		secondaryDiseaseAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+secondaryDisease+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
	            		secondaryDiseaseArea.after(secondaryDiseaseAreaHtml);
	            		$('#searchBox').val('');
	            	}
		            
	            }else if(medicineTab.classList.contains('active')){
	            	var medicineAreaHtml = "";
	            	medicineSelect=ui.item.label;
					medicineAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+medicineSelect+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
	            	medicinePrescription.after(medicineAreaHtml);
					$('#searchBox').val('');
	            }
	        },
	        focus : function(event, ui) {	//한글 오류 방지
	            return false;
	        },
	        minLength : 1,
	        autoFocus : true,
	        classes : {
	            'ui-autocomplete': 'highlight'
	        },
	        delay : 500,
	        position : { my : 'right top', at : 'right bottom' },
	        close : function(event) {
	            console.log(event);
	        }
	  });
	 	
		//선택항목 삭제
		
		document.addEventListener('click', function(event) {
		    if (event.target.id === 'deleteSel') {
		        event.preventDefault(); // 기본 동작 방지
		        console.log("삭제!!!!!!");
		        var parentDiv = event.target.closest('.card'); // 클릭된 "X" 버튼의 부모 요소인 div.card를 찾기
		        parentDiv.remove(); // 부모 요소를 삭제.
		    }
		});
		
		//오더세트 등록
		var groupOrderName = ""; 	//오더세트 명
		
		$("#createOrderName").on("click", function(){
			orderSetInsert();
		});
		
		function orderSetInsert(){
			
				groupOrderName= $("#orderName").val(); //그룹오더 이름
				
				//진단내역 테이블
				//주상병
				var primaryDiseaseSend = $("#primaryDisease").next("div").text().trim();	//주상병 번호와 이름
				primaryDiseaseName = primaryDiseaseSend.substring(primaryDiseaseSend.indexOf(' ')+1); // 주상병 이름
				primaryDiseaseNo = primaryDiseaseSend.substring(0, primaryDiseaseSend.indexOf(' ')); // 주상병 번호
			    primaryDiseaseData[primaryDiseaseNo]=primaryDiseaseName;	// JSON 형식의 데이터에 키와 값을 추가
				//부상병
				var secondaryDiseaseSend = [];
			    var secondaryDiseaseSel="";
				var divCountDisease = $("#secondDisease").siblings("div").length;
			    
			    for(var i=0; i<divCountDisease; i++){
			    	secondaryDiseaseSel = $("#secondDisease").nextAll("div").eq(i).text().trim()
					secondaryDiseaseSend.push(secondaryDiseaseSel);	//부상병 번호와 이름
					secondaryDiseaseName = secondaryDiseaseSel.substring(secondaryDiseaseSel.indexOf(' ')+1); // 부상병 이름
					secondaryDiseaseNo = secondaryDiseaseSel.substring(0, secondaryDiseaseSel.indexOf(' ')); // 부상병 번호
			 		secondaryDiseaseNoList.push(secondaryDiseaseNo); //부상병번호 배열형식(오더세트등록에서 쓰임)
			 		secondaryDiseaseData[secondaryDiseaseNo]=secondaryDiseaseName;  // JSON 형식의 데이터에 키와 값을 추가
			    }
				
				//오더테이블
				//처방약오더
				var medicineSend=[];
				
			    var medicineSel="";
				var divCountMedicine = $("#medicinePrescription").siblings("div").length;
				var medicineNoList=[];
			    
			    for(var i=0; i<divCountMedicine; i++){
			    	medicineSel = $("#medicinePrescription").nextAll("div").eq(i).text().trim()
					medicineSend.push(medicineSel);	//부상병 번호와 이름
						medicineName = medicineSel.substring(medicineSel.indexOf(' ')+1); // 부상병 이름
						medicineNo = medicineSel.substring(0, medicineSel.indexOf(' ')); // 부상병 번호
						medicineNoList.push(medicineNo); //부상병번호 배열형식(오더세트등록에서 쓰임)
			 		medicineData[medicineNo]=medicineName;  // JSON 형식의 데이터에 키와 값을 추가
			    }
				
				var data = {
						groupOrderName : groupOrderName,
						primaryDiseaseNo : primaryDiseaseNo,	//주상병번호
						secondaryDiseaseNoList : secondaryDiseaseNoList,	//부상병번호 리스트
						medicineNoList : medicineNoList
				};
				
			 	$.ajax({
		   		 	url: '/doctor/insertGroupOrder', // 서버의 엔드포인트 URL을 여기에 입력
		   	        type: 'POST',
		   	     	contentType: 'application/json',
		   	        dataType: 'text', 
		   	     	data: JSON.stringify(data),
		   	     	beforeSend: function(xhr) {
		   	     	   // CSRF 토큰 헤더에 추가
		                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		     		},
		   	        success: function(res) {
		   				alert("성공!");
	// 	   				$("#closeModal").click();
		   				location.href="/orderSet/main";
		   	        }
			});
		}
		
		//오더세트 추가
		$("#addOrderSet").on("click", function(){
// 			//영역을 다 비우는 이벤트 발생
// 			primaryDiseaseArea.nextAll().remove(); //영역 다 비우기
// 	        secondaryDiseaseArea.nextAll().remove(); //영역 다 비우기
// 	        medicinePrescription.nextAll().remove(); //영역 다 비우기
	        
// 	        //버튼바꾸기
// 	        $('#addOrdersetBtn').show();
// 	        $('#modOrdersetBtn').hide();

			location.href="/orderSet/main";
		});
	//오더세트 조회
	var dropdownItems = document.querySelectorAll('.dropdown-item');
	
	var groupOrderNo="";
	// 각각의 요소에 대해 클릭 이벤트를 추가
	
	 // li 요소를 클릭할 때마다 색깔로 표시
    $('.dropdown-item').on('click', function() {
        // 모든 li 요소의 클래스를 초기화
        $('.dropdown-item').removeClass('active');
        // 현재 클릭한 li 요소에 active 클래스 추가
        $(this).addClass('active');
    });
	
	dropdownItems.forEach(function(item) {
	    item.addEventListener('click', function(event) {
	        event.preventDefault(); // 기본 동작 방지
	        
	        primaryDiseaseArea.nextAll().remove(); //영역 다 비우기
	        secondaryDiseaseArea.nextAll().remove(); //영역 다 비우기
	        medicinePrescription.nextAll().remove(); //영역 다 비우기
	        
	        //버튼바꾸기
	        $('#addOrdersetBtn').hide();
	        $('#createOrderName').hide();
	        $('#delOrdersetBtn').show();
	        $('#modOrdersetBtn').show();
	        $('#modOrderName').show();

	        // 클릭된 요소에서 그룹오더 넘버 가져오기
	        groupOrderNo = this.getAttribute('data-groupOrderNo');
	        
	        
		 	$.ajax({
	   		 	url: '/orderSet/detail', 
	   	        type: 'POST',
	   	     	contentType: 'application/json',
	   	        dataType: 'json', 
	   	     	data: JSON.stringify({groupOrderNo : groupOrderNo}),
	   	     	beforeSend: function(xhr) {
	             // CSRF 토큰 헤더에 추가
                    xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
         		},
	   	        success: function(res) {
	   	        	var orderSetName = res.orderSetName;
	   	        	var diseaseList = res.orderSetDiseaseList;
	   	        	var medicineList = res.orderSetMedicineList;
	   	        	
	   	        	console.log(diseaseList);
	   	        	
	   	        	$.each(diseaseList, function(index, item) {
	   	        		var getPrimaryDiseaseAreaHtml="";
	   	        		var getSecondaryDiseaseAreaHtml="";
	   	        		
		   	        	if(index==0){
			   	        	getPrimaryDiseaseAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+item.disNo +" "+item.disNameKr+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
			   	        	primaryDiseaseArea.after(getPrimaryDiseaseAreaHtml);
		   	        	}
		   	        	if(index!=0){
			   	        	getSecondaryDiseaseAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+item.disNo +" "+item.disNameKr+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
		            		secondaryDiseaseArea.after(getSecondaryDiseaseAreaHtml);
		   	        	}
	   	        	});
	   	        	$.each(medicineList, function(index, item) {
	   	        		var getMedicineAreaHtml="";
						getMedicineAreaHtml +="<div class='card custom-card m-2' style='display: inline-block; width:100%;'>"+item.mdcinNo +" "+item.mdcinName+"<a href='#' id='deleteSel' style='display: inline-block; float: right; margin-right:10px;'>X</a></div>";
						medicinePrescription.after(getMedicineAreaHtml);
	   	        	});
	   	        	
	   	         $('#insert-orderGroup').on('show.bs.modal', function (e) {
	 	            // 모달이 열릴 때 실행되는 부분
	 	            $('#orderName').val(orderSetName);
	 	        });
					
	   	        }
	   		});
	        
	    });
	});
	
	//오더셋트 삭제
	$('#delOrdersetBtn').on("click", function(){
		 var confirmDelete = confirm("정말로 삭제하시겠습니까?");
		 if(confirmDelete){
			$.ajax({
				url:'/orderSet/delete',
				type:'POST',
				contentType:'application/json',
				dataType : 'text',
				data: JSON.stringify({groupOrderNo : groupOrderNo}),
			   	beforeSend: function(xhr) {
		             // CSRF 토큰 헤더에 추가
	                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	        		},
	        	success:function(res){
	        		if(res=="SUCCESS"){
		        		alert('삭제성공');
		        		location.href="/orderSet/main";
	        		}
	        	}
				
			});
		 }
	});
	//오더셋트 수정
	$('#modOrderName').on("click", function(){

		$.ajax({
			url:'/orderSet/delete',
			type:'POST',
			contentType:'application/json',
			dataType : 'text',
			data: JSON.stringify({groupOrderNo : groupOrderNo}),
		   	beforeSend: function(xhr) {
	             // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
        	success:function(res){
        		if(res=="SUCCESS"){
	        		orderSetInsert();
        		}
        	}
			
		});
	});
	
	});

//검색입력창 클릭시 값 비우기
$("#searchBox").on("click",function(){
	$("#searchBox").val('');
});

</script>

</html>