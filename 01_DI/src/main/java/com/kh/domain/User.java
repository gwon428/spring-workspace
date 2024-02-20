package com.kh.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
// @Data : Setter, Getter, AllArgsConstructor, ToString
public class User {
	private String userId;
	private String password;
	private int age;
	
	public User(String userId, String password) {
	this.userId = userId;
	this.password = password;
	}
}
