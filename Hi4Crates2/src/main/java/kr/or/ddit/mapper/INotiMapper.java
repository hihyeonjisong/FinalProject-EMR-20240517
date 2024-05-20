package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.NotificationVO;

public interface INotiMapper {

	public List<NotificationVO> getNotiList(String memId);

	public void checkNoti(int notificationNo);


	public void insertNoti(NotificationVO notiVO);

}
