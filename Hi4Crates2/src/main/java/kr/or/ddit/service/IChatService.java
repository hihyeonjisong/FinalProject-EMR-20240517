package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.ChatPersonVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.MemberVO;

public interface IChatService {

	public int createSoloChat(ChatRoomVO chatRoom, Map<String, Object> map, MemberVO mine);

	public void sendChat(ChatVO chat);

	public List<ChatPersonVO> getChatPersonList(int chatRoomNo);

	public List<ChatRoomVO> getMyChatRoomList(int memNo);

	public List<ChatVO> getSoloRoomChat(int chatRoomNo);

	public void enterChat(Map<String, Object> map);

	public void outChat(Map<String, Object> map);

}
