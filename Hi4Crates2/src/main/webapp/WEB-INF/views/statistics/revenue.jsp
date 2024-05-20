<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                <div class="card-title">월 별 매출액</div>
                            </div>
                            <div class="card-body">
                            	<select id="yearSelect">

								</select>
                                <div id="echart-basic-line1" class="echart-charts"></div>
                            </div>
                        </div>
                    </div>
                <div class="col-xl-6">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">과 별 매출액</div>
                            </div>
                            <div class="card-body">
                            <select id="yearSelect1">

							</select>
                                <div id="dashed-chart1"></div>
                            </div>
                        </div>
<!--                         <div class="card custom-card"> -->
<!--                             <div class="card-header"> -->
<!--                                 <div class="card-title">월별 직원 수 추이</div> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                             	<select id="yearSelect1"> -->

<!-- 								</select> -->
<!--                                 <div id="echart-stacked-line1" class="echart-charts"></div> -->
<!--                             </div> -->
<!--                         </div> -->
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
    <script src="${pageContext.request.contextPath }/assets/js/apexcharts-stock-prices.js"></script>

</body>
<script type="text/javascript">
$(function() {
    function render(year) {
        // AJAX 요청을 통해 결과를 가져오고 차트를 그리는 작업
        $.ajax({
            url: '/statistics/monthMoney',
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify({ statisticsYear: year }),
            success: function(res) {
                console.log("월변돈" + res);
                // AJAX 요청이 성공한 경우 차트를 그리기 위해 option을 업데이트
                option.series[0].data[4] = res;
                // 차트를 다시 렌더링
                myChart.setOption(option);
            }
        });
    }

    //초기 연도와 월 설정
    var currentYear = new Date().getFullYear(); // 현재 연도를 가져옵니다.

    //년 select 박스의 옵션 추가 및 기본값 설정
    var yearSelect = document.getElementById("yearSelect");
    for (var year = currentYear; year >= 2020; year--) {
        var option = document.createElement("option");
        option.text = year + "년";
        option.value = year;
        yearSelect.add(option);
    }

    $('#yearSelect').val(currentYear);
    //연도 변경 시 render 함수 호출
    $('#yearSelect').change(function() {
        var selectedYear = $('#yearSelect').val();
        console.log("선택된 년:", selectedYear);
        render(selectedYear);
    });

    // 초기 데이터 설정
    var initialData = [34234560, 31234560, 28234560, 29234560, 6370624, , , , , , , ];

    // basic line chart
    var dom = document.getElementById('echart-basic-line1');
    var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
    });
    var app = {};
    var option;
    option = {
        grid: {
            left: "0%",
            right: "0%",
            bottom: "0%",
            top: "10%",
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            axisLine: {
                lineStyle: {
                    color: "#8c9097"
                },
                splitLine: {
                    lineStyle: {
                        color: "rgba(142, 156, 173,0.1)"
                    }
                }
            }
        },
        yAxis: {
            type: 'value',
            axisLine: {
                lineStyle: {
                    color: "#8c9097"
                }
            },
            splitLine: {
                lineStyle: {
                    color: "rgba(142, 156, 173,0.1)"
                }
            }
        },
        series: [{
            data: initialData,
            type: 'line'
        }],
        color: "#845adf",
        tooltip: {  // tooltip 옵션 추가
            trigger: 'axis',  // 마우스를 그래프 선 위에 올렸을 때 툴팁을 활성화
            axisPointer: {  // 축을 따라 툴팁을 표시하는 설정
                type: 'line'  // 축에 따라 선으로 표시
            }
        }
    };
    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
    window.addEventListener('resize', myChart.resize);

    // 초기 렌더링을 위해 render 함수 호출
    render(currentYear);
});

/* 
	2번째 차트
*/

	//새로운 변수명을 사용하여 현재 연도 가져오기
	var currentYear1 = new Date().getFullYear(); // 현재 연도를 가져옵니다.

	// 년 select 박스의 옵션 추가 및 기본값 설정
	var yearSelect1 = document.getElementById("yearSelect1");
	for (var year = currentYear1; year >= 2020; year--) {
	    var option = document.createElement("option");
	    option.text = year + "년";
	    option.value = year;
	    yearSelect1.add(option);
	}
	
	$('#yearSelect1').val(currentYear1);
	render1(currentYear1);
	
	// 연도 변경 시 render 함수 호출
	$('#yearSelect1').change(function() {
	    var selectedYear = $('#yearSelect1').val();
	    console.log("선택된 년1 :", selectedYear);
	    render1(selectedYear);
	});


/* dashed chart */
    let options1 = {
        series: [{
            name: "MRI",
            data: [6, 6, 5, 5, 6, 6, 6, 6, 6, 6, 8, 5]
        },
        {
            name: "X-Ray",
            data: [28, 28, 28, 29, 28, 28, 28, 26, 28, 28, 27, 29]
        },
        {
            name: '물리치료',
            data: [3, 3, 3, 3, 6, 3, 3, 3, 3, 3, 3, 3]
        },
        {
            name: "수술비용",
            data: [5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 3, 5]
        },
        {
            name: "입원비용",
            data: [15, 18, 15, 14, 15, 16, 15, 16, 18, 18, 18, 18]
        }
        ],
        chart: {
            height: 320,
            type: 'line',
            zoom: {
                enabled: false
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            width: [4, 4, 4, 4, 4],
            curve: 'straight',
            dashArray: [0, 0, 0, 0, 0]
        },
        colors: ["#845adf", "#23b7e5", "#f5b849", "#49b6f5", "#e6533c"],
        title: {
            text: 'Page Statistics',
            align: 'left',
            style: {
                fontSize: '13px',
                fontWeight: 'bold',
                color: '#8c9097'
            },
        },
        legend: {
            tooltipHoverFormatter: function (val, opts) {
                return val + ' - ' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + ''
            }
        },
        markers: {
            size: 0,
            hover: {
                sizeOffset: 6
            }
        },
        xaxis: {
            categories: ['01 Jan', '02 Jan', '03 Jan', '04 Jan', '05 Jan', '06 Jan', '07 Jan', '08 Jan', '09 Jan',
                '10 Jan', '11 Jan', '12 Jan'
            ],
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
            min: 0,
            max: 100000,
            tickAmount: 6, // 0부터 30까지 6개의 눈금으로 나누어 표시합니다.
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
        tooltip: {
            y: [
                {
                    title: {
                        formatter: function (val) {
                            return val + " (mins)"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val + " per session"
                        }
                    }
                },
                {
                    title: {
                        formatter: function (val) {
                            return val;
                        }
                    }
                }
            ]
        },
        grid: {
            borderColor: '#f1f1f1',
        }
    };
    var chart = new ApexCharts(document.querySelector("#dashed-chart1"), options1);
    chart.render();
	render1(currentYear1);
	
	
	function render1(year){
		$.ajax({
			url: '/statistics/subject',
			type: 'POST',
			contentType: "application/json",
			data: JSON.stringify({statisticsYear: year}),
			success: function(res){
				console.log(res);
				console.log("MRI" + res.mriPrice);
				console.log("X-Ray" + res.xrayPrice);
				console.log("물리치료" + res.mulliPrice);
				console.log("수술" + res.surgeryPrice);
				console.log("입원" + res.hpPrice);
				
				// 1000에 자리마다 쉼표 넣는거, 근데 이렇게 데이터 넣으면 쉼표때메 값이 잘려서 들어감
				let MriPrice = res.mriPrice.toLocaleString();
				let XrayPrice = res.xrayPrice.toLocaleString();
				let MulliPrice = res.mulliPrice.toLocaleString();
				let SurgeryPrice = res.surgeryPrice.toLocaleString();
				let HpPrice = res.hpPrice.toLocaleString();
				
				
				// 받아온 데이터를 적절한 형태로 처리하여 각 시리즈에 할당합니다.
	            options1.series[0].data[4] = res.mriPrice; // MRI 데이터
	            options1.series[1].data[4] = res.xrayPrice; // X-ray 데이터
	            options1.series[2].data[4] = res.mulliPrice; // 물리치료 데이터
	            options1.series[3].data[4] = res.surgeryPrice; // 수술 데이터
	            options1.series[4].data[4] = res.hpPrice; // 입원 데이터

	            // 차트를 업데이트합니다.
	            chart.updateSeries(options1.series);
			    
			    
			},
			error: function(xhr, status, error){
				
				console.log("오류가 발생하였습니다.");
			}
		});
	}
</script>

</html>