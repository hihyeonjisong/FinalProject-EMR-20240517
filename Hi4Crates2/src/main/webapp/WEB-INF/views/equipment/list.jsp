<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>

        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">장비 목록</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ecommerce</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Products List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">   
                    <div class="col-xl-12">
                        <div class="card custom-card">
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
                                        		<c:when test="${empty list }">
                                        			<tr class="product-list">
                                                		<td style="text-align: center;" colspan="6">empty</td>
                                            		</tr>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:forEach items="${list }" var="list">
                                        				<tr class="product-list">
                                                			<td style="text-align: center;">${list.eqNo }</td>
                                                			<td>
                                                    			<div class="d-flex align-items-center">
                                                        			<div class="fw-semibold mx-auto">
                                                            			${list.eqName }
                                                        			</div>
                                                    			</div>
                                                			</td>
                                                			<td>${list.eqModel }</td>
                                                			<td>${list.eqCompany }</td>
                                                			<td>${list.eqLocname }</td>
                                                			<td>${list.eqStatusname }</td>
                                                			<td>
                                                    			<div class="hstack gap-2 fs-15 justify-content-center">
                                                    				<!-- 버튼 아이콘, 색깔 수정예정 -->
                                                    				<!-- 방식 바꾸는것도 고민중 -->
<!--                                                         			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-info-light" data-bs-toggle="modal" data-bs-target="#exampleModalScrollable2"><i class="bi bi-clipboard-check"></i></a> -->
                                                        			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-warning-light" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="ri-edit-line"></i></a>
                                                        			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-danger-light"><i class="ri-delete-bin-line"></i></a>
                                                    			</div>
                                                			</td>
                                            			</tr>
                                        			</c:forEach>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <button class="btn btn-light btn-wave waves-effect waves-light" type="submit" data-bs-toggle="modal" data-bs-target="#addModal">추가하기</button>
                                <!-- 페이징 안넣고 스크롤만? -->
                                <!-- <div class="d-flex align-items-center justify-content-center flex-wrap">
                                    <nav aria-label="...">
                                        <ul class="pagination mb-0">
                                            <li class="page-item disabled">
                                                <span class="page-link">이전</span>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                                            <li class="page-item active" aria-current="page">
                                                <span class="page-link">2</span>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0);">다음</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    	버튼 삭제할지 말지 고민
                                    <button class="btn btn-danger btn-wave m-1">Delete All</button>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!--End::row-1 -->

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
                       <form action="/equipment/update" method="post" id="updateForm">
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
				                <label for="message-text"class="col-form-label">장소:</label>
				                <select class="form-select" id="eqLoc" name="eqLoc">
				                	<option value="LOC001">진료실1</option>
				                	<option value="LOC002">진료실2</option>
				                	<option value="LOC003">진료실3</option>
				                	<option value="LOC004">진료실4</option>
				                	<option value="LOC005">진료실5</option>
				                	<option value="LOC006">진료실6</option>
				                	<option value="LOC007">진료실7</option>
				                	<option value="LOC008">물리치료실</option>
				                	<option value="LOC010">방사선실1</option>
				                	<option value="LOC011">방사선실2</option>
				                </select>
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
<!-- 				            <sec:csrfInput/> -->
				        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="updateBtn">수정</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="addModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel1">장비 추가하기</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody">
                       <form action="/equipment/addEquipment" method="post" id="addForm">
                			<div class="mb-3">
				                <label for="recipient-name"
				                    class="col-form-label">장비명:</label>
				                <input type="text" class="form-control" id="eqName1" name="eqName">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">모델명:</label>
				                <input type="text" class="form-control" id="eqModel1" name="eqModel">
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">제조사:</label>
				                <input type="text" class="form-control" id="eqCompany1" name="eqCompany">
				            </div>
				            <select class="form-select" id="eqLoc1" name="eqLoc">
				                	<option value="LOC001">진료실1</option>
				                	<option value="LOC002">진료실2</option>
				                	<option value="LOC003">진료실3</option>
				                	<option value="LOC004">진료실4</option>
				                	<option value="LOC005">진료실5</option>
				                	<option value="LOC006">진료실6</option>
				                	<option value="LOC007">진료실7</option>
				                	<option value="LOC008">물리치료실</option>
				                	<option value="LOC010">방사선실1</option>
				                	<option value="LOC011">방사선실2</option>
				                </select>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">상태:</label>
				                <select class="form-select" id="eqStatus1" name="eqStatus">
				                	<option value="IS001">양호</option>
				                	<option value="IS002">중간</option>
				                	<option value="IS003">안좋음</option>
				                	<option value="IS004" hidden>수리중</option>
				                </select>
				            </div>
				            <div class="mb-3">
				                <label for="message-text"
				                    class="col-form-label">설명:</label>
				                <textarea class="form-control" style="resize : none; height: 200px" id="eqDescription1" name="eqDescriptioncontent"></textarea>
				            </div>
<!-- 				            <sec:csrfInput/> -->
				        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="addBtn">추가</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
       <!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal"
    		data-bs-target="#exampleModalScrollable2">
    			Vertically centered modal
		</button> -->
<!-- 		<div class="modal fade" id="exampleModalScrollable2" tabindex="-1" -->
<!-- 		aria-labelledby="exampleModalScrollable2" data-bs-keyboard="false" -->
<!-- 		aria-hidden="true"> -->
<!-- 		<!-- Scrollable modal --> -->
<!-- 			<div class="modal-dialog modal-dialog-centered"> -->
<!-- 			    <div class="modal-content"> -->
<!-- 			        <div class="modal-header"> -->
<!-- 			            <h6 class="modal-title" id="staticBackdropLabel2">Modal title -->
<!-- 			            </h6> -->
<!-- 			            <button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 			                aria-label="Close"></button> -->
<!-- 			        </div> -->
<!-- 			        <div class="modal-body"> -->
<!-- 			        	<input type="hidden" id="repairEqNo" value=""/> -->
<!-- 			            <p>수리 요청?</p> -->
<!-- 			            <p>요청 사유</p> -->
<!-- 			        	<input type="text" class="form-control" id="repairReason" value=""/> -->
<!-- 			        </div> -->
<!-- 			        <div class="modal-footer"> -->
<!-- 			            <button type="button" id="repairBtn" class="btn btn-primary"> -->
<!-- 			                	요청</button> -->
<!-- 			            <button type="button" class="btn btn-secondary" -->
<!-- 			                data-bs-dismiss="modal">취소</button> -->
<!-- 			        </div> -->
<!-- 			    </div> -->
<!-- 			</div> -->
<!-- 		</div> -->
    
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
	let deleteBtn = $('.btn-danger-light');	
	console.log(deleteBtn);

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
        	url : "/equipment/equipmentInfo",
        	contentType : "application/json",
        	/* beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader(csrfHeader, csrfToken);
            	}, */
        	data : JSON.stringify(data),
        	success : function (res) {
				console.log("SUCCESS!!!");
				console.log("res" + res);
				
				let eqNo = $('#eqNo');
				let eqName = $('#eqName');
				let eqModel = $('#eqModel');
				let eqCompany = $('#eqCompany');
				let eqDescription = $('#eqDescription');
				let eqLoc = $('#eqLoc');
// 				let eqDescriptioncontent = $('#eqDescriptioncontent');
				
				eqNo.val(res.eqNo);
				eqName.val(res.eqName);
				eqModel.val(res.eqModel);
				eqCompany.val(res.eqCompany);
				eqLoc.val(res.eqLoc);
				$("#eqLoc option[value='" + res.eqLoc + "']").prop("selected", true);
				$("select").removeAttr("disabled");
				
				$("#eqStatus option[value='" + res.eqStatus + "']").prop("selected", true);
				eqDescription.val(res.eqDescriptioncontent);
			}
        });
        
	});
	
	// 장비 정보 업데이트
	let updateForm = $('#updateForm');
	let updateBtn = $('#updateBtn');
	
	updateBtn.click(function() {
        // 각 입력 필드의 값을 가져오기
        var eqName = $('#eqName').val();
        var eqModel = $('#eqModel').val();
        var eqCompany = $('#eqCompany').val();
        var eqLoc = $('#eqLoc').val();
        var eqStatus = $('#eqStatus').val();
        var eqDescription = $('#eqDescription').val();
        

        // 빈 값 확인
        if (eqName === '' || eqModel === '' || eqCompany === '' || eqLoc === '' || eqStatus === '' || eqDescription === '') {
            alert("누락된 정보가 있습니다.");
            return false; // 제출 중단
        } else {
        	// 확인을 누르면 수정하시겠습니까?
        	if (confirm("수정 하시겠습니까?")){
            updateForm.submit(); // 모든 정보가 입력되었으면 제출
        	}
        }
    });
	
	
	deleteBtn.click(function() {
	    // alert로 삭제할건지 물어보기
	    if (confirm("삭제하시겠습니까?")) {
	        let tr = $(this).closest('tr');
	        let eqNo = tr.find('td:nth-child(1)').text().trim();
	        let deleteData = {
	            eqNo: eqNo
	        };

	        $.ajax({
	            url: "/equipment/delete",
	            type: "post",
	            contentType: "application/json",
	            data: JSON.stringify(deleteData),
	            success: function(res) {
	            	alert("해당 장비 정보가 삭제되었습니다.");
	                console.log(res);
	                tr.remove(); // 예시: 삭제된 행을 화면에서 제거
	            },
	            error: function(xhr, status, error) {
	                console.error(xhr.responseText);
	                // 삭제에 실패한 경우 사용자에게 알림을 표시할 수 있음
	                alert("삭제에 실패했습니다. 다시 시도해주세요.");
	            }
	        });
	    }
	});
	
	
	// 장비 추가
	let addForm = $('#addForm');
	let addBtn = $('#addBtn');
	
	addBtn.click(function() {
        // 각 입력 필드의 값을 가져오기
        var eqName = $('#eqName1').val();
        var eqModel = $('#eqModel1').val();
        var eqCompany = $('#eqCompany1').val();
        var eqLoc = $('#eqLoc1').val();
        var eqStatus = $('#eqStatus1').val();
        var eqDescription = $('#eqDescription1').val();
        
        //비동기 ㄱㄱ
        
		
        // 빈 값 확인
        if (eqName === '' || eqModel === '' || eqCompany === '' || eqLoc === '' || eqStatus === '' || eqDescription === '') {
            alert("누락된 정보가 있습니다.");
            return false; // 제출 중단
        } else {
        	// 확인을 누르면 수정하시겠습니까?
        	if (confirm("추가 하시겠습니까?")){
            addForm.submit(); // 모든 정보가 입력되었으면 제출
        	}
        }
    });
</script>

</html>