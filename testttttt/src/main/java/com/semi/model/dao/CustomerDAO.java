package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Customer;

@Repository
public class CustomerDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Customer> showAllCustomer(){
		return session.selectList("customerMapper.showAllCustomer");
	}
	
}
