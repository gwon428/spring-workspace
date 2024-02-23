package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Coupon {
	private String couponCode;
	private String couponName;
	private String expiryDate;
	private String id;
	private String prodCode;
}
