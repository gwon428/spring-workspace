package com.kh.dice;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

import com.kh.dice.play.Player03;

// Spring 사용!
public class DiceTestApp03UsingSpring {

	public static void main(String[] args) {
		BeanFactory factory = new XmlBeanFactory(new FileSystemResource("src/main/resources/config/dice.xml"));
		Player03 player01 = (Player03) factory.getBean("player01");
		player01.playDice(12);
		System.out.println("=====");
		System.out.println("선택된 주사위 수 총 합 " + player01.getTotalValue());
		System.out.println("=====");
		
		Player03 player02 = (Player03) factory.getBean("player02");
		player02.playDice(5);
		System.out.println("=====");
		System.out.println("선택된 주사위 수 총 합 " + player02.getTotalValue());
		System.out.println("=====");
		
	}

}
