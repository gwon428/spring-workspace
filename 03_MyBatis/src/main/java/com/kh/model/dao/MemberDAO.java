package com.kh.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired	//를 통해 bean 등록한 것들 중 가져올 것 가져올 수 있게 함.
	private SqlSessionTemplate session;
	
	public List<Member> showAllMember() {
		return session.selectList("memberMapper.showAllMember");
	}
}
