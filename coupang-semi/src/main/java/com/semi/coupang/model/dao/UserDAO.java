package com.semi.coupang.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.coupang.model.vo.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int register(User user) {
		return session.insert("user.register", user);
	}
	
	public User getById(String id) {
		return session.selectOne("user.getById", id);
	}
}
