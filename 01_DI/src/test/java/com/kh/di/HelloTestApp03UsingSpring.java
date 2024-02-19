package com.kh.di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class HelloTestApp03UsingSpring {

	public static void main(String[] args) {
		
		// 1+2. BeanFactory 생성 (Spring이 기본으로 가지고 있는 공장) - 주문서
		BeanFactory factory = new XmlBeanFactory(new FileSystemResource("src/main/resources/config/hello.xml"));
		
		// 3. factory한테 hello 이름을 갖는 Hello 객체 요청
		Hello hello = (Hello) factory.getBean("hello");
		
		// 4. printMessage() 호출
		hello.printMessage();
	}

}
