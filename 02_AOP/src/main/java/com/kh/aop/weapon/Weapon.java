package com.kh.aop.weapon;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public abstract class Weapon {
	// 상속받은 클래스만 제어할 수 있게 -> protected 
	protected String name;
	
	public abstract String attack() throws Exception;
}
