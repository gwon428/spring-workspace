package com.semi.coupang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.coupang.model.dao.ProductDAO;
import com.semi.coupang.model.vo.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	public Product select(int code) {
		return dao.select(code);
	}
	
}
