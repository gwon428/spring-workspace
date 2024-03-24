package com.semi.coupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.coupang.model.dao.CategoryDAO;
import com.semi.coupang.model.vo.Category;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO dao;
	
	public List<Category> viewCategoryList() {
		return dao.viewCategoryList();
	}
	
}
