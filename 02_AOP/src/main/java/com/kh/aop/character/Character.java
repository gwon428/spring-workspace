package com.kh.aop.character;

import com.kh.aop.weapon.Weapon;

public class Character {
	
	private String name;
	private int level;
	private Weapon weapon;
	
	public String quest(String questName) {
		return questName + " 퀘스트 진행 중";
	}
	
	// aop를 만들기 위해서는 애스팩트가 있어야 함. (CharacterAspect)
	
}
