package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.dao.MemberDAO;
import com.kh.model.vo.Member;

@Service 	// 페이징 처리도 Service에서!
public class MemberService {
	// 비즈니스 로직을 처리하는 메서드
	
	@Autowired	// bean 등록 되어있는 것들에 바로 접근 가능하도록
	private MemberDAO dao;
	
	public List<Member> showAllMember(){
		return dao.showAllMember();
	}
}
