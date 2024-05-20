<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.card-body ul {
    font-size: 5.1em; /* 원하는 크기로 조정하세요 */
}

.card-body ul li {
    font-size: 5.1em; /* 리스트 아이템에 대해서도 필요한 경우 조정하세요 */
}
#patntList {
    font-size: 20px; /* 원하는 크기로 조절하세요 */
}
</style>

<!-- 새 페이지 만들기용 -->
        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

               <!-- row start -->
               <div class="row">
               	    <div class="col-xxl-3 col-xl-12">
						<div class="col-xl-12" style="padding-right: 0px;">
						    <div class="card custom-card" style="height:880px;">
						        <div class="card-header">
						            <div class="card-title">
						                	입원환자 리스트(임시)
						            </div>
						        </div>
						        <div class="card-body" style="padding-left: 0px;padding-top: 0px;padding-right: 0px; ">
						            
						                    <div class="card-body" style="overflow-y: auto;">
						                        <table class="table table-bordered text-nowrap w-100">
						                            <thead>
						                                <tr>
						                                    <th rowspan="1" colspan="1">이름</th>
						                                    <th rowspan="1" colspan="1">입원일</th>
						                                    <th rowspan="1" colspan="1">성별</th>
						                                    <th rowspan="1" colspan="1">정보</th>
						                                </tr>
						                            </thead>
						                            <tbody id="patntList">
						                                <!-- 환자 정보가 여기에 동적으로 추가됩니다 -->
						                            </tbody>
						                        </table>
						                    </div>
						               
						        </div>
						    </div>
						</div>
					
					</div>
               	    <div class="col-xxl-5 col-xl-12" style="padding-left: 0px;">
               	    	
               	    		<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card" style="height:350px;margin-bottom: 12px;" >
								<div class="card-header justify-content-between">
									<div class="card-title">진료기록 차트(내역)</div>
								</div>
								<div class="card-body" style="padding-top: 12px;">
									<div class="col-xxl-12">
									    <div class="d-flex flex-row">
									        <div class="col-xxl-3 col-xl-12 text-nowrap" style="width:122px;overflow-y: auto;">
									            <div class="card custom-card" style="height:280px;">
									                <div class="card-body" style="padding-top: 5px;padding-right: 0px;padding-left: 0px;">
									                	<div class="table-responsive">
									                		<table class="table">
									                			<tbody id="recordList" style="overflow-y: auto">
									                			</tbody>
									                		</table>
									                	</div>
									                </div>
									            </div>
									        </div>
									        <div class="col-xxl-9">
									            <div class="card custom-card" style="height:270px;">
									                <div class="card-body" style="padding-top: 0px; padding-bottom: 0px;">
									                	<div class="table-response">
									                		<table class="table">
									                			<tbody id="recordDetail">
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
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card" style="height:469px;">
								<div class="card-header justify-content-between">
									<div class="card-title">차트조회</div>
								</div>
								<div class="card-body" style="overflow-y: auto;">
								</div>
							</div>
						</div>
						
					</div>
               	    <div class="col-xxl-4 col-xl-12" style="padding-left: 0px;">
	               	    <div class="col-xxl-12 col-xl-6">
								<div class="card custom-card" style="height:880px;">
									<div class="card-header justify-content-between">
										<div class="card-title">회진일지 작성</div>
									</div>
									<div class="card-body" style="overflow-y: auto;">
									    <input type="hidden" id="hsptlzNo"/>
									    <div class="form-group">
									        <label for="memName" style="font-weight: bold; font-size: 15px;padding-bottom: 5px;">환자명 :</label>
									        <input type="text" class="form-control" id="memName" style="font-size: 16px;">
									    </div>
									    <div class="form-group">
									        <label for="mdcinNo" style="font-weight: bold; font-size: 15px;padding-bottom: 5px; padding-top:5px;">약품명 :</label>
									        <input type="text" class="form-control" id="mdcinNo" style="font-size: 16px;">
									    </div>
									    <div class="form-group">
									        <label for="descriptionArea" style="font-weight: bold; font-size: 15px;  padding-bottom: 5px; padding-top: 5px;">기록 내용 :</label>
									        <textarea class="form-control" style="resize: none; font-size: 16px;" id="descriptionArea"></textarea>
									    </div>
									    <button type="button" class="btn btn-md btn-info mt-2" id="insertRoundBtn" style="float: right;">등록</button>
									</div>
								</div>
							</div>
					</div>
               </div>
               <!-- row end -->

            </div>
        </div>
        <!-- End::app-content -->

       
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Defaultmenu JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/defaultmenu.min.js"></script>

    <!-- Node Waves JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

    <!-- Sticky JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/sticky.js"></script>

    <!-- Simplebar JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/simplebar.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>


    
    <!-- Custom-Switcher JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>

    <!-- Internal Product-Details JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/product-list.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
    
</body>
<script type="text/javascript">
	$(function() {
		
		let memberNo = ${sessionScope.user.member.memNo};
    	let empName = "${sessionScope.user.member.memName}";
		
		let empNo = "";
        
	     $.ajax({
	    	url : "/doctor/round/getEmpInfo",
	    	type : "post",
	    	data : JSON.stringify({ memNo : memberNo }),
	    	beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
	    	contentType : "application/json",
	    	success : function(res) {
				console.log(res);
				empNo = res.empNo;
			}
	    });
		
		// 입원 환자 리스트부터 불러오기
		function getHsptlzPatntList() {
			$.ajax({
				url : "/doctor/round/getHsptlzPatntList",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					console.log(res);
					let patntList = $('#patntList');
					let html = "";
					$.each(res, function (index, item) {
						console.log(item);
						html += "<div class='patntList' data-hsptlz-no='" + item.hsptlzRecordVO.hsptlzNo + "' data-receipt-no='" + item.receiptNo + "'>";
						html += "	<input type='hidden' value='" + item.patientVO.patntNo + "'>";
						html += "	" + item.memName;
						html += "</div>";
					});
					patntList.html(html);
				}
				
			});
		}
		
		getHsptlzPatntList();
		
		// 진료기록차트 불러오기
		function getPatntRecordList(patntNo) {
			$.ajax({
				url : "/doctor/round/getPatntRecordList",
				type : "post",
				data : JSON.stringify({ patntNo : patntNo }),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					console.log(res);
					let html = "";
					let recordList = $('#recordList');
					$.each(res, function (index, item) {
						console.log(item);
						let chartNo = item.chartNo;
						console.log(chartNo);
						let chartDate = item.chartDate.split(" ")[0];
						console.log("chartDate");
						console.log(chartDate);
						let receiptNo = item.receiptVO.receiptNo;
						console.log("접수번호 떴냐???");
						console.log(receiptNo);
						
						html += "<tr class='chartList' data-chart-no='" + chartNo + "'>";
						html += "	<td>";
						html += "		" + chartDate;
						html += "	</td>";
						html += "</tr>";
					});
					recordList.html(html);
				}
			});
		}
		
		// 진료기록 차트 상세보기 추가
		
		
		$(document).on('click', 'div.patntList', function() {
			// 이전에 선택된 요소의 배경색을 초기화합니다.
		    $('div.patntList').css('background-color', 'transparent');
		    // 클릭된 요소의 배경색을 하늘색빛으로 변경합니다.
		    $(this).css('background-color', '#87CEEB');
			
			// 클릭된 div에서 숨겨진 input 요소의 값을 가져옴
		    let patntNo = $(this).find('input[type="hidden"]').val();
		    let hsptlzNo = $(this).data("hsptlz-no");
		    let memName = $(this).text().trim();
		    let receiptNo = $(this).data("receipt-no");
		    console.log("test!!!");
		    console.log(hsptlzNo);
		    console.log(memName);
		    
		    let hsptlzNoInp = $('#hsptlzNo');
		    hsptlzNoInp.val(hsptlzNo);
		    
		    let memNameInp = $('#memName');
		    memNameInp.val(memName);
		    
		    // 가져온 값 사용 예시
		    console.log("Patient No:", patntNo);
		    console.log("receiptNo:", receiptNo);
		    
		    // 이후 작업 수행
		    getPatntRecordList(patntNo);
		    
		    // 회진 기록 리스트
		    getRoundRecordList(hsptlzNo);
		    
		    // 간호 기록 리스트
		    $.ajax({
		    	url : "/doctor/round/getNursingRecord",
		    	type : "post",
		    	data : JSON.stringify({ hsptlzNo : hsptlzNo }),
		    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
		    	contentType : "application/json",
		    	success : function (res) {
		    		console.log("간호기록 떴냐????");
					console.log(res);
				}
		    });
		    
		});
		
		
		$(document).on('click', 'tr.chartList', function() {
			// 이전에 선택된 요소의 배경색을 초기화합니다.
		    $('tr.chartList').css('background-color', 'transparent');
			
		    // 클릭된 요소의 배경색을 하늘색빛으로 변경합니다.
		    $(this).css('background-color', '#87CEEB');
			
			console.log("test!!!");
// 			console.log($(this));
			$(this).find().css("background-color", "#b9feff");
			$(this).find('td').css("font-weight", "bold");
			let chartNo = $(this).data('chart-no');
			console.log(chartNo);
			$.ajax({
				url : "/doctor/round/getPatntRecordInfo",
				type : "post",
				data : JSON.stringify({ chartNo : chartNo}),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success: function(res) {
				    console.log(res);
				    let recordDetail = $('#recordDetail');
				    let html = "<tr>";
				    html += "<th style='font-weight: bold; font-size: 15px;'>환자명</th>";
				    html += "<td>" + res.memName + "</td>";
				    html += "</tr>";
				    html += "<tr>";
				    html += "<th style='font-weight: bold; font-size: 15px;'>성별</th>";
				    html += "<td>남자(하드코딩)</td>";
				    html += "</tr>";
				    html += "<tr>";
				    html += "<th style='font-weight: bold; font-size: 15px;'>나이</th>";
				    html += "<td>28세(하드코딩)</td>";
				    html += "</tr>";
				    html += "<tr>";
				    html += "<th style='font-weight: bold; font-size: 15px;'>진료기록내용</th>";
				    html += "<td>손톱 너무 바짝 깍음(하드코딩)</td>";
				    html += "</tr>";
				    // 보여줄 데이터 추가하기
				    recordDetail.html(html);   
				}
			});
			
		});
		
		// 회진 기록 등록
		let insertRoundBtn = $('#insertRoundBtn');
		insertRoundBtn.click(function() {
			console.log("btn click!!");
			let hsptlzNo = $('#hsptlzNo').val();
			let mdcinNo = $('#mdcinNo').val();
			let description = $('#descriptionArea').val();
			
			let data = {
				hsptlzNo : hsptlzNo,
				mdcinNo : mdcinNo,
				medicationDescription : description,
				empNo : empNo
			}
			
			$.ajax({
				url : "/doctor/round/insertRoundRecord",
				type : "post",
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					console.log(res); // insert 성공 시 true, 실패 시 false
				}
				
			})
		});
	});
	
	 // 회진 기록 리스트
	function getRoundRecordList(hsptlzNo) {
	    $.ajax({
	    	url : "/doctor/round/getRoundRecordList",
	    	type : "post",
	    	beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
	    	data : JSON.stringify({ hsptlzNo : hsptlzNo }),
	    	contentType : "application/json",
	    	success : function(res) {
	    		console.log("떴냐???");
				console.log(res);
			}
	    });
	}
	 
	 // 회진 상세보기 추가
	
	
	
</script>

</html>