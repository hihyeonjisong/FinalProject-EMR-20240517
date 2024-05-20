package kr.or.ddit.controller.comm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kotlinx.serialization.json.Json;
import kr.or.ddit.service.IChatService;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.INotiService;
import kr.or.ddit.service.IParticularService;
import kr.or.ddit.vo.ChatPersonVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.ParticularVO;
import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/echo")
@Slf4j
@Scope(value = WebApplicationContext.SCOPE_APPLICATION)
public class EchoHandler extends TextWebSocketHandler {
	
	@Inject
	private INotiService notiService;
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IChatService chatService;
	
	@Inject
	private IParticularService partiService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
//	
//	@Autowired
//	public EchoHandler(ObjectMapper objectMapper) {
//		this.objectMapper = new ObjectMapper();
//
//	}
	
	// 로그인 중인 전체 인원 정보
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	
	// 클라이언트가 웹 소켓 생성함
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		log.info("접속자 : " + session.getPrincipal().getName());
		
		// 웹 소켓이 생성될 때마다 리스트에 넣어줌
		if(!sessions.contains(session)) {
			sessions.add(session);
		}
		
		log.info("--------------접속정보--------------");
		for (WebSocketSession ss : sessions) {
			log.info("현재 접속자 : "+ss.getPrincipal().getName());
		}
		connetToChat(session);
		log.info("접속자수 : "+sessions.size());
		log.info("----------------------------------");
		
		
	}
	

	// JS에서 메세지 받을 때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		if(isJson(message)) {
			Map<String, Object> map = objectMapper.readValue(message.getPayload(), Map.class);
			String code = (String) map.get("code");
			if(code.equals("soloChat")) sendChatting(session, map);
			else if(code.equals("insertParticular")) insertParticular(session, map);
			else if(code.equals("checkParticular")) checkParticular(map);
			else if(code.equals("mention")) particularMention(map);
			else if(code.equals("requestNoti")) requestNoti(session,map);
			else if(code.equals("agree")) agreeNoti(session,map);
			else if(code.equals("disagree")) disagreeNoti(session,map);
			else if(code.equals("docuRequest")) requestDocument(session, map); 
			else if(code.equals("reqCollabo")) requestCollabo(session, map); 
			else if(code.equals("insertDiagnosis")) insertDiagnosis(session, map); 
			else if(code.equals("inviteMeeting")) inviteMeeting(session, map); 
		}
		else {
			String requestMsg = message.getPayload();
			int dis = requestMsg.indexOf("#");
			String reqCode = requestMsg.substring(0, dis);
			String data = requestMsg.substring(dis+1);
			
			if(reqCode.equals("vacationResult")) vacationResult(data, session, message);
			else if(reqCode.equals("로그인")) getNotiList(data, session, message);
			else if(reqCode.equals("openSoloChat")) openSoloChat(session, message);
			else if(reqCode.equals("connectChat")) getMyChatRoomList(session);
			else if(reqCode.equals("enterChat")) enterChat(session, message);
		}
	}






	private void inviteMeeting(WebSocketSession session, Map<String, Object> map) throws IOException {

		List<String> empNoList =  (List<String>) map.get("empNoList");
		String url = (String) map.get("url");
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "inviteMeeting");
		jsonObject.addProperty("url", url);
		jsonObject.addProperty("name", getMyInfo(session).getMemName());
		jsonObject.addProperty("memNo", getMyInfo(session).getMemNo());
		
		String jsonMsg = jsonObject.toString();
		for (String s : empNoList) {
			String targetId = memberService.getMemId(Integer.parseInt(s));
			for (WebSocketSession wss : sessions) {
				if(wss.getPrincipal().getName().equals(targetId)) {
					wss.sendMessage(new TextMessage(jsonMsg));
				}
			}
		}
		
	}


	private void insertDiagnosis(WebSocketSession session, Map<String, Object> map) throws IOException {
		
		int receiptNo = (int)map.get("receiptNo");
		int memNo = (int)map.get("memNo");
		int myNo = getMyInfo(session).getMemNo();
		String myName = getMyInfo(session).getMemName();
		String patntName = (String) map.get("patntName");
		JsonObject json = new JsonObject();
		json.addProperty("type", "insertDiagnosis");
		json.addProperty("name", myName);
		json.addProperty("myNo", myNo);
		json.addProperty("patntName", myNo);
		json.addProperty("receiptNo", receiptNo);
		String jsonMsg = json.toString();
		
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == memNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
			}
		}
		
	}


	private void requestCollabo(WebSocketSession session, Map<String, Object> map) throws IOException {
		int receiptNo = (int) map.get("receiptNo");
		int reqCollaboNo = (int) map.get("reqCollaboNo");
		int patntNo = (int) map.get("patntNo");
		int myNo = (int) map.get("empNo");
		int collaboDr = Integer.parseInt((String)map.get("collaboDr"));
		String collaboReqContent = (String) map.get("collaboReqContent");
		MemberVO m = memberService.getMemberInfo(myNo);
		
		int targetNo = memberService.getMemNo(collaboDr);
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "reqCollabo");
		jsonObject.addProperty("content", collaboReqContent);
		jsonObject.addProperty("myNo", myNo);
		jsonObject.addProperty("name", m.getMemName());
		jsonObject.addProperty("receiptNo", receiptNo);
		jsonObject.addProperty("reqCollaboNo", reqCollaboNo);
		jsonObject.addProperty("patntNo", patntNo);
		
		String jsonMsg = jsonObject.toString();
		
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == targetNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
			}
			
			
		}
		
		
		
		
		
		
	}


	private void requestDocument(WebSocketSession session, Map<String, Object> map) throws IOException {
		int receiptNo = Integer.parseInt((String) map.get("receiptNo"));
		int memNo = getMyInfo(session).getMemNo();
		
		int targetNo = memberService.getReceiptMemNo(receiptNo);
		
		String content = "진단서 발급 요청이 왔습니다.";
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type","docuRequest");
		jsonObject.addProperty("data",content);
		jsonObject.addProperty("name", getMyInfo(session).getMemName());
		jsonObject.addProperty("memNo", memNo);
		jsonObject.addProperty("receiptNo", receiptNo);
		String jsonMsg = jsonObject.toString();
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == targetNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
			}
		}
		
	}


	private void disagreeNoti(WebSocketSession session, Map<String, Object> map) throws IOException {
		int masterNo = memberService.getMasterNo();
		int memNo = memberService.getMemNo((int)map.get("empNo"));
		String content = (String) map.get("content");
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type","disagreeNoti");
		jsonObject.addProperty("data", content);
		jsonObject.addProperty("master", masterNo);
		String jsonMsg = jsonObject.toString();
		boolean online_flag = false;
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == memNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
				online_flag = true;
			}
		}
		if(!online_flag) {
			NotificationVO notiVO = new NotificationVO();
			notiVO.setEmpNo(memNo);
			notiVO.setNotificationPerson(masterNo);
			notiVO.setNotificationContent(content);
			notiVO.setNotificationType("3");
			notiService.insertNoti(notiVO);
		}
		
		
	}


	private void agreeNoti(WebSocketSession session, Map<String, Object> map) throws IOException {
		int masterNo = memberService.getMasterNo();
		int memNo = memberService.getMemNo((int)map.get("empNo"));
		String content = (String) map.get("content");
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "agreeNoti");
		jsonObject.addProperty("data", content);
		jsonObject.addProperty("master", masterNo);
		String jsonMsg = jsonObject.toString();
		boolean online_flag = false;
		
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == memNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
				online_flag = true;
			}
		}
		
		if(!online_flag) {
			NotificationVO notiVO = new NotificationVO();
			notiVO.setEmpNo(memNo);
			notiVO.setNotificationPerson(masterNo);
			notiVO.setNotificationContent(content);
			notiVO.setNotificationType("2");
			notiService.insertNoti(notiVO);
		}
	}


	private void requestNoti(WebSocketSession session, Map<String, Object> map) throws IOException {
		
		int masterNo = memberService.getMasterNo();
		String content = (String) map.get("content");
		String destination = (String) map.get("destination");
		JsonObject jsonObject = new JsonObject();
		
		jsonObject.addProperty("type", "requestNoti");
		jsonObject.addProperty("data", content);
		jsonObject.addProperty("destination", destination);
		
		String jsonMsg = jsonObject.toString();
		
		boolean online_flag = false;
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == masterNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
				online_flag = true;
			}
		}
		// 오프라인 일때는 Notification 에 남겨야함
		if(!online_flag) {
			NotificationVO notiVO = new NotificationVO();
			notiVO.setEmpNo(masterNo);
			notiVO.setNotificationPerson(getMyInfo(session).getMemNo());
			notiVO.setNotificationContent(content);
			notiVO.setNotificationType("1");
			notiService.insertNoti(notiVO);
		}
		
		
	}


	private void particularMention(Map<String, Object> map) throws IOException {
		int targetNo = (int)map.get("targetNo");
		
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		String jsonMap = gson.toJson(map);
		
		jsonObject.addProperty("type", "mention");
		jsonObject.addProperty("data", jsonMap);
		
		String jsonMsg = jsonObject.toString();
		
		for (WebSocketSession webSocketSession : sessions) {
			if(getMyInfo(webSocketSession).getMemNo() == targetNo) {
				webSocketSession.sendMessage(new TextMessage(jsonMsg));
			}
		}
		
	}


	private void checkParticular(Map<String, Object> map) throws IOException {
		int patntNo = (int) map.get("patntNo");
		int particularNo = (int) map.get("particularNo");
		partiService.checkParticular(particularNo);
		
		List<ParticularVO> particularList = partiService.getParticularList(patntNo);
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		String jsonParticularList = gson.toJson(particularList);
		
		jsonObject.addProperty("type", "checkParticular");
		jsonObject.addProperty("data", jsonParticularList);
	
		String jsonMsg = jsonObject.toString();
		
		for(WebSocketSession ws : sessions) {
			ws.sendMessage(new TextMessage(jsonMsg));
		}
		
	}


	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		log.info("소켓 끊음 ~~~~~_~~~~~~~~");
		// 웹소켓이 종료될 때 마다 리스트에서 뺌
		sessions.remove(session);
		connetToChat(session);
	}
	
	
	
	
	
	
	
	
	
	
	private void connetToChat(WebSocketSession session) throws IOException {
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		// 온라인 리스트 만들기
		List<MemberVO> onlineList = new ArrayList<MemberVO>();
		for (WebSocketSession online : sessions) {
			CustomUser onlineUser = (CustomUser) online.getAttributes().get("user");
			onlineList.add(onlineUser.getMember());
		}
		List<MemberVO> memberList = memberService.getEmpList();
		List<MemberVO> newList = new ArrayList<MemberVO>(memberList);
		
		for (MemberVO online : onlineList) {
			Iterator<MemberVO> iterator = newList.iterator();
			while (iterator.hasNext()) {
				MemberVO all = iterator.next();
				if (all.getMemId().equals(online.getMemId())) {
					iterator.remove(); // 반복자를 사용하여 삭제
				}
			}
		}
		
		String onlineJson = gson.toJson(onlineList);
		String memberJson = gson.toJson(newList);
		jsonObject.addProperty("type", "로그인");
		jsonObject.addProperty("online", onlineJson);
		jsonObject.addProperty("offline", memberJson);
		
		String jsonMessage = jsonObject.toString();
		TextMessage msg = new TextMessage(jsonMessage);
		for (WebSocketSession ss : sessions) {
			ss.sendMessage(msg);
		}
	}

	private void openSoloChat(WebSocketSession session, TextMessage message) throws IOException {
		
		int memNo = Integer.parseInt(message.getPayload().split("#")[1]);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		MemberVO member = memberService.getMemberInfo(memNo);
		
		String memJson = gson.toJson(member);
		
		jsonObject.addProperty("type", "openSoloChat");
		jsonObject.addProperty("member", memJson);
		jsonObject.addProperty("status", "offline");
		
		// 로그인 하면 json 온라인으로 바꺼ㅜ줌
		for (WebSocketSession users : sessions) {
			CustomUser user = (CustomUser) users.getAttributes().get("user");
			if(user.getMember().getMemNo() == memNo) {
				jsonObject.addProperty("status", "online");
				break;
			}
		}
		String jsonMsg = jsonObject.toString();
		
		session.sendMessage(new TextMessage(jsonMsg));
		
		
	}
	
	
	
	public void vacationResult(String data, WebSocketSession session, TextMessage message) throws IOException {
		log.info("WS:vacationResult ====================");
		int empNo = Integer.parseInt(data.split("#")[0]);
		String memId = memberService.getMemId(empNo);
		String result = data.split("#")[1];
		int notiNo = Integer.parseInt(data.split("#")[2]);
		String content = "";
		if(result.equals("disagree")) content = data.substring(data.lastIndexOf("#")+1);
		
		for (WebSocketSession user : sessions) {
			// 클라이언트에서 보낸 #대상자아이디#와 세션에 접속해있는 유저의 아이디가 같을때 -> 전송
			if(memId.equals(user.getPrincipal().getName())) {
				if(result.equals("agree"))
					user.sendMessage(new TextMessage("vacationResult#"+result+"#"+notiNo));
				else if(result.equals("disagree"))
					user.sendMessage(new TextMessage("vacationResult#"+result+"#"+notiNo+"#"+content));
				}
			}
		}
		
	public void getNotiList(String data, WebSocketSession session, TextMessage message) throws IOException {
		int dis = data.indexOf("#");
		String targetId = data.substring(0, dis);
		for(WebSocketSession single : sessions) {
			// 세션 아이디
			String memId = session.getPrincipal().getName(); // 클라이언트에서 보낸 요청자
			log.info("로그인 !!!!!!!"+ targetId);
			if(targetId.equals(single.getPrincipal().getName())) {
				log.info("알람탄다~~~~~~~~~~");
				List<NotificationVO> noti = new ArrayList<NotificationVO>();
				noti = notiService.getNotiList(targetId);
				for(NotificationVO notiVO : noti) {
					int idx = notiVO.getNotificationNo();
					String content = notiVO.getNotificationContent();
					String type = notiVO.getNotificationType();					
					TextMessage sendMsg = new TextMessage("notiList#"+content+"#"+idx+"#"+type);
					single.sendMessage(sendMsg);
				}
			}
		}
	}
	
	public List<WebSocketSession> getSessions(){
		return sessions;
	}
	
	private boolean isJson(TextMessage message) {
	    try {
	        String payload = message.getPayload();
	        // JSON 파싱 시도
	        objectMapper.readTree(payload);
	        return true;
	    } catch (Exception e) {
	        return false;
	    }
	}
	


	private void sendChatting(WebSocketSession session, Map<String, Object> map) throws IOException {
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		MemberVO myInfo = getMyInfo(session);
		ChatVO chat = new ChatVO();
		
		chat.setChatLog((String)map.get("content"));
		chat.setChatRoomNo(Integer.parseInt((String)map.get("roomNo")));
		chat.setChatSender(myInfo.getMemNo());
		
		chatService.sendChat(chat);
		
		
		List<ChatVO> chatList = (List<ChatVO>) chatService.getSoloRoomChat(chat.getChatRoomNo());
		List<ChatPersonVO> chatMemberList = chatService.getChatPersonList(Integer.parseInt((String)map.get("roomNo")));
		for (ChatVO c : chatList) {
			for (WebSocketSession user : sessions) {
				if(getMyInfo(user).getMemNo() == c.getChatSender()) {
					c.setUserOnlineStatus("online");
				}
			}
		}
		String jsonChat = gson.toJson(chatList);
		jsonObject.addProperty("type", "chat");
		jsonObject.addProperty("chat", jsonChat);
		String jsonMsg = jsonObject.toString();
		
		// 채팅방에 메세지 뿌리기
		for (ChatPersonVO chatPersonVO : chatMemberList) {
			int member = chatPersonVO.getMemNo();
			for (WebSocketSession user : sessions) {
				MemberVO online = getMyInfo(user);
				if(member == online.getMemNo()) {
					
					user.sendMessage(new TextMessage(jsonMsg));
				}
			}
		}
		
		
		
	}
	
	
	private void getMyChatRoomList(WebSocketSession session) throws IOException {
		MemberVO myInfo = getMyInfo(session);
		List<ChatRoomVO> chatRoomList = chatService.getMyChatRoomList(myInfo.getMemNo());
		
		for (ChatRoomVO chatRoomVO : chatRoomList) {
			chatRoomVO.setOnlineStatus("offline");
			for (WebSocketSession online : sessions) {
				if(chatRoomVO.getOpponentNo() == getMyInfo(online).getMemNo()) {
					chatRoomVO.setOnlineStatus("online");
				}
			}
		}
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		String jsonChatRoomList = gson.toJson(chatRoomList);
		
		jsonObject.addProperty("type", "myChatRoom");
		jsonObject.addProperty("data", jsonChatRoomList);
		
		String jsonMsg = jsonObject.toString();
		
		session.sendMessage(new TextMessage(jsonMsg));
		
		
	}
		
		
		
	
	

	private void insertParticular(WebSocketSession session, Map<String, Object> map) throws IOException {
		log.info("내용 : "+map.get("particularDescription"));
		log.info("환자번호 : "+map.get("patntNo"));
		log.info("작성자 : "+map.get("particularWriter"));
		log.info("내 회원번호 : " +map.get("memNo"));
		
		ParticularVO partiVO = new ParticularVO();
		partiVO.setMemNo((int)map.get("memNo"));
		partiVO.setParticularDescription((String)map.get("particularDescription"));
		partiVO.setParticularWriter((String)map.get("particularWriter"));
		partiVO.setPatntNo((int)map.get("patntNo"));
		
		partiService.insertParticular(partiVO);
		
		List<ParticularVO> partiList = partiService.getParticularList((int)map.get("patntNo"));
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		String jsonParticularList = gson.toJson(partiList);
		jsonObject.addProperty("type","insertParticular");
		jsonObject.addProperty("data", jsonParticularList);
		String jsonMsg = jsonObject.toString();
		
		for(WebSocketSession online : sessions) {
			online.sendMessage(new TextMessage(jsonMsg));
		}
		
	}


	private void enterChat(WebSocketSession session, TextMessage message) throws IOException {
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		int chatRoomNo = Integer.parseInt(message.getPayload().split("#")[1]);
		List<ChatPersonVO> chatMemberList = chatService.getChatPersonList(chatRoomNo);
		for (WebSocketSession webSocketSession : sessions) {
			MemberVO onlineUser = getMyInfo(webSocketSession);
			for (ChatPersonVO chatPersonVO : chatMemberList) {
				if(chatPersonVO.getMemNo() == onlineUser.getMemNo()) {
					chatPersonVO.setUserOnlineStatus("online");
				}
			}
		}
		String jsonChatMemberList = gson.toJson(chatMemberList);
		jsonObject.addProperty("type", "enterChat");
		jsonObject.addProperty("data", jsonChatMemberList);
		String jsonMsg = jsonObject.toString();
		
		session.sendMessage(new TextMessage(jsonMsg));
		
		
	}
	
	
	
	
	
	private MemberVO getMyInfo(WebSocketSession session) {
		
		CustomUser user = (CustomUser) session.getAttributes().get("user");
		MemberVO myInfo = user.getMember();
		
		return myInfo;
		
	}
	


	
}
