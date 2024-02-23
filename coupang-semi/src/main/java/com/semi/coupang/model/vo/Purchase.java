package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Purchase {
	private String purCode;
	private String id;
	private String prodCode;
	private String purDate;
	private String purStatus;
}
