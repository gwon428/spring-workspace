package com.kh.api.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor
public class Animal {

	public Animal(String name, String message) {
		this.name = name;
		this.message = message;
	}
	private String message;
	
	private int no;
	private String name;
	private int age;
}
