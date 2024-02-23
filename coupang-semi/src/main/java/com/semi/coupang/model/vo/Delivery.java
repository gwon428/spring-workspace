package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Delivery {
	private String deliCode;
	private String purCode;
	private String deliDate;
	private String deliCompany;
	private String deliCost;
	private String deliAddr;
}
