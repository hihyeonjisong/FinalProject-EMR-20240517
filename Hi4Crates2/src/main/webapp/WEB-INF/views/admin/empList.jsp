<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>



<!-- Prism CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/prismjs/themes/prism-coy.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/toastUiGrid/tui-grid.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/toastUiGrid/tui-grid.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/toastUiGrid/tui-date-picker.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/toastUiGrid/tui-time-picker.css" type="text/css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="${pageContext.request.contextPath }/resources/toastUiGrid/tui-time-picker.js"></script>
<script src="${pageContext.request.contextPath }/resources/toastUiGrid/tui-date-picker.js"></script>
<script src="${pageContext.request.contextPath }/resources/toastUiGrid/gridData.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid" style="height:877px;">
			<!-- Start::row-1 -->
			<div class="row"  style="height: 100%;">
				<div class="col-xl-12"  style="height: 100%;">
					<div class="card custom-card"  style="height: 100%;">
						<div class="card-header">
							<div class="card-title">
								직원목록
							</div>
						</div>
						<div class="card-body">
							<div id="grid"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End::app-content -->
 
	


<script type="text/javascript">

$(function(){
	 class CustomTextEditor {
	        constructor(props) {
	          const el = document.createElement('input');
	          const { maxLength } = props.columnInfo.editor.options;

	          el.type = 'text';
	          el.id = 'txt';
	          el.maxLength = maxLength;
	          el.value = String(props.value);

	          this.el = el;
	        }

	        getElement() {
	          return this.el;
	        }

	        getValue() {
	          return this.el.value;
	        }

	        mounted() {
	          this.el.select();
	        }
	      }
		//grid 인스턴스 생성
	      const grid = new tui.Grid({
	    	//gird가 생성될 컨테이너 HTML엘리먼트
	        el: document.getElementById('grid'),
	        
	        //페이징처리옵션
		     pageOptions: {
		     useClient: true,
		     perPage: 15,
		   },

//	         scrollX: false,
//	         scrollY: false,

			//헤더의 체크박스옵션
// 	        rowHeaders:['checkbox'],
	        //컬럼정보배열
	        columns: [
	            {
	                header: '사원번호',	//컬럼의 헤더에 사용
	                name: 'empNo',	//키값으로 사용됨
	                align: 'center', 
//	               editor: 'text',	//컬럼의 인풋타입 결정
	                sortable: true,		//정렬옵션
	                sortingType: 'asc',
	                width: 100,
	                	
	              },
	              {
		                header: '직무',
		                name: 'empJob',
		                formatter: 'listItemText',
		                align: 'center', 
		                editor: {
		                  type: 'select',
		                  options: {
		                    listItems: [
		                      { text: '정형외과의', value: '정형외과의' },
		                      { text: '정형외과장', value: '정형외과장' },
		                      { text: '신경외과의', value: '신경외과의' },
		                      { text: '신경외과장', value: '신경외과장' },
		                      { text: '간호사', value: '간호사' },
		                      { text: '간호사장', value: '간호사장' },
		                      { text: '방사선사', value: '방사선사' },
		                      { text: '방사선과장', value: '방사선과장' },
		                      { text: '물리치료사', value: '물리치료사' },
		                      { text: '재활의학과장', value: '재활의학과장' },
		                      { text: '원무과', value: '원무과' },
		                      { text: '원무과장', value: '원무과장' },
		                      { text: '병원장', value: '병원장' }
		                  	]
		                  },

		              },
		              
		                filter: {
		                    type: 'text'
		                  },
		                width: 100,
		                sortable: true,		//정렬옵션
		                sortingType: 'asc'
	              },
		          {
		                header: '이름',	//컬럼의 헤더에 사용
		                name: 'memName',	//키값으로 사용됨
		                align: 'center', 
//		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                filter: {
		                    type: 'text',
		                  },
		                width: 90
		                	
		           },
			        {
		                header: '성별',	//컬럼의 헤더에 사용
		                name: 'memGender',	//키값으로 사용됨
		                align: 'center', 
//		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                width: 50
		                	
		           },
		           {
		                header: '생년월일',	//컬럼의 헤더에 사용
		                name: 'memRegno1',	//키값으로 사용됨
		                align: 'center', 
//		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                width: 90
		           },
		           {
		                header: '나이',	//컬럼의 헤더에 사용
		                name: 'memAge',	//키값으로 사용됨
		                align: 'center', 
//		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                width: 50
		                	
		           },
		           {
		                header: '연락처',	//컬럼의 헤더에 사용
		                name: 'memTel',	//키값으로 사용됨
		                align: 'center', 
//		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                	
		           },
		           {
		                header: '주소',	//컬럼의 헤더에 사용
		                name: 'memAddress1',	//키값으로 사용됨
//		               editor: 'text',	//컬럼의 인풋타입 결정
		                filter: {
		                    type: 'text',
		                  },
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                width: 220
		                	
		           },
	              {
	                header: '면허번호',
	                name: 'empLicence',
	                align: 'center', 
// 	             	sortable: true,
// 	              	sortingType: 'asc',
	                width: 70
	              },
	              {
	                  header: '입사일',
	                  name: 'empHireDate',
// 	                  sortable: true,
// 	                  sortingType: 'asc',
	                  align: 'center', 
	                  filter: {
	                      type: 'date',
	                      options: {
	                        format: 'yyyy.MM.dd'
	                      }
	                    },
	             		width: 100
// 	                   filter: 'date',
	                },
	 	           {
		                header: '퇴사여부',	//컬럼의 헤더에 사용
		                name: 'empLeave',	//키값으로 사용됨
		                align: 'center', 
		               editor: 'text',	//컬럼의 인풋타입 결정
// 		                sortable: true,		//정렬옵션
// 		                sortingType: 'asc',
		                width: 70,
		                filter: {
		                    type: 'select'
		                  }
		           },
		              {
		                  header: '퇴사일',
		                  name: 'empLeaveDate',
		                  align: 'center', 
		                  editor: {
		                      type: 'datePicker',
		                      options: {
		                          format: 'yyyy/MM/dd',
		                      },
		                    },
		                   width: 100
		               }
	        ]
	      });
	      //전체리스트 불러오기
	      showList();
	      
	      var data;
	      var empNo;
	      
	      
	      grid.on('dblclick',function(){
			  grid.startEditing();
			  data = grid.getFocusedCell(); // 클릭한 셀 값
			  console.log("data  : "+data.rowKey);
			  let ob = grid.getColumnValues('empNo'); // empNo 배열
			  console.log("ob :"+ob);
			  let idx = data.rowKey; // 클릭한 셀 행 번호
			  empNo = ob[idx]; // 클릭한 셀 행번호에 해당하는 empNo 값
			  console.log(data);

	      grid.on('beforeChange', ev => {
//	         console.log('before change:', ev);
	      });
	      
	});
	      grid.on('afterChange', ev => {
	    	
			let changeData = ev.changes[0].value;
	        console.log('after change:', changeData);
	    	data.value = changeData;	//수정한 값을 담아줌
	    	
			let empData = {
					empNo : empNo,
					columnName : data.columnName,
					value : data.value
				};
			console.table(empData);
			
			
			$.ajax({
		   		url:"/empList/updateEmp",
	  			type:"post",
	  			contentType : "application/json;charset=utf-8",	//보내는거
	  			data : JSON.stringify(empData),	//보내는 데이터
	  			beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        		},
	  			success:function(result){
	  				console.log("result: " + result);
	  				if(result ==="SUCCESS"){
	  					alert("성공!");
	  					showList();
	  				}
	  			}
	  			
				});
	      });
// 	      tui.Grid.applyTheme('clean');
	      
	      tui.Grid.applyTheme('default', {
	    	  cell: {
	    	    normal: {
	    	      background: '#fff',
	    	      border: '#e0e0e0',
	    	      showVerticalBorder: false,
	    	      showHorizontalBorder: true
	    	    },
	    	    header: {
	    	      background: '#fff',
	    	      border: '#e0e0e0'
	    	    },
	    	    selectedHeader: {
	    	      background: '#e0e0e0'
	    	    }
	    	  }
	    	});

//사원리스트 보여줌     
function showList(){
	$.ajax({
		url : "/empList/getEmpList",
		method : "GET",
		dataType : "JSON",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success : function(result){
			console.log(result);
			grid.resetData(result);
		}
	});
}
	});


</script>

</html>