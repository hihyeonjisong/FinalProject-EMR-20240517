package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IChatMapper;
import kr.or.ddit.service.IChatService;
import kr.or.ddit.vo.ChatPersonVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class ChatServiceImpl implements IChatService {
	
	@Inject
	private IChatMapper chatMapper;
	
	@Override
	public int createSoloChat(ChatRoomVO chatRoom, Map<String, Object> map, MemberVO mine) {
		
		// 방생성
		int res1 = chatMapper.createSoloChatRoom(chatRoom);
		// select key를 통해 pk 추출
		int chatRoomNo = chatRoom.getChatRoomNo();
		// 채팅방 소속 유저 정보 insert
		
		ChatPersonVO chatPerson = new ChatPersonVO();
		chatPerson.setChatPersonStatus("1");
		chatPerson.setChatRoomNo(chatRoomNo);
		chatPerson.setMemName(mine.getMemName());
		chatPerson.setMemNo(mine.getMemNo());
		
		// 방 생성자
		int res2 = chatMapper.insertSoloChatPerson(chatPerson);
		
		// 방 초대받은 사람
		chatPerson.setChatPersonStatus("0");
		chatPerson.setChatRoomNo(chatRoomNo);
		chatPerson.setMemName((String)map.get("memName"));
		chatPerson.setMemNo(Integer.parseInt((String)map.get("memNo")));
		int res3 = chatMapper.insertSoloChatPerson(chatPerson);
		
		
		if(res1 > 0 && res2 > 0 && res3 > 0) return chatRoomNo;
		
		return 0;
	}

	@Override
	public void sendChat(ChatVO chat) {
		chatMapper.sendChat(chat);
		chatMapper.insertUnread();
	}

	@Override
	public List<ChatPersonVO> getChatPersonList(int chatRoomNo) {
		return chatMapper.getChatPersonList(chatRoomNo);
	}

	@Override
	public List<ChatRoomVO> getMyChatRoomList(int memNo) {
		return chatMapper.getMyChatRoomList(memNo);
	}

	@Override
	public List<ChatVO> getSoloRoomChat(int chatRoomNo) {
		return chatMapper.getSoloRoomChat(chatRoomNo);
	}

	@Override
	public void enterChat(Map<String, Object> map) {
		chatMapper.enterChat(map);
	}

	@Override
	public void outChat(Map<String, Object> map) {
		chatMapper.outChat(map);
	}

}
