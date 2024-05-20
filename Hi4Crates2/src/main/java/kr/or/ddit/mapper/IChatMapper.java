package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatPersonVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatVO;

public interface IChatMapper {

	public int createSoloChatRoom(ChatRoomVO chatRoom);

	public int insertSoloChatPerson(ChatPersonVO chatPerson);

	public void sendChat(ChatVO chat);

	public void insertUnread();

	public List<ChatPersonVO> getChatPersonList(int chatRoomNo);

	public List<ChatRoomVO> getMyChatRoomList(int memNo);

	public List<ChatVO> getSoloRoomChat(int chatRoSomNo);

	public void enterChat(Map<String, Object> map);

	public void outChat(Map<String, Object> map);

}
