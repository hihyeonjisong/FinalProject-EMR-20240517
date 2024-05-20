<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xxl-2 col-xl-12">
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card" style="height:880px;">
								<div class="card-header justify-content-between">
									<div class="card-title">환자목록</div>
								</div>
								<div class="card-body" id="waitingList" style="overflow-y: auto;height: 900px;padding-left: 0px;padding-top: 5px;" >
								</div>
							</div>
						</div>
					</div>
                    <div class="col-xl-5" style="padding-left: 0px;padding-right: 0px;">
                    	<div class="row">
                    	<div class="col-xxl-6">
	                        <div class="card custom-card" style="height: 880px; margin-bottom: 12px;">
	                            <div class="card-header">
	                                <div class="card-title">
	                                    	촬영 요청서 확인
	                                </div>
	                            </div>
	                            <div class="card-body" id="orderArea" data-simplebar style="overflow-y: auto;">
	                            
	                            
	                            
	                            
	                            
	                            
                                      
                                          <ul class="list-group">
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                         	 환자명 :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memNameDetail" value=""></span>
                                                  </div>
                                              </li>
                                              
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                        	  성별[나이] :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memAgeDetail"></span>
                                                  </div>
                                              </li>
                                              <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center">
                                                      <div class="me-2 fw-semibold">
                                                       	   촬영종류[촬영부위] :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memGenderDetail"></span>
                                                  </div>
                                              </li>
                                              <!-- <li class="list-group-item">
                                                  <div class="d-flex flex-wrap align-items-center" style="">
                                                      <div class="me-2 fw-semibold">
                                                       	    촬영종류[촬영부위] :
                                                      </div>
                                                      <span class="fs-12 text-muted" id="memRegnoDetail"></span>
                                                  </div>
                                              </li> -->
                                             
                                            
 
                                          </ul>
                                          <!-- <div class="text-end">
                                        <button type="button" class="btn btn-secondary btn-wave">확인</button>
                                    </div> -->
                                    
                                                                                              
	                            
	                            
	                            	
	                            </div>
	                        </div>
                        </div>
                        <div class="col-xxl-6" style=" padding-left: 0px;">
                            <div class="card custom-card" style="height: 880px; ">
                                <div class="card-header">
                                    <div class="card-title">
                                        	방사선실 현황
                                    </div>
                                </div>
                                <div class="card-body" style="overflow-y: auto;" id="radiationRoomArea">
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="col-xl-5">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card custom-card" style="height:880px;">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="card-title">
                                           	 촬영 결과 소견서 작성
                                        </div>
                                    </div>
										
										<div class="card-body" style="margin-top: 20px;">
                                               <div class="row gy-4"  >
                                                           
                                               <!--  -->
                                               
                                               <div class="col-md-12" style="margin-top: 5px;margin-bottom: 5px;padding-left: 20px;padding-right: 20px;">
                                                   <label for="text-area" class="form-label">환자명 :</label>
                                                   <input type="text" class="form-control" id="memNameInp"/>
<!--                                                    <textarea class="form-control" id="preDiagnosisChoice" rows="1" style="width: 390px; height: 50px;"></textarea> -->
                                                </div>
                                                <div class="col-md-12" style="margin-top: 5px;margin-bottom: 5px;padding-left: 20px;padding-right: 20px;">
                                                   <label for="text-area" class="form-label">촬영 날짜 :</label>
                                                   <input type="text" class="form-control" id="recDate"/>
<!--                                                    <textarea class="form-control" id="preDiagnosisChoice" rows="1" style="width: 390px; height: 50px;"></textarea> -->
                                                </div>
                                                <div class="col-md-12" style="margin-top: 5px;margin-bottom: 5px;padding-left: 20px;padding-right: 20px;">
                                                   <label for="text-area" class="form-label">직원명 :</label>
                                                   <input type="text" class="form-control" id="empName"/>
<!--                                                    <textarea class="form-control" id="preDiagnosisChoice" rows="1" style="width: 390px; height: 50px;"></textarea> -->
                                                </div>
                                                 
                                                 <div class="col-md-12" style="margin-top: 5px;margin-bottom: 10px;padding-left: 20px;padding-right: 20px;margin-top: 0px;">
                                                   <label for="text-area" class="form-label">사용 장비 :</label>
                                                   <!-- <input type="text" class="form-control" id="useEq"/> -->
                                                   <select id="useEq" class="form-control"></select>
<!--                                                    <textarea class="form-control" id="preDiagnosisDisease" rows="1" style="width: 390px; height: 50px;"></textarea> -->
                                                </div>
                                                  <div class="col-mb-5" style="float:left;padding-left: 20px;margin-bottom: 10px;padding-right: 20px;margin-top: 0px;">
                                                      <label for="input-text" class="form-label">촬영 부위 :</label>
                                                      <select class="form-control" id="bodyCodeSelect">
                                                      	<option disabled selected value="default">촬영 부위를 선택해주세요</option>
                                    				  </select>
                                   				</select>
<!--                                                        <input type="text" class="form-control" id="preDiagnosisAllergy"  style="width: 390px; margin-right: 50px;" > -->
                                                  </div>
                                                  
                                                  <div class="col-mb-5" style="float:left;margin-bottom: 10px; padding-left: 20px; padding-right: 20px;margin-top: 0px;" >
                                                      <label for="input-text" class="form-label">기록 내용 :</label>
                                                      <textarea class="form-control" id="rocRecordcontent"></textarea>
<!--                                                        <input type="text" class="form-control" id="preDiagnosisExp"  style="width: 410px;" > -->
                                                  </div>
                                                  <div class="col-mb-5" style="float:left;margin-bottom: 10px; padding-left: 20px; padding-right: 20px;margin-top: 0px;" >
                                                      <label for="input-text" class="form-label">촬영 사진 : </label> 
                                                      
                                                      <div class="card custom-card">
                                                      	<div  id="images" style="overflow-y: auto;height: 200px;"></div> 
                                                      </div>
                                                  </div>
                                               
                                                  <!-- 버튼 -->
                                                 <!-- <div class="card-footer" style="padding-right: 10px;padding-top: 13px;margin-top: 12px;">
                                                   <button type="button" id="receiptFinalBtn" class="btn btn-secondary btn-wave" style="float: right;">접수</button>
                                               	</div> -->
                                                 <!-- 버튼넣기 -->
                                            </div>
                                            <div class="card-footer" style="padding-right: 10px;padding-top: 13px;margin-top: 12px;">
                                                   <button type="button"  class="form-control btn btn-info" id="insertRocRecord" style="float: right;">등록</button>
<!--                                                    <button type="button" id="receiptFinalBtn" class="btn btn-secondary btn-wave" style="float: right;">접수</button> -->
                                               	</div>
<!--                                         		<button type="button" class="form-control btn btn-info" id="insertRocRecord">d등록</button> -->
                                           </div>
										 
										
										
										
										
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End::row-1 -->

            </div>
        </div>
        <!-- End::app-content -->

    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

   

    <!-- Prism JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/prismjs/prism.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/prism-custom.js"></script>
    
    <!-- Modal JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/radiation_modal.js"></script>

    
    <!-- Filepond JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond/filepond.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-encode/filepond-plugin-file-encode.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-edit/filepond-plugin-image-edit.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-transform/filepond-plugin-image-transform.min.js"></script>
    
    <!-- Dropzone JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/dropzone/dropzone-min.js"></script>
    
    <!-- Fileupload JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/fileupload.js"></script>
    
    <!-- Custom JS -->
    <%-- <script src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script> --%>

</body>
<script>
	//세션에서 데이터 가져오기
	const allSessionData = {};
	let memberNo = ${sessionScope.user.member.memNo};
	let empName = "${sessionScope.user.member.memName}";
	
	console.log(memberNo);
	console.log(empName);
	
	const imageFiles = [];
	
	function previewImage(file) {
	    const reader = new FileReader();
	    reader.onload = function(event) {
	        const img = $('<img>').attr('src', event.target.result);
	        $('#images').append(img); // 미리보기 이미지를 표시할 곳에 추가
	        img.css('max-width', '450px');
	    };
	    reader.readAsDataURL(file);
	}
	
	console.log(sessionStorage.length);
	// sessionStorage의 모든 키에 대해 반복하여 값을 가져와서 객체에 저장
	for (let i = 0; i < sessionStorage.length; i++) {
	    const key = sessionStorage.key(i); // 현재 인덱스의 키 가져오기
	    const value = sessionStorage.getItem(key); // 해당 키에 대한 값 가져오기
	    
		console.log("sessionInfo");
	    console.log(key);
	    console.log(value);
	    //var date = getToday();
	    //$("#recDate").val(date)
	    
	    
	    if (key == 'memName') {
			console.log(key);
			console.log(value);
			let memNameInp = $('#memNameInp');
			memNameInp.val(value);
			
		} else if (key == 'orderNo') {
			console.log("orderNo");
			console.log(key);
			console.log(value);
			
		} else if (key.startsWith("OD")) { // 이 부분 변경해야 할듯?
			let array = JSON.parse(value);
			console.log(key);
			console.log(key.substr(2));
			let orderNo = parseInt(key.substr(2));
			console.log("여기까지는 왔나??");
			console.log(orderNo);
			// orderNo로 bodyCode 가져오면 될거 같음
			$.ajax({
				url : "/radiation/getBodyCode",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify({ orderNo : orderNo }),
				contentType : "application/json; charset=utf-8",
				success : function(res) {
					console.log("불러오기 왜 안됨???");
					console.log(res);
					
					// 가져온 bodyCode select에 추가하기
					if (res != null || res != "") {
						let newOption = $('<option>');
						newOption.text(res.orderCode + " - " + res.bodyCodeno);
						newOption.val(orderNo);
						console.log("newOption");
						console.log(newOption);
						$('#bodyCodeSelect').append(newOption);
					}
				}
			});
			
			/* console.log(array);
			$.each(array, function(index, item) {
				console.log(item);
				const blob = dataURItoBlob(item.data); // base64로 인코딩된 이미지 데이터를 Blob 객체로 변환
		        const file = new File([blob], key, { type: 'image/jpeg' }); // Blob 객체를 File 객체로 변환
		        console.log(file);
		        previewImage(file);  // 이미지 미리보기 	
			}); */
		} 
	    
	    
	    allSessionData[key] = value; // 객체에 키-값 쌍 추가
	}
	
	// 모든 sessionStorage 데이터가 담긴 객체 출력
	console.log(allSessionData);
	
	$('#bodyCodeSelect').change(function() {
		// select option 변경될 때마다 이미지 다르게 띄워주기 (데이터 있어야 테스트 가능할듯)
		$('#images').html("");
		console.log("test");
		let val = $(this).val();
		console.log(val);
		let imgs = sessionStorage.getItem("OD" + val);
		console.log(JSON.parse(imgs));
		$.each(JSON.parse(imgs), function(index, item) {
			const blob = dataURItoBlob(item.data); // base64로 인코딩된 이미지 데이터를 Blob 객체로 변환
	        const file = new File([blob], "OD" + val, { type: 'image/jpeg' }); // Blob 객체를 File 객체로 변환
	        console.log(file);
	        previewImage(file);  // 이미지 미리보기 	
		});
	});
	
	function dataURItoBlob(dataURI) {
		console.log(dataURI);
	    const byteString = atob(dataURI.split(',')[1]);
	    const mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	    const ab = new ArrayBuffer(byteString.length);
	    const ia = new Uint8Array(ab);
	    for (let i = 0; i < byteString.length; i++) {
	        ia[i] = byteString.charCodeAt(i);
	    }
	    const blob = new Blob([ab], { type: mimeString });
	    return blob;
	}
	
	//방사선 대기 환자
    function getWaitingList() {
        $.ajax({
            url: '/radiation/radiationWaitingList',
            type: 'POST',
            beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
            dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
            success: function(data) {
                // 서버에서 받은 데이터를 처리하여 HTML 업데이트
                console.log("방사선대기data:", data);
                
                //let html = '';
                let options = [
                    {value: 'LOC014', text: '대기실'},
                    {value: 'LOC010', text: '방사선실1'},
                    {value: 'LOC011', text: '방사선실2'}
                ];
                data.forEach(function(item) {
                	
                	var html =
                	    '<div class="card border custom-card" style="background-color:white;width: 105%;height: 100px;margin-left: 6px;margin-bottom: 10px;margin-top: 5px;">' +
                	    '<div class="card-header" style="height: 30px; background-color: #f6feff !important">' +
                	    '<div class="d-flex align-items-center">';

                	// 
                	html += '<span class="fw-semibold fs-13" style="position: absolute; left: 12px;">' + item.codeName + '</span>';

                	// 드롭다운 옵션
                	html += '<select class="form-select" id="statusSelect" style="position: absolute; right: 12px; width: auto; padding: 0.25rem 0.5rem; font-size: 0.855rem;">';
                	options.forEach(function(option) {
                	    if (item.historyLoc === option.value) {
                	        html += '<option value="' + option.value + '" selected>' + option.text + '</option>';
                	    } else {
                	        html += '<option value="' + option.value + '">' + option.text + '</option>';
                	    }
                	});
                	html += '</select>';

                	html += '</div>' +
                	    '</div>' +
                	    '<div class="card-body p-3" style="width: 220px;height: 150px;margin-left: 0px;margin-bottom: 0px;padding-left: 0px;">' +
                	    '<div class="d-flex  align-items-start mb-3 flex-wrap" style="">' +
                	    '<div class="d-inline-flex align-items-start position-relative pickPt">' +
                	    '<a href="#">';

                	// 환자 정보
                	html += '<div class="flex-grow-1 clickReservs" data-bs-receiptNo="' + item.receiptNo + '" id="detailMember" style="margin-top:-7px;">' +
                	    '<span class="mb-0 d-block fs-15 fw-semibold patntName waitingMemname" data-memNo="'+item.memNo+'" data-body-code="'+item.bodyCode+'" >' + item.memName + '</span>' +
                	    '<span class="fs-13 text-muted">' + item.memGender + ', ' + item.memAge + '세</span>' +
                	    '<br>';

                	// 주문 목록
                	/* item.orderList.forEach(function(orderItem) {
                	    html += '<span>' + orderItem.bodyCode + '</span><br>';
                	}); */

                	html += '</div>' +
                	    '</a>' +
                	    '</div>' +
                	    '</div>' +
                	    '<input type="hidden" value="' + item.receiptNo + '" />' +
                	    '</div>' +
                	    '</div>';

                    $('#waitingList').append(html);
                });
                
                /* $.each(data, function(index, item) {
                	console.log("orderList")
                	console.log(item);
                	console.log(item.orderList);
                	
                    html += '<div class="card border custom-card hrm-main-card primary">';
                    html += '    <div class="card-header" style="padding: 4%;">';
                    html += '        <h8 class="fw-semibold mt-1" style="padding: -10%;">' + item.codeName + '</h8>';
                    html += '    </div>';
                    html += '    <div class="card-body">';
                    html += '        <div class="d-flex align-items-top">';
                    html += '            <div class="me-3">';
                    html += '                <span class="avatar bg-primary"> <i class="ri-team-line fs-18"></i></span>';
                    html += '            </div>';
                    html += '            <div class="row">';
                    html += '                <h6 class="fw-semibold mt-1">';
                    html += '                    <a href="javascript:void(0)" id="watingMemName" data-memNo="'+item.memNo+'">' + item.memName + '</a>';
                    html += '                    <input type="hidden" value="' + item.receiptNo + '">';
                    html += '                    <select id="statusSelect">';
                    $.each(options, function(index, option) {
                        if (item.historyLoc === option.value) {
                            html += '				<option value="' + option.value + '" selected>' + option.text + '</option>';
                        } else {
                            html += '				<option value="' + option.value + '">' + option.text + '</option>';
                        }
                    });
                    html += '                    </select>'; // select 닫음
                    html += '                </h6>';
                    html += '                <div>';
                    html += '                    <span class="fs-12 mb-0">' + item.memGender + ', ' + item.memAge + '세</span>';
                    html += '                </div>';
                    html += '                <div>'; // 추가된 부분
                    $.each(item.orderList, function(index, orderItem) {
                        html += '				<span>' + orderItem.bodyCode + '</span><br>';
                    });
                    html += '                </div>'; // 추가된 부분
                    html += '            </div>';
                    html += '        </div>';
                    html += '    </div>';
                    html += '</div>';
                }); */
                // HTML 업데이트
                //$('#waitingList').html(html);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText); // 에러 처리
            }
        });
     }
     // 페이지 로드 후 처음 한 번 요청을 실행
     getWaitingList();

     // 3초마다 비동기 요청 반복 실행
     // setInterval(getWaitingList, 10000);
    
    
     //방사선 대기 환자 이름 클릭이벤트
     $(document).on('click','.waitingMemname',function(event){
     	event.preventDefault();
     	
     	let memNo = $(this).attr('data-memNo');
     	let receiptNo = $(this).closest('.clickReservs').attr('data-bs-receiptNo'); // 부모 요소인 clickReservs 클래스를 선택한 후에 데이터를 가져옵니다.
     	
     	console.log("memNo체킹:",memNo);
     	console.log("receiptNo체킹:",receiptNo);
     	let bodyCode = $(this).attr('data-body-code');
     	console.log("bodyCode체킹:",bodyCode);
     	
     	/* let data = {
     			memNo : memNo
     	}
     	 */
     	 
     	let data = {
     			receiptNo : receiptNo
     	};
     	
     	$.ajax({
     		url : "/radiation/getPatntOrder",
     		type : "post",
     		beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
     		contentType : "application/json",
     		data : JSON.stringify(data),
     		success : function (res) {
				console.log(res);
				
				// json데이터로 order 화면에 띄워주기(수정해야함)
				let orderArea = $('#orderArea');
			 	let html = "";
			        html += '<div style="padding-bottom: 20px;">';
			        html += '<ul class="list-group">';
			        html += '<li class="list-group-item" style="padding-right: 10px;">';
			        html += '<div class="d-flex flex-wrap align-items-center justify-content-between">';
			        html += '<div class="me-2 fw-semibold">';
			        html += '<span>환자명 : </span>';
			        html += '</div>';
			        html += '<div>';
			        html += '<span id="jrCost">' + res[0].memName  + '</span><span class="me-2 fw-semibold"></span>';
			        html += '</div>';
			        html += '</div>';
			        html += '</li>';
			        html += '<li class="list-group-item" style="padding-right: 10px;">';
			        html += '<div class="d-flex flex-wrap align-items-center justify-content-between">';
			        html += '<div class="me-2 fw-semibold">';
			        html += '<span>성별[나이] : </span>';
			        html += '</div>';
			        html += '<div>';
			        html += '<span  id="MRICost">' + res[0].memGender+'['+  res[0].memAge+']'+ '</span><span class="me-2 fw-semibold"></span>';
			        html += '</div>';
			        html += '</div>';
			        html += '</li>';
			 	
			 	 
			        html += '<li class="list-group-item" style="padding-right: 10px;" >';
			        html += '<div >';
			        html += '<div >';
			        html += '<div  style="margin-bottom: 8px;">';
			        html += '<div >';
			        html += '<span class="me-2 fw-semibold">촬영종류[촬영부위] : </span>';
			        html += '</div>';
			        html += '<div style="padding-right: 0px;float:right;">';
			 	for (let i = 0; i < res.length; i++) {
			        html += '<div>';
			        html += '<div>';
			        html += '<span id="XRAYCost">' + res[i].orderName+'['+ res[i].bodyName + ']'+'</span><span class="me-2 fw-semibold"></span>';
			        html += '</div>';
			       
			        
			    } 
			        html += '</div>';
			        html += '</div>';
			        html += '</div>';
			        html += '</li>';
			        html += '</ul>';
			        html += '</div>'; 

			    orderArea.html(html);
			}
     	});
     });
     
     // 방사선실 현황 비동기로 다시
     function getRadiationRoomList() {
    	 $.ajax({
    	    	url : "/radiation/radiationRoomList",
    	    	type : "get",
    	    	beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
    	    	success : function (res) {
    	    		console.log(res);
    	    		
    				let radiationRoomArea = $('#radiationRoomArea');
    				let html = "";
    				$.each(res, function(index, item) {
    					console.log(item);
    					html += '<div class="card border border custom-card" style="width:200px; height:100px; margin-bottom: 0px;">';
    					html += '<div class="card-body">';
    					html += '<div class="d-flex align-items-center">';
    					html += '	<div class="orders-delivery-address">';
    					html += '		<a href="/radiation/radiationRoom?roomNo='+item.rocNo+'">';
    					html += '			<p class="mb-1 fw-semibold">'+item.rocName+'</p>';
    					html += '		</a>';
    					html += '		<p class="text-muted mb-0">';
    					if (item.memName != null || item.memName == "") {
	    					html += '			 ' + item.memName;
	    					html += '			 환자 촬영중';
						} else {
							html += "";
						}
    					html += '		</p>';
    					html += '	</div>';
    					html += '	<div class="ms-auto">';
    					if (item.rocStatus.trim() == "ROC002") {
	    					html += '		<span class="badge bg-danger">'+item.rocStatusname+'</span>';
						} else if(item.rocStatus.trim()=="ROC001") {
	    					html += '		<span class="badge bg-info">'+item.rocStatusname+'</span>';
						}
    					html += '	</div>';
    					html += '	</div>';
    					html += '</div>';
    					html += '</div>';
    					html += '<br/>';
    				});
    				radiationRoomArea.html(html);
    			}
    	 });
	 }
     
     // 페이지 로드 시 한번 실행
     getRadiationRoomList();
     
     // 일정 시간마다 반복실행(상태 업데이트 될때마다 실행되게 하기)
     // setInterval(getRadiationRoomList, 10000);
    
  // select의 부모 요소에 이벤트 위임
  	let preRoomNo;
     $('#waitingList').on('change', 'select', function() {
    	 
         let locCodeNo = $(this).val();
         console.log('Selected value:', locCodeNo);
         let historyStatus = "HS001"; // 대기중
         
         let rocStatus = "ROC001"; // 촬영가능
         let rocNo = 1;
         
         if (locCodeNo == "LOC010" || locCodeNo == "LOC011") { // 방사선1, 방사선2
        	 historyStatus = "HS004"; // 촬영중
        	 rocStatus = "ROC002" // 촬영중
        	 
        	 if (locCodeNo == "LOC011") {
				rocNo = 2;
			}
		}
         
         if (locCodeNo == 'LOC014') { // 방사선대기실
			rocNo = preRoomNo;
		}
         
         preRoomNo = rocNo;
         
         let $parentDiv = $(this).closest('.row');
         let $input = $parentDiv.find('input[type="hidden"]');
         
         // 가져온 input의 값 출력
         let receiptNo = $(this).closest('.card').find('input[type="hidden"]').val();
         console.log(receiptNo);
         console.log(rocStatus);
         
         let data = {
        	historyLoc : locCodeNo,
        	receiptNo : receiptNo,
			historyStatus : historyStatus,
			radiationRoomVO : {
				rocStatus : rocStatus,
				rocNo : rocNo
			}
         };
         
         // history update 
         $.ajax({
        	url : "/radiation/updateHistory",
        	type : "post",
        	beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
        	data : JSON.stringify(data),
        	contentType : "application/json",
        	success : function(res) {
				console.log("업데이트 성공함?", res);
				if (res) {
					getRadiationRoomList();
				}
			}
        	 
         });
         
         
     });
     
     let empNo = "";
     
     $.ajax({
    	url : "/radiation/getEmpInfo",
    	type : "post",
    	data : JSON.stringify({ memNo : memberNo }),
    	contentType : "application/json",
    	beforeSend: function(xhr) {
	        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
    	success : function(res) {
			console.log("getEmpInfo:",res);
			empNo = res.empNo;
		}
     });
     
     
     	let selectedOptions = [];
     	
     	console.log("asdf");
     	console.log(selectedOptions);
     	
	    let allOptions = "";
     	$(document).ready(function() {
     	    // 페이지가 로드될 때 실행되는 코드

	     	allOptions = $('#bodyCodeSelect option').length - 1;
     	    
     	    console.log("옵션의 개수: " + allOptions);
     	});
     	
     	console.log(allOptions);
     
        let insertRocRecordBtn = $('#insertRocRecord');
        insertRocRecordBtn.click(function() {
			// 여기서 입력한 값들과 파일을 formData로 전송하기
			// formData에 담아서 전송!!!
			console.log("insertBtn!!!");
			// FormData 객체 생성
			const formData = new FormData();
			
			let orderNo = $('#bodyCodeSelect').val();
			
			if (selectedOptions.includes(orderNo)) {
		        console.log(orderNo + '은(는) 이미 선택되었습니다.');
		        return;
		    }
			
			formData.append("orderNo", orderNo);
			
			let fileDataArray = [];
			
			// sessionStorage에 있는 파일과 데이터를 FormData에 추가
			for (let i = 0; i < sessionStorage.length; i++) {
			    let key = sessionStorage.key(i); // 현재 인덱스의 키 가져오기
			    let value = sessionStorage.getItem(key); // 해당 키에 대한 값 가져오기
			    
			    // 이미지나 파일 구분할 수 있는 키로 가져오는거 수정하기
			    if (key == 'memName') {
			        formData.append(key, value); // 데이터 추가
			    } else if (key == "OD" + orderNo) {
			    	console.log(key);
			    	console.log(value);
			    	$.each(JSON.parse(value), function (index, item) {
			    		console.log(item.name);
				        var blob = dataURItoBlob(item.data); // base64로 인코딩된 이미지 데이터를 Blob 객체로 변환
				        console.log("blob!!!");
				        console.log(blob);
				        var file = new File([blob], item.name, { type: 'image/jpeg' }); // Blob 객체를 File 객체로 변환
				        fileDataArray.push({ key: item.name, value: file });
					});
			    }
			}
			
			console.log("array!");
			console.log(fileDataArray);
			
			for (let i = 0; i < fileDataArray.length; i++) {
				console.log(fileDataArray[i].value);
				formData.append("files", fileDataArray[i].value, fileDataArray[i].key + ".jpg");
			}
			
			let useEq = $('#useEq').val();
			let rocRecordcontent = $('#rocRecordcontent').val();
			
			formData.append("rocEqno", useEq);
			formData.append("rocRecordcontent", rocRecordcontent);
			formData.append("rocNo", sessionStorage.getItem("rocNo"));
			formData.append("chartNo", sessionStorage.getItem("chartNo"));
			formData.append("empNo", empNo);
			
			for (let key of formData.keys()) {
			    console.log("Key:", key);
			    const values = formData.getAll(key); // 같은 키의 모든 값을 배열로 가져옴
			    console.log("Values:", values);
			    values.forEach(value => {
			        console.log(key, ":", value); // 각 값을 출력
			    });
			}
			
       	  $.ajax({
     		url : "/radiation/insertRocRecord",
     		type : "post",
     		data : formData,
     		beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
     		dataType : "text",
     		processData : false,
     		contentType : false,
     		async : false,
     		success : function(res) {
     			console.log(res);
     			
     			if (res) {
     				
	     			selectedOptions.push(orderNo);
	     			
	     			
	     			console.log(selectedOptions.length);
	     			console.log(allOptions);
	     			
	     			// 기록 내용, 이미지 영역, select 초기화
	     			$('#rocRecordcontent').val("");
	     			$('#images').html("");
	     			$('#bodyCodeSelect').val('default');
	     			
	     			// 기록 작성 알림
					alert('작성 완료');
	     			
	     			if (selectedOptions.length === allOptions) {
		     			// 성공하면 sweetalert 띄워주고 환자 위치, 상태 업데이트(clinicNo 받아서 보내주기)
		     			// 실패 시 sweetalert만
		     			// "success", "fail"에 따라 처리해주기
		     			
	                    alert("모든 촬영 결과 기록이 완료되었습니다.");
		     			
	                    // 세션 지우기
	                    sessionStorage.clear();
	                    
	                    console.log(orderNo);
	                    let clinicNo = "";
	                    let receiptNo = "";
	                    
	                    // orderNo로 clinicNo 구하기
	                    $.ajax({
	                    	url : "/radiation/getClinicNo",
	                    	type : "post",
	                    	data : JSON.stringify({ orderNo : orderNo }),
	                    	beforeSend: function(xhr) {
	            		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	            			},
	            			async : false,
	            			contentType : "application/json",
	            			success : function(res) {
	            				console.log("이거 왜 안됨???");
								console.log(res);
								clinicNo = res.clinicNo;
								receiptNo = res.receiptNo;
							}
	                    });
	                    
	                    console.log(clinicNo);
	                    console.log(receiptNo);
	                    
	                    // 환자 상태 업데이트
	                    // clinic no 넘겨주기
	                    let data = {
	                    	historyLoc : clinicNo,
	                    	receiptNo : receiptNo,
	                    	historyStatus : "HS001"
	                    };
	                    
	                    $.ajax({
	                    	url : "/radiation/updatePatntHistory",
	                    	type : "post",
	                    	data : JSON.stringify(data),
	                    	beforeSend: function(xhr) {
	            		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	            			},
	            			contentType : "application/json",
	            			success : function(res) {
								console.log(res);
								if (res) {
									location.reload();
								}
							}
	                    });
						
	                    
	                }
				}
     			
     			
     		}
     	});
       	  
       	  
       /* 	function getToday(){
       		var date  = new Date();
       		var year = date.getFullYear();
       		var month = ("0" + (1 + date.getMonth())).slice(-2);
       		var day = ("0" + date.getDate()).slice(-2);
       		
       		return year +"-"+ month +"-"+ day;
       	} */
		
	});
        
       /*  $(document).ready(function(){
            // 현재 날짜를 가져오는 함수
            function getCurrentDate() {
                var date = new Date();
                var year = date.getFullYear();
                var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 1월부터 시작하므로 +1을 해주고, 두 자리로 만듭니다.
                var day = date.getDate().toString().padStart(2, '0'); // 두 자리로 만듭니다.
                return year + "-" + month + "-" + day; // YYYY-MM-DD 형식으로 반환합니다.
            } */
            var today = new Date();
            // recDate 필드에 현재 날짜를 넣기
            $("#recDate").val(formatDate(today)).prop("disabled",true);
            //$("#recDate").val(getCurrentDate()).prop("disabled",true);
            
            //직원명 넣기
            $("#empName").val(empName).prop("disabled",true);
//         });
        
        // 사용장비 불러와서 select에 넣기(수리중인거는 선택 안되거나 안불러오기)
         $.ajax({
        	url : "/radiation/getEquipList",
        	type : "post",
        	beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function(res) {
				console.log("장비 목록");
				console.log(res);
				
				let useEq = $('#useEq');
				$.each(res, function(index, item) {
					let newOption = $('<option>', {
					    value: item.eqNo, // 옵션 값
					    text: item.eqLoc + " - " + item.eqName // 옵션 텍스트
					});
					useEq.append(newOption);
				});
			}
        });
</script>

</html>