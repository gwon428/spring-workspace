## AOP(Aspect Oriented Programming)

### 1. AOP(Aspect Oriented Programming)

- 관점 지향 프로그래밍(Aspect Oriented Programming)의 약자이다.
- 애플리케이션의 여러 부분에 걸쳐 있는 기능을 횡단 관심사(Cross-cutting concerns)라고 한다.
- AOP는 이러한 횡단 관심사를 분리하고 분리한 기능을 어디에 어떻게 적용할지 선언적으로 정의할 수 있다.
  <br><img src="https://user-images.githubusercontent.com/26870393/182381535-d93c41eb-ab56-4d1f-bb24-df4732cb50a2.png" width="800px"/><br>
- AOP의 목적은 횡단 관심사와 이에 영향받는 객체 간 결합도를 낮추는데 있다.

### 2. AOP 용어

- 애스펙트(Aspect)는 횡단 관심사를 분리하여 작성한 클래스이다. (어드바이스 + 포인트컷)
- 어드바이스(Advice)는 애스펙트가 해야 할 작업과 언제 그 작업을 수행해야 하는지 정의하는 것을 말한다.
  <table>
    <tr>
      <td>Before Advice</td>
      <td>조인포인트 앞에서 실행된다.</td>
    </tr>
    <tr>
      <td>After Advice</td>
      <td>조인포인트 뒤에서 실행된다.</td>
    </tr>
    <tr>
      <td>Around Advice</td>
      <td>조인포인트 앞과 뒤에서 실행된다.</td>
    </tr>
    <tr>
      <td>After Returning Advice</td>
      <td>조인포인트가 정상적으로 종료된 후에 실행된다.</td>
    </tr>
    <tr>
      <td>After Throwing Advice</td>
      <td>조인포인트에서 예외가 발생했을 때 실행된다.</td>
    </tr>
  </table>
- 조인포인트(JoinPoint)는 어드바이스가 적용될 수 있는 모든 곳을 의미한다. (메소드 호출 지점, 예외 발생 지점, 필드 등)
- 포인트컷(PointCut)은 여러 조인포인트 중에 실제 어드바이스가 적용될 조인 포인트를 정의하는 것을 말한다.
- 대상 객체(Target Object)는 애스펙트가 적용될 객체를 말한다.
- 위빙(Weaving)은 대상 객체에 애스펙트를 적용하는 것을 말한다.
  <table>
    <tr>
      <td>컴파일 시 위빙</td>
      <td>대상 클래스가 컴파일 될 때 위빙 된다.</td>
    </tr>
    <tr>
      <td>클래스 로딩 시 위빙</td>
      <td>대상 클래스가 JVM에 로드될 때 위빙 된다.</td>
    </tr>
    <tr>
      <td>런타임 시 위빙</td>
      <td>애플리케이션 실행 중에 위빙 된다. (스프링)</td>
    </tr>
  </table>

### 3. Spring AOP

#### 3.1. 메소드 조인 포인트만 지원한다.

- 대상 객체의 메소드가 호출되는 런타임 시점에만 어드바이스을 적용할 수 있다.
- AspectJ 같은 고급 AOP 프레임워크를 사용하면 객체의 생성, 필드 값의 조회와 조작, static 메소드 호출 및 초기화 등의 다양한 작업에 어드바이스를 적용할 수 있다.

#### 3.2. 프록시(Proxy) 기반의 AOP를 지원한다.

- 프록시(Proxy)는 대상 객체에 어드바이스가 적용된 후 생성되는 객체로 대상 객체에 직접 접근을 제한하는 역할을 하는 객체이다.
- Spring AOP는 대상 객체에 대한 프록시를 만들어 제공하며, 대상 객체를 감싸는 프록시는 런타임 시에 생성된다.
- 프록시는 대상 객체의 메소드 호출을 가로채어 어드바이스를 수행하고 대상 객체의 메소드를 호출하거나 대상 객체의 메소드를 호출 후 어드바이스를 수행한다.
  <br><img src="https://user-images.githubusercontent.com/26870393/182384317-9e023b61-0ad4-4f19-9f19-3f84fd3bb77c.png" width="800px"/><br>

### 4. Spring AOP 구현 방법

#### 4.1. XML 기반의 AOP 구현

- 스프링의 aop 네임스페이스를 사용하여 빈을 애스펙트로 전환할 수 있다.

  ```xml
  <aop:config>
    <aop:aspect ref="빈 ID">
      <!-- 메소드 실행 전에 적용되는 어드바이스를 정의 -->
      <aop:before
          pointcut="포인트컷 지정자"
          method="메소드명"/>

      <!-- 메소드 실행 후에 적용되는 어드바이스를 정의 -->
      <aop:after
          pointcut="포인트컷 지정자"
          method="메소드명"/>

      <!-- 메소드가 정상적으로 실행된 후에 적용되는 어드바이스를 정의 -->
      <aop:after-returning
          pointcut="포인트컷 지정자"
          method="메소드명"/>

      <!-- 메소드가 예외를 발생시킬 때 적용되는 어드바이스를 정의 -->
      <aop:after-throwing
          pointcut="포인트컷 지정자"
          method="메소드명"/>

      <!-- 메소드 호출 이전, 이후, 예외 발생 등 모든 시점에 적용 가능한 어드바이스를 정의 -->
      <aop:around
          pointcut="포인트컷 지정자"
          method="메소드명"/>
    </aop:aspect>
  </aop:config>
  ```

#### 4.2. 어노테이션 기반의 AOP 구현

- 스프링은 AspectJ의 어노테이션을 사용하여 애스펙트를 생성할 수 있다.

  ```java
  @Aspect
  @Component
  public class 클래스명 {
    @Before("포인트컷 지정자")
    public void before() {
      // 메소드 실행 전에 적용되는 어드바이스를 정의
    }

    @After("포인트컷 지정자")
    public void after() {
      //  메소드 실행 후에 적용되는 어드바이스를 정의
    }

    @AfterReturning("포인트컷 지정자")
    public void success() {
      // 메소드가 정상적으로 실행된 후에 적용되는 어드바이스를 정의
    }

    @AfterThrowing("포인트컷 지정자")
    public void fail() {
      // 메소드가 예외를 발생시킬 때 적용되는 어드바이스를 정의
    }

    @Around("포인트컷 지정자")
    public String around(ProceedingJoinPoint jp) {
      // 메소드 호출 이전, 이후, 예외 발생 등 모든 시점에 적용 가능한 어드바이스를 정의
    }
  }
  ```

- AsepctJ 어노테이션을 적용을 위해서는 설정 파일에 아래와 같이 프록시 설정을 해야한다.
  ```xml
  <!-- XML 설정 -->
  <beans>
    <aop:aspectj-autoproxy/>
  </beans>
  ```
  ```java
  // Java 설정
  @Configuration
  @EnableAspectJAutoProxy
  public class RootConfig {
  }
  ```
