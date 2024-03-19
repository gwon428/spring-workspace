package com.semi.coupang.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.coupang.model.vo.Category;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<Category> viewCategoryList() {
		return session.selectList("category.select");
	}

}
