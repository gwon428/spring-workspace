package com.kh.di;

public class Hello {
	private String message = "Hello~";
	
	public void printMessage() {
		
		System.out.println(getClass().getName() + "=> " + message);
	}
}
