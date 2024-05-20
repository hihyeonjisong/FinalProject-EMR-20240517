<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css">

<div class="main-content app-content">
	<div class="container-fluid" style="height:877px;">
	<div class="card card-custom" style="height: 100%;">
		<div class="row" style="height: 100%;">
			<div class="col-xl-12" style="height: 100%;">
				<div class="card custom-card" style="height: 100%;">
					<div class="card-header">
						<div class="card-title">권한 부여 대기 목록</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="vacation-table"
								class="table table-bordered text-nowrap w-100">
								<thead>
									<tr>
										<th>이름</th>
                                        <th>직무</th>
                                        <th>아이디</th>
                                        <th>이메일</th>
                                        <th>나이</th>
                                        <th>성별</th>
                                        <th>전화번호</th>
                                        <th>신청일</th>
                                        <th>주민번호</th>
										<th style="width:90px;">작업</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty memList}">
										<tr>
											<td colspan="10">
												직원 권한 승인 대기 목록이 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${memList}" var="member">
											<tr>
												<td>${member.memName }</td>
												<td>${member.empJob }</td>
												<td>${member.memId }</td>
												<td>${member.memEmail }</td>
												<td>${member.memAge }</td>
												<td>${member.memGender }</td>
												<td>${member.memTel }</td>
												 <td class="format-date" data-date="${member.memSignupDate}"></td>
												<td>${member.memRegno1 }-${member.memRegno2.substring(0,1) }******</td>
												<td style="font-size : 20px; padding:5px;">
													<a href="#" style="margin-left:25px;"><i class='bx bx-check permit'  
													data-memno="${member.memNo}" data-empjob="${member.empJob }" data-empname="${member.memName }"></i></a> 
													<a href="#" style="margin-right:25px; float:right;"><i class='bx bx-x-circle xpermit' 
													data-memno="${member.memNo }" data-memname='${member.memName }'></i></a>
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
</div>

<div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="permitToast" class="toast colored-toast bg-info-transparent" role="alert" aria-live="assertive"
        aria-atomic="true">
        <div class="toast-header bg-info text-fixed-white">
            <img class="bd-placeholder-img rounded me-2" src="" alt="...">
            <strong class="me-auto">원무과장</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"
                aria-label="Close"></button>
        </div>
        <div class="toast-body" id="permitBox">
            
        </div>
    </div>
</div>
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="XpermitToast" class="toast colored-toast bg-danger-transparent" role="alert" aria-live="assertive"
        aria-atomic="true">
        <div class="toast-header bg-danger text-fixed-white">
            <img class="bd-placeholder-img rounded me-2" src="" alt="...">
            <strong class="me-auto">원무과장</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"
                aria-label="Close"></button>
        </div>
        <div class="toast-body" id="XpermitBox">
            
        </div>
    </div>
</div>


<script>
// connectWs();

$(document).on("click",'#alert-confirm',function(){
	console.log('ㅇㅇ')

});

$(function(){
	$('.permit').on("click", function() {
	    let that = $(this);
	    let memNo = $(this).data("memno");
	    let empJob = $(this).data("empjob");
	    let empName = $(this).data("empname");
	    let data = {
	        "memNo": memNo,
	        "empJob": empJob
	    };
	    console.table(data);
	    Swal.fire({
	        title: '회원가입을 승인 하시겠습니까?',
	        text: "승인을 클릭해주세요.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        cancelButtonText: '취소',
	        confirmButtonText: '승인'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            console.log('성공');
	        	$.ajax({
	                url: "/admin/signuppermit.do",
	                type: "post",
	                data: JSON.stringify(data),
	                contentType: "application/json;charset=utf-8",
	                beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
	                success: function(res) {
	                    that.closest('tr').remove();
	                    $('#permitBox').text(empName + "님에게 권한부여가 완료되었습니다!");
	                    $('#permitToast').toast('show');
	                    // 성공한 경우에만 SweetAlert2 사용
	                    Swal.fire(
	                        '권한 부여가 완료되었습니다!',
	                        '정상적으로 접속이 가능합니다.',
	                        'success'
	                    );
	                },
	                error: function(xhr, status, error) {
	                	console.log(error);
	                    // 실패한 경우에만 SweetAlert2 사용
	                    Swal.fire(
	                        '에러!',
	                        '권한 부여 중에 오류가 발생했습니다.',
	                        'error'
	                    );
	                }
	            });
	        }
	    });
	});
	
	$('.xpermit').on("click", function() {
	    let that = $(this);
	    let memNo = $(this).data("memno");
	    let memName = $(this).data("memname");
	    let data = {
	        "memNo": memNo,
	    };
	    console.table(data);
	    Swal.fire({
	        title: '권한 부여를 거절하시겠습니까?',
	        text: "버튼을 클릭해주세요.",
	        icon: 'error',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        cancelButtonText: '취소',
	        confirmButtonText: '거절'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            console.log('성공');
	        	$.ajax({
	                url: "/admin/signupXpermit.do",
	                type: "post",
	                data: JSON.stringify(data),
	                contentType: "application/json;charset=utf-8",
	                beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
	                success: function(res) {
	                    that.closest('tr').remove();
	                    $('#XpermitBox').text(memName + "님의 권한부여 요청을 거절하셨습니다!");
	                    $('#XpermitToast').toast('show');
	                    // 성공한 경우에만 SweetAlert2 사용
	                    Swal.fire(
	                        '권한 부여를 거절하셨습니다!',
	                        '신청이 삭제됩니다.',
	                        'success'
	                    );
	                },
	                error: function(xhr, status, error) {
	                	console.log(error);
	                    // 실패한 경우에만 SweetAlert2 사용
	                    Swal.fire(
	                        '에러!',
	                        '권한 부여 중에 오류가 발생했습니다.',
	                        'error'
	                    );
	                }
	            });
	        }
	    });
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    $('.format-date').each(function() {
        var dateString = $(this).data('date');
        var formattedDate = formatDate(dateString);
        $(this).text(formattedDate);
    });
    
    function formatDate(dateString) {
        var year = dateString.substring(0, 4);
        var month = dateString.substring(5, 7);
        var day = dateString.substring(8, 10);
    
        return year + '년 ' + month + '월 ' + day + '일';
    }
});

</script>
    <!-- Sweetalerts JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<%--     <script src="${pageContext.request.contextPath }/resources/assets/js/sweet-alerts.js"></script> --%>