var contextPath = "<%= request.getContextPath() %>";
/* 로그인 시 알림 전부 띄워주기 */
function getNotiList(event){
	let dis2 = event.data.indexOf("#", event.data.indexOf("#")+1)
	let content = event.data.split("#")[1];
	let notiNo = event.data.split("#")[2];
	let type = event.data.split("#")[3];
	console.log(content);
	let newAlarm = '';
	
	 newAlarm += '<li class="dropdown-item">';
	 newAlarm += '<div class="d-flex align-items-start">';
	 newAlarm += '<div class="pe-2">';

	if(type === '1' || type==='2')
		newAlarm += '<span class="avatar avatar-md bg-success-transparent avatar-rounded"><i class="bx bxs-comment-check fs-18"></i></span>';
	if(type === '3')
		newAlarm += '<span class="avatar avatar-md bg-danger-transparent avatar-rounded"><i class="bx bxs-comment-check fs-18"></i></span>';

	 newAlarm += '</div>';
	 newAlarm += '<div class="flex-grow-1 d-flex align-items-center justify-content-between">';
	 newAlarm += '<div>';
	 newAlarm += '<p class="mb-0 fw-semibold"';
	 if(type==='1')
	 newAlarm += '<a href="notifications.html">업무</a>';
	 if(type==='2')
	 newAlarm += '<a href="notifications.html">기안이 승인되었습니다.</a>';
	 if(type==='3')
	 newAlarm += '<a href="notifications.html">기안이 반려되었습니다.</a>';
	//  if(content === "당신의 연가신청이 승인되었습니다.")
	//  	newAlarm += '<a href="notifications.html">신청이 승인되었습니다!</a>';
	//  else if(content != "당신의 연가신청이 승인되었습니다.")
	//  	newAlarm += '<a href="notifications.html">신청이 반려되었습니다!</a>';

	 newAlarm += '</p>';
	 newAlarm += '<span class="text-muted fw-normal fs-12 header-notification-text">'+content+'</span>';

	//  if(content === "당신의 연가신청이 승인되었습니다.")
	//  newAlarm += '<span class="text-muted fw-normal fs-12 header-notification-text">'+content+'</span>';
	// else if(content != "당신의 연가신청이 승인되었습니다.")
	// newAlarm += '<span class="text-muted fw-normal fs-12 header-notification-text">반려 사유 : '+content+'</span>';

	 newAlarm += '</div>';
	 newAlarm += '<div>';
	 newAlarm += '<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1" data-notino="'+notiNo+'"><i class="ti ti-x fs-16" ></i></a>';
	 newAlarm += '</div>';
	 newAlarm += '</div>';
	 newAlarm += '</div>';
	 newAlarm += '</li>';
	 notiBox.append(newAlarm);

	 $("#notification-icon-badge").text($(".dropdown-item-close1").length+"+");
	 $("#notifiation-data").text("안읽은 알림 (" + $(".dropdown-item-close1").length + ")개");
     $(".empty-item1").addClass("d-none");
	 
	 
	 
	 if($(".dropdown-item-close1").length === 0) {
        $(".empty-item1").removeClass("d-none");
		$("#notifiation-data").text("알림이 존재하지 않습니다.")
	 }
}


function vacationResult(event){
	let result = event.data.split('#')[1];
	let notiNo = event.data.split('#')[2];
	let content;
	if(result === "disagree"){
		content = event.data.substring(event.data.lastIndexOf("#")+1);
	}
	let newAlarm = '';
	
	 newAlarm += '<li class="dropdown-item">';
	 newAlarm += '<div class="d-flex align-items-start">';
	 newAlarm += '<div class="pe-2">';
	 if(result === "agree")
	 	newAlarm += '<span class="avatar avatar-md bg-success-transparent avatar-rounded"><i	class="bx bxs-comment-check fs-18"></i></span>';
	 else if(result ==="disagree")	
	 	newAlarm += '<span class="avatar avatar-md bg-pink-transparent avatar-rounded"><i	class="bx bxs-comment-x fs-18"></i></span>';
	 newAlarm += '</div>';
	 newAlarm += '<div class="flex-grow-1 d-flex align-items-center justify-content-between">';
	 newAlarm += '<div>';
	 newAlarm += '<p class="mb-0 fw-semibold"';
	 if(result === "agree")
	 	newAlarm += '<a href="notifications.html">신청이 승인되었습니다!</a>';
	 else if(result === "disagree")
	 	newAlarm += '<a href="notifications.html">신청이 반려되었습니다!</a>';
	 newAlarm += '</p>';
	 if(result === "agree")
	 newAlarm += '<span class="text-muted fw-normal fs-12 header-notification-text">당신의 연가 신청이 승인되었습니다!</span>';
	 else if(result === "disagree")
	 newAlarm += '<span class="text-muted fw-normal fs-12 header-notification-text">반려 사유 : '+content+'</span>';
	 newAlarm += '</div>';
	 newAlarm += '<div>';
	 newAlarm += '<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1" data-notino="'+notiNo+'"><i class="ti ti-x fs-16" ></i></a>';
	 newAlarm += '</div>';
	 newAlarm += '</div>';
	 newAlarm += '</div>';
	 newAlarm += '</li>';
	 notiBox.append(newAlarm);
	 
	 $("#notification-icon-badge").text($(".dropdown-item-close1").length+"+");
	 $("#notifiation-data").text("안읽은 알림 (" + $(".dropdown-item-close1").length + ")개");
     $(".empty-item1").addClass("d-none");
	 if(result === "agree"){
		 $('#infoToast').toast('show');
	 }
	 if(result === "disagree"){
		 $('#dangerToast').toast('show');
	 }
}

//  소켓 접속시 현 인원한테 동적으로 html 추가해서 온라인된거 보여줌
function showOnline(onlineList, offlineList){

	/* 온라인 유저 뿌리기 */
	var html ='<li class="pb-0">';
	html +='<div class="row">';
	html +='<p class="text-muted fs-11 fw-semibold mb-1 op-7 col-3">온라인</p>';
	html +='<p class="text-muted fs-11 fw-semibold mb-1 op-7 col-9" style="text-align: right;">';
	html +='<span class="badge bg-success-transparent rounded-circle float-end fs-10">온라인 '+onlineList.length+'명</span>';
	html +='</p>';
	html += '</div>';
	html += '</li>';
	let inviteOnHtml = '';
	let groupOnHtml = '';
	$.each(onlineList, function(idx, online){
	html += '<li>' +
    '<div class="d-flex align-items-center">' +
    '<div class="me-1 lh-1">' +
    '<span class="avatar avatar-md online me-2 avatar-rounded">' +
    '<img src="/resources/img/default.png" alt="img">' +
    '</span>' +
    '</div>' +
    '<div class="flex-fill my-auto">' +
    '<p class="mb-0 fw-semibold">' +
    online.memName +
    '<span class="text-muted text-truncate fs-10">' + online.empJob + '</span>' +
    '</p>' +
    '<p class="fs-12 mb-0">' +
    '<span class="text-muted text-truncate">' + online.memEmail + '</span>' +
    '</p>' +
    '</div>' +
    '<div class="">' +
    '<button aria-label="button" type="button" class="btn btn-sm btn-icon btn-primary-light">' +
    '<i class="ti ti-plus"></i>' +
    '</button>' +
    '</div>' +
    '</div>' +
    '</li>';

	inviteOnHtml+='<li class="checkforactive chatUser" style="margin-top: 10px;">'
	// inviteOnHtml+='<span style="display:none;">'+online.memNo+'</span>';
	inviteOnHtml+='<div class="d-flex align-items-top">'
	inviteOnHtml+='<div class="me-1 lh-1">'
	inviteOnHtml+='<span class="avatar avatar-md online me-2 avatar-rounded">'
	inviteOnHtml+='<img src="/resources/img/default.png" alt="img">';
	inviteOnHtml+='</span>'
	inviteOnHtml+='</div>'
	inviteOnHtml+='<p class="fw-semibold fs-14 memName" style="margin-top:7px;">'
	inviteOnHtml+=online.memName
	inviteOnHtml+='</p>'
	inviteOnHtml+='<input type="radio" class="flex-fill" style="margin-left:50%; height: 20px; margin-top: 7px;" name="soloSelect" value="'+online.memNo +'">'
	inviteOnHtml+='</div>'
	inviteOnHtml+='</li>'

	groupOnHtml+='<li class="checkforactive chatUser" style="margin-top: 10px;">'
	// groupOnHtml+='<span style="display:none">'+online.memNo+'</span>';
	groupOnHtml+='<div class="d-flex align-items-top">'
	groupOnHtml+='<div class="me-1 lh-1">'
	groupOnHtml+='<span class="avatar avatar-md online me-2 avatar-rounded">'
	groupOnHtml+='<img src="/resources/img/default.png" alt="img">';
	groupOnHtml+='</span>'
	groupOnHtml+='</div>'
	groupOnHtml+='<p class="fw-semibold fs-14 memName" style="margin-top:7px;">'
	groupOnHtml+=online.memName
	groupOnHtml+='</p>'
	groupOnHtml+='<input type="radio"  name="'+online.memName+'" class="flex-fill" style="margin-left:50%; height: 20px; margin-top: 7px;" value="'+online.memNo +'">'
	groupOnHtml+='</div>'
	groupOnHtml+='</li>'




	});
	$('#onlineList').html(html);
	$('#inviteOnlieList').html(inviteOnHtml);
	$('#onlinePeople').text('온라인 ('+onlineList.length+')');
	$('#onlineGroupPeople').text('온라인 ('+onlineList.length+')');
	$('#groupOnlieList').html(groupOnHtml);









	/* 오프라인 유저 뿌리기 */
	var offHtml = '<li class="pb-0">';
	offHtml +='<div class="row">';
	offHtml +='<p class="text-muted fs-11 fw-semibold mb-1 op-7 col-3">오프라인</p>';
	offHtml +='<p class="text-muted fs-11 fw-semibold mb-1 op-7 col-9" style="text-align: right;">';
	offHtml +='<span class="badge bg-dark-transparent rounded-circle float-end fs-10">오프라인 '+offlineList.length+'명</span>';
	offHtml +='</p>';
	offHtml += '</div>';
	offHtml += '</li>';

	let chatOffHtml = '';
	let groupOffHtml ='';
	$.each(offlineList, function(idx, offline){
		offHtml += '<li>' +
		'<div class="d-flex align-items-center">' +
		'<div class="me-1 lh-1">' +
		'<span class="avatar avatar-md offline me-2 avatar-rounded">' +
		'<img src="/resources/img/default.png" alt="img">' +
		'</span>' +
		'</div>' +
		'<div class="flex-fill my-auto">' +
		'<p class="mb-0 fw-semibold">' +
		offline.memName +
		'<span class="text-muted text-truncate fs-10">' + offline.empJob + '</span>' +
		'</p>' +
		'<p class="fs-12 mb-0">' +
		'<span class="text-muted text-truncate">' + offline.memEmail + '</span>' +
		'</p>' +
		'</div>' +
		'<div class="">' +
		'<button aria-label="button" type="button" class="btn btn-sm btn-icon btn-primary-light">' +
		'<i class="ti ti-plus"></i>' +
		'</button>' +
		'</div>' +
		'</div>' +
		'</li>';


		chatOffHtml += '<li class="checkforactive chatUser" style="margin-top: 10px;">';
		// chatOffHtml += '<span style="display:none;">'+offline.memNo+'</span>';
		chatOffHtml += '<div class="d-flex align-items-top">';
		chatOffHtml += '<div class="me-1 lh-1">';
		chatOffHtml += '<span class="avatar avatar-md offline me-2 avatar-rounded">';
		chatOffHtml += '<img src="/resources/img/default.png" alt="img">';
		chatOffHtml += '</span>';
		chatOffHtml += '</div>';
		chatOffHtml += '<p class="fw-semibold fs-14 memName" style="margin-top:7px;">';
		chatOffHtml += offline.memName;
		chatOffHtml += '</p>';
		chatOffHtml += '<input type="radio" class="flex-fill" style="margin-left:50%; height: 20px; margin-top: 7px;" name="soloSelect" value="'+offline.memNo +'">';
		chatOffHtml += '</div>';
		chatOffHtml += '</li>';


		groupOffHtml += '<li class="checkforactive chatUser" style="margin-top: 10px;">';
		// groupOffHtml += '<span style="display:none;">'+offline.memNo+'</span>';
		groupOffHtml += '<div class="d-flex align-items-top">';
		groupOffHtml += '<div class="me-1 lh-1">';
		groupOffHtml += '<span class="avatar avatar-md offline me-2 avatar-rounded">';
		groupOffHtml += '<img src="/resources/img/default.png" alt="img">';
		groupOffHtml += '</span>';
		groupOffHtml += '</div>';
		groupOffHtml += '<p class="fw-semibold fs-14 memName" style="margin-top:7px;">';
		groupOffHtml += offline.memName;
		groupOffHtml += '</p>';
		groupOffHtml += '<input  name="'+offline.memName+'" type="radio" class="flex-fill" style="margin-left:50%; height: 20px; margin-top: 7px;" value="'+offline.memNo +'">';
		groupOffHtml += '</div>';
		groupOffHtml += '</li>';




		});
	$('#offlineList').html(offHtml);
	$('#inviteOfflineList').html(chatOffHtml);
	$('#chatOffPeople').text('오프라인 ('+offlineList.length+')');
	$('#chatOffGroupPeople').text('오프라인 ('+offlineList.length+')');
	$('#groupOffList').html(groupOffHtml)




}

function openSoloChat(member, memStatus){
	let div1 = $('.soloChatStatus');
	let div2 = $('.chatPartner');

	let html1 = '';
	if(memStatus === "offline")
	html1+= '<span class="avatar avatar-lg offline me-2 avatar-rounded chatstatusperson">';
	html1 += '<span style="display:none;" id="chatReceiver">'+member.memNo+'</span>'
	if(memStatus === "online")
	html1+= '<span class="avatar avatar-lg online me-2 avatar-rounded chatstatusperson">';
	html1+= '<img class="chatimageperson" src="/resources/img/default.png" alt="img">';
	html1+= '</span>';
	let html2 = '';
	html2+= '<p class="mb-0 fw-semibold fs-14">';
	html2+= '<a href="javascript:void(0);" class="chatnameperson responsive-userinfo-open ">'+member.memName+'</a>';
	html2+= '</p>';
	html2+= '<p class="text-muted mb-0 chatpersonstatus">'+memStatus+'</p>';
	div1.html(html1);
	div2.html(html2);

}

var unreadChatClickListener;
var chatRoom;
function myChatRoomList(chatList){

	let unreadChatRoomListHtml ='<li class="pb-0">'
	unreadChatRoomListHtml += '<p class="text-muted fs-11 fw-semibold mb-2 op-7">읽지 않은 메세지</p>';
	unreadChatRoomListHtml += '</li>';

	let allChatRoomListHtml = '<li class="pb-0">'
	allChatRoomListHtml += '<p class="text-muted fs-11 fw-semibold mb-2 op-7">모든 메세지</p>';
	allChatRoomListHtml += '</li>';
	$.each(chatList,function(idx, c){
		chatRoom = c;
		console.log("chatRoom.unreadChatNo : ",chatRoom.chatRoomNo)
		let time = chatRoom.chatDate.split(' ')[1]

		// 안읽은 메세지
		if(chatRoom.unreadChatNo != 0){
			unreadChatRoomListHtml += '<li class="checkforactive">';
			unreadChatRoomListHtml += '<a href="#" class="cRoom" data-chatroom='+chatRoom.chatRoomNo+'>';
			unreadChatRoomListHtml += '<div class="d-flex align-items-top">';
			unreadChatRoomListHtml += '<div class="me-1 lh-1">';

			unreadChatRoomListHtml += '<span class="avatar avatar-md '+chatRoom.onlineStatus+' me-2 avatar-rounded">';
			
			unreadChatRoomListHtml += '<img src="/resources/img/default.png" alt="img">';
			unreadChatRoomListHtml += '</span>';
			unreadChatRoomListHtml += '</div>';
			unreadChatRoomListHtml += '<div class="flex-fill">';
			unreadChatRoomListHtml += '<p class="mb-0 fw-semibold">';
			unreadChatRoomListHtml += chatRoom.memName+'(2)<span class="float-end text-muted fw-normal fs-11">'+time+'</span>';
			unreadChatRoomListHtml += '</p>';
			unreadChatRoomListHtml += '<p class="fs-12 mb-0">';
			unreadChatRoomListHtml += '<span class="chat-msg text-truncate">'+chatRoom.chatLog+'</span>';
			unreadChatRoomListHtml += '<span class="chat-read-icon float-end align-middle"><i class="ri-check-double-fill"></i></span>';
			unreadChatRoomListHtml += '</p>';
			unreadChatRoomListHtml += '</div>';
			unreadChatRoomListHtml += '</div>';
			unreadChatRoomListHtml += '</a>';
			unreadChatRoomListHtml += '</li>';
		}
		

		// 모든 메세지
		if(chatRoom.unreadChatNo === 0){
			allChatRoomListHtml += '<li class="checkforactive">';
			allChatRoomListHtml += '<a href="#" class="cRoom" data-chatroom="'+chatRoom.chatRoomNo+'">';
			allChatRoomListHtml += '<div class="d-flex align-items-top">';
			allChatRoomListHtml += '<div class="me-1 lh-1">';

			allChatRoomListHtml += '<span class="avatar avatar-md '+chatRoom.onlineStatus+' me-2 avatar-rounded">';
			
			allChatRoomListHtml += '<img src="/resources/img/default.png" alt="img">';
			allChatRoomListHtml += '</span>';
			allChatRoomListHtml += '</div>';
			allChatRoomListHtml += '<div class="flex-fill">';
			allChatRoomListHtml += '<p class="mb-0 fw-semibold">';
			allChatRoomListHtml += chatRoom.memName+'<span class="float-end text-muted fw-normal fs-11">'+time+'</span>';
			allChatRoomListHtml += '</p>';
			allChatRoomListHtml += '<p class="fs-12 mb-0">';
			allChatRoomListHtml += '<span class="chat-msg text-truncate">'+chatRoom.chatLog+'</span>';
			allChatRoomListHtml += '<span class="chat-read-icon float-end align-middle"></span>';
			allChatRoomListHtml += '</p>';
			allChatRoomListHtml += '</div>';
			allChatRoomListHtml += '</div>';
			allChatRoomListHtml += '</a>';
			allChatRoomListHtml += '</li>';
		}

	})
	$('.soloChatList').html(unreadChatRoomListHtml);
	$('.allChatList').html(allChatRoomListHtml);
}
function enterChat(chatPersonList){
	$.each(chatPersonList, function(idx, chatPerson){
		if(chatPerson.memNo != myNo){
			$('.headerPersonName').text(chatPerson.memName);
			$('.headerPersonStatus').text(chatPerson.userOnlineStatus);
			$('#headerStatus').removeClass();
			$('#headerStatus').addClass("avatar avatar-lg "+chatPerson.userOnlineStatus+" me-2 avatar-rounded chatstatusperson")
			$('.headerPersonImg').attr("src","/resources/img/default.png");
			
		}
	});
}

function particularMention(data){

	$('#infoToast').find(".me-auto").text(data.particularWriter);
	$('#infoToast').find('#description').text(data.particularDescription);
	$('#infoToast').find('img').attr('src','/file/showprofile/'+data.memNo);
	$('#description').data("patntno",data.patntNo);
	partiTargetNo = data.patntNo;

	$('#infoToast').show();
}

function requestNoti(data, destination){
	console.log(destination);
	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-warning-transparent" role="alert" aria-live="assertive" aria-atomic="true">';
	html += '<div class="toast-header bg-warning text-fixed-white">';
	html += '<strong class="me-auto">기안 처리</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="'+destination+'" id="description">'+data+'</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();
	setTimeout(function(){
    $('#infoToast').fadeOut();
}, 3000); 
	console.log('전송완료')
}
function agreeNoti(data,masterNo){
	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-info-transparent" role="alert" aria-live="assertive" aria-atomic="true">';
	html += '<div class="toast-header bg-info text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+masterNo+'" alt="...">';
	html += '<strong class="me-auto">원무과장</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#" id="description">'+data+'</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();
	setTimeout(function(){
    $('#infoToast').fadeOut();
}, 3000); 
	console.log('전송완료')
}
function disagreeNoti(data,masterNo){
	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-danger-transparent" role="alert" aria-live="assertive" aria-atomic="true">';
	html += '<div class="toast-header bg-danger text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+masterNo+'" alt="...">';
	html += '<strong class="me-auto">원무과장</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#" id="description">'+data+'</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();
	setTimeout(function(){
    $('#infoToast').fadeOut();
}, 3000); 
	console.log('전송완료')
}

function documentRequest(data){
	let content = data.data;
	let memNo = data.memNo;
	let receiptNo = data.receiptNo;
	let name = data.name

	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-info-transparent docu" role="alert" aria-live="assertive" aria-atomic="true" data-memno="'+memNo+'" data-receiptno="'+receiptNo+'">';
	html += '<div class="toast-header bg-info text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+memNo+'" alt="...">';
	html += '<strong class="me-auto">'+name+'(원무과)</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#" id="description">'+content+'</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();

	console.log('전송완료')
}
function reqCollabo(data){
	let content = data.content;
	let name = data.name;
	let myNo = data.myNo;
	let receiptNo = data.receiptNo;
	let reqCollaboNo = data.reqCollaboNo;
	let patntNo = data.patntNo;

	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-info-transparent collabo" role="alert" aria-live="assertive" aria-atomic="true" data-receiptno="'+receiptNo+'">';
	html += '<div class="toast-header bg-info text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+myNo+'" alt="...">';
	html += '<strong class="me-auto">'+name+'</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#" id="description">'+content+'</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();

	console.log('전송완료')
}

function insertDiagnosis(data){
	let name = data.name;
	let receiptNo = data.receiptNo;
	let myNo = data.myNo;
	
	let html = '';
	html += '<div id="infoToast" class="toast colored-toast bg-info-transparent disa" role="alert" aria-live="assertive" aria-atomic="true" data-receiptno="'+receiptNo+'">';
	html += '<div class="toast-header bg-info text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+myNo+'" alt="...">';
	html += '<strong class="me-auto">'+name+'</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#" id="description">환자 진단서 발행했습니다!</a></div>';
	html += '</div>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();

}

function inviteMeeting(data){
	console.table(data);

	let html = '';
	html += '<a href="'+data.url+'">';
	html += '<div id="infoToast" class="toast colored-toast bg-info-transparent collabo" role="alert" aria-live="assertive" aria-atomic="true">';
	html += '<div class="toast-header bg-info text-fixed-white">';
	html += '<img class="bd-placeholder-img rounded me-2" src="/file/showprofile/'+data.memNo+'" alt="...">';
	html += '<strong class="me-auto">'+data.name+'</strong>';
	html += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	html += '</div>';
	html += '<div class="toast-body"><a href="#">'+data.name+' 원장님이 화상회의 요청을 보내셨습니다.</a></div>';
	html += '</div>';
	html += '</a>';
	$('#toastbox').html(html);
	$('#infoToast').fadeIn();
}