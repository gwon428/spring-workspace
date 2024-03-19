package com.semi.coupang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.coupang.model.dao.UserDAO;
import com.semi.coupang.model.vo.User;

@Service
public class UserService implements UserDetailsService {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	@Autowired
	private UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) {
		User user = dao.getById(username);		
		return user;
	}
	
	public int register(User user) {
		user.setPassword(bcpe.encode(user.getPassword()));
		return dao.register(user);
	}

}