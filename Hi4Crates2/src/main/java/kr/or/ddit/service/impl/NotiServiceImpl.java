package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.INotiMapper;
import kr.or.ddit.service.INotiService;
import kr.or.ddit.vo.NotificationVO;

@Service
public class NotiServiceImpl implements INotiService {
	
	@Inject
	private INotiMapper notiMapper;
	
	@Override
	public List<NotificationVO> getNotiList(String memId) {
		return notiMapper.getNotiList(memId);
	}

	@Override
	public void checkNoti(int notificationNo) {
		notiMapper.checkNoti(notificationNo);
	}
	
	@Override
	public void insertNoti(NotificationVO notiVO) {
		notiMapper.insertNoti(notiVO);
	}


}
