<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="main-content app-content">
	<div class="container-fluid" style="height:877px;">
	<div class="card card-custom" style="height: 100%;">
		<div class="row" style="height: 100%;">
			<div class="col-xl-12" style="height: 100%;">
				<div class="card custom-card" style="height: 100%;">
					<div class="card-header">
						<div class="card-title">연가관리</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="vacation-table"
								class="table table-bordered text-nowrap w-100">
								<thead>
									<tr>
										<th>이름</th>
										<th>직무</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>사용일</th>
										<th>잔여일</th>
										<th>작성일</th>
										<th>사유</th>
										<th style="width:90px;">작업</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty vacationReqList}">
										<tr>
											<td colspan="9">
												연가 신청 목록이 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${vacationReqList}" var="vacationReq">
											<tr>
												<td>${vacationReq.memName }</td>
												<td>${vacationReq.empJob }</td>
												 <td class="format-date" data-date="${vacationReq.vacationStartDate}"></td>
												 <td class="format-date" data-date="${vacationReq.vacationEndDate}"></td>
												<td>${vacationReq.vacationDate }일</td>
												<td>${vacationReq.empVacation} 일</td>
												 <td class="format-date" data-date="${vacationReq.vacationRequestDate}"></td>
												<td>${vacationReq.vacationReason }</td>
												<td style="font-size : 20px; padding:5px;">
													<a href="#" style="margin-left:25px;"><i class='bx bx-check vacationAgree'  
													data-reqno="${vacationReq.vacationRequestNo }" data-empno="${vacationReq.empNo }"></i></a> 
													<a href="#" style="margin-right:25px; float:right;"><i class='bx bx-x-circle vacationDisagree' 
													data-reqno='${vacationReq.vacationRequestNo }' data-empno="${vacationReq.empNo }"
													data-empname='${vacationReq.memName }'></i></a>
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
    <div id="infoToast" class="toast colored-toast bg-info-transparent" role="alert" aria-live="assertive"
        aria-atomic="true">
        <div class="toast-header bg-info text-fixed-white">
            <img class="bd-placeholder-img rounded me-2" src="" alt="...">
            <strong class="me-auto">원무과장</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"
                aria-label="Close"></button>
        </div>
        <div class="toast-body">
            연가 신청을 승인하셨습니다!
        </div>
    </div>
</div>



<div class="modal fade" id="formmodal" tabindex="-1"
aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h6 class="modal-title" id="exampleModalLabel">반려 사유 작성</h6>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form>
                <div class="mb-3">
                    <label for="recipient-name"
                        class="col-form-label">수신자:</label>
                    <input type="text" class="form-control" id="recipient-name">
                </div>
                <div class="mb-3">
                    <label for="message-text"
                        class="col-form-label">사유:</label>
                    <textarea class="form-control" id="message-text"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="disagreeBtn">작성</button>
            <button type="button" class="btn btn-secondary" id="closeBtn"
                data-bs-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
</div>
<script>
// connectWs();

$(function(){
	
	
	
	$('.vacationAgree').on("click",function(){
		console.log($(this));
		let that = $(this);
		let reqNo = $(this).data("reqno");
		let empNo = $(this).data("empno");
		console.log(reqNo);
		let data = {
				"vacationRequestNo" :reqNo,
				"empNo" : empNo
		};
		$.ajax({
			url : "/admin/vacationrequestagree.do",
			type : "post",
			data :JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
			success : function(res){
					that.closest('tr').remove();
//                     $('#infoToast').toast('show');
//                     reloadDataTable();
//                     $('#vacation-table').DataTable().ajax.reload();
					let notidata = {
							"code" : "agree",
							"content" : "당신의 연가가 승인되었습니다.",
							"empNo" : empNo
					};
// 					ws.send("vacationResult#"+empNo+"#agree#"+res);
					ws.send(JSON.stringify(notidata));
			}
		});
	});
	var disagree;
	$('.vacationDisagree').on("click",function(){
		disagree = $(this);
		let re = $(this).data('empname');
		let reqNo = $(this).data("reqno");
		let empNo = $(this).data("empno");
		console.log(reqNo)
		console.log(empNo)
		$('#formmodal').find('input').val(re);
		$('#formmodal').append("<input type='hidden' value='"+reqNo+"' id='targetReqNo'>")
		$('#formmodal').append("<input type='hidden' value='"+empNo+"' id='targetEmpNo'>")
		$('#formmodal').modal("toggle");
		console.log("거절");
	});
	
	$('#disagreeBtn').on("click",function(){
		
		let empName = $('#recipient-name').val();
		let reason = $('#formmodal').find('textarea').val();
		let reqNo = $('#targetReqNo').val();
		let empNo = $('#targetEmpNo').val();
	    $('#formmodal').modal("hide");
	    $('#formmodal').find('input, textarea').val('');	
	    $('#formmodal').find('input[type="hidden"]').remove();
		console.log(reqNo)
		let data = {
				"empName" : empName,
				"reason" : reason, 
				"reqNo"	: reqNo,
				"empNo" : empNo
		}
		console.table(data);
		$.ajax({
			url : "/admin/vacationrequestdisagree.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
    		success : function(res){
				disagree.closest('tr').remove();
				let notidata = {
						"code" : "disagree",
						"content" : "연가 신청이 반려되었습니다.",
						"empNo" : empNo
				};
//     		    ws.send("vacationResult#"+empNo+"#disagree#"+res+"#"+reason);
				ws.send(JSON.stringify(notidata));
				console.log("탔냐")
    		}
		});
		
	});
	$('#closeBtn').on("click", function() {
	    // 모달 닫기
	    $('#formmodal').modal("hide");
	    // 모달 내용 초기화
	    $('#formmodal').find('input, textarea').val('');
	    // 다른 초기화 로직을 추가할 수도 있습니다.
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
})
</script>