package kr.or.ddit.security;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailService implements UserDetailsService{
	
	@Inject
	private MemberMapper memberMapper;
	
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("sssssssssssssssssssssssss");
		// 사용자 정보 저장
		MemberVO member;
		try {
			
			member = memberMapper.readByUserId(username);
			log.info("member  :  "+member);
			return member == null ? null : new CustomUser(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

}
