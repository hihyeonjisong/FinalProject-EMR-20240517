<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#waitingList{
overflow-y:auto;
	max-width:100%;
}
#waitingList .custom-card{
	    height: 95px;
	    width: 90%;
	    margin: 5%
	}
</style>
<!-- 새 페이지 만들기용 -->
        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">


               <!-- row start -->
               <div class="row">
					<div class="col-xxl-2 col-xl-12">
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card"  style="height: 880px;">
								<div class="card-header justify-content-between">
									<div class="card-title">환자목록</div>
								</div>
								<div class="card-body" id="waitingList">

								</div>
							</div>
						</div>
					</div>
					<!-- 차트 div  -->
					<div class="col-xxl-10 col-xl-12">
					
					<!-- 차트 상세 -->
					<div id="chartView">
						<div class="row" style="background-color: white; border-radius: 1%; height:880px;">
							<div class="col-xl-3"
								style="border-right: solid 1px rgb(229, 228, 228);">
								<div class="row">
									<div class="col-xxl-12 col-xl-12">
										<div class="row">
											<div class="col-xl-12">
												<div class="card custom-card">
													<div class="card-header">
														<div class="card-title">
															환자 상세정보
														</div>
													</div>
													<div class="card-body" id="patntInfoArea" style="height:800px;">
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3" style="border-right: solid 1px rgb(229, 228, 228); ">
								<div class="row">
									<div class="col-xl-12">
										<div class="card custom-card">
											<div class="card-header">
												<div class="card-title">
													사전 검사 조회
												</div>
											</div>
											<div class="card-body" id="preInspectionInfo" style="height:800px;">
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="col-xl-12">
										<div class="card custom-card">
											<div class="card-header">
												<div class="card-title">
													사전검사 등록
												</div>
											</div>
											<div class="card-body" id="preInspectionInfo">
												<!-- 환자 기본정보 넣기 -->
												<input type="hidden" id="hsptlzNoInp" name="hsptlzNo" />
												
												<label  class="col-form-label"> 혈액 :</label>
												<input type="text" class="form-control" name="inspctBlood"/>
												<label  class="col-form-label"> 심전도 :</label>
												<input type="text" class="form-control" name="inspctElecgrm"/>
												<label  class="col-form-label"> 소변검사 :</label>
												<input type="text" class="form-control" name="inspctUrine"/>
												<label  class="col-form-label"> 비고 :</label>
												<input type="text" class="form-control" name="inspctDescription"/>
												<label  class="col-form-label"> 검사일시 :</label>
												<input type="text" class="form-control" name="inspctDate" style="margin-bottom: 12px;"/>
												<input type="hidden" class="form-control" name="empNo"/>
												<button type="button" class="btn btn-info" id="insertPreInspection" style="float: right;">작성</button>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
					</div>
				</div>
               <!-- row end -->

            </div>
        </div>
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
       
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

   

    <!-- Internal Product-Details JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/product-list.js"></script>

   
    
  

</body>
<script type="text/javascript">
	$(function() {
		
		// 여기도 환자 상세정보 조회하는거 넣으면 좋을듯?
		
		let empNo = "";
		
		let memberNo = ${sessionScope.user.member.memNo};
    	let empName = "${sessionScope.user.member.memName}";
        
	     $.ajax({
	    	url : "/nurse/getEmpInfo",
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
		
	     // 수술 오더 받은 입원 한 사람 조회(입원 안한사람도 조회 해야되나??)
		$.ajax({
			url : "/nurse/getWaitingSurgeryList",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log(res);
				let waitingList = $('#waitingList');
				let html = "";
				$.each(res, function(index, item) {
					console.log(item);
					let hsptlzNo = item.hsptlzRecordVO.hsptlzNo;
					let memNo = item.memNo;
					let memName = item.memName;
					let memAge = item.memAge;
					let memGender = item.memGender;
					let orderCode = item.orderVO.orderCode;
					// 임시로 해놓음
					html += '<div class="card border custom-card" style="background-color:white;width: 280px;height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">'+
		            '<div class="card-header" style="height: 30px; background-color: #f6feff !important">'+
		            '<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">수납대기실</span>'+
		            '</div>'+
		            '<div class="card-body p-2"  data-name="info" data-mem-no="' + memNo + '">'+
		            '<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="">'+
		            '<div class="d-inline-flex align-items-start position-relative">'+
		            // '<a href="profile.html" class="stretched-link"></a>'+
		            '<div class="flex-grow-1">'+
		            '<span class="mb-0 d-block fs-15 fw-semibold pickPt">' + item.memName + '</span>'+
		            '<span class="fs-13 text-muted">' + item.memGender + ' ' + item.memAge + '세</span>'+
		            '</div>' +
		            '</div>' +
		            '<span class="fs-10 badge rounded-pill bg-secondary">수납대기중</span>'+
		            
		            '</div>' +
		            '<input type="hidden" value="'+item.hsptlzRecordVO.hsptlzNo+'" />'+
		            '</div>' +
		            '</div>';
				});
				waitingList.html(html);
			}
			
		});
		
	     // 클릭 이벤트
		$(document).on('click', '[data-name="info"]', function() {
			let hsptlzNo = $(this).find('input').val();
			let memNo = $(this).data('mem-no');
			
			console.log(hsptlzNo);
		    let data = {
		    	hsptlzNo : hsptlzNo
		    }
		    
		    // 환자 정보도 띄워주기
		    getPatntInfo(memNo);
		    
		    
		    $.ajax({
		    	url : "/nurse/getPreInspectionInfo",
		    	type : "post",
		    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
		    	data : JSON.stringify(data),
		    	contentType : "application/json",
		    	success : function(res) {
					console.log(res);
					if (res == null || res == "") {
						// 사전검사 등록되지 않은 환자라고 알리고 등록 할건지 물어보기
						let hsptlzNoInp = $('#hsptlzNoInp');
						hsptlzNoInp.val(hsptlzNo);
					} else {
						// 검사 결과 화면에 추가
						
					}
				} 
		    });
		    
		});
		
		let insertPreInspectionBtn = $('#insertPreInspection');
		insertPreInspectionBtn.click(function() {
			console.log("insert!!!");
			
			let hsptlzNo = $('input[name=hsptlzNo]').val();
			let inspctBlood = $('input[name=inspctBlood]').val();
			let inspctElecgrm = $('input[name=inspctElecgrm]').val();
			let inspctUrine = $('input[name=inspctUrine]').val();
			let inspctDescription = $('input[name=inspctDescription]').val();
			let inspctDate = $('input[name=inspctDate]').val();
			
			console.log(hsptlzNo);
			console.log(inspctBlood);
			console.log(inspctElecgrm);
			console.log(inspctUrine);
			console.log(inspctDescription);
			console.log(inspctDate);
			
			let data = {
				hsptlzNo : hsptlzNo,
				inspctBlood: inspctBlood,
				inspctElecgrm : inspctElecgrm,
				inspctUrine : inspctUrine,
				inspctDescription : inspctDescription,
				inspctDate : inspctDate,
				empNo : empNo
			};
			
			$.ajax({
				url : "/nurse/insertPreInspection",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(data),
				contentType : "application/json",
				sueccess : function(res) {
					console.log(res);
				}
			});
		});
		
		// 환자 상세정보 조회
		function getPatntInfo(memNo) {
			
			// 환자 상세정보
			let data = {
				memNo : memNo
			};
			
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
		}
	
	});
</script>

</html>