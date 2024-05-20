var detailNo;
var detailTitle;
var detailContent;
var detailWriter;
var detailFix;
//상세 정보를 modal에 표시하는 함수
function showDetail(empNoticeNo) {
	// AJAX를 사용하여 empNoticeNo에 해당하는 상세 정보를 가져옴
	$.ajax({
		type: "GET",
		url: "/emp/notice/detail.do",
		data: { empNoticeNo: empNoticeNo },
		success: function(data) {
			// 가져온 데이터를 modal에 표시
			$("#modalTitle").text(data.empNoticeTitle);
			$("#modalBody").text(data.empNoticeContent);
			$("#modalWriter").text(data.empNoticeWriter);
			$("#modalDate").text(data.empNoticeDate);
			$("#modalHit").text(data.empNoticeHit);
// 			$("#modalNo").text(data.empNoticeNo);
			
// 			$("#delBtn").data("empNoticeNo", data.empNoticeNo);
			detailNo = data.empNoticeNo;
			detailTitle = data.empNoticeTitle;
			detailContent = data.empNoticeContent;
			detailWriter = data.empNoticeWriter;
			detailFix = data.empNoticeFix;

			console.log("detailNo: " + detailNo);
			console.log("detailTitle: " + detailTitle);
			
			$("#modBtn").click(function(){
				var empNoticeNo = $("#modalNo").text();
				window.location.href = "/emp/notice/detail?empNoticeNo=" + data.empNoticeNo;
			})
		},
		error: function(){
			$("#modalTitle").text("Error");
			$("#modalBody").html("Failed to load content.");
		}
	});
}
// detail 안에서 wrtBtn(등록) 버튼 클릭시 작동
$(function(){
	var wrtBtn = $("#wrtBtn");
	wrtBtn.on("click", function(){
		
		$.ajax({
			type: "get",
			url: "/emp/notice/reset.do",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(),
			success: function(result){
				console.log("ajax 성공");
				$("#modalEdit").modal("show");
				
				// status에 따라 modal 내용(글자) 바꾸는 코드를 여기에 넣어야 함
				// 예: 공지사항 수정 ("#modalEditTitle")
				console.log("result: " + result);
				if(result != 'u'){
					console.log("if절 내부 | result: " + result);
					$("#modalEditTitle").html("<h6 class='modal-title'>공지사항 등록</h6>");
					$("#modalPostBtn").html(
						"<h6 class='modal-title'>등록</h6>"
					);

						<button id="postEditBtn" type="button" class="btn btn-info"
							onclick="editDetail(${detailNo})" data-bs-dismiss="modal">등록</button>


					result = "";
				}
			},
			error: function(xhr, status, error){
				alert("수정창 열기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
});
// detail 안에서 editBtn 클릭시 작동
$(function(){
	// 수정 창 모달로 열었을 때 input칸 채워두기
	var editBtn = $("#editBtn");
	editBtn.on("click", function(){
		$("#empNoticeEditNo").val(detailNo);
		$("#empNoticeEditTitle").val(detailTitle);
		$("#empNoticeEditContent").val(detailContent);
		$("#empNoticeEditWriter").val(detailWriter);
		$("#empNoticeEditFix").prop('checked', detailFix === 'Y');
		
		$.ajax({
			type: "get",
			url: "/emp/notice/status.do",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(),
			success: function(result){
				console.log("ajax 성공");
				$("#modalEdit").modal("show");
				
				// status에 따라 modal 내용(글자) 바꾸는 코드를 여기에 넣어야 함
				// 예: 공지사항 수정 ("#modalEditTitle")
				console.log("result: " + result);
				if(result === 'u'){
					console.log("if절 내부 | result: " + result);
					$("#modalEditTitle").html("<h6 class='modal-title'>공지사항 수정</h6>");
					$("#modalPostBtn").html("<button id='postEditBtn' type='button' class='btn btn-info' onclick='editDetail(${detailNo})' data-bs-dismiss='modal'>수정</button>");
				}
			},
			error: function(xhr, status, error){
				alert("수정창 열기에 실패했습니다. 다시 시도해주세요.");
			}
		});
	});
});
// ajax로 수정기능 구현 (modal창용)
function editDetail(empNoticeNo) {
	var empNoticeVO = {
		empNoticeNo: $("#empNoticeEditNo").val(),
// 		empNoticeWriter: $("#empNoticeEditWriter").val(),
		empNoticeTitle: $("#empNoticeEditTitle").val(),
		empNoticeContent: $("#empNoticeEditContent").val(),
		empNoticeFix: $("#empNoticeEditFix").is(":checked") ? "Y" : "N"
	};
	
	$.ajax({
		type: "post",
		url: "/emp/notice/edit.do",
		data: JSON.stringify(empNoticeVO),
		contentType: "application/json",
		success: function(data) {
			alert("게시글을 수정했습니다.");
			console.log("data: " + data);
// 			location.href="/emp/notice/list";
			// 아래 코드는 작동하지 않는데 없으면 에러를 일으킴
			setTimeout(function(){
				showDetail(data.empNoticeNo);
			}, 1000);
		},
		error: function(){
			$("#modalTitle").text("Error");
			$("#modalBody").html("Failed to load content.");
		}
	});
}
// 게시글 삭제 처리
$(function(){
	var delBtn = $("#delBtn");
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
// 			$("#delForm").submit();
			var empNoticeNo = detailNo;
			console.log("empNoticeNo: " + empNoticeNo);
			
			$.ajax({
				type: "post",
				url: "/emp/notice/delete.do",
				data: {empNoticeNo: empNoticeNo},
				success: function(response){
					alert("삭제되었습니다.");
					location.href="/emp/notice/list";
				},
				error: function(xhr, status, error){
					alert("삭제에 실패했습니다. 다시 시도해주세요.");
				}
			});
		} // if(confirm) 끝
	});
});
