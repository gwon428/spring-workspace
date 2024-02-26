package com.kh.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.security.model.dao.MemberDAO;
import com.kh.security.model.vo.Member;

// Spring Security에서 제공하는 UserDetailsService 인터페이스 상속
@Service
public class MemberService implements UserDetailsService {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	@Autowired
	private MemberDAO dao;
	
	
	
	// 로그인 시 자동으로 여기로 오는 메서드
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// id값 받아오는 거임 !
		Member member = dao.getMemberById(username);
		return member;
	}

	// 회원가입
	public int registerMember(Member vo) {
		// 암호화 처리를 하고
		String encodePw = bcpe.encode(vo.getPassword());
		// 암호화 처리된 비밀번호로 세팅해서
		vo.setPassword(encodePw);
		// registerMember로 전달
		return dao.registerMember(vo);
	}
}
