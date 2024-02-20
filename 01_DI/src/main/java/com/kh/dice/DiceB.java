package com.kh.dice;

import java.util.Random;

import lombok.Getter;
@Getter	
public class DiceB {
private int value;
	
	public DiceB() {
	
		System.out.println(getClass().getName() + " 생성자");
	}
	
	public void selectedNumber() {
		// 메서드를 부르는 순간 value에 random 값
		// 주사위를 던져 선택되는 숫자를 생산
		value = new Random().nextInt(6)+1;	// 1~6까지 random
	}
	
}
