<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->

<!-- 사이드바 -->

<style>
    .background-image {
            background-image: url("${pageContext.request.contextPath}/resources/assets/images/media/backgrounds/back4.jpg");
            background-size: cover; /* 배경 이미지를 요소에 맞게 조절합니다. */
            background-position: center; /* 배경 이미지를 가운데 정렬합니다. */
            width: 100%;
            height: 100%;
            position: fixed; /* 스크롤 시 배경 이미지가 고정되도록 설정합니다. */
            top: 0;
            left: 0;
            z-index: -1; /* 배경 이미지를 화면 뒤로 이동시킵니다. */
        }

         /* 동그란 하얀 배경을 갖는 요소에 스타일을 추가합니다. */
        .SeoulIcon {
        display: inline-block;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        text-align: center;
        line-height: 50px;
        margin-right: 50px; /* 오른쪽으로 10px 이동 */
    }

    .blink {
        animation: 2s blink linear infinite
    }
    @keyframes blink {
        0% {
            visibility: hidden;
        }
        50% {
            visibility: hidden;
        }
        100% {
            visibility: visible;
        }
    }

    
</style>

        <!-- Start::app-content -->
        <div class="main-content app-content background-image" style="margin-top: 4% !important;" >
            <div class="container-fluid ">
                
                <!-- Page Header -->
                <!-- 날씨 부분 div공간 띄우려면 이부분 필요 -->
                    <!-- <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                        <h1 class="page-title fw-semibold fs-18 mb-0 text-bg" style="font-size: 20px;" ></h1>
                        
                        <div class="ms-md-1 ms-0">
                        </div>
                    </div> -->
                <!-- 날씨 부분 div공간 띄우려면 이부분 필요 -->
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6">
                            <!--  -->
                            <!-- <div class="border border-2 border-light p-2 rounded text-center">
                                <div class="bg-transparent p-3 rounded d-inline-block col-6">
                                    <h5 class="mb-0" id="showDate"></h5>
                                    <h1 class="mb-0" id="showTime"></h1>
                                </div>
                            </div> -->


                        <!--  -->
                        <div class="card custom-card "  style="background-color: transparent; box-shadow: none; width: 1000px;">
                            <a href="javascript:void(0);" class="card-anchor " ></a>
                            <div class="card-body" >
                                <div class="d-flex align-items-center">
                                    <div class="me-3" >
                                        <div><h5 class="mb-0" id="showDate" style="font-size: 20px;"></h5></div>
                                        <div style="display: flex;" >
                                            <h1 class="mb-0"  id="showHour" style="font-size: 80px;"></h1>
                                            <h1 class="mb-0 blink"  id="showColon" style="font-size: 80px;"></h1>
                                            <span style="margin-right: 10px;">
                                                <h1 class="mb-0"  id="showTime" style="font-size: 80px;"></h1>
                                            </span>
                                            <h1 class="mb-0"  id="showAmPm" style="font-size: 80px;"></h1>
                                        </div>
                                        <!-- <span class="avatar avatar-xl">
                                            <img src="../assets/images/faces/8.jpg" alt="img">
                                        </span> -->
                                    </div>
                                    <!-- <div>
                                        <p class="card-text text-info mb-1 fs-14 fw-semibold">ㅇㅇㅇ님</p>
                                        <p class="card-text text-info mb-1 fs-14 fw-semibold">오늘도 좋은하루 보내세요!</p>
                                        <div class="card-title text-muted fs-11 mb-0"></div>
                                    </div>     -->
                                    
                                </div>
                                <div>
                                    <br>
                                    <br>
                                    <p class="card-text text-dark mb-1 fs-14 fw-semibold" style="font-size: 20px;  ">${sessionScope.user.member.memName } 선생님,</p>
                                    <p class="card-text text-dark mb-1 fs-14 fw-semibold" style="font-size: 20px;">오늘도 좋은하루 보내세요!</p>
                                </div>
                                
                            </div>
                            
                        </div>
                        <!--  -->


                            
                            <!-- <div cl                                                                                                                                                                                                                                                                                                                                ass="card custom-card overflow-hidden">
                                                                                                        <div class="card-body p-0" style="height:                                                        ; ">
                                    <div class="p-3">
                                        <div class="d-flex align-items-center mb-2">
                                            <span class="avatar avatar-md avatar-rounded bg-secondary me-2">
                                                <i class="bi bi-receipt fs-16"></i>
                                            </span>
                                            <p class="mb-0 flex-fill text-muted">03:30</p>
                                            <span class="fs-5 fw-semibold">2024-03-01</span>
                                        </div>
                                        <span class="fs-5 fw-semibold">3:30</span>
                                    </div>                                                                  
                                </div>
                            </div> -->
                            

                        </div>
                    </div>

                    
                    <div class="col-md-4">
                        <!-- <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6" style="background-color: aquamarine;">
                        </div>
                        <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6" style="background-color: aqua;">
                        </div> -->

                        <!--  -->
                        <div class="col-md-4">
                            <p></p>
                        </div>

                        <div class="col-md-8" >
                    <!-- <div class="card custom-card card-bg-info text-fixed-white" style="background-color: rgba(73, 182, 245, 0.8);"> -->
                    <!-- 밑에 한줄이랑 같음 -->                                                                                                                                                             
                            <div class="card custom-card " style="background-color:transparent; box-shadow: none; width: 190px; float:right;">
                                <div class="card-body" > 
                                    <div class="d-flex align-items-top mb-2" >
                                        <div class="flex-fill">
                                            <!-- <span class="nowtime"></span> -->
                                            <p class="mb-0 op-7">
                                                <i class="bi bi-brightness-high"></i>
                                                Today  날씨
                                            </p>
                                            <!-- <h3>대전</h3> -->
                                            <div style="display:flex; justify-content: center;">
                                            <h3 class="SeoulIcon"></h3><br>
                                            </div>
                                            <span class="fs-6 fw-semibold SeoulNowtemp">현재기온 : </span><br>
                                            <span class="fs-6 fw-semibold SeoulLowtemp">습도 : </span><br>
                                            <!-- <span class="fs-6 fw-semibold SeoulHightemp"></span> -->
                                            <!-- <h6 class="SeoulNowtemp">현재기온:</h6> -->                                                                    
                                            <!-- <h6 class="SeoulLowtemp">최저기온:</h6> -->
                                            <!-- <h6 class="SeoulHightemp">최대기온:</h6> -->
                                          
                                        </div>
                                        <div class="ms-2">
                                            <!-- <span class="avatar avatar-md bg-secondary shadow-sm fs-18">
                                                <i class="bi bi-person-square"></i>                                                                                                                                                                                  
                                            </span> -->
                                        </div>
                                    </div>
                                    <!-- <span class="fs-5 fw-semibold">9,231</span> -->
                                    <!-- <span class="fs-12 op-7 ms-1"><i class="ti ti-trending-up me-1 d-inline-block"></i>0.5%</span> -->
                                </div>
                            </div>
                        </div>
                        <!--  -->


                    </div>
                    <div>
                        <div class="col-xxl-3 col-xl-3 col-lg-6 col-md-6">
                            <!--  -->
                            <div class="card custom-card card-bg-primary text-fixed-white">
                                <!-- <div class="card-body">
                                    <div class="d-flex align-items-top mb-2">
                                        <div class="flex-fill">
                                            <p class="mb-0 op-7">Today</p>
                                        </div>
                                        <div class="ms-2">
                                            <span class="avatar avatar-md bg-secondary shadow-sm fs-18">
                                                <i class="bi bi-person-square"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <span class="fs-5 fw-semibold">9,231</span>
                                    <span class="fs-12 op-7 ms-1"><i class="ti ti-trending-up me-1 d-inline-block"></i>0.5%</span>
                                </div> -->
                            </div>
                            <!--  -->  
                        </div>
                    </div>
                </div>
                <!--End::row-1 -->

                <!-- Start::row-2 -->
                <div class="row">
                    <div class="col-xxl-2 col-xl-4 col-lg-12">
                        <div class="row">
                            <div class="col-xl-12">
                                
                            </div>
                            <div class="col-xl-12">
                                <!--  -->
                                <!--  -->
                            </div>
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                    
                                </div>
                            </div>
                            <div class="col-xl-12">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-5 col-xl-8 col-lg-12">
                        <div class="row">
                            <div class="col-xl-6">
                                
                            </div>
                            <div class="col-xl-6">
                                <!--  -->
                                <!--  -->
                            </div>
                            <div class="col-xl-6">
                                <!-- <div class="card custom-card overflow-hidden">
                                    <div class="card-body p-0">
                                        
                                        <div id="totalRevenue"></div>
                                    </div>
                                </div> -->
                            </div>
                            <div class="col-xl-6">
                                <div class="card custom-card">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-3 col-xl-7 col-lg-7">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                    
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                   
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-2 col-xl-5 col-lg-5">
                        <div class="row">
                            <div class="col-xl-12">
                                
                            </div>
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                    <div class="card-body p-0">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card custom-card">
                                    <div class="card-body p-0">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End::row-2 -->

                <!-- Start::row-3 -->
                <div class="row">
					
				</div>
                <!-- End::row-3 -->

                <!-- Start::row-4 -->
                <div class="row">
                    
                </div>
                <!-- End::row-4 -->

                <!-- Start::row-5 -->
                <div class="row">
                    
                </div>
                <!-- End::row-5 -->

                <!-- Start::row-6 -->
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card custom-card">
                            
                        </div>
                    </div>
                    <div class="col-xl-4">
                        
                    </div>
                    <div class="col-xl-4">
                        
                    </div>
                </div>
                <!-- End::row-6 -->

                <!-- Start:: row-7 -->
                <div class="row">
                    <div class="col-xl-6">
                        
                    </div>
                    <div class="col-xl-6">
                        
                        
                    </div>
                </div>
                <!-- End:: row-7 -->

                <!-- Start::row-8 -->
                <div class="row">
                    <div class="col-xl-4">
                        
                    </div>
                    <div class="col-xl-4">
                        
                    </div>
                    <div class="col-xl-4">
                        
                    </div>
                </div>
                <!-- End::row-8 -->

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
        

    </div>

</body>
<script>

    setInterval(function(){ 
    var showDate = document.getElementById("showDate");
    //var showTime = document.getElementById("showTime");
    var showHour = document.getElementById("showHour");
    var showColon = document.getElementById("showColon");
    var showTime = document.getElementById("showTime");
    var showAmpm = document.getElementById("showAmpm");
    var today = new Date();

    // 결과 : Sun May 30 2021 15:47:29 GMT+0900 (대한민국 표준시)

    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;

//     console.log(dateString);

    // 결과 : 2021-05-30

    var hours = ('0' + today.getHours()).slice(-2); 
    var minutes = ('0' + today.getMinutes()).slice(-2);
    var seconds = ('0' + today.getSeconds()).slice(-2); 
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    

    //var timeString = hours + ':' + minutes +" "+ ampm;
    var hourString = hours;
    var semiString = ':';
    var minuteString = minutes;
    var ampmString = ampm;


    //console.log(timeString);
    // 결과 : 3:47 PM

    showDate.innerHTML = dateString;

    showHour.innerHTML = hourString;
    showColon.innerHTML = semiString;
    showTime.innerHTML = minuteString;
    showAmPm.innerHTML = ampmString;

    },1000)

    function doBlink() {
    var blink  = document.all.tags("BLINK");
    for(var i = 0; i < blink.length; i++) {
        blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "";
    }
}
function startBlink() {
    if(document.all) {
        setInterval("doBlink()",350);
    }
}
window.onload = startBlink;


    //////////////////////
     //오늘 날짜출력
     $(document).ready(function() {

        function convertTime() {
        var now = new Date();

        var month = now.getMonth() + 1;
        var date = now.getDate();

        return month + '월' + date + '일';
        }

        var currentTime = convertTime();
        $('.nowtime').append(currentTime);

    });

    //제이쿼리사용
    $.getJSON('https://api.openweathermap.org/data/2.5/weather?q=daejeon,kr&appid=API_KEY&units=metric',
    function(WeatherResult) {
    //기온출력

    var temp  = Math.floor(WeatherResult.main.temp);
    $('.SeoulNowtemp').append(temp+"°C");
    $('.SeoulLowtemp').append(WeatherResult.main.humidity+"%");
    $('.SeoulHightemp').append(WeatherResult.weather[0].description);

    //날씨아이콘출력
    //WeatherResult.weater[0].icon
        var weathericonUrl = '<img src= "http://openweathermap.org/img/wn/' 
            + WeatherResult.weather[0].icon + 
            '.png" alt="' + WeatherResult.weather[0].description + '"/>'
        $('.SeoulIcon').html(weathericonUrl);
    
    
    });


</script>

</html>