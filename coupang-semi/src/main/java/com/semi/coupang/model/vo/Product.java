package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Product {
	private String prodCode;
	private String enteId;
	private String cateCode;
	private String prodName;
	private String prodDesc;
	private String price;
	private String stock;
	private String prodDate;
	
}
