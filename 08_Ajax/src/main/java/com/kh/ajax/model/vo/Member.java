package com.kh.ajax.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Member {

	private String id;
	private String password;
	private String name;
	private String auth;
	private int enabled;
}
