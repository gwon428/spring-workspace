package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Category {
	private String cateCode;
	private String cateName;
	private String parentCode;
}
