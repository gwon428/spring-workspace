package com.semi.coupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.coupang.model.vo.Category;
import com.semi.coupang.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	@ResponseBody
	@GetMapping("/category")
	public List<Category> category() {
		return service.viewCategoryList();
	}
	
}






