package kr.or.ddit.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User{

	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		
		super(username, password, authorities);
		
	}
	
	public CustomUser(MemberVO member) {
		
		//Java 스트림을 사용한 경우 (람다표현식)
		// - 자바 버전 8부터 추가된 기능
		
		// map : 컬렉션(List, Map, Set 등), 배열 등의 설정되어 있는 각 타입의 값들을 하나씩
		//		참조하여 람다식으로 반복 처리할 수 있게 해준다.
		//collect : Stream()을 돌려 발생되는 데이터를 가공 처리하고 원하는 형태의 자료형으로 변환을 돕는다
		//회원정보안에 들어있는 역할명들을 컬렉션 형태의 스트림으로 만들어서 보내준다.
		//람다는 간단하게 메서드를 줄여주는 장점이 있지만 디버깅이 불가능.
		super(member.getMemId(), member.getMemPw(), member.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthName())).collect(Collectors.toList()));		
		this.member = member;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}
	
	
}
