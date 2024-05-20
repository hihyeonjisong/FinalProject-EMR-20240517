<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.lbr-20 {
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
}

.rbr-20 {
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
}

.wm400 {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<div class="page">
	<!-- app-header -->
	<!-- /app-header -->

	<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">
			<div class="main-chart-wrapper p-2 gap-2 d-lg-flex">
				<div class="chat-info border">
					<a aria-label="anchor" href="#"
						class="btn btn-secondary btn-icon rounded-circle chat-add-icon"
						data-bs-toggle="dropdown" id="startChat"> <i
						class="ri-add-line"></i>
					</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item" data-bs-effect="effect-scale"
							data-bs-toggle="modal" href="#soloModal" id="soloChat">개인 채팅</a></li>
						<li><a class="dropdown-item" data-bs-toggle="modal"
							href="#groupModal" id="groupChat">그룹 채팅</a></li>
					</ul>
					<div
						class="d-flex align-items-center justify-content-between w-100 p-3 border-bottom">
						<div>
							<h5 class="fw-semibold mb-0">채팅</h5>
						</div>
					</div>
					<div class="chat-search p-3 border-bottom">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0"
								placeholder="검색" aria-describedby="button-addon2">
							<button aria-label="button" class="btn btn-light" type="button"
								id="button-addon2">
								<i class="ri-search-line text-muted"></i>
							</button>
						</div>
					</div>
					<ul
						class="nav nav-tabs tab-style-2 nav-justified mb-0 border-bottom d-flex"
						id="myTab1" role="tablist">
						<li class="nav-item border-end me-0" role="presentation">
							<button class="nav-link active h-100" id="users-tab"
								data-bs-toggle="tab" data-bs-target="#users-tab-pane"
								type="button" role="tab" aria-controls="users-tab-pane"
								aria-selected="true">
								<i class="ri-history-line me-1 align-middle d-inline-block"></i>개인
							</button>
						</li>
						<li class="nav-item border-end me-0" role="presentation">
							<button class="nav-link h-100" id="groups-tab"
								data-bs-toggle="tab" data-bs-target="#groups-tab-pane"
								type="button" role="tab" aria-controls="groups-tab-pane"
								aria-selected="false">
								<i class="ri-group-2-line me-1 align-middle d-inline-block"></i>그룹
							</button>
						</li>
						<li class="nav-item border-end me-0" role="presentation">
							<button class="nav-link h-100" id="calls-tab"
								data-bs-toggle="tab" data-bs-target="#calls-tab-pane"
								type="button" role="tab" aria-controls="calls-tab-panee"
								aria-selected="false">
								<i class="ri-group-fill me-1 align-middle d-inline-block"></i>회원
							</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active border-0 chat-users-tab"
							id="users-tab-pane" role="tabpanel" aria-labelledby="users-tab"
							tabindex="0">
							<ul class="list-unstyled mb-0 mt-2 chat-users-tab soloChatList"
								id="chat-msg-scroll">
								<!-- 안읽은 리스트 -->
							</ul>
							<ul class="list-unstyled mb-0 mt-2 chat-users-tab allChatList">
								<!-- 읽은 채팅방 리스트 -->
							</ul>
						</div>
						<div class="tab-pane fade border-0 chat-groups-tab"
							id="groups-tab-pane" role="tabpanel" aria-labelledby="groups-tab"
							tabindex="0">
							<ul class="list-unstyled mb-0 mt-2 ">
								<li class="pb-0">
									<p class="text-muted fs-11 fw-semibold mb-1 op-7">GROUP
										CHATS</p>
								</li>
								<li class="checkforactive"><a href="javascript:void(0);"
									onclick="changeTheInfo(this,'Family Together &#128525;','18','online')">
										<div class="d-flex align-items-top">
											<div class="me-1 lh-1">
												<span class="avatar avatar-md online me-2 avatar-rounded">
													<img
													src="${pageContext.request.contextPath }/resources/assets/images/faces/17.jpg"
													alt="img">
												</span>
											</div>
											<div class="flex-fill">
												<p class="mb-0 fw-semibold">
													Family Together &#128525; <span
														class="float-end text-muted fw-normal fs-11">12:24PM</span>
												</p>
												<p class="fs-12 mb-0 chat-msg-typing ">
													<span class="chat-msg text-truncate">Hira Typing...</span>
													<span class="chat-read-icon float-end align-middle"><i
														class="ri-check-double-fill"></i></span> <span
														class="badge bg-success-transparent rounded-circle float-end">2</span>
												</p>
											</div>
										</div>
								</a></li>
								<li class="chat-msg-unread checkforactive"><a
									href="javascript:void(0);"
									onclick="changeTheInfo(this,'Work Buddies','19','online')">
										<div class="d-flex align-items-top">
											<div class="me-1 lh-1">
												<span class="avatar avatar-md online me-2 avatar-rounded">
													<img
													src="${pageContext.request.contextPath }/resources/assets/images/faces/18.jpg"
													alt="img">
												</span>
											</div>
											<div class="flex-fill">
												<p class="mb-0 fw-semibold">
													Work Buddies <span
														class="float-end text-muted fw-normal fs-11">1:16PM</span>
												</p>
												<p class="fs-12 mb-0">
													<span class="chat-msg text-truncate"><span
														class="group-indivudial">Rams:</span>Happy to be part of
														this group</span> <span
														class="chat-read-icon float-end align-middle"><i
														class="ri-check-double-fill"></i></span>
												</p>
											</div>
										</div>
								</a></li>
								<li class="chat-inactive checkforactive"><a
									href="javascript:void(0);"
									onclick="changeTheInfo(this,'Friends Forever &#128526;','20','offline')">
										<div class="d-flex align-items-top">
											<div class="me-1 lh-1">
												<span class="avatar avatar-md offline me-2 avatar-rounded">
													<img
													src="${pageContext.request.contextPath }/resources/assets/images/faces/19.jpg"
													alt="img">
												</span>
											</div>
											<div class="flex-fill">
												<p class="mb-0 fw-semibold">
													Friends Forever &#128526; <span
														class="float-end text-muted fw-normal fs-11">3 days
														ago</span>
												</p>
												<p class="fs-12 mb-0">
													<span class="chat-msg text-truncate">Simon,Melissa,Amanda,Patrick,Siddique</span>
													<span class="chat-read-icon float-end align-middle"><i
														class="ri-check-double-fill"></i></span>
												</p>
											</div>
										</div>
								</a></li>
								<li class="chat-inactive checkforactive"><a
									href="javascript:void(0);"
									onclick="changeTheInfo(this,'Social Media Deals','21','offline')">
										<div class="d-flex align-items-top">
											<div class="me-1 lh-1">
												<span class="avatar avatar-md offline me-2 avatar-rounded">
													<img
													src="${pageContext.request.contextPath }/resources/assets/images/faces/20.jpg"
													alt="img">
												</span>
											</div>
											<div class="flex-fill">
												<p class="mb-0 fw-semibold">
													Social Media Deals <span
														class="float-end text-muted fw-normal fs-11">5 days
														ago</span>
												</p>
												<p class="fs-12 mb-0">
													<span class="chat-msg text-truncate">Kamalan,Subha,Ambrose,Kiara,Jackson</span>
													<span class="chat-read-icon float-end align-middle"><i
														class="ri-check-double-fill"></i></span>
												</p>
											</div>
										</div>
								</a></li>
								<li class="chat-inactive checkforactive"><a
									href="javascript:void(0);"
									onclick="changeTheInfo(this,'Apartment Group','22','offline')">
										<div class="d-flex align-items-top">
											<div class="me-1 lh-1">
												<span class="avatar avatar-md offline me-2 avatar-rounded">
													<img
													src="${pageContext.request.contextPath }/resources/assets/images/faces/21.jpg"
													alt="img">
												</span>
											</div>
											<div class="flex-fill">
												<p class="mb-0 fw-semibold">
													Apartment Group <span
														class="float-end text-muted fw-normal fs-11">12
														days ago</span>
												</p>
												<p class="fs-12 mb-0">
													<span class="chat-msg text-truncate">Subman,Rajen,Kairo,Dibasha,Alexa</span>
													<span class="chat-read-icon float-end align-middle"><i
														class="ri-check-double-fill"></i></span>
												</p>
											</div>
										</div>
								</a></li>
							</ul>
						</div>

						<div class="tab-pane fade border-0 chat-calls-tab solList"
							id="calls-tab-pane" role="tabpanel" aria-labelledby="calls-tab"
							tabindex="0">
							<ul class="list-unstyled mb-0 mt-2 chat-calls-tab"
								id="onlineList">
								<!-- 온라인 목록 -->
							</ul>
							<ul class="list-unstyled mb-0 mt-2 chat-calls-tab"
								id="offlineList">
								<!-- 오프라인  -->
							</ul>
						</div>
					</div>
				</div>
				<div class="main-chat-area border">
					<div class="d-flex align-items-center p-2 border-bottom">

						<div class="me-2 lh-1 soloChatStatus">

							<!-- online or offline 표시로 초록불 -->
							<span id="headerStatus"
								class="avatar avatar-lg offline me-2 avatar-rounded chatstatusperson">
								<img class="chatimageperson headerPr"
								src="${pageContext.request.contextPath }/resources/assets/images/faces/2.jpg"
								alt="img">
							</span>
						</div>

						<div class="flex-fill chatPartner">
							<p class="mb-0 fw-semibold fs-14">
								<a href="javascript:void(0);"
									class="chatnameperson responsive-userinfo-open headerPersonName">클릭한 상대 이름</a>
							</p>
							<p class="text-muted mb-0 chatpersonstatus headerPersonStatus">online or offline</p>
						</div>

						<div class="d-flex flex-wrap rightIcons">
							<button aria-label="button" type="button"
								class="btn btn-icon btn-outline-light my-1 ms-2">
								<i class="ti ti-phone"></i>
							</button>
							<button aria-label="button" type="button"
								class="btn btn-icon btn-outline-light my-1 ms-2">
								<i class="ti ti-video"></i>
							</button>
							<button aria-label="button" type="button"
								class="btn btn-icon btn-outline-light my-1 ms-2 responsive-userinfo-open">
								<i class="ti ti-user-circle" id="responsive-chat-close"></i>
							</button>
							<div class="dropdown ms-2">
								<button aria-label="button"
									class="btn btn-icon btn-outline-light my-1 btn-wave waves-light"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="ti ti-dots-vertical"></i>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="javascript:void(0);">Profile</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);">Clear
											Chat</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);">Delete
											User</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);">Block
											User</a></li>
									<li><a class="dropdown-item" href="javascript:void(0);">Report</a></li>
								</ul>
							</div>
							<button aria-label="button" type="button"
								class="btn btn-icon btn-outline-light my-1 ms-2 responsive-chat-close">
								<i class="ri-close-line"></i>
							</button>
						</div>
					</div>
					<!-- 채팅 메인 -->
					<div class="chat-content" id="main-chat-content">
						<ul class="list-unstyled chatMain">



						</ul>
					</div>
					<!-- 채팅 메인 끝 -->
					<div class="chat-footer">
						<input class="form-control" placeholder="채팅을 입력해주세요..."
							type="text" id="chatMessage"> <a aria-label="anchor"
							class="btn btn-icon mx-2 btn-success-light"
							href="javascript:void(0)"> <i class="ri-emotion-line"></i>
						</a> <a aria-label="anchor" class="btn btn-primary btn-icon btn-send"
							href="javascript:void(0)"> <i class="ri-send-plane-2-line"></i>
						</a>
					</div>
				</div>
				<!-- 오른쪽 사이드 -->
				<div class="chat-user-details border" id="chat-user-details">
					<button aria-label="button" type="button"
						class="btn btn-icon btn-outline-light my-1 ms-2 responsive-chat-close2">
						<i class="ri-close-line"></i>
					</button>
					<div class="text-center mb-5">
						<span
							class="avatar avatar-rounded offline avatar-xxl me-2 mb-3 chatstatusperson">
							<img class="chatimageperson"
							src="${pageContext.request.contextPath }/resources/assets/images/faces/2.jpg"
							alt="img">
						</span>
						<p class="mb-1 fs-15 fw-semibold text-dark lh-1 chatnameperson">상대방
							정보</p>
						<p class="fs-12 text-muted">
							<span class="chatnameperson">emaileyjackson2134</span>@gmail.com
						</p>
						<!-- <p class="text-center mb-0">
                                <button type="button" aria-label="button" class="btn btn-icon rounded-pill btn-primary-light"><i
                                        class="ri-phone-line"></i></button>
                                <button type="button" aria-label="button" class="btn btn-icon rounded-pill btn-primary-light ms-2"><i
                                        class="ri-video-add-line"></i></button>
                                <button type="button" aria-label="button" class="btn btn-icon rounded-pill btn-primary-light ms-2"><i
                                        class="ri-chat-1-line"></i></button>
                            </p> -->
					</div>
					<div class="mb-5">
						<div class="fw-semibold mb-4">
							공유한 파일 <span
								class="badge bg-primary-transparent rounded-circle ms-1">갯수</span>
							<span class="float-end fs-11"><a
								href="javascript:void(0);" class="link-primary text-underline"><u>전체보기</u></a></span>
						</div>
						<ul class="shared-files list-unstyled">
							<li>
								<div class="d-flex align-items-center">
									<div class="me-2">
										<span class="shared-file-icon"> <i
											class="ti ti-file-text"></i>
										</span>
									</div>
									<div class="flex-fill">
										<p class="fs-12 fw-semibold mb-0">파일명</p>
										<p class="mb-0 text-muted fs-11">등록일시</p>
									</div>
									<div class="fs-18">
										<a aria-label="anchor" href="javascript:void(0)"><i
											class="ri-download-2-line text-muted"></i></a>
									</div>
								</div>
							</li>
							<li>
								<div class="d-flex align-items-center">
									<div class="me-2">
										<span class="shared-file-icon"> <i
											class="ri-image-line"></i>
										</span>
									</div>
									<div class="flex-fill">
										<p class="fs-12 fw-semibold mb-0">Img_02.Jpg</p>
										<p class="mb-0 text-muted fs-11">22,Oct 2022 - 10:19AM</p>
									</div>
									<div class="fs-18">
										<a aria-label="anchor" href="javascript:void(0)"><i
											class="ri-download-2-line text-muted"></i></a>
									</div>
								</div>
							</li>
							<li>
								<div class="d-flex align-items-center">
									<div class="me-2">
										<span class="shared-file-icon"> <i
											class="ri-image-line"></i>
										</span>
									</div>
									<div class="flex-fill">
										<p class="fs-12 fw-semibold mb-0">Img_15.Jpg</p>
										<p class="mb-0 text-muted fs-11">22,Oct 2022 - 10:18AM</p>
									</div>
									<div class="fs-18">
										<a aria-label="anchor" href="javascript:void(0)"><i
											class="ri-download-2-line text-muted"></i></a>
									</div>
								</div>
							</li>
							<li>
								<div class="d-flex align-items-center">
									<div class="me-2">
										<span class="shared-file-icon"> <i
											class="ri-video-line"></i>
										</span>
									</div>
									<div class="flex-fill">
										<p class="fs-12 fw-semibold mb-0">Video_15_02_2022.MP4</p>
										<p class="mb-0 text-muted fs-11">22,Oct 2022 - 10:18AM</p>
									</div>
									<div class="fs-18">
										<a href="javascript:void(0)"><i
											class="ri-download-2-line text-muted"></i></a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="mb-0">
						<div class="fw-semibold mb-4">
							공유한 사진 <span
								class="badge bg-primary-transparent rounded-circle ms-1">갯수</span>
							<span class="float-end fs-11"><a
								href="javascript:void(0);" class="link-primary text-underline"><u>전체보기</u></a></span>
						</div>
						<div class="row">
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
								<a aria-label="anchor" href="gallery.html" class="chat-media">
									<img
									src="${pageContext.request.contextPath }/resources/assets/images/media/media-56.jpg"
									alt="">
								</a>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
								<a aria-label="anchor" href="gallery.html" class="chat-media">
									<img
									src="${pageContext.request.contextPath }/resources/assets/images/media/media-52.jpg"
									alt="">
								</a>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
								<a aria-label="anchor" href="gallery.html" class="chat-media">
									<img
									src="${pageContext.request.contextPath }/resources/assets/images/media/media-52.jpg"
									alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End::app-content -->


	<!-- 개인 채팅 모달 영역 -->
	<div class="modal fade" id="soloModal">
		<div
			class="modal-dialog modal-dialog-centered text-center modal-sm modal-dialog-scrollable"
			role="document">
			<div class="modal-content modal-content-demo" style="height: 700px;">
				<div class="modal-header">
					<h6 class="modal-title">대화 상대 선택</h6>
					<button aria-label="Close" class="btn-close"
						data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<input type="text"
							class="form-control bg-light border-0 lbr-20 searchUser"
							placeholder="이름" aria-describedby="button-addon2">
						<button aria-label="button" class="btn btn-light rbr-20"
							type="button" id="button-addon2">
							<i class="ri-search-line text-muted"></i>
						</button>
					</div>
					<p class="text-muted fs-11 fw-semibold mb-1 op-6 col-4"
						id="onlinePeople" style="margin-top: 10px;">온라인 (2)</p>
					<ul class="list-unstyled mb-0 mt-2" id="inviteOnlieList">
						<!-- 채팅 초대 온라인 -->
					</ul>
					<p class="text-muted fs-11 fw-semibold mb-1 op-6 col-4"
						id="chatOffPeople" style="margin-top: 10px;">오프라인 (2)</p>
					<ul class="list-unstyled mb-0 mt-2" id="inviteOfflineList">
						<!-- 채팅 초대 오프라인 -->
					</ul>
				</div>

				<div class="modal-footer">
					<button class="btn btn-dark addChatBtn" id="soloSelectBtn">선택</button>
					<button class="btn btn-light" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 개인 채팅 모달 영역 끝 -->

	<!-- 그룹 채팅 모달 영역 -->
	<div class="modal fade" id="groupModal">
		<div
			class="modal-dialog modal-dialog-centered text-center modal-sm modal-dialog-scrollable"
			role="document">
			<div class="modal-content modal-content-demo" style="height: 700px;">
				<div class="modal-header">
					<h6 class="modal-title">대화 상대 선택</h6>
					<span class="text-muted fs-10" id="nop" style="margin-left: 10px;"></span>
					<button aria-label="Close" class="btn-close"
						data-bs-dismiss="modal"></button>
				</div>
				<div class="badgeContainer" id="badgeList" style="margin-top: 10px;">

				</div>
				<div class="modal-body">
					<div class="input-group">
						<input type="text"
							class="form-control bg-light border-0 lbr-20 searchUser"
							placeholder="이름" aria-describedby="button-addon2">
						<button aria-label="button" class="btn btn-light rbr-20"
							type="button" id="button-addon2">
							<i class="ri-search-line text-muted"></i>
						</button>
					</div>
					<p class="text-muted fs-11 fw-semibold mb-1 op-6 col-4"
						id="onlineGroupPeople" style="margin-top: 10px;">온라인 (2)</p>
					<ul class="list-unstyled mb-0 mt-2" id="groupOnlieList">
						<!-- 채팅 초대 온라인 -->
					</ul>
					<p class="text-muted fs-11 fw-semibold mb-1 op-6 col-4"
						id="chatOffGroupPeople" style="margin-top: 10px;">오프라인 (2)</p>
					<ul class="list-unstyled mb-0 mt-2" id="groupOffList">
						<!-- 채팅 초대 오프라인 -->
					</ul>
				</div>

				<div class="modal-footer">
					<button class="btn btn-dark addChatBtn">선택</button>
					<button class="btn btn-light" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹 채팅 모달 영역 끝 -->








	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="searchModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="input-group">
						<a href="javascript:void(0);" class="input-group-text"
							id="Search-Grid"><i
							class="fe fe-search header-link-icon fs-18"></i></a> <input
							type="search" class="form-control border-0 px-2"
							placeholder="Search" aria-label="Username"> <a
							href="javascript:void(0);" class="input-group-text"
							id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
						<a href="javascript:void(0);" class="btn btn-light btn-icon"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fe fe-more-vertical"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Another
									action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Something
									else here</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="javascript:void(0);">Separated
									link</a></li>
						</ul>
					</div>
					<div class="mt-4">
						<p class="font-weight-semibold text-muted mb-2">Are You
							Looking For...</p>
						<span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
					</div>
					<div class="my-4">
						<p class="font-weight-semibold text-muted mb-2">Recent Search
							:</p>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="notifications.html"><span>Notifications</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="alerts.html"><span>Alerts</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
							<a href="mail.html"><span>Mail</span></a> <a class="ms-auto lh-1"
								href="javascript:void(0);" data-bs-dismiss="alert"
								aria-label="Close"><i class="fe fe-x text-muted"></i></a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="btn-group ms-auto">
						<button type="button" class="btn btn-sm btn-primary-light">Search</button>
						<button type="button" class="btn btn-sm btn-primary">Clear
							Recents</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>









<div class="modal fade" id="searchModal" tabindex="-1"
	aria-labelledby="searchModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="input-group">
					<a href="javascript:void(0);" class="input-group-text"
						id="Search-Grid"><i
						class="fe fe-search header-link-icon fs-18"></i></a> <input
						type="search" class="form-control border-0 px-2"
						placeholder="Search" aria-label="Username"> <a
						href="javascript:void(0);" class="input-group-text"
						id="voice-search"><i class="fe fe-mic header-link-icon"></i></a> <a
						href="javascript:void(0);" class="btn btn-light btn-icon"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
						class="fe fe-more-vertical"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
						<li><a class="dropdown-item" href="javascript:void(0);">Another
								action</a></li>
						<li><a class="dropdown-item" href="javascript:void(0);">Something
								else here</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="javascript:void(0);">Separated
								link</a></li>
					</ul>
				</div>
				<div class="mt-4">
					<p class="font-weight-semibold text-muted mb-2">Are You Looking
						For...</p>
					<span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a
						href="javascript:void(0)" class="tag-addon"
						data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
						class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a
						href="javascript:void(0)" class="tag-addon"
						data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
						class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a
						href="javascript:void(0)" class="tag-addon"
						data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
						class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a
						href="javascript:void(0)" class="tag-addon"
						data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
				</div>
				<div class="my-4">
					<p class="font-weight-semibold text-muted mb-2">Recent Search :</p>
					<div
						class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
						<a href="notifications.html"><span>Notifications</span></a> <a
							class="ms-auto lh-1" href="javascript:void(0);"
							data-bs-dismiss="alert" aria-label="Close"><i
							class="fe fe-x text-muted"></i></a>
					</div>
					<div
						class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
						<a href="alerts.html"><span>Alerts</span></a> <a
							class="ms-auto lh-1" href="javascript:void(0);"
							data-bs-dismiss="alert" aria-label="Close"><i
							class="fe fe-x text-muted"></i></a>
					</div>
					<div
						class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
						<a href="mail.html"><span>Mail</span></a> <a class="ms-auto lh-1"
							href="javascript:void(0);" data-bs-dismiss="alert"
							aria-label="Close"><i class="fe fe-x text-muted"></i></a>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="btn-group ms-auto">
					<button type="button" class="btn btn-sm btn-primary-light">Search</button>
					<button type="button" class="btn btn-sm btn-primary">Clear
						Recents</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script>
var myNo = ${sessionScope.user.member.memNo};
// 페이지 접속 시 좌측에 채팅방 리스트 불러오기
$(document).ready(function(){
	if (ws.readyState === WebSocket.OPEN) {
		ws.send("connectChat#");
    } else {
        setTimeout(function() {
        	ws.send("connectChat#");
        }, 300);
    }
	
});


/* 개인 채팅 멤버 선택 */
$(document).on("change", ".checkforactive input[type='radio']", function(){
	var memName = $(this).closest(".checkforactive").find(".memName").text();
	let html = '<a href="#" class="selectList"><span name="'+memName+'" class="btn btn-outline-light rounded-pill btn-wave fs-10" style="margin:5px;">';
	html += '<span class="fs-14">'+memName+'</span>';
	html += '<i class="bx bx-x fs-14"></i></span></a>';
	$('#badgeList').append(html);
	
// 	let memNo = $(this).closest(".checkforactive").find('span:hidden').text();
	
	let listNumber = $('#badgeList').find('a');
	if(listNumber.length === 0 ) $('#nop').text("");
	else $('#nop').text(listNumber.length);
	$(".addChatBtn").prop("disabled",false);
	
});
// 개인채팅에서 선택 버튼 클릭 시
	$('#soloSelectBtn').click(function(){
		// 멤버 번호 던지기
		let memNo = $('.checkforactive input[type="radio"]:checked').val();
		let target = $('.checkforactive input[type="radio"]:checked').closest('.chatUser');
		let memName = target.find('.memName').text()
		let data = {
			"memName" : memName,
			"memNo" : memNo
		}
		console.table(data);
		console.log(target)
		// 채팅방 생성
		$.ajax({
			url : "/comm/chat/createSoloChat",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
// 			beforeSend: function(xhr) {
// 	             xhr.setRequestHeader(csrfHeader, csrfToken);
// 	         },
			success : function(res){
				// 성공적으로 채팅방이 생성되었을 때
					// 모달 초기화하고 꺼주기
					chatReset();
					$('#soloModal').fadeOut(); // 모달 숨김
					$('.modal-backdrop').fadeOut(); // 배경 페이드 효과 제거
					
					// 채팅방 헤더 온라인/오프라인 구성
					ws.send("openSoloChat#"+memNo);
					
					
					$('.chatMain').html('<li>채팅을 시작하셨습니다.</li><span style="display:none;" id="roomNo">'+res+'</span>')
					// 비동기로 화면 띄워주기
					
					
			}
		});
	});

// 그룹 채팅 선택에서 뱃지 삭제
var targetTab;
$(document).on("click", "#badgeList .selectList", function() {
	
	let name = $(this).find('span').attr("name");
	$(this).remove();
	$(".checkforactive input[name='"+name+"']").prop("checked",false);
	let listNumber = $('#badgeList').find('a');
	if(listNumber.length === 0 ) $('#nop').text("");
	else $('#nop').text(listNumber.length);

});

// 검색 기능
$(document).ready(function(){
	$('.searchUser').on("input",function(){
		var searchKeyword = $(this).val();
		$('.chatUser').each(function(){
			var text = $(this).find(".memName").text();
			if(text.includes(searchKeyword)){
				$(this).show();
			}else{
				$(this).hide();
			}
		});
	});
});

// + 버튼 눌러서 드롭박스 띄울때
$('#startChat').click(function(){
	chatReset();
});

// 선택 초기화
function chatReset(){
	$(".checkforactive input[type='radio']").prop("checked",false);
	if($(".checkforactive input[type='radio']:checked").length === 0 )
		$(".addChatBtn").prop("disabled",true);
	$('#badgeList').html("");
	$('#nop').text("");
};
// 채팅 전송
$(document).on('keydown','#chatMessage',function(event){
	if(event.keyCode === 13){
		let msg = $('#chatMessage').val();
		let memNo = $('#chatReceiver').text();
		let roomNo = $('#roomNo').text();
		let JSONdata = {
				"code" : "soloChat",
				"receiver" : memNo,
				"content" : msg,
				"roomNo" : roomNo
		}
		ws.send(JSON.stringify(JSONdata));
		$('#chatMessage').val("");
		
	}
});

var targetRoomNo;
var flagEnterRoom = false;
$(document).on("click",".cRoom",function(){
	if(flagEnterRoom){
		handleChatRoomChange();
		console.log('트루임');		
	}
	let roomNo = $(this).data("chatroom");
	targetRoomNo = roomNo;
	console.log(roomNo);
	console.log(myNo);
	let chatRoom = {
			"chatRoomNo" : roomNo
	}
	$.ajax({
		url : "/comm/chat/enterChat",
		type : "post",
		data : JSON.stringify(chatRoom),
		contentType : "application/json;charset=utf-8",
// 		beforeSend: function(xhr) {
//             xhr.setRequestHeader(csrfHeader, csrfToken);
//         },
		success : function(chatList){
			printChat(chatList);
			ws.send("enterChat#"+roomNo);
			flagEnterRoom = true;
		},
		error : function(){
			console.log('에러뜸')
		}
	});
});

$(document).on("visibilitychange", function() {
    if (document.visibilityState === 'hidden') {
    	handleChatRoomChange();
    } else {
        console.log("화면이 보여집니다.");
    }
});

function printChat(chatList){
	let html = '<li class="chat-day-lable">';
	html += '<span id="roomNo" style="display:none;">'+chatList[0].chatRoomNo+'</span>'
	html += '<span>Today</span>';
	html += '</li>'
	
	$.each(chatList, function(idx, chat){
		let time= chat.chatDate.split(' ')[1];
		time = time.substr('0','5');
		time = timeFormat(time);
		if(chat.chatSender != myNo){
			html += '<li class="chat-item-start">';
			html += '    <div class="chat-list-inner">';
			html += '        <div class="chat-user-profile '+chat.chatSender+'">';
			
			html += '            <span class="avatar avatar-md '+chat.userOnlineStatus+' avatar-rounded chatstatusperson">';
			
			html += '                <img class="chatimageperson" src="/resources/img/default.png" alt="img">';
			html += '            </span>';
			html += '        </div>';
			html += '        <div class="ms-3">';
			html += '            <span class="chatting-user-info">';
			html += '                <span class="chatnameperson">'+chat.memName+'</span> <span class="msg-sent-time">'+time+'</span>';
			html += '            </span>';
			html += '            <div class="main-chat-msg">';
			html += '                <div>';
			html += '                    <p class="mb-0">'+chat.chatLog+'</p>';
			html += '                </div>';
			html += '            </div>';
			html += '        </div>';
			html += '    </div>';
			html += '</li>';
		}
		if(chat.chatSender == myNo){
			html += '<li class="chat-item-end">';
			html += '    <div class="chat-list-inner">';
			html += '        <div class="me-3">';
			html += '            <span class="chatting-user-info">';
			html += '                <span class="msg-sent-time"><span class="chat-read-mark align-middle d-inline-flex"><i class="ri-check-double-line"></i></span>'+time+'</span> 나';
			html += '            </span>';
			html += '            <div class="main-chat-msg">';
			html += '                <div>';
			html += '                    <p class="mb-0">'+chat.chatLog+'</p>';
			html += '                </div>';
			html += '            </div>';
			html += '        </div>';
			html += '        <div class="chat-user-profile '+chat.chatSender+'">';
			
			html += '            <span class="avatar avatar-md '+chat.userOnlineStatus+' avatar-rounded">';
			html += '                <img src="/resources/img/default.png" alt="img">';
			html += '            </span>';
			
			html += '        </div>';
			html += '    </div>';
			html += '</li>';
		}
	});
	$('.chatMain').html(html);
	
	$(document).on("visibilitychange",function(){
		console.log("화면전환")
	});
}


//MutationObserver 생성
// const observer = new MutationObserver((mutationsList, observer) => {
//     // 채팅방 이동을 처리하는 함수 호출
//     handleChatRoomChange();
// });

// // 감시할 대상 요소 선택 (예시: 왼쪽 탭 메뉴)
// const targetNode = document.querySelector('.chatMain');

// // MutationObserver의 옵션 설정
// const config = { childList: true, subtree: true };

// // MutationObserver를 시작하여 감시
// observer.observe(targetNode, config);

// 채팅방 이동을 처리하는 함수 정의
function handleChatRoomChange() {
    // 여기에 채팅방 이동 처리하는 코드를 작성
    let data = {
    		"chatRoomNo" : targetRoomNo,
    		"memNo"	: myNo
    }
    console.table(data);
    $.ajax({
    	url : "/comm/chat/outChatRoom.do",
    	type : "post",
    	data : JSON.stringify(data),
    	contentType : "application/json;charset=utf-8",
    	success : function(){}
    	
    });
}


</script>