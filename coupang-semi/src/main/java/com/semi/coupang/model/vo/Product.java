package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Product {

	private int prodCode;
	private String prodName;
	private int price;
	private String prodPhoto;
	
}
