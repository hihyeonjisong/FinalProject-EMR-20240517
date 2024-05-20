<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


    <div class="page">
        
        <!-- 본문 시작 -->
        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- 페이지 헤더 -->
                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">빈 페이지Empty</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Pages</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Empty</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- Page Header Close -->
                <!-- 페이지 헤더 끝 -->

                <!-- 본문의 본문 -->
                <!-- Start::row-1 -->
                <div class="row">
                    
                    
                    
                    
                                        <!-- <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                        <label for="input-label" class="form-label">Form Input With Label</label>
                        <input type="text" class="form-control" id="input-label">
                    </div> -->
                    
                    <div class="row mb-3">
                        <label for="input-name"
                            class="col-sm-2 col-form-label">이름(Name): </label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="input-name">
                        </div>
                    </div>

                    <div class="row mb-3">
                   		<label for="input-sex"
                            class="col-sm-2 col-form-label">성별(Sex): </label>
                        <div class="form-check col-sm-2">
                            <input type="radio" class="form-check-input" name="input-sex" id="input-sex-male">
                            <label class="form-check-label" for="input-sex-male">male</label>
                        </div>
                        <div class="form-check col-sm-2">
                            <input type="radio" class="form-check-input" name="input-sex" id="input-sex-female">
                            <label class="form-check-label" for="input-sex-female">female</label>
                        </div>
                        <div class="form-check col-sm-2">
                            <input type="radio" class="form-check-input" name="input-sex" id="input-sex-other">
                            <label class="form-check-label" for="input-sex-other">other</label>
                        </div>
                    </div>
					
                    
                    
                    
                    
                    
                    
                </div>
                <!--End::row-1 -->
                <!-- 본문의 본문 끝 -->

            </div>
        </div>
        <!-- End::app-content -->
        <!--본문 끝-->
    
    </div>

    

</body>

</html>