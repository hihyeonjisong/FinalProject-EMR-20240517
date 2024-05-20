<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<style>

#formmodal table,
#formmodal th,
#formmodal td {
    border: 1px solid black;
}
#formmodal table tr td:first-child {
    border-left: none; /* 각 행의 첫 번째 셀의 왼쪽 테두리 제거 */
}
#formmodal table tr td:last-child {
    border-right: none; /* 각 행의 마지막 셀의 오른쪽 테두리 제거 */
}
#formmodal td {
    padding: 6px;

}
#formmodal input,
#formmodal textarea {
    border: none;
}

#formmodal input:focus,
#formmodal textarea:focus {
    outline: none;
}
#surgeryRecord th {
	text-align: center;
}


</style>

<div class="main-content app-content">
	<div class="card card-custom"  style="margin-left: 12px;" >
		<div class="row">
			<div class="col-xl-12">
				<div class="card custom-card" style="height:845px;">
					<div class="card-header">
						<div class="card-title">수술목록</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="surgeryRecord" class="table table-bordered text-nowrap w-100">
								<thead>
									<tr>
										<th>예약번호</th>
										<th>예약날짜</th>
										<th>환자이름</th>
										<th>수술종류</th>
										<th>집도의</th>
										<th>완료여부</th>
										<th>수술기록</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${surgeryList}" var="surgery">
											<tr>
												<td style="text-align:center;">${surgery.surgeryReservationNo }</td>
												<td style="text-align:center;">${surgery.surgeryReservationDate.substring(0,10)}</td>
												<td style="text-align:center;">${surgery.patntName }</td>
												<td>${surgery.surgeryKindName} </td>
												<td style="text-align:center;">${surgery.empName }</td>
										
									       <c:set var="resrvationNo" value="${surgery.surgeryReservationNo }"></c:set>
									       <c:set var="surgeryNo" value="${surgery.surgeryNo }"></c:set>
										<c:choose>
											 <c:when test="${!surgery.flagDate }">
												<td style="text-align:center;">예정 </td>
												<td style="text-align:center;"></td>
											</c:when>
											<c:otherwise>
												<td style="text-align:center;">완료 </td>
												<c:choose>
													<c:when test="${surgeryNo eq 0}">
														<td class="writeRecord" style="text-align:center; cursor:pointer; color:red;"" data-info='
														{ 
														"surgeryDoctorName" : "${surgery.empName }",
														"surgeryDoctor" : "${surgery.surgeryDoctor }",
														"surgeryKindName" : "${surgery.surgeryKindName }",
														"empName" : "${surgery.empName }",
														"empLicence" : "${surgery.empLicence }",
														"surgeryDate" : "${surgery.surgeryReservationDate }",
														"surgeryKindCode" : "${surgery.surgeryKindCode }",
														"orderNo" : "${surgery.orderNo }",
														"patntName" : "${surgery.patntName }",
														"memAge" : "${surgery.memAge }",
														"memGender" : "${surgery.memGender }",
														"surgeryNo" : "${surgery.surgeryNo }",
														"maxSurgeryNo" : "${surgery.maxSurgeryNo }",
														"patntNo" : "${surgery.patntNo }" 
														}
														'>작성
														</td>
													</c:when>
													<c:otherwise>
														<td class="checkRecord" style="text-align:center; cursor:pointer;  color:blue;" data-surgeryno = "${surgeryNo }" >조회 </td>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										
											</tr>
										</c:forEach>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="formmodal" tabindex="-1" aria-labelledby="exampleModalScrollable3" data-bs-keyboard="false" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 720px;">
    <div class="modal-content">
        <div class="modal-header">
            <h6 class="modal-title" id="staticBackdropLabel3">수술기록지</h6>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="col-xxl-12 col-xl-12">
                <div class="row">
                    <div class="col-xl-12">
                        <!-- <div class="card custom-card">
                            <div class="card-body"> -->
                                <div class="content-wrapper">
                                    <div id="crm-revenue-analytics">
                                        <h4 style="text-align: center; margin:40px;">수술기록지</h4>
                                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                    <table class="text-nowrap" style=" width: 100%;">
                                                        <tr>
                                                            <td style="text-align:center;">기록No </td>
                                                            <td><input type="text" style="width: 100px;" id="surgeryNo" readonly></td>
                                                            <td style="text-align:center;">작성자</td>
                                                            <td> <input type="text" id="writer" style="width: 100px;" readonly></td>
                                                            <td style="text-align:center;">작성일</td>
                                                            <td> <input type="text" id="surgeryRecDate" style="width: 130px;" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align:center;">진료과 </td>
                                                            <td>정형외과</td>
                                                            <td style="text-align:center;">집도의</td>
                                                            <td> <input type="text" id="empName" style="width: 100px;" readonly></td>
                                                            <td>면허번호</td>
                                                            <td> <input type="text" id="empLicence" style="width: 100px;" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align:center;" >환자성명 </td>
                                                            <td> <input type="text" id="patntName" style="width: 100px;" readonly></td>
                                                            <td style="text-align:center;">나이</td>
                                                            <td> <input type="text" id="memAge" style="width: 100px;" readonly></td>
                                                            <td style="text-align:center;">성별</td>
                                                            <td> <input type="text" id="memGender" style="width: 100px;" readonly></td>
                                                        </tr>
                                          
                                                        <tr>
                                                            <td style="text-align:center;">수술코드</td>
                                                            <td colspan="5"> <input type="text" id="surgeryKindCode" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align:center;">수술명</td>
                                                            <td colspan="5"> <input type="text" id="surgeryKindName" style="width: 100%;" readonly></td>
                                                        </tr>             
                                                         <tr>
                                                            <td style="text-align:center;">수술일자</td>
                                                            <td> <input type="text" id="surgeryDate" style="width: 150px;"></td>
                                                            <td>경과시간</td>
                                                            <td> <input type="text" id="surgeryElapse" style="width: 150px;"></td>
                                                        </tr>
                                                        <tr>
                                                        
                                                        
                                                        
                                                        
                                                            <td colspan="6" style="text-align:center;">기    록    사    항</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6"><textarea id="surgeryComment" style="width: 100%; height: 300px;"></textarea></td>
                                                        </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                </div>
                            <!-- </div>
                        </div> -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" id="submitBtn">작성</button>
                <button type="button" class="btn btn-sm btn-light" data-bs-dismiss="modal" id="closeBtn">취소</button>
            </div>
        </div>
    </div>
</div>

<script>

// 현재 날짜를 가져오는 함수
function getCurrentDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 2자리로 변환
    var day = String(today.getDate()).padStart(2, '0'); // 일자를 2자리로 변환
    return year + '년' + month + '월' + day+'일'; 
}

$(function(){
var info;
//수술기록 작성
	$('.writeRecord').click(function(){
		
		$('#surgeryComment').prop('readonly', false);
		$('#surgeryElapse').prop('readonly', false);
		
		$("#submitBtn").show();
		$("#closeBtn").text("취소");
		
		
		$("#surgeryRecDate").val(getCurrentDate());

		
		
		info = JSON.parse($(this).data("info"));
		$('#empName').val(info.empName);
		$('#empLicence').val(info.empLicence);
		$('#empName').val(info.empName);
		$('#patntName').val(info.patntName);
		$('#memAge').val(info.memAge);
		$('#memGender').val(info.memGender);
		$('#surgeryKindName').val(info.surgeryKindName);
		$('#surgeryKindCode').val(info.surgeryKindCode);
		$('#writer').val(info.empName);
		$('#surgeryDate').val(info.surgeryDate.substring(0,10));
		
		console.log("수술번호"+info.maxSurgeryNo);
		var maxSurgeryNo = parseInt(info.maxSurgeryNo);
		$('#surgeryNo').val(maxSurgeryNo+1);	//수술기록지 번호
		
		$('#formmodal').modal("toggle");
		
		
	});
		$('#submitBtn').click(function(){
			let surgeryElapse = $('#surgeryElapse').val();
			let surgeryComment = $('#surgeryComment').val();
			let jsonData = {
					"surgeryElapse" : surgeryElapse,
					"surgeryComment" : surgeryComment,
			}
			console.table(jsonData);
			
			let mergeJson = Object.assign({}, info, jsonData);
			console.table(mergeJson);
			$.ajax({
				url :"/surgeryRecord/insertsurgery",
				type : "post",
				data : JSON.stringify(mergeJson),
				contentType : "application/json;charset=utf-8",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
				success : function(res){
					console.log(res)
					location.reload();
				}
			});
		});
	$('.checkRecord').click(function(){
		let surgeryNo = $(this).data("surgeryno");
		console.log(surgeryNo)
		
		$.ajax({
			url: "/surgeryRecord/detailSurgery",
			type: "post",
			data: JSON.stringify({surgeryNo : surgeryNo}),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		},
			success : function(res){
				
				$('#surgeryNo').val(res.surgeryNo);
				$('#surgeryRecDate').val(res.surgeryRecDate);
				$('#empName').val(res.empName);
				$('#empLicence').val(res.empLicence);
				$('#empName').val(res.empName);
				$('#patntName').val(res.patntName);
				$('#memAge').val(res.memAge);
				$('#memGender').val(res.memGender);
				$('#surgeryKindName').val(res.surgeryKindName);
				$('#surgeryKindCode').val(res.surgeryKindCode);
				$('#writer').val(res.empName);
				$('#surgeryDate').val(res.surgeryDate);
				$('#surgeryElapse').val(res.surgeryElapse);
				$('#surgeryComment').val(res.surgeryComment);
				
				$('#surgeryComment').prop('readonly', true);
				$('#surgeryElapse').prop('readonly', true);
				
				$("#submitBtn").hide();
				$("#closeBtn").text("닫기");
				
				$('#formmodal').modal("toggle");
				
			}
			
			
		});
		
		
	
		
	});
});

</script>