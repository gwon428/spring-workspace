package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Enterprise {
	private String enteId;
	private String password;
	private String name;
	private String company;
	private String address;
	private String registNumber;
	private String companyPhone;
}
