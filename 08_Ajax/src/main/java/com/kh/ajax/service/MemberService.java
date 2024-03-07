package com.kh.ajax.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ajax.model.dao.MemberDAO;
import com.kh.ajax.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	public Member idCheck(String id) {
		return dao.check(id);
	}
	
	public int register(Member member) {
		return dao.register(member);
	}
}
