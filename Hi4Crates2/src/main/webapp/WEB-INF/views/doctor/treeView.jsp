<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/jstree.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/themes/default/style.min.css" />
<style>
    .jstree-anchor {
    font-size: 16px !important;
    line-height: 24px !important;
    height: 31px !important;
}
.texts{
font-size: 14px;
}
</style>

        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

               <!-- row start -->
               <div class="row">
                    <div class="col-xl-4">
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card" style="height:880px;">
								<div class="card-header justify-content-between">
									<div class="card-title">조직도</div>
								</div>
								<div class="card-body" style="overflow-y: auto;height: 900px;padding-left: 12px;padding-top: 12px;" >
									<div id="jstree"></div>
								</div>
							</div>
						</div>
					</div>
                    <div class="col-xl-3" style="padding-left: 0px;padding-right: 0px;">
	                    	<div class="col-xxl-12">
		                        <div class="card custom-card" style="height: 880px; margin-bottom: 12px;">
		                            <div class="card-header">
		                                <div class="card-title">
		                                
		                                    	화상회의 생성
		                                </div>
		                            </div>
		                            <div class="card-body" data-simplebar style="overflow-y: auto;">
		                            	 <div id="settingArea" style="margin-bottom: 12px; ">
			                            	 <label for="text-area" class="form-label texts">회의제목 :</label>
		               						 <input class="form-control" id="meetingTitle" style="width:260px;"/>
	                   					</div>
	                   					<div id="settingArea" style="margin-bottom: 12px; ">
			                            	 <label for="text-area" class="form-label texts" >회의 주체자 :</label>
		               						 <input class="form-control" id="meetingName" style="width:260px;"/>
	                   					</div>
	                   					<div>
	                   						<label for="text-area"  class="form-label texts">초대리스트 [ <span id="putInvitedCount">*</span>명] :</label>
	                   						<button  id="resetBtn" class="btn btn-outline-dark btn-sm btn-wave texts" >다시선택</button>
		                   					 <div class="card-body" style="overflow-y: auto;max-height: 250px; height:250px; width:270px; padding-left: -;padding-left: 0px;padding-top: 0px;padding-right: 20px;" id="radiationRoomArea">
							               		<div class="card custom-card" style="border: 1px solid #e4eaf1;height:250px; width:270px;"> 
							               		<ul class="list-group" id="inviteHTML">
												    <%-- <li class="list-group-item">
												        <div class="d-flex align-items-center">
												            <span class="avatar avatar-sm">
												                <img src="${pageContext.request.contextPath}/resources/assets/images/faces/1.jpg" alt="img">
												            </span>
												            <div class="ms-2 fw-semibold" id="inviteList">
												                
												            </div>
												        </div>
												    </li> --%>
												</ul>
												</div>
												  		
		                                	</div>
	                                	</div>
	                                	<div style="padding-top: 20px;">
											<button style="float:right;" type="button" class="btn btn-success" id="startBtn">회의 시작하기</button>
	                                	</div>
		                            </div> 
		                        </div>
	                        </div>
	                        <%-- <div class="col-xxl-12">
	                            <div class="card custom-card" style="height: 470px;">
	                                <div class="card-header">
	                                     <div class="card-title">
	                                        	초대 리스트
	                                    </div>
	                                </div>
	                                <div class="card-body" style="overflow-y: auto;" id="radiationRoomArea">
	                                  	   초대리스트
						               		<ul class="list-group" id="inviteHTML">
											    <li class="list-group-item">
											        <div class="d-flex align-items-center">
											            <span class="avatar avatar-sm">
											                <img src="${pageContext.request.contextPath}/resources/assets/images/faces/1.jpg" alt="img">
											            </span>
											            <div class="ms-2 fw-semibold" id="inviteList">
											                
											            </div>
											        </div>
											    </li>
											</ul>
					               		
					               		
	                                </div>
	                            </div>
	                        </div> --%>
                    </div>
                    <div class="col-xl-5">
                       <div class="col-xxl-12 col-xl-6">
							<div class="card custom-card" style="height:880px;">
								<div class="card-header justify-content-between">
									<div class="card-title">회의기록</div>
								</div>
								<div class="card-body" style="overflow-y: auto; height: 900px;" >
									<table class="table table-bordered text-nowrap w-100">
										<thead style="text-align: center">
											<tr>
												<th style="width: 40%">회의 날짜</th>
												<th style="width: 20%">시작 시간</th>
												<th style="width: 20%">종료 시간</th>
												<th style="width: 10%">회의 생성자</th>
												<th style="width: 10%">참여 인원</th>
											</tr>
										</thead>
										<tbody id="meetingTBody" style="text-align: center">
											
											
										</tbody>
									</table>
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
	let memberNo = ${sessionScope.user.member.memNo};
	let empName = "${sessionScope.user.member.memName}";
	
	let employeeNum = 0;
	
	$.ajax({
		url : "/doctor/meeting/getEmpInfo",
		type : "post",
		data : JSON.stringify({ memNo : memberNo }),
		contentType : "application/json",
		beforeSend: function(xhr) {
			xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success : function(res) {
			console.log(res);
			employeeNum = res.empNo;
		}
	});
	
	$("#meetingName").val(empName).prop("disabled",true);
	
	$(function() {
		
		$.ajax({
			url : "/doctor/meeting/getEmpList",
			type : "post",
			beforeSend: function(xhr) {
			        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function(res) {
				// 아이콘 수정하고 클릭이벤트 추가해서 회의 방제 설정하고 초대코드 생성해서 실시간 알림 하면 될듯?
				// 아이콘 empJob에 따라서 변경해주기
				
				console.log(res);
				$("#jstree").jstree({
		            'core': {
		                'data': res,
		                "check_callback": true,
		                themes: {
		                    dots: false // 노드 사이의 점을 표시할지 여부
		                }
		            }
		        });
			}
		});
		
		const generateRandomString = (num) => {
			  const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
			  let result = '';
			  const charactersLength = characters.length;
			  for (let i = 0; i < num; i++) {
			      result += characters.charAt(Math.floor(Math.random() * charactersLength));
			  }

			  return result;
		}
		
	    let selectedNodes = {};
		
		let startBtn = $('#startBtn').click(function() {
			// 무작위 문자열 생성해서 회의 alias 설정하기(초대링크)
			let meetingTitle = $('#meetingTitle').val();
			let randomStr = generateRandomString(10);
			console.log(meetingTitle);
			console.log(randomStr);
			// 초대 링크 구성해서 사용자들에게 알림 전달해주면 될듯?
			console.table(selectedNodes);
			
			// 여기서 회의 정보 insert하기
			let meetingUrl = "/doctor/meeting/start?roomName=" + meetingTitle + "&alias=" + randomStr;
			console.log(meetingUrl);
			const keys = Object.keys(selectedNodes);
			
			let jsonMsg = {
					"code" : "inviteMeeting",
					"empNoList" : keys,
					"url" : meetingUrl
			}
			console.table(jsonMsg);
			// 이동하기 전에 실시간 알림 띄워주기	
			ws.send(JSON.stringify(jsonMsg));
			
			location.href = meetingUrl;
		});
		
		
	    let invitedUsers = 0; // 초대된 사용자 수
	    
		$('#jstree').on("select_node.jstree", function (e, data) {
	    	console.log("select", data.node);
	    	let empNo = data.node.id;
	    	let text = data.node.text;
	    	
	    	if (empNo == employeeNum) {
	    		alert("본인은 선택할 수 없습니다!");
	    		// 선택을 취소하고 다른 동작을 중지합니다.
	    		$('#jstree').jstree('deselect_node', data.node);
	    		return false; // 이벤트 중지
			}
	    	
	    	console.log("empNo : " + empNo);
	    	console.log("text : " + text);
	    	
	    	/* 
	    	<li class="list-group-item">
	        <div class="d-flex align-items-center">
	            <span class="avatar avatar-sm">
	                <img src="${pageContext.request.contextPath}/resources/assets/images/faces/1.jpg" alt="img">
	            </span>
	            <div class="ms-2 fw-semibold" id="inviteList">
	                
	            </div>
	        </div>
	    </li> */ 
	    	
	    	
	    	if (!selectedNodes[empNo]) {
	            selectedNodes[empNo] = text;
	            
	            
	            invitedUsers++; // 초대된 사용자 수 증가
	            updateInvitedUsersCount(); // 초대된 사용자 수 업데이트
	            
	            // 선택한 노드 정보를 div 영역에 추가
	            // 추가된 사용자에게 알림 전송하기(초대링크 보내주기)
	            // ~( ^0^ )/ 현흠 하이 ! 이거 임시로 로그인한사람 프로필 넣어놨는데 
	            // 클릭한 사람의 memNo로 가져오면된대
	            var html =
	            '<li class="list-group-item">'+
	            '<div class="d-flex align-items-center">'+
	            '<span class="avatar avatar-sm">'+
	            '<img src="/file/showprofile/${sessionScope.user.member.memNo }">'+
	            '</span>'+
	            '<div class="ms-2 fw-semibold" id="inviteList">'+
	            '<input type="hidden" value="' + empNo + '" />' + text +
	            '<a href="javascript:void(0);" class="btn btn-icon btn-sm btn-danger-light product-btn"><i class="ri-close-line"></i></a>'+
	            
	            '</div>'+
	            '</div>'+
	            '</li>';
	            
	            
	            //$("#inviteHTML").append("<div><input type='hidden' value='" + empNo + "' />" + text + "</div>");
	            $("#inviteHTML").append(html);
	            console.log(selectedNodes);
	            
		   		// 여기에 추가적인 로직을 넣어 추가된 사용자에게 알림을 전송하거나 기타 처리를 할 수 있습니다.
	        }
	    });
		
		// 삭제버튼 클릭시 추가한 html 삭제
		$('#inviteHTML').on('click', '.product-btn', function() {
		    $(this).closest('.list-group-item').hide();
		    invitedUsers--; // 초대된 사용자 수 감소
		    updateInvitedUsersCount(); // 초대된 사용자 수 업데이트
		    
		});
		
		$("#resetBtn").on("click",function(){
			 // 모든 초대된 사용자 제거
		    $("#inviteHTML").empty();	
			resetSelectedNodes();
			
		})
		
		// 초대된 사용자 수 업데이트 함수
		function updateInvitedUsersCount() {
		    $('span[id=putInvitedCount]').html(invitedUsers);
		}
		
		function resetSelectedNodes() {
		    selectedNodes = {}; // 선택된 노드 초기화
		    invitedUsers = 0; // 초대된 사용자 수 초기화
		    updateInvitedUsersCount(); // 초대된 사용자 수 업데이트
		    
		}
		
		function getMeetingRecord() {
			$.ajax({
				url : "/doctor/meeting/getMeetingRecord",
				type : "post",
				beforeSend: function(xhr) {
				        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function(res) {
					console.log("회의기록 불러오기");
					console.log(res);

					let meetingTBody = $('#meetingTBody');
					let html = "";
					if (res.length == 0) {
						// 화상회의 기록 없다고 띄워주기
						html += "<tr><td colspan='5'>회의 기록이 존재하지 않습니다.</td></tr>";
						// meetingRecordArea.html(html);
					} else {
						$.each(res, function(index, item) {
							let meetingNo = item.meetingNo;
							let meetingDate = item.meetingDate;
							let meetingStarttime = item.meetingStarttime;
							let meetingEndtime = item.meetingEndtime;
							let meetingStarter = item.meetingStarter;
							let meetingPersoncount = item.meetingPersoncount;
							
							// 회의 기록 내용 추가하기
							html += "<tr>"
							html += 	"<td>" + meetingDate.split(" ")[0] + "</td>";
							html += 	"<td>" + meetingStarttime + "</td>";
							html += 	"<td>" + meetingEndtime + "</td>";
							html += 	"<td>" + meetingStarter + "</td>";
							html += 	"<td>" + meetingPersoncount + "</td>";
							html += "</tr>"
						});
					}
					meetingTBody.html(html);
				}
			});
		}
		
		getMeetingRecord();
		
	});
</script>

</html>