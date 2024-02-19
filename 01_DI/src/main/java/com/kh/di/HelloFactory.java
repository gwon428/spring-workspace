package com.kh.di;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class HelloFactory {

	private Hello hello;
	private Properties properties;

	// 싱글톤 패턴
	// 1. 생성자 - private
	// 2. getInstance - public static
	private static HelloFactory helloFactory;

	private HelloFactory() {
	}

	public synchronized static HelloFactory getInstance() {
		if (helloFactory == null)
			helloFactory = new HelloFactory();
		return helloFactory;
	}

	// properties 파일 읽어오는 메서드
	public void setConfigResource(String configResource) {
		try (FileInputStream fis = new FileInputStream(configResource)) {
			properties = new Properties();
			properties.load(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// name에 해당하는 객체 생성 역할 (hello 객체 생성)
	private void newInstanceHello(String name) {
		// .trim() : 앞뒤 공백 제거 역할
		String className = properties.getProperty(name).trim();

		try {
			Class cls = Class.forName(className);
			Object obj = cls.newInstance();

			if (obj instanceof Hello) {
				this.hello = (Hello) obj;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Hello 객체 생성하는 newInstanceHello() 호출 후 Hello 객체 리턴
	public Hello getBean(String name) {
		newInstanceHello(name);
		return hello;
	}
}
