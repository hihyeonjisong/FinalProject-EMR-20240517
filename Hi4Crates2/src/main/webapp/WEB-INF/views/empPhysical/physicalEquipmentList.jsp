<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

        <div class="main-content app-content">
            <div class="container-fluid" style="height:877px;">
                <div class="row" style="height: 100%;">   
                    <div class="col-xl-12" style="height: 100%;">
                        <div class="card custom-card" style="height: 100%;">
                            <div class="card-header">
                                <div class="card-title">
                                    	장비 목록 리스트
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive mb-4">
                                    <table class="table text-nowrap table-bordered text-center">
                                        <thead>
                                        	<!-- 테이블 순서랑 간격 수정하기 -->
                                            <tr>
                                                <th scope="col" style="width: 1%; text-align: center;">
                                                    	장비 코드
                                                </th>
                                                <th scope="col">품명</th>
                                                <th scope="col" style="width: 25%;">모델</th>
                                                <th scope="col" style="width: 15%;">제조사</th>
                                                <th scope="col" style="width: 5%;">장소</th>
                                                <th scope="col" style="width: 8%;">상태</th>
                                                <th scope="col" style="width: 12%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:choose>
                                        		<c:when test="${empty physicalEquip }">
                                        			<tr class="product-list">
                                                		<td style="text-align: center;" colspan="6">비었음</td>
                                            		</tr>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:forEach items="${physicalEquip }" var="equip">
                                        				<tr class="product-list">
                                                			<td style="text-align: center;">${equip.eqNo }</td>
                                                			<td>
                                                    			<div class="d-flex align-items-center">
                                                        			<div class="fw-semibold mx-auto">
                                                            			${equip.eqName }
                                                        			</div>
                                                    			</div>
                                                			</td>
                                                			<td>${equip.eqModel }</td>
                                                			<td>${equip.eqCompany }</td>
                                                			<td>${equip.eqLocname }</td>
                                                			<td>${equip.eqStatusname }</td>
                                                			<td>
                                                    			<div class="hstack gap-2 fs-15 justify-content-center">
                                                    				<!-- 버튼 아이콘, 색깔 수정예정 -->
                                                    				<!-- 방식 바꾸는것도 고민중 -->
                                                        			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-info-light" data-bs-toggle="modal" data-bs-target="#exampleModalScrollable2"><i class="bi bi-clipboard-check"></i></a>
                                                        			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-warning-light" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="ri-edit-line"></i></a>
                                                    			</div>
                                                			</td>
                                            			</tr>
                                        			</c:forEach>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
        <!-- modal -->
        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Launch demo modal
        </button> -->
        <div class="modal fade" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel1">장비 정보 상세보기</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody">
                       <form action="/radiation/updateEqInfo" method="post" id="updateForm">
                       		<input type="hidden" id="eqNo" name="eqNo" />
                			<div class="mb-3">
				                <label for="recipient-name"
				                    class="col-form-label">장비명:</label>
				                <input type="text" class="form-control" id="eqName" name="eqName">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">모델명:</label>
				                <input type="text" class="form-control" id="eqModel" name="eqModel">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">제조사:</label>
				                <input type="text" class="form-control" id="eqCompany" name="eqCompany">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">장소:</label>
<!-- 				                    <select class="form-select" id="eqLoc" name="eqLoc"> -->
<!-- 				                		<option value="LOC010">방사선실1</option> -->
<!-- 				                		<option value="LOC011">방사선실2</option> -->
<!-- 				                	</select> -->
				                	<input type="text" class="form-control" value="LOC008" readonly="readonly" id="eqLoc" name="eqLoc">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">상태:</label>
				                <select class="form-select" id="eqStatus" name="eqStatus">
				                	<option value="IS001">양호</option>
				                	<option value="IS002">중간</option>
				                	<option value="IS003">안좋음</option>
				                	<option value="IS004" hidden>수리중</option>
				                </select>
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">설명:</label>
				                <textarea class="form-control" style="resize : none; height: 200px" id="eqDescription" name="eqDescriptioncontent"></textarea>
				            </div>
				            <sec:csrfInput/>
				        </form>	
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="updateBtn">수정</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
       <!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal"
    		data-bs-target="#exampleModalScrollable2">
    			Vertically centered modal
		</button> -->
		<div class="modal fade" id="exampleModalScrollable2" tabindex="-1"
		aria-labelledby="exampleModalScrollable2" data-bs-keyboard="false"
		aria-hidden="true">
		<!-- Scrollable modal -->
			<div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			        <div class="modal-header">
			            <h6 class="modal-title" id="staticBackdropLabel2">Modal title
			            </h6>
			            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                aria-label="Close"></button>
			        </div>
			        <div class="modal-body">
			        	<input type="hidden" id="repairEqNo" value=""/>
			            <p>수리 요청</p>
			            <p>요청 사유</p>
			        	<input type="text" class="form-control" id="repairReason" value=""/>
			        </div>
			        <div class="modal-footer">
			            <button type="button" id="repairBtn" class="btn btn-primary">
			                	요청</button>
			            <button type="button" class="btn btn-secondary"
			                data-bs-dismiss="modal">취소</button>
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
    
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</body>
<script type="text/javascript">
	/* function eqInfoClick() {
		console.log("test");
		// ajax로 장비 번호 보내서 해당 장비 정보 받아와 모달 추가
		let modalBody = $('#modalBody');
		console.log(modalBody.text().trim());
		// modalBody.text("modal test!!!");
		
	} */
	let detailBtn = $('.btn-warning-light');
	let repairRequestBtn = $('.btn-info-light');
	
	detailBtn.click(function() {
		console.log("test");
		let tr = $(this).closest('tr');
		console.log(tr);
		
		 // tr 요소에서 각 셀(td)의 내용 가져오기
        let eqNo = tr.find('td:nth-child(1)').text().trim();

        // 가져온 정보 출력 또는 다른 작업 수행
        console.log("Equipment Number: " + eqNo);
        let data = {
        	eqNo : eqNo
        }
        // ajax로 상세 정보 가져오기
        $.ajax({
        	type : "post",
        	url : "/radiation/equipmentInfo",
        	contentType : "application/json",
        	beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader(csrfHeader, csrfToken);
            	}, 
        	data : JSON.stringify(data),
        	success : function (res) {
				console.log("SUCCESS!!!");
				console.log("res" + res);
				
				let eqNo = $('#eqNo');
				let eqName = $('#eqName');
				let eqModel = $('#eqModel');
				let eqCompany = $('#eqCompany');
				let eqDescription = $('#eqDescription');
				
				eqNo.val(res.eqNo);
				eqName.val(res.eqName);
				eqModel.val(res.eqModel);
				eqCompany.val(res.eqCompany);
// 				if (res.eqStatusname == "방사선실1") {
// 					$("#eqLoc option:contains('방사선실1')").prop("selected", true);
// 				}
// 				if (res.eqStatusname == "방사선실2") {
// 					$("#eqLoc option:contains('방사선실2')").prop("selected", true);
// 				}
				
				
				
				$("select").removeAttr("disabled");
				if (res.eqStatusname == "양호") {
					$("#eqStatus option:contains('양호')").prop("selected", true);
				}
				if (res.eqStatusname == "중간") {
					$("#eqStatus option:contains('중간')").prop("selected", true);
				}
				if (res.eqStatusname == "안좋음") {
					$("#eqStatus option:contains('안좋음')").prop("selected", true);
				}
				if (res.eqStatusname == "수리중") {
					$("select option:contains('수리중')").prop("selected", true);
					$("select").attr("disabled", "disabled");
				}
				eqDescription.val(res.eqDescriptioncontent);
			}
        });
        
	});
	
	let updateForm = $('#updateForm');
	let updateBtn = $('#updateBtn');
	updateBtn.click(function() {
		updateForm.submit();
	});
	
	
	let repairBtn = $('#repairBtn');
	repairRequestBtn.click(function() {
		
		let tr = $(this).closest('tr');
		
		 // tr 요소에서 각 셀(td)의 내용 가져오기
        let eqNo = tr.find('td:nth-child(1)').text().trim();
		
        let repairEqNo = $('#repairEqNo');
        repairEqNo.val(eqNo);
        
	});
	
	repairBtn.click(function() {
		console.log("test!!");
		
		let repairEqNo = $('#repairEqNo');
		let repairReason = $('#repairReason');
		
		let data = { 
				eqNo : repairEqNo.val(),
				repairPerson : "12", // 테스트용
				repairReason : repairReason.val()
			};				
		console.log(data);
		
		$.ajax({
			type : "post",
			url : "/radiation/eqRepairRequest",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
			success : function(res) {
				// res == true면 수정 완료 모달로 띄워주고 새로고침?
				console.log(res);
				if (res) {
					let repairReason = $("#repairReason");
					repairReason.val("");
				}
				
				
				let notidata = {
						"code" : "requestNoti",
						"content" : "처리 대기 중인 수리 요청이 있습니다.",
						"destination" : "/admin/equipmentRequestList"
				}
				
				ws.send(JSON.stringify(notidata));
			}
		});
		
	});
	
</script>

</html>