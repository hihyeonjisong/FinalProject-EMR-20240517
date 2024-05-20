<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



	<div class="page">



		<!-- Start::app-content -->
		<div class="main-content app-content">
			<div class="container-fluid">

				<!-- Start::row-1 -->
				<div class="row">
					<div class="col-xl-3">
						<div class="card custom-card">
							<div class="card-body p-0">





								<div
									class="p-3 task-navigation border-bottom border-block-end-dashed">
									<ul class="list-unstyled task-main-nav mb-0">
										<li class="px-0 pt-0"><span
											class="fs-11 text-muted op-7 fw-semibold">TASKS</span></li>
										<li class="active">
										<a href="/emp/surgery/reservList">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1"> <i
														class="ri-task-line align-middle fs-14"></i>
													</span> <span class="flex-fill text-nowrap"> 수술 예정 환자 </span> <span
														class="badge bg-success-transparent rounded-pill">뱃지</span>
												</div>
										</a></li>
										<li><a href="/emp/surgery/reservForm">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1"> <i
														class="ri-star-line align-middle fs-14"></i>
													</span> <span class="flex-fill text-nowrap"> 수술 일정 등록 </span>
												</div>
										</a></li>
										<li><a href="/emp/surgery/surgeryRoom">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1"> <i
														class="ri-delete-bin-5-line align-middle fs-14"></i>
													</span> <span class="flex-fill text-nowrap"> 수술실 예약 현황 </span>
												</div>
										</a></li>
										<li><a href="/emp/surgery/surgeryRecord">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1"> <i
														class="ri-delete-bin-5-line align-middle fs-14"></i>
													</span> <span class="flex-fill text-nowrap"> 수술 기록 조회 </span>
												</div>
										</a></li>

									</ul>
								</div>

							</div>
						</div>
					</div>





					<div class="col-xl-9">
						<div class="row">
							<div class="col-xl-12">
								<div class="card custom-card">



									<div class="card-header">
										<div class="card-title">Surgery Reservation Form</div>
										<div>
											<div class="dropdown">
												<button
													class="btn btn-icon btn-sm btn-light btn-wave waves-light waves-effect"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false">
													<i class="ti ti-dots-vertical"></i>
												</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item"
														href="javascript:void(0);">Select All</a></li>
													<li><a class="dropdown-item"
														href="javascript:void(0);">Share All</a></li>
													<li><a class="dropdown-item"
														href="javascript:void(0);">Delete All</a></li>
												</ul>
											</div>
										</div>
									</div>



									<div class="p-3 border-bottom border-block-end-dashed">
										<div class="input-group">
											<input type="text" class="form-control bg-light border-0"
												placeholder="Search Patient Here"
												aria-describedby="button-addon2">
											<button class="btn btn-light" type="button"
												id="button-addon2">
												<i class="ri-search-line text-muted"></i>
											</button>
										</div>
									</div>





									<div class="tab-content task-tabs-container">
										<div class="tab-pane show active p-0" id="all-tasks"
											role="tabpanel">
											<div class="row" id="tasks-container">


												<div class="col-xl">
													<div class="row">
														<div class="col-xl-12">
															<div class="card custom-card">
																<div class="card-body p-0">
																	<!--                                             <div class="d-flex p-3 align-items-center justify-content-between"> -->
																	<div
																		class="p-3 align-items-center justify-content-between">

																		<div class="table-responsive">
																			<table class="table text-nowrap"
																				style="text-align: center;">
																				<thead>
																					<tr>
																						<th scope="col">이름</th>
																						<th scope="col" class="col-sm-1">성별</th>
																						<th scope="col" class="col-sm-1">나이</th>
																						<th scope="col">수술예정일</th>
																						<th scope="col">수술실</th>
																						<th scope="col">담당의</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<th scope="row">1</th>
																						<td>Microsoft 1111</td>
																						<td>$170 billion</td>
																						<td>United States</td>
																						<td>1</td>
																						<td>1</td>
																					</tr>
																					<tr>
																						<th scope="row">2</th>
																						<td>HP</td>
																						<td>$72 billion</td>
																						<td>United States</td>
																						<td>1</td>
																						<td>1</td>
																					</tr>
																					<tr>
																						<th scope="row">3</th>
																						<td>IBM</td>
																						<td>$60 billion</td>
																						<td>United States</td>
																						<td>1</td>
																						<td>1</td>
																					</tr>
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

									</div>

<div style="margin-right:18px;">
									<ul class="pagination justify-content-end">
										<li class="page-item disabled"><a class="page-link">Previous</a>
										</li>

										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">1</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">2</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">3</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">Next</a></li>
									</ul>
									<div style="margin-bottom:18px; margin-left:18px;">
							        	<button form="opRes" class="btn btn-info">Submit</button>
						        	</div>
</div>
								</div>
							</div>
							<!--End::row-1 -->


						</div>



					</div>
				</div>
			</div>

		</div>
		<!-- End::app-content -->

	</div>


	<!-- Scroll To Top -->
	<div class="scrollToTop">
		<span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
	</div>
	<div id="responsive-overlay"></div>
	<!-- Scroll To Top -->


</body>

</html>