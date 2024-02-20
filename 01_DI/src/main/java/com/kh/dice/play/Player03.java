package com.kh.dice.play;

import com.kh.dice.Dice;

import lombok.Data;

@Data	// Getter, Setter, NoargsConstructor .. 등등의 것들을 가지고 있는 것 
public class Player03 {
	private Dice dice; // DiceA, DiceB 상관없이 가져오고 싶다 --> 인터페이스로 지정
	private int totalValue;
	
	public Player03(Dice dice) {
		this.dice = dice;
	}
	
	public void playDice(int count) {
		System.out.println("==> " + getClass().getName() + ".playDice() start");
		
		for(int i=0; i<count; i++) {
			dice.selectedNumber(); 	// 무작위로 돌아가는 메서드 호출
			System.out.println("[ " + dice.getClass().getName() + " ] 의 선택된 수 : " + dice.getValue());		// lombok을 통해 getter 생성 -> getvalue() 사용
			totalValue += dice.getValue();
		}
		
		System.out.println("==> " + getClass().getName() + ".playDice() end");
	}
	
}