<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script src='https://8x8.vc/vpaas-magic-cookie-30197fdac748462da181f1d55f8ab63e/external_api.js' async></script>
    <style>
    	/* 화상 채팅 영역을 감싸는 div 요소의 스타일 */
       #jaas-container {
    height: 850PX;
    margin-left: 13%;
    margin-top: 5%;
    width: 86%;
    	}

    </style>
    <script type="text/javascript">
	    
	      window.onload = () => {
	    	  
	    	let roomName = "${roomName}";
	    	let alias = "${alias}";
	    	
		    let audioInput = "";
		    let audioOutput = "";
		    let videoInput = "";
		    
	    	let memberNo = ${sessionScope.user.member.memNo};
	      	let empName = "${sessionScope.user.member.memName}";
	      	
	      	console.log(empName);
	      	
	      	let empNo = "";
	    	  
	      	let employeeNum = 0;
	    	
	    	$.ajax({
	    		url : "/doctor/meeting/getEmpInfo",
	    		type : "post",
	    		data : JSON.stringify({ memNo : memberNo }),
	    		contentType : "application/json",
	    		beforeSend: function(xhr) {
	    			xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	    		},
	    		success : function(res) {
	    			console.log(res);
	    			employeeNum = res.empNo;
	    		}
	    	});
	    	  
	    	  let startTime;
	    	  let participants = 0;
	    	  
	    	  navigator.mediaDevices
	    		.enumerateDevices()
	    		.then(function (devices) {
	    		  devices.forEach(function (device) {
	    		    console.log(
	    		      device
	    		    );
	    		    if (device.kind == "audioinput") {
	    		    	audioInput = device;
					}
	    		    if (device.kind == "audioutput") {
	    		    	audiooutput = device;
					}
	    		    if (device.kind == "videoinput") {
	    		    	videoInput = device;
					}
	    		  });
	    		})
	    		.catch(function (err) {
	    		  console.log(err.name + ": " + err.message);
	    		});
	    	const options = {
	    		
	    		devices : {
	    			audioInput : audioInput,
	    			audioOutput : audioOutput,
	    			videoInput : videoInput
	    		}
	    	};
	    	
	        const api = new JitsiMeetExternalAPI("8x8.vc", {
	          roomName: "vpaas-magic-cookie-30197fdac748462da181f1d55f8ab63e/" + roomName, // roomname 설정 가능
	          parentNode: document.querySelector('#jaas-container'),
	          configOverwrite: {
	        	  toolbarButtons: ['hangup', 'microphone', 'camera', 'settings'],
	              brandingRoomAlias : alias
	          },
	          lang: 'ko'
	        }, options);
	        
	        $.ajax({
	  	    	url : "/doctor/meeting/getEmpInfo",
	  	    	type : "post",
	  	    	data : JSON.stringify({ memNo : memberNo }),
	  	    	beforeSend: function(xhr) {
	  		        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	  			},
	  	    	contentType : "application/json",
	  	    	success : function(res) {
	  				console.log(res);
	  				empNo = res.empNo;
	  				let empJob = res.empJob;
	  				
	  				console.log(empName);
	  				console.log(empJob);
	  				
// 	  				$('.jstree-anchor').css("font-size", "16px");
// 	  				$('.jstree-anchor').css("line-height", "24px");
// 	  				$('.jstree-anchor').css("height", "31px");
// 	  				console.log("CSSS변경")
	  				
	  			}
	  	    });
	        
	        let meetingNo = 0;
	        // 되는거 확인
	        api.addEventListener('videoConferenceJoined', (event) => {
	            // 회의 시작 시간이 설정되어 있지 않으면 설정
	            // joinMeetingAndSetDisplayName();
	            
	            // const displayName = event.displayName;
	            // empName = displayName.split(" ")[0];
	            
	            let meetingDate = "";
	            let meeingStartTime = "";
	            
	            if (!startTime) {
	                startTime = new Date();
	                const year = startTime.getFullYear().toString().slice(-2); // 년도의 마지막 2자리만 추출
	                const month = ('0' + (startTime.getMonth() + 1)).slice(-2); // 월이 0부터 시작하므로 1을 더한 후 2자리로 맞춤
	                const date = ('0' + startTime.getDate()).slice(-2); // 날짜를 2자리로 맞춤
	                meetingDate = year + "/" + month + "/" + date;
	
	                // 현재 시간 가져오기
	                const hours = ('0' + startTime.getHours()).slice(-2); // 시간을 2자리로 맞춤
	                const minutes = ('0' + startTime.getMinutes()).slice(-2); // 분을 2자리로 맞춤
	                meeingStartTime = hours + ":" + minutes;
	
	            }
	            // 참여 인원 수 증가
	            participants++;
	            
	            if (participants == 1) {
		            
		            let data = {
		            	meetingDate : meetingDate,
		            	meetingStarttime : meeingStartTime,
		            	meetingStarter : employeeNum
		            }
		            
		            $.ajax({
		            	url : "/doctor/meeting/createMeeting",
		            	type : "POST",
		            	data : JSON.stringify(data),
		            	beforeSend: function(xhr) {
					        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
						},
		            	contentType : "application/json",
		            	async: false,
		            	success : function(res) {
		            		if (res != 0) {
								meetingNo = res;
							}
						}
		            });
				}
	            
	            // 회의에 입장하면 사용자 정보 받아서 회의 참여인원 정보 insert하기
	            // 로그인한 사용자 empNo 가져오기
				insertMeetingPerson(empNo, meetingNo); // empNo 임시
				            
	        });
	        
	        function insertMeetingPerson(empNo, meetingNo) {
				let data = {
					empNo : empNo,
					meetingNo : meetingNo
				};
	        
	        	$.ajax({
	        		url : "/doctor/meeting/insertMeetingPerson",
	        		type : "post",
	        		data : JSON.stringify(data),
	        		beforeSend: function(xhr) {
				        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
	        		contentType : "application/json",
	        		success : function(res) {
						console.log(res);
					}
	        	});
			}
	        // 종료 이벤트
	        api.addEventListener('videoConferenceLeft', () => {
	        	
	        	participants--;
	
	            // 만약 모든 참가자가 나갔다면 종료 시간 기록 및 데이터 전송
	            if (participants === 0) {
	                const endTime = new Date();
	                
	                const hours = ('0' + endTime.getHours()).slice(-2); // 시간을 2자리로 맞춤
	                const minutes = ('0' + endTime.getMinutes()).slice(-2); // 분을 2자리로 맞춤
	                let meeingEndTime = hours + ":" + minutes;
	
	                // DB에 데이터 전송
	                console.log(participants);
	                console.log(endTime);
	                console.log("empName : " + empName);
	                sendDataToServer(meeingEndTime);
	                
	             // 회의 종료 후 페이지 이동
	            }
	            location.href =  "/admin/main"; // 이동하고자 하는 페이지의 URL을 입력하세요.
	        });
	        
	       
	        
		    function sendDataToServer(meeingEndTime) {
		    	let data = {
		    		meetingNo : meetingNo,
		    		meetingEndtime : meeingEndTime
		    	};
		    	console.log(meetingNo);
		    	// 회의 정보 update(endTime이랑 회의 번호 보내면 될듯?)
		    	$.ajax({
		    		url : "/doctor/meeting/recordingMeeting",
		    		type : "post",
		    		beforeSend: function(xhr) {
				        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
		    		data : JSON.stringify(data),
		    		contentType : "application/json",
		    		success : function(res) {
						console.log(res);
					}
		    	});
		    }
		  //여기에 페이지 이동 링크 달기
		//원래 treeView페이지로
		/* $('#new-toolbox > :nth-child(4) .toolbox-icon.hangup-button').on('click', function() {
		    // 클릭 이벤트 핸들러 코드 작성
			location.href = "/doctor/meeting/treeView";
		}); */
			
		    
	      };
    </script>
  </head>
  <body><div id="jaas-container" style=></div></body>
</html>
  