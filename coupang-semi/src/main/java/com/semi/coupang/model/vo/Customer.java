package com.semi.coupang.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Customer {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String email;
}
