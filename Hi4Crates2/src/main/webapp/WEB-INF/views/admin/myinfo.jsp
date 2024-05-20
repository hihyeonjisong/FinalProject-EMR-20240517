<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .page{
        /* background-image: url("1234.jpg"); */
        /* background-size: 80%; */
        /* background-color: white; */
    }
    .list-group{
         margin-top:50px;
        
    }
    .main-content{
        margin-top:-10px;
    }
    .list-group .list-group-item{
        width: 50%;
        margin-left: 25%;
        box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.2);
    }
</style>
    
<div class="main-content app-content">
	<div class="container-fluid">
                <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">개인정보 조회</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">마이 페이지</a></li>
                                <li class="breadcrumb-item active" aria-current="page">개인정보 조회</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- <div class="card-header">
                    <div class="card-title">
                        내 정보
                    </div>
                </div> -->
                <ul class="list-group" style="width: 80%; margin-left: 10%;">
                    <li class="list-group-item">
                        <div class="col-xl-12">
                            <span class="avatar avatar-xxl avatar-rounded me-3" style="margin-left: 40%; height: 10rem; width: 10rem;">
                                <img id="imgBox" src="doctor.png" alt="">
                            </span><br>
                        </div>
                    </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        아이디 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memId }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        이메일 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memEmail }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        이름 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memName }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        나이 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memAge }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        성별 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memGender }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        주민번호 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memRegno1 }-${member.memRegno2}</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        주소 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.memAddress1 }, ${member.memAddress2 }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        사번 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.empVO.empNo }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        직무 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.empVO.empJob }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        면허번호 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.empVO.empLicence }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="me-2 fw-semibold">
                                        입사일 :
                                    </div>
                                    <span class="fs-12 text-muted">${member.empVO.empHireDate }</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <input type="button" class="btn btn-primary" data-bs-toggle="modal" 
                                data-bs-target="#passChkModal" value="정보변경" id="modifyBtn" style="float: right;">
                            </li>
                        </ul>
                    </div>
               </div>
               
               
               
               
               
               
<div class="modal fade" id="passChkModal" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content" >
            <div class="modal-header">
                <h6 class="modal-title" id="passChkModalLabel">비밀번호 인증
                </h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="mb-3">
                        <label for="form-text" class="form-label fs-14 text-dark">비밀번호</label>
                        <input type="password" class="form-control" id="memPw" placeholder="비밀번호를 입력해주세요!">
                        <div class="invalid-feedback" id="invalid-pw">*비밀번호가 틀렸습니다!</div>
                    </div>
                    <div>
                        <button class="btn btn-primary" type="button" id="pwChkBtn" data-param="${sessionScope.user.member.memPw}">확인</button>
                        <button class="btn btn-primary" type="button" data-bs-dismiss="modal" aria-label="모달닫기">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
               
<script>
	$(function(){
		$('#pwChkBtn').on("click",function(){
			console.log("클릭클릭클릭클릭")
			let memPw = $('#memPw').val();
			let memPw2 = $('#pwChkBtn').data('param');
			console.log(memPw2)
			let data = { 
					"memPw" : memPw,
					"memPw2" : memPw2
					}
			$.ajax({
				url : "/public/pwchk.do",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        	},
				success : function(res){
					console.log(res);
					if(res === "SUCCESS"){
						location.href="/mypage/modifyprofile/${sessionScope.user.member.memNo }";						
					}else if(res === "FAILED"){
						$('#memPw').addClass("is-invalid");
					}
				}
			});
		});
	});
</script>
