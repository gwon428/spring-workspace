package com.kh.aop.weapon;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Sword extends Weapon {

	@Override
	public String attack() throws Exception {
		return "검을 휘두른다.";
	}

}
