package com.kh.aop.weapon;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Bow extends Weapon {

	@Override
	public String attack() throws Exception {
		return "민첩하게 활을 쏜다.";
	}

}
