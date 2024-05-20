package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.NotificationVO;

public interface INotiService {

	
	public List<NotificationVO> getNotiList(String hsid);

	public void checkNoti(int notificationNo);


	
	public void insertNoti(NotificationVO notiVO);

}
