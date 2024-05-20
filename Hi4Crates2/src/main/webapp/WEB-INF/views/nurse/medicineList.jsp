<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
               
                <!-- Page Header Close -->

               <!-- row start -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card custom-card" style="margin-bottom: 12px;">
                            <div class="card-header" style="padding-top: 8px;padding-bottom: 8px;">
                                <div class="card-title">
                                    	의약품 리스트
                                </div>
                            </div>
                            <div class="card-body" style="padding-top: 0px;">
                                <div class="table-responsive">
                                    <table id="medicines" class="table table-bordered text-nowrap w-100" ">
                                        <thead> 
                                            <tr>
                                                <th>의약품 번호</th>
                                                <th>약품명</th>
                                                <th>수량</th>
                                                <th>단위</th>
                                                <th>제조사</th>
                                                <th>투여 경로</th>
                                                <th>가격</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-right: 0px;">
	                     <div class="col-xl-6" style="padding-right: 0px;">
	                        <div class="card custom-card" style="height:410px;">
	                            <div class="card-header" style="padding-top: 8px;padding-bottom: 8px; ">
	                                <div class="card-title">
	                                	의약품 신청 내역
	                                </div>
	                            </div>
	                            <div class="card-body" style="max-height: 380px; overflow-y: auto;"> 
								    <table id="" class="table table-bordered text-nowrap w-100">
								        <thead> 
								            <tr>
								                <th style="width: 5%;">번호</th> 
								                <th style="width: 15%">약품명</th>
								                <th style="width: 5%;">수량</th>
								                <th style="width: 15%;">처리 날짜</th> 
								                <th style="width: 8%;">결과</th>
								                <th>신청자</th>
								                <!-- <th>승인자명</th> -->
								            </tr> 
								        </thead>
								        <tbody id="requestListBody" >
								            <!-- 테이블 내용 추가 -->
								        </tbody>
								    </table>
								</div>
	                        </div>
	                    </div>
	                    <div class="col-xl-6" style="padding-right: 0px;">
	                        <div class="card custom-card" style="overflow-y: auto;height:410px;">
	                            <div class="card-header" style="padding-top: 8px;padding-bottom: 8px;">
	                                <div class="card-title">
	                                	의약품 신청
	                                </div>
	                            </div>
	                            <div class="card-body" style="padding-left: 0px;padding-top: 5px;">
								    <table id="insertTable" class="table table-borderless text-nowrap w-100">
								        <thead> 
								            <tr>
								                <th style="width: 30%">의약품 번호</th>
								                <th>약품명</th>
								                <th style="width: 20%">수량</th>
								                <th>단위</th>
								                <th style="width: 5%;"></th>
								            </tr>
								        </thead>
								        <tbody>
								            <!-- 여기에 테이블의 내용을 추가 -->
								        </tbody>
								    </table>
								    <br/>
								    <button class="btn btn-success" id="insertBtn" style="float: right;">신청</button>
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


    
    <!-- Sweet Alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Internal Datatables JS -->
   <%--  <script src="${pageContext.request.contextPath }/resources/assets/js/datatables.js"></script> --%>

</body>
<script type="text/javascript">
	$(function() {
		
		let memberNo = ${sessionScope.user.member.memNo};
		let empName = "${sessionScope.user.member.memName}";
		
		let empNo = "";
    	
    	$.ajax({
    		url : "/nurse/getEmpInfo",
    		type : "post",
    		data : JSON.stringify({ memNo : memberNo }),
    		contentType : "application/json",
    		beforeSend: function(xhr) {
    			xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		},
    		success : function(res) {
    			console.log(res);
    			empNo = res.empNo;
    		}
    	});
		
		let table = $('#medicines').DataTable({
			ordering: true, // 초기 정렬 활성화
			order: [[2, 'asc']], // 첫 번째 열을 오름차순으로 정렬
			"lengthMenu": [[6], [7]],
			"lengthChange" : false,
			"columns": [
	            { "width": "10%"}, // 첫 번째 열의 크기를 20%로 지정
	            { "width": "50%"}, // 두 번째 열의 크기를 30%로 지정
	            { "width": "5%"}, // 두 번째 열의 크기를 30%로 지정
	            { "width": "5%"}, // 두 번째 열의 크기를 30%로 지정
	            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
	            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
	            { "width": "10%"}, // 두 번째 열의 크기를 30%로 지정
	        ],
			"language": {
		        "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Korean.json" // 한국어로 설정
		    }
		});
		
		$.ajax({
			url : "/nurse/getMedicineList",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			dataType : "json",
			success : function(res) {
				$.each(res, function(index, item) {
	                table.row.add([
	                    item.mdcinNo,
	                    item.mdcinName,
	                    item.mdcinQuantity,
	                    item.mdcinUnit,
	                    item.mdcinCompany,
	                    item.mdcinCourse,
	                    item.mdcinPrice.toLocaleString('ko-KR') + "원"
	                ]);
	            });
				table.draw();
			}
		});
		
		/* function inputNum(id) {
			let element = $('input[name=inputNum]');
			element.value = element.value.replace(/[^0-9]/gi, "");
		} */
		
		
		let addedRows = {};
		
		$('#medicines tbody').on('click', 'tr', function() {
		       var $row = $(this);
		       if (!$row.hasClass('clicked')) { // 이미 추가된 행이 아닌 경우에만 처리
		           var data = table.row(this).data();
			       let mdcinNo = data[0];
			       let mdcinName = data[1];
			       let mdcinQuantity = data[2];
			       let mdcinUnit = data[3];
			       let mdcinCompany = data[4];
			       let mdcinCourse = data[5];
			       let mdcinPrice = data[6];
		       
		           if (!(mdcinNo in addedRows)) {
			           console.log('Clicked row data:', data);
			           
			           let html = "";
			           html += "<tr>";
			           html += "	<td>"+ mdcinNo +"</td>";
			           html += "	<td>"+ mdcinName +"</td>";
			           html += "	<td><input type='number' class='form-control input-quantity'/></td>";
			           html += "	<td style='padding-left: 0px;padding-right: 0px;'>"+ mdcinUnit +"</td>";
			           html += "	<td><a href='javascript:void(0);' class='btn btn-icon btn-sm btn-danger-light product-btn'><i class='ri-close-line'></i></a></td>";
			           html += "</tr>"; 
			           $('#insertTable > tbody:last').append(html);
			           
			           addedRows[mdcinNo] = true;
		           }
		       }
		});
		
		$('#insertTable tbody').on('click', '.product-btn', function() {
		    // $(this).closest('tr').remove();
		    let $row = $(this).closest('tr');
		    let mdcinNo = $row.find('td:first').text(); // 첫 번째 열에 있는 값을 키로 사용

		    // 해당 행 제거
		    $row.remove();

		    // addedRows 객체에서 해당 키 제거
		    delete addedRows[mdcinNo];
		});
		
		$('#insertTable').on('input', '.input-quantity', function() {
		    // 입력된 값에서 숫자가 아닌 문자를 제거
		    let value = $(this).val().replace(/[^0-9]/g, '');
		    
		    if (value === '0') {
		        value = '';
		    }

		    // 입력된 값 설정
		    $(this).val(value);
		});
		
		let insertBtn = $('#insertBtn');
		insertBtn.click(function() {
			console.log('test!!');
			let insertTable = $('#insertTable');
			
			let rows = insertTable.find('tbody').children('tr');
			let rowsArray = rows.toArray();
			console.log(rows);
			console.log(rowsArray);
			
			let dataArray = [];
		    rowsArray.forEach(function(row) {
		        let rowData = {};
		        $(row).find('td').each(function(index, cell) {
		        	if (index == 0) {
						let key = "mdcinNo";
						let value = $(cell).text();
				        rowData[key] = value;
					}
		        	if (index == 2) {
						let key = "mdcinQuantity";
						let value = $(cell).find('input').val();
						console.log(value);
				        rowData[key] = value;
					}
		        	if (index == 3) {
						let key = "mdcinUnit";
						let value = $(cell).text();
				        rowData[key] = value;
					}
		        	
		        	rowData["medicineRequestperson"] = empNo;
		        });
		        dataArray.push(rowData);
		    });
		    
		    console.log("dataArray 확인");
		    console.log(dataArray);
			
			$.ajax({
				url : "/nurse/requestMedicine",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				data : JSON.stringify(dataArray),
				success : function(res) {
					console.log(res);
					if (res) {
						Swal.fire('신청 완료', '신청이 완료되었습니다.', 'success');
						let tbody = $('#insertTable > tbody');
						tbody.html("");
						getRequestList();
						
						let notidata ={
            					"code" : "requestNoti",
            					"content" :"처리 대기 중인 의약품 신청 기안이 존재합니다.",
            					"destination" : "/admin/medicineRequestList"
            			};
						ws.send(JSON.stringify(notidata));
						
						
					} else {
						Swal.fire('실패', '신청 과정 중 오류가 발생하였습니다.', 'error');
					}
					
				}
			});
		});
		
		// 의약품 신청 리스트 가져오기(비동기)
		function getRequestList() {
			$.ajax({
				url : "/nurse/getRequestResult",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					let html = "";
					$.each(res, function(index, item) {
						console.log(item);
						
						html += "<tr>";
						html += "	<td>" + item.medicineRequestVO.medicineRequestno + "</td>";
						html += "	<td class='text-truncate'>" + item.medicineRequestVO.medicineVO.mdcinName + "</td>";
						html += "	<td>" + item.medicineRequestVO.medicineRequestquantity + "</td>";
						if (item.medicineResultdate != null) {
							html += "	<td>" + item.medicineResultdate.split(" ")[0] + "</td>";
						} else {
							html += "	<td style='text-align: center;'> - </td>";
						} 
						if (item.medicineResultagree != null) {
							html += "	<td>" + item.medicineResultagree + "</td>";
						} else {
							html += "	<td></td>";
						} 
						if (item.medicineRequestVO.memName != null) {
							html += "	<td>" + item.medicineRequestVO.memName + "</td>";
						} else {
							html += "	<td style='text-align: center;'> - </td>";
						}
						/* if (item.resultEmp != null) {
							html += "	<td>" + item.resultEmp + "</td>";
						} else 	{
							html += "	<td style='text-align: center;'> - </td>";
						} */
							
						html += "</tr>";
					});
					let requestListBody = $('#requestListBody');
					requestListBody.html(html);
					
				}
			});
		}
		
		getRequestList();
		
	});
</script>

</html>