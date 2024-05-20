<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
/* 스타일링된 셀렉트 박스 */
/* 셀렉트 박스 스타일 */
.custom-select {
  display: block;
  font-family: Arial, sans-serif;
  font-size: 14px; /* 폰트 크기 조정 */
  color: #555;
  line-height: 1.5;
  padding: .25rem .5rem; /* 내부 여백 조정 */
  width: 20%; /* 너비 조정 */
  max-width: 100%;
  height: calc(1.875rem + 2px); /* 높이 조정 */
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: .2rem; /* 모서리 반경 조정 */
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

/* 셀렉트 박스 호버 효과 */
.custom-select:hover {
  border-color: #adb5bd;
}

/* 셀렉트 박스 포커스 효과 */
.custom-select:focus {
  border-color: #86b7fe;
  outline: 0;
  box-shadow: 0 0 0 0.1rem rgba(13, 110, 253, 0.25); /* 포커스된 경우 그림자 크기 조정 */
}

/* 셀렉트 박스 화살표 아이콘 */
.custom-select::after {
  position: absolute;
  top: 50%;
  right: .5rem; /* 오른쪽 여백 조정 */
  bottom: 0;
  content: '\203A';
  transform: translateY(-50%);
  color: #555;
  pointer-events: none;
}
</style>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                <!-- <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">전체 통계</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ecommerce</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Products List</li>
                            </ol>
                        </nav>
                    </div>
                </div> -->
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">   
                    <div class="col-xl-12">
                        <div class="card custom-card" style="height:880px;">
                            <div class="card-header">
                                <div class="card-title">
                                   	매출액 통계
                                </div>
                            </div>
                            <div class="card-body" style="padding-top: 100px;">
                                <div class="table-responsive mb-4">
                                <!-- Start::row-1 -->
                <div class="row">
                	<div class="col-xl-6">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">연 별 수입 통계</div>
                            </div>
                            <div class="card-body" style="margin-top: 30px;">
                            	<select id="year1" hidden>
                            	
                            	</select>
                                <div id="column-basic1"></div>
                            </div>
                        </div>
                    </div>
                	<div class="col-xl-6">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">월 별 수입 통계</div>
                            </div>
                            <div class="card-body">
                            	<select class="custom-select" id="year2">
                            	
                            	</select>
                                <div id="column-basic2"></div>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
                </div>
                <!--End::row-1 -->
            </div>
          </div>
         </div>
        </div>
        <!-- End::app-content -->

        <!-- modal -->
        
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

   
	
    <!-- Echarts JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/echarts/echarts.min.js"></script>
    

	<!-- -Used In Annotations Chart -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/apexcharts-stock-prices.js"></script>
    
</body>
<script type="text/javascript">
$(function() {
	function render(year) {
		$.ajax({
			url: '/statistics/yearMonth',
			type: 'POST',
			contentType: "application/json",
			data: JSON.stringify({ statisticsYear: year }),
			success: function(res){
				console.log("ㅎㅇ" + res);
				console.log(options);
				options.series[0].data[4] = res;
				console.log(options);
				$('#column-basic1').html("");
				chart.render();
				
			}
		});
	}
	
	/* basic column chart 1번*/
    
	// 초기 연도와 월 설정
	var currentYear = new Date().getFullYear();

	// 년 select 박스의 옵션 추가 및 기본값 설정
	var yearSelect = document.getElementById("year1");
	for (var year = currentYear; year >= 2020; year--) {
    var option = document.createElement("option");
    option.text = year + "년";
    option.value = year;
    yearSelect.add(option);
}
	// 초기 렌더링 시 render 함수 호출 (여기 render1로 바꾸거나 추가);
	render(currentYear);

	$('#year1').val(currentYear);
	// 연도 변경 시 render 함수 호출
	$('#year1').change(function() {
    var selectedYear = $('#year1').val();
    console.log("선택된 년:", selectedYear);
    render(selectedYear);
});
	
	// 년 select 박스의 옵션 추가 및 기본값 설정
	var yearSelect1 = document.getElementById("year2");
	for (var year = currentYear; year >= 2020; year--) {
    var option = document.createElement("option");
    option.text = year + "년";
    option.value = year;
    yearSelect1.add(option);
}
	// 초기 렌더링 시 render 함수 호출 (여기 render1로 바꾸거나 추가);
// 	render(currentYear);

	$('#year2').val(currentYear);
	// 연도 변경 시 render 함수 호출
	$('#year2').change(function() {
    var selectedYear1 = $('#year2').val();
    console.log("선택된 년:", selectedYear1);
//     render(selectedYear1);
});

	
	var options = {
        series: [{
            name: '2024연매출',
            data: [32224124, 35224125, 33224123, 36224121, 87]
        }],
        chart: {
            type: 'bar',
            height: 320
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '80%',
                endingShape: 'rounded'
            },
        },
        grid: {
            borderColor: '#f2f5f7',
        },
        dataLabels: {
            enabled: false
        },
        colors: ["#845adf", "#23b7e5", "#f5b849"],
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ['2020', '2021', '2022', '2023', '2024'],
            labels: {
                show: true,
                style: {
                    colors: "#8c9097",
                    fontSize: '11px',
                    fontWeight: 600,
                    cssClass: 'apexcharts-xaxis-label',
                },
            }
        },
        yaxis: {
            title: {
                text: '₩ (원)',
                style: {
                    color: "#8c9097",
                }
            },
            labels: {
                formatter: function (val) {
                    return "₩ " + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                },
                show: true,
                style: {
                    colors: "#8c9097",
                    fontSize: '11px',
                    fontWeight: 600,
                    cssClass: 'apexcharts-xaxis-label',
                },
            }
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            y: {
                formatter: function (val) {
                	return "₩ " + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
                }
            }
        }
    };
    var chart = new ApexCharts(document.querySelector("#column-basic1"), options);
    chart.render();
    
    /* 
    	새로운 차트
    */
    
    /* basic column chart */
    var options2 = {
        series: [{
            name: '월 매출',
            data: [34234560, 31234560, 28234560, 29234560, 6370624, , , , , , , ]
        }],
        chart: {
            type: 'bar',
            height: 320
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '80%',
                endingShape: 'rounded'
            },
        },
        grid: {
            borderColor: '#f2f5f7',
        },
        dataLabels: {
            enabled: false
        },
        colors: ["#845adf", "#23b7e5", "#f5b849"],
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            labels: {
                show: true,
                style: {
                    colors: "#8c9097",
                    fontSize: '11px',
                    fontWeight: 600,
                    cssClass: 'apexcharts-xaxis-label',
                },
            }
        },
        yaxis: {
            title: {
                text: '₩ (원)',
                style: {
                    color: "#8c9097",
                }
            },
            labels: {
                formatter: function (val) {
                    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                },
                show: true,
                style: {
                    colors: "#8c9097",
                    fontSize: '11px',
                    fontWeight: 600,
                    cssClass: 'apexcharts-xaxis-label',
                },
            }
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            y: {
                formatter: function (val) {
                	return "₩ " + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
                }
            }
        }
    };
    var chart2 = new ApexCharts(document.querySelector("#column-basic2"), options2);
    chart2.render();
});


</script>

</html>