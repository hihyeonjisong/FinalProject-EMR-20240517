package kr.or.ddit.controller.comm;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.service.INotiService;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/noti")
@Slf4j
public class NotificationController {
	
	@Inject
	private INotiService notiService;
	
	@PostMapping("/checkNoti.do")
	public void checkNoti(@RequestBody Map<String, Object> map) {
		int notificationNo = (int) map.get("notiNo");
		log.info(""+notificationNo);
		
 		notiService.checkNoti(notificationNo);
	}
	
	
}
