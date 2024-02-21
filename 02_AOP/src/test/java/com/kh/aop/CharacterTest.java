package com.kh.aop;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class CharacterTest {

	// factory에서 읽어와서 getBean까지 한 단계와 같음.
	@Autowired(required=false)
	private Character character;
	
	
	@Test
	void test() {}

	@Test
	void character() {
		// 단위 테스트에서 쓰이는.
		// 존재하지 않는다면 fail, 존재한다면 true가 되는지 체크하는 기능
		assertThat(character).isNotNull();
	}
}
