package com.kh.dice.play;

import com.kh.dice.DiceA;

import lombok.Getter;

@Getter
public class Player01 {

	private DiceA diceA = new DiceA();
	private int totalValue;
	
	// count 만큼 주사위 굴려서 주사위 합을 구하는 로직
	public void playDice(int count) {
		System.out.println("==> " + getClass().getName() + ".playDice() start");
		
		for(int i=0; i<count; i++) {
			diceA.selectedNumber(); 	// 무작위로 돌아가는 메서드 호출
			System.out.println("[ " + diceA.getClass().getName() + " ] 의 선택된 수 : " + diceA.getValue());		// lombok을 통해 getter 생성 -> getvalue() 사용
			totalValue += diceA.getValue();
		}
		
		System.out.println("==> " + getClass().getName() + ".playDice() end");
	}
}
