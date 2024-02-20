package com.kh.dice;

import com.kh.dice.play.Player01;
import com.kh.dice.play.Player02;

public class DiceTestApp01 {

	public static void main(String[] args) {
		// 객체 생성
		Player01 player01 = new Player01();
		player01.playDice(12);
		System.out.println("=====");
		System.out.println("선택된 주사위 수 총 합 " + player01.getTotalValue());
		System.out.println("=====");
		
		Player02 player02 = new Player02();
		player02.playDice(5);
		System.out.println("=====");
		System.out.println("선택된 주사위 수 총 합 " + player02.getTotalValue());
		System.out.println("=====");
	}

}
