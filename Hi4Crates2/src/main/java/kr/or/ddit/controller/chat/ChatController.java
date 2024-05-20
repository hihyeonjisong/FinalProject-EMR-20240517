package kr.or.ddit.controller.chat;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.comm.EchoHandler;
import kr.or.ddit.service.IChatService;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IChatService chatService;
	
	@Autowired
	private final EchoHandler echoHandler;
	
	private List<MemberVO> onlineList = new ArrayList<MemberVO>();
	
	
	@Autowired
	public ChatController(EchoHandler echoHandler) {
		this.echoHandler = echoHandler;
	}
	
	@GetMapping("/comm/chat")
	public String chatHome(Model model) {
		List<WebSocketSession> sessions = echoHandler.getSessions();
		List<MemberVO> newList = new ArrayList<MemberVO>(onlineList);
		
		// 웹소켓 세션에서 정보를 꺼내어서 online 유저 확인하기
		for (WebSocketSession webSocketSession : sessions) {
			log.info("접속자 아이디 : "+webSocketSession.getPrincipal().getName());
			log.info(""+webSocketSession.getAttributes().get("user"));
			CustomUser user = (CustomUser) webSocketSession.getAttributes().get("user");
			
			if(onlineList.size() == 0) newList.add(user.getMember());
			
			for (MemberVO m : onlineList) {
				
				if(!m.getMemId().equals(webSocketSession.getPrincipal().getName())) {
					newList.add(user.getMember());
				}
				
			}
		}
		
		List<MemberVO> memberList = memberService.getEmpList();
		
		
		model.addAttribute("onlineList", newList);
		model.addAttribute("memberList", memberList);
		return "main/chat/chat"; 
	}
	
	@ResponseBody
	@PostMapping("/comm/chat/createSoloChat")
	public int CreateSoloChat(@RequestBody Map<String, Object>map, HttpServletRequest req){
		
		// memNo 꺼내기
		int memNo = Integer.parseInt((String)map.get("memNo"));
		// 이름 꺼내기
		String memName = (String)map.get("memName");
		// 내 memNo 꺼내기
		CustomUser user = (CustomUser) req.getSession().getAttribute("user");
		MemberVO mine = user.getMember();
		
		log.info("상대 번호 : "+memNo);
		log.info("상대 이름 : "+memName);
		log.info("내 번호 : "+mine.getMemNo());
		log.info("내 이름 : "+mine.getMemName());
		
		ChatRoomVO chatRoom = new ChatRoomVO();
		chatRoom.setChatRoomName(mine.getMemName()+" 님과 "+memName+" 님의 대화방");
		chatRoom.setChatRoomNop(2);
		chatRoom.setChatRoomType("0");
		chatRoom.setMemNo(memNo);
		
		
		int chatRoomNo = chatService.createSoloChat(chatRoom, map, mine);
		
		
		return chatRoomNo;
	}
	
	@PostMapping("/comm/chat/enterChat")
	@ResponseBody
	public ResponseEntity<List<ChatVO>> EnterChat(@RequestBody ChatRoomVO chatRoom, HttpServletRequest req){
		CustomUser user = (CustomUser)req.getSession().getAttribute("user");
		MemberVO myInfo = user.getMember();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", myInfo.getMemNo());
		map.put("chatRoomNo", chatRoom.getChatRoomNo());
		chatService.enterChat(map);
		List<WebSocketSession> sessions = echoHandler.getSessions();
		
		List<ChatVO> chatList = (List<ChatVO>) chatService.getSoloRoomChat(chatRoom.getChatRoomNo());
		
		for (ChatVO chatVO : chatList) {
			for (WebSocketSession session : sessions) {
				CustomUser users = (CustomUser) session.getAttributes().get("user");
				MemberVO member = users.getMember();
				if(chatVO.getChatSender() == member.getMemNo()) {
					chatVO.setUserOnlineStatus("online");
				}
			}
		}
		
		return new ResponseEntity<List<ChatVO>>(chatList,HttpStatus.OK);
		
	}
	
	@ResponseBody
	@PostMapping("/comm/chat/outChatRoom.do")
	public void OutChat(@RequestBody Map<String, Object> map) {
		chatService.outChat(map);
	}
}
