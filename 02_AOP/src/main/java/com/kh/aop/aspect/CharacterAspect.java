package com.kh.aop.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

/*
 	1. Aspect (애스펙트)
 	- AOP 횡단 관심사 (한 Application의 여러 부분에 공통적으로 사용하고 있는 기능) [관통..?]
 	  애스펙트라는 특별한 클래스로 모듈화해서 관리한다.
 	- 애스펙트는 어드바이스와 포인트 커트를 합친 것이다.
 
 	2. Advice (어드바이스)
 	- 애스펙트가 해야하는 작업을 AOP 용어로 어드바이스라고 한다.
 	- 애스펙트가 해야하는 작업(공통적으로 사용하고 있는 기능)과 언제 그 작업을 수행해야 하는지 정의하는 것을 말한다.
 	- Spring Aspect는 5가지 종류의 어드바이스
 	  1) before : 어드바이스 대상 메서드가 호출되기 전에 어드바이스 기능을 수행한다.
 	  2) after : 결과와 상관 없이 어드바이스 대상 메서드가 완료된 후에 어드바이스 기능을 수행한다.
 	  3) after-returning : 어드바이스 대상 메서드가 성공적으로 완료된 후에 어드바이스 기능을 수행한다.
 	  4) after-throwing : 어드바이스 대상 메서드가 예외를 던진 후에 어드바이스 기능을 수행한다.
 	  5) around : 어드바이스 대상 메서드를 감싸서 어드바이스 대상 메서드 호출 전과 후에 어드바이스 기능을 수행한다.
 	  
 	 3. PointCut (포인트 커트)
 	 - 어드바이스가 적용될 조인 포인트의 영역을 좁히는 일을 한다.
 	 - 어드바이스는 애스펙트가 해야 하는 '작업'과 '언제' 그 작업을 수행해야 하는지 정의하는 것이라면,
 	   포인트 커트는 '어디에' 어드바이스를 적용할지 정의하는 것이다.
 	 - 포인트 커트를 지정하기 위해서는 "AspectJ" 포인트 커트 표현식을 통해서 지정해 줄 수 있다.
 	 
 	 4. JoinPoint (조인 포인트)
 	 - 어드바이스를 적용할 수 있는 모든 지점을 조인 포인트라고 한다.
 	 - 즉, 조인 포인트는 애플리케이션 실행에 어드바이스를 끼워 넣을 수 있는 지점(Point)를 말한다.
 */
@Aspect	// 애스팩트임을 명시해줘야 함.
public class CharacterAspect {

	@Pointcut("execution(* com.kh.aop.character.Character.quest(..)) && args(questName)")
	public void questPointcut(String questName) {}
	
	@Before("execution(* com.kh.aop.character.Character.quest(..))")
	public void beforeQuest(JoinPoint jp) {
		// 퀘스트 수행 전 필요한 작업 수행
		String questName = (String) jp.getArgs()[0];
		System.out.println(questName + " 퀘스트 준비 중 (Before)");
	}
	
	
	
	@Around("execution(* com.kh.aop.character.Character.quest(..))")
	public String questAdvice(ProceedingJoinPoint jp) {
		String result = null;
		String questName = (String) jp.getArgs()[0];
		
		// == before가 진행
		System.out.println(questName + " 퀘스즈 준비 중 (Around)");
		
		try {
			result = (String) jp.proceed(new Object[] {questName});
			
			// after-returning일 때
			System.out.println(questName + " 퀘스트 수행 완료 ..");
		} catch (Throwable e) {
			// after-throwing일 때
			System.out.println(questName + " 수행 중 에러 발생");
		}
		
		return result;
	}
}
