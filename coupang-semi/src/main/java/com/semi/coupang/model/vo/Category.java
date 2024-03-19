package com.semi.coupang.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Category {
	
	private int cateCode;
	private String cateIcon;
	private String cateName;
	private String cateUrl;
	
	private int subCode;
	private String subName;
	
	private List<Category> subList;
	
}
