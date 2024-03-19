package com.semi.coupang.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.coupang.model.vo.Product;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public Product select(int code) {
		return session.selectOne("product.select", code);
	}
}
