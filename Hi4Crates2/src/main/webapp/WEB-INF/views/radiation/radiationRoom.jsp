<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xl-9">
                        <div class="card custom-card" style="height: 77vh;">
                            <div class="card-header">
                                <div class="card-title d-flex flex-wrap justify-content-between align-items-center" id="rocName">
                                	<div class="mr-4">
	                                   	 ${radiationRoomInfo.rocName }	<!-- 좔영중인 환자 정보, 사용여부 넣기 -->
                                	</div>
                                	<!-- 띄어쓰기 줄 예정 -->
                                   	 <div id="patntInfo"></div> 
                                </div>
                            </div>
                            <div class="card-body d-flex flex-column align-items-stretch" >
                            <div>
                                <div class="flex-grow-1">
                                    <div>
                                    	<!-- 
                                    	캠 영역 크기 다시 맞출것!!!
                                    	캡쳐 사진 업로드
                                    	 -->
                                        <video class="player" style="height: 430px; width: 80%;"></video>
                                        <div class="photobooth">
                                            <canvas class="photo" hidden></canvas>
                                            <div class="strip"></div>
                                        </div>
                                        <audio class="snap" src="https://wesbos.com/demos/photobooth/snap.mp3" hidden></audio>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="card-body d-flex justify-content-end">
                                    	<div style="width: 50px;height: 40px;margin-right: 10px;">
                                        	<input type="button" name="" class="btn btn-info " id="" value="촬영" onclick="takePhoto()" />
                                        </div>
                                        <span>&nbsp;</span>
                                        <div style="width: 50px; height: 40px;">
                                        	<input type="button" name="" class="btn btn-success " id="submitBtn" value="촬영완료"  />
                                    	</div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3">
                        <div class="row">
                            <div class="col-xl-12" style="padding-left: 0px;">
                                <div class="card custom-card" style="height: 77vh;">
                                    <div class="card-header d-flex justify-content-between"> 
									    <div class="card-title">
									        <span>안내방송</span>
									    </div>  
									    <button type="button" class="btn btn-sm btn-info" data-bs-toggle="modal"
    										data-bs-target="#formmodal"><i class="ri-edit-line"></i>안내방송 관리</button>
									</div>
                                    <div class="card-body d-flex flex-column">
                                        <div class="table-responsive">
                                            <table class="table text-nowrap" id="commentTable">
                                                <tbody>
                                                	<c:choose> 
                                                		<c:when test="${empty commentList }">
                                                			<tr>
                                                				<td>
                                                					등록된 코멘트가 없습니다.
                                                				</td>
                                                			</tr>
                                                		</c:when>
                                                		<c:otherwise>
                                                			<c:forEach items="${commentList }" var="commList">
                                                				<tr>
                                                					<td>
                                                						${commList.commentSequence }.
                                                					</td>
                                                					<td>
                                                						${commList.commentContent }
                                                					</td>
                                                				</tr>
                                                			</c:forEach>
                                                		</c:otherwise>
                                                	</c:choose>
                                                </tbody>
                                            </table>
                                            <br/>
                                            <!-- 추가 수정 삭제 어떻게 할건지 생각해보기 -->
                                            <div class="d-flex align-items-center">
                                            	<input type="text" id="commInput" class="form-control me-1" placeholder="직접 입력"/>
                                            	<input type="button" id="addBtn" class="btn btn-success btn-sm me-1" value="입력"/>
                                            </div>
                                            <br/>
                                        </div>
                                        <div>
                                            <br/>
                                            <div class="d-flex justify-content-center">
                                                <textarea name="" id="textarea" cols="40" rows="5" disabled 
                                                    placeholder="멘트 출력 부분" style="resize: none; border: none;"></textarea>
                                            </div>
                                            <hr/>
                                            <div class="col text-end">
                                                <input type="button" class="form-control btn btn-warning" id="voiceBtn" value="안내방송">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="formmodal" tabindex="-1"
                                        aria-labelledby="exampleModalToggleLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <!-- <div class="modal-header">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div> -->
                                    <div class="modal-body">
                                    	<table class="table table-borderless text-center">
                                    		<thead>
            	                        		<tr>
        	                            			<th>순번</th>
    	                                			<th style="width : 87%" colspan="2">멘트</th>
	                                    		</tr>
                                    		</thead>
                                    		<tbody id="modalTbody"></tbody>
                                    		<%-- <c:choose>
                                        		<c:when test="${empty commentList }">
                                            		<tr>
                                                		<td colspan="2">
                                                			등록된 코멘트가 없습니다.
                                                		</td>
                                                	</tr>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<c:forEach items="${commentList }" var="commList">
                                            		<!-- 순번 변경방식 고민해보기 -->
                                                		<tr>
                                                			<td>
		                                               			<input type="hidden" value='${commList.commentNo }' id="commentNoInp"/>
                                                				${commList.commentSequence }
                                                			</td>
                                                			<td style="width : 65%;">
                                                				${commList.commentContent }
                                                			</td>
                                                			<td class="justify-content-center" style="width : 20%;">
	                                                			<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-warning-light" data-bs-toggle="modal" data-bs-target="#updateFormModal"><i class="ri-edit-line"></i></a>
                                                        		<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-danger-light product-btn"><i class="ri-delete-bin-line"></i></a>
                                                			</td>
                                                		</tr>
                                                	</c:forEach>
                                            	</c:otherwise>
                                        	</c:choose> --%>
                                        	<tr>
                                                <td>
                                                	<i class ="ri-add-line"></i>
	                                            </td>
	                                            <td colspan="2">
												    <div class="input-group">
												        <input type="text" id="commentInput" class="form-control" placeholder="입력">
												        <button type="button" id="commInsertBtn" class="btn btn-sm btn-success">추가</button>
												    </div>
												</td>
	                                        </tr>
                                    	</table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">닫기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="updateFormModal" tabindex="-1"
			aria-labelledby="exampleModalToggleLabel2" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
			    <div class="modal-content">
			        <div class="modal-header">
			            <h6 class="modal-title" id="exampleModalToggleLabel2">멘트 수정</h6>
			            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                aria-label="Close"></button>
			        </div>
			        <div class="modal-body">
			            <form>
			                <div class="mb-3">
			                    <label for="recipient-name"
			                        class="col-form-label">수정할 멘트 입력:</label>
			                    <input type="text" class="form-control" id="recipient-name">
			                </div>
			            </form>
			        </div>
			        <div class="modal-footer">
			            <button type="button" class="btn btn-primary">수정</button>
			            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
		
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

	
	<!-- Picker, Custom js 에러남 -->
   

	<!-- Prism JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/prismjs/prism.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/prism-custom.js"></script>

	<!-- Modal JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/modal.js"></script>
    
	
	<!-- Sweet Alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->
	
</body>
<script>
    const video = document.querySelector('.player');
    const canvas = document.querySelector('.photo');
    const ctx = canvas.getContext('2d');
    
    let receiptNo = "";
    
    const session = window.sessionStorage;
    // 로그인 세션은 지우면 안됨!! 나중에 수정하기
    console.log("세션 지우기!");
    sessionStorage.clear();
    
    function getVideo() {
            const options = { 
                video:true, 
                audio:false 
            };  
    
            navigator.mediaDevices.getUserMedia(options)
            .then(localMediaStream => {
                video.srcObject = localMediaStream;
                video.play();
            })
            .catch(err => {
                console.error("error", err);
            });
    }
    
    function clearVideo() {
        const stream = video.srcObject;
        const tracks = stream.getTracks();
      
        tracks.forEach(track => track.stop());
        video.srcObject = null;
    
    }
    
    const strip = document.querySelector('.strip');
    const snap = document.querySelector('.snap');
    
    //make webcam image bigger and look like video
    function paintToCanvas() {
        const width = video.videoWidth;
        const height = video.videoHeight;
    
        canvas.width = width;
        canvas.height = height;
    
        // take webcam images into canvas by every 16ms (about 60 fps)
            // returning it makes it re-accessible when it has to be stopped
        return setInterval(() => {
            // draw image of 'video' from top-left corner of canvas
            ctx.drawImage(video, 0, 0, width, height);
    
            // get pixel data from top-left corner of canvas
                // returns array of rgba data
            let pixels = ctx.getImageData(0, 0, width, height);
    
            // modify pixels through filter functions
            // pixels = redEffect(pixels);
            // pixels = rgbSplit(pixels);
            // pixels = greenScreen(pixels);
    
            // put pixels back into canvas
            ctx.putImageData(pixels, 0, 0)
        }, 16);
    }
    let imgArray = [];
    let imageMap = {};
	let cnt = 0;
	function takePhoto() {
        
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const data = imageData.data;
    
        // 이미지를 반전시킵니다.
        /* for (let i = 0; i < data.length; i += 4) {
           data[i] = 255 - data[i]; // Red
           data[i + 1] = 255 - data[i + 1]; // Green
           data[i + 2] = 255 - data[i + 2]; // Blue
           // data[i + 3]는 알파 채널이므로 건드리지 않습니다.
         } */
    
        // 반전된 이미지 데이터를 캔버스에 다시 그립니다.
        ctx.putImageData(imageData, 0, 0);
          
        const reverseData = canvas.toDataURL('image/jpeg');
        const link = document.createElement('a');
        link.href = reverseData;
        link.setAttribute('download', 'undefined');
        
     	// Base64 인코딩된 이미지 URL을 Blob 객체로 변환합니다.
        const byteCharacters = atob(reverseData.split(',')[1]);
        const byteNumbers = new Array(byteCharacters.length);
        for (let i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
        }
        const byteArray = new Uint8Array(byteNumbers);
        const blob = new Blob([byteArray], { type: 'image/jpeg' });
        const blobURL = URL.createObjectURL(blob);
	
        
        
        let patntName = $('#patntInfo');
        console.log(patntName.text());
        
        // mri인지 x-ray인지 구분해주기
        // 파일이름 = mri(xray)_memNo_memName.jpg
        let fileName = "test.jpg";
        let name = "img_" + cnt;
        
        let orderSelect = $('#orderSelect');
        // 선택된 option의 값을 가져옴
        let orderNo = orderSelect.val();
        console.log(orderNo);
        
        if (!imgArray[orderNo]) {
            imgArray[orderNo] = [];
        }
        
        imgArray[orderNo].push({ name: name, data: reverseData });
        
        cnt++;
        
        alert("촬영!"); // 멘트, 알림 수정하기
        // shows thumbnail of image rather than textContent
        link.innerHTML = `<img src="${data}" alt="Selfie" />`;
        // link.textContent = "Download Image";
    
        // downloaded file's name will be 'whataface'
        link.setAttribute('download', 'whataface');
    	
        // insert 'link' as a first child of 'strip'
        // strip.insertBefore(link, strip.firstChild);
        // link.click();
        
        
    }
	
	function saveImageToSession(orderNo, imageData) {
	    // orderNo를 키로 사용하여 이미지 배열 가져오기
	    let imageArray = imageMap[orderNo] || [];
	    // 이미지 데이터를 이미지 배열에 추가
	    imageArray.push(imageData);
	    // orderNo를 키로 사용하여 이미지 배열 저장
	    imageMap[orderNo] = imageArray;
	    
	    // session에도 저장 (옵션)
	    // sessionStorage.setItem(orderNo, JSON.stringify(imageArray));
	}
	
	function sendImages() {
		// FormData에 Blob 객체를 추가합니다.
		
		// 파일과 환자정보, 사용장비 등을 넘겨주면 될듯?
		for (let i = 0; i < imgArray.length; i++) {
		    const fileName = imgArray[i].name;
		    const data = imgArray[i].data;
		    sessionStorage.setItem(fileName, data);
		}
		
	}
    
    getVideo();
    
    video.addEventListener('canplay', paintToCanvas);
    
    $(function() {
    	
		let commentTable = $('#commentTable');
		let comments = commentTable.find('td');
		let commentInput = $('#commInput');
		let textarea = $('#textarea');
		
		comments.each(function(index, el) {
			if (index % 2 == 1) {
				$(el).click(function () {
					textarea.val($(this).text().trim());
				});
			}
		});
		
		let addBtn = $('#addBtn');
		let voiceBtn = $('#voiceBtn');
		
		addBtn.click(function () {
			textarea.val(commentInput.val());
		});
		
		voiceBtn.click(function () {
			let data = {
					"voice" : {
						"languageCode" : "ko-KR"
					},
					"input" : {
						"text" : textarea.val()
					},
					"audioConfig":{
						"audioEncoding":"mp3"
					}
				}
			$.ajax({
				type:'POST',
				url : 'https://texttospeech.googleapis.com/v1/text:synthesize?key=API_KEY',
				data: JSON.stringify(data),
				dataType: 'JSON',
				contentType : "application/json; charset=UTF-8",
				success : function (res) {
					let audioFile = new Audio();
					let audioBlob = base64ToBlob(res.audioContent, "mp3");
					audioFile.src = window.URL.createObjectURL(audioBlob);
					audioFile.playbackRate = 1;
					audioFile.play();
				},
				error : function(request, status, error) {
					alert("오류 발생!!");
				}
			});
			
			function base64ToBlob(base64, fileType) {
				  let typeHeader = "data:application/" + fileType + ";base64,"; // base64 헤더 파일 유형 정의
				  let audioSrc = typeHeader + base64; 
				  let arr = audioSrc.split(",");
				  let array = arr[0].match(/:(.*?);/);
				  let mime = (array && array.length > 1 ? array[1] : type) || type;
				  // url헤더 제거하고 btye로 변환
				  let bytes = window.atob(arr[1]);
				  // 예외를 처리하고 0보다 작은 ASCII 코드를 0보다 큰 값으로 변환
				  let ab = new ArrayBuffer(bytes.length);
				  // 뷰 생성(메모리에 직접): 8비트 부호 없는 정수, 길이 1바이트
				  let ia = new Uint8Array(ab);
				  for (let i = 0; i < bytes.length; i++) {
				    ia[i] = bytes.charCodeAt(i);
				  }
				  return new Blob([ab], {
				    type: mime
				  });
				}
		});
		
		function getCommentList() {
			$.ajax({
				url : "/radiation/getCommentList",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					console.log("코멘트 리스트 가져오기");
					// 모달에 비동기로 추가하기
					let modalTbody = $('#modalTbody');
					let html = "";
					$.each(res, function(index, item) {
						console.log(item);
						html += "<tr data-comment-no='" + item.commentNo + "'>";
						html += "	<td>";
						html += "		<input type='hidden' id='commentNoInp'/>";
						html += "		" + item.commentSequence + ".";
						html += "	</td>";
						html += "	<td style='width : 65%'>";
						html += "		" + item.commentContent;
						html += "	</td>";
						html += "	<td class='justify-content-center' style='width : 20%;'>";
						html += "		<a href='javascript:void(0);' class='btn btn-icon btn-sm btn-warning-light' data-bs-toggle='modal' data-bs-target=''#updateFormModal'><i class='ri-edit-line'></i></a>";
						html += "		<a href='javascript:void(0);' class='btn btn-icon btn-sm btn-danger-light product-btn'><i class='ri-delete-bin-line'></i></a>";
						html += "	</td>";
						html += "</tr>";
						
					});
					modalTbody.html(html);
				}
				
			});
		}
		
		getCommentList();
		
		let updateBtn = $('.btn-warning-light');
		updateBtn.click(function() {
			console.log("test!!!");
			let tr = $(this).closest('tr');
			
			// 멘트 수정 방식 다시 고민해볼것!!!
			// 클릭하면 input이랑 수정 버튼 생기고 버튼 누르면 수정 되게 하는 방식 고민중

		});
		
		let deleteBtn = $('.btn-danger-light');
		$(document).on('click', '.btn-danger-light', function() {
			console.log("delete!!!");
			let tr = $(this).closest('tr');
			let commentNo = tr.data('comment-no');
			
			console.log("commentNo!!");
			console.log(commentNo);
			
			let data = {
				commentNo : commentNo	
			};
			
			Swal.fire({
				  title: '정말 삭제하시겠습니까?',
				  text: '삭제하신 데이터는 복구할 수 없습니다.',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소',
				}).then((result) => {
				  if (result.isConfirmed) {
					$.ajax({
				      	url : "/radiation/deleteComment",
				      	type : "post",
				      	contentType : "application/json",
				      	beforeSend: function(xhr) {
					        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
						},
				      	data : JSON.stringify(data),
				      	success : function (res) {
							if (res) {
								Swal.fire('삭제 완료!', '삭제되었습니다.', 'success').then(function () {
									location.reload();
								});
							} else {
								 Swal.fire('삭제 실패!', '삭제 과정 중 오류가 발생했습니다!', 'error').then(function() {
									location.reload();
								});
							}
						}
				    });
				    // 여기서 삭제 작업 수행
				  } else if (result.dismiss === Swal.DismissReason.cancel) {
				    Swal.fire('취소', '취소되었습니다.)', 'error');
				    // 취소 작업 수행 또는 아무 작업도 수행하지 않음
				  }
				});
		});
		
		let commInsertBtn = $('#commInsertBtn');
		commInsertBtn.click(function() {
			
			let commentInput = $('#commentInput');
			console.log(commentInput.val());
			let data = {
				commentContent : commentInput.val()	
			};
			
			$.ajax({
				type : 'post',
				url : "/radiation/insertComment",
				data : JSON.stringify(data),
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				contentType : "application/json",
				success : function(res) {
					if (res) {
						Swal.fire('추가 완료', '코멘트가 추가되었습니다.', 'success').then(function () {
							location.reload();
						});
					} else {
						 Swal.fire('실패', '코멘트 추가 과정 중 오류가 발생했습니다!', 'error').then(function() {
							location.reload();
						});
					}
				}
			});
		});
		
		let rocName = $('#rocName').text().trim();
		console.log(rocName);
		
		let data = {
			rocName : rocName
		};
		let rocNo = "";
		let clinicNo = "";
		$.ajax({
			url : "/radiation/inRadiationRoomPatntInfo",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function (res) {
				console.log(typeof res);
				console.log(res);
				
				let memNo = res.memNo;
				let memName = res.memName;
				let memAge = res.memAge;
				let memGender = res.memGender;
				// let orderNo = res.orderVO.orderNo;
				let orderList = res.orderList;
				let chartNo = res.chartNo;
				
				rocNo = res.radiationRoomVO.rocNo;
				receiptNo = res.receiptNo;
				clinicNo = res.clinicNo;
				
				console.log(receiptNo);
				console.log(clinicNo);
				
				if (memNo != undefined) {
					let html = "";
					html += memName + " 환자(" + memGender + ", " + memAge + "세)";
					html += "<select id='orderSelect'>";
					$.each(orderList, function(index, item) {
						console.log(item.orderNo);
						html += "<option value='" + item.orderNo + "'>" + item.orderCode + " - " + item.bodyCode + "</option>";
					})
					html += "</select>";
					sessionStorage.setItem("memName", memName);
						
					let patntInfo = $('#patntInfo');
					patntInfo.html(html);
				}
				
				sessionStorage.setItem("chartNo", chartNo);
				sessionStorage.setItem("rocNo", rocNo);
					
			}
		});
		
		let submitBtn = $('#submitBtn');
		submitBtn.click(function() {
			let patntInfo = $('#patntInfo');
			console.log(patntInfo.html());
			
			sendImagesToSession();
			
			// clinic no 넘겨주기
			let data = {
		       	historyLoc : 'LOC014',
		    	receiptNo : receiptNo,
				historyStatus : "HS005",
				radiationRoomVO : {
					rocStatus : 'ROC001',
					rocNo : rocNo
				}
		    };
			
			// 버튼 클릭 시 환자 상태 촬영 완료로 변경하고 대기실로 보내기
			$.ajax({
				url : "/radiation/updateHistory",
				type : "post",
				beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(res) {
					console.log(res);
					location.href = "/radiation/main";
				}
				
			});
		});
		
		function sendImagesToSession() {
		    // 각 orderNo에 해당하는 이미지를 세션에 저장
		    console.log(imgArray);
		    for (const orderNo in imgArray) {
		        if (imgArray.hasOwnProperty(orderNo)) {
		        	console.log(orderNo);
		            const images = imgArray[orderNo];
		            console.log(images);
		            // 각 이미지를 세션에 저장하는 로직 작성
		            sessionStorage.setItem("OD" + orderNo, JSON.stringify(images));
		        }
		    }
		}
		
	});
</script>
</html>