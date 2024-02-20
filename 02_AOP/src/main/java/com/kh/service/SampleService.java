package com.kh.service;

import org.springframework.stereotype.Service;

@Service 
public class SampleService {

	public Integer add(String str1, String str2) {
		return Integer.parseInt(str1) + Integer.parseInt(str2);
	}
	
}
