package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Swap {
	private String swapCode;
	private String id;
	private String prodCode;
	private String reason;
	private String swapDate;
	private String price;
	private String swapStatus;
}
