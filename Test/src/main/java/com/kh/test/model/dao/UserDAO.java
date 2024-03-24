package com.kh.test.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.test.model.vo.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public User selectUser(String userNo) {
		return session.selectOne("usermapper.selectUser", userNo); 
	}
}
