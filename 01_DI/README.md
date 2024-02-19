# DI (Dependency Injection)

## 1. IoC (Inversion of Control)

- IoC(Inversion of Control)란, 프로그램을 구동하는데 필요한 객체에 대한 생성, 변경 등의 관리를 개발자가 아닌 컨테이너에서 직접 관리하는 것을 말한다.
- 스프링은 IoC 구조를 통해 구동 시 필요한 객체의 생성부터 소멸까지 해당 객체에 대한 관리를 직접 수행한다.

<img src="https://user-images.githubusercontent.com/26870393/182604427-d5e9f400-cc8c-410e-b583-df5de4e50bbc.png" width="800px"/>

### 1.1. 스프링 IoC 컨테이너

- 스프링에서 관리하는 객체를 `빈(Bean)`이라고 하고, 해당 빈들을 관리한다는 의미로 컨테이너를 `빈 팩토리(Bean Factory)`라고 한다.

<img src="https://user-images.githubusercontent.com/26870393/182604523-d8b96080-a043-41cb-a51c-9213abc12428.png" width="800px"/>

### 1.2 스프링 IoC 컨테이너의 역할

- 객체(Bean)의 생명주기와 의존성을 관리한다.
- 객체(Bean)의 생성, 초기화, 소멸 등의 처리를 담당한다.
- 개발자가 직접 객체를 생성할 수 있지만 해당 권한을 컨테이너에 맡김으로써 소스 코드 구현의 시간을 단축할 수 있다.

<img src="https://user-images.githubusercontent.com/26870393/182604584-41a1d804-b021-4443-b8e1-6e72885460e7.png" width="800px"/>

### 1.3 스프링 IoC 컨테이너의 종류

- `애플리케이션 컨텍스트(Application Context)`는 `빈 팩토리(BeanFactory)`를 확장한 IoC 컨테이너로 빈(Bean)을 등록하고 관리하는 기능은 빈 팩토리(BeanFactory)와 동일하지만 스프링이 제공하는 각종 부가적인 서비스를 추가 제공한다.

| 종류                                  | 설명                                                                                                        |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| AnnotationConfigApplicationContext    | 자바 기반 설정 클래스에서 스프링 애플리케이션 컨텍스트를 로드한다.                                          |
| AnnotationConfigWebApplicationContext | 자바 기반 설정 클래스에서 스프링 웹 애플리케이션 컨텍스트를 로드한다.                                       |
| GenericXmlApplicationContext          | XML 설정 파일에서 스프링 애플리케이션 컨텍스트를 로드한다.                                                  |
| ClassPathXmlApplicationContext        | 애플리케이션 클래스패스(classpath)에 있는 하나 이상의 xml 파일에서 스프링 애플리케이션 컨텍스트를 로드한다. |
| XmlWebApplicationContext              | 웹 애플리케이션에 포함된 XML 파일에서 스프링 애플리케이션 컨텍스트를 로드한다.                              |

## 2. DI(Dependency Injection)

### 2.1. DI(Dependency Injection)

- DI(Dependency Injection)란 하나의 객체가 사용하는(의존하는) 다른 객체를 외부에서 생성하고 주입받아 사용하는 것을 말한다.
- 객체를 주입받는 방법으로는 메소드를 통한 의존성 주입 방법과 생성자를 통한 의존성 주입 방법이 있다.

### 2.2. 스프링 DI

- 스프링에서는 컨테이너가 설정 정보를 읽어와서 자동으로 객체들의 의존 관계를 주입한다.
- 스프링 컨테이너를 통해 의존성을 주입받게 되면 유지 보수가 편해지고 개발자가 작성해야 할 코드가 단순해지며 객체 간의 종속 관계(결합도)를 해소할 수 있다.

## 3. 스프링 DI 설정 방법

- 스프링은 객체들의 의존 관계를 연결할 수 있는 3가지의 설정 방법을 제공한다.

### 3.1. XML 방식

- 스프링 컨테이너 구동 시 생성해야 하는 객체(Bean)들과 의존 관계를 XML 파일로 작성하는 방식이다.
- `<beans>` 요소는 최상위 요소로 하위 요소들로 다양한 스프링 설정할 수 있다. (DI, AOP, Transaction 등)
- `<bean>` 요소는 스프링 컨테이너가 관리할 빈을 선언하는 요소이다.

```xml
  <beans>
    <bean id="student" class="com.kh.spring.person.model.vo.Student"/>
  </beans>
```

- Setter 메소드를 통해 의존 관계가 있는 빈을 주입하려면 `<property>` 요소를 사용한다. (단, 일치하는 setter 메소드가 있어야 된다.)

```xml
 <beans>
   <bean id="student" class="com.kh.spring.person.model.vo.Student">
     <property name="name" value="홍길동"/>
     <property name="wallet" ref="money"/>
   </bean>

   <bean id="money" class="com.kh.spring.wallet.model.vo.Wallet" />
 </beans>
```

- 생성자를 통해 의존 관계가 있는 빈을 주입하려면 `<constructor-arg>` 요소를 사용한다. (단, 일치하는 매개변수가 있는 생성자가 있어야 된다.)

```xml
 <beans>
   <bean id="student" class="com.kh.spring.person.model.vo.Student">
     <constructor-arg name="name" value="홍길동"/>
     <constructor-arg name="wallet" ref="money"/>
   </bean>

   <bean id="money" class="com.kh.spring.wallet.model.vo.Wallet" />
 </beans>
```

- `<import>` 요소를 사용하여 다른 XML 설정을 가져올 수 있다.

  ```xml
  <beans>
    <import resource="config.xml"/>
  </beans>
  ```

### 3.2. Java 방식

- 스프링 컨테이너 구동 시 생성해야 하는 객체(Bean)들과 의존 관계를 Java 파일로 작성하는 방식이다.
- 스프링 컨테이너가 자바 파일을 설정 파일로 식별하기 위해서는 @Configuration 어노테이션을 클래스에 작성해야 한다.
  ```java
  @Configuration
  public class JavaConfig {
  }
  ```
- 자바 파일에서 빈을 선언하기 위해서는 객체를 리턴하는 메소드를 만들고 @Bean 어노테이션을 메소드에 작성해야 한다.
  ```java
  @Configuration
  public class JavaConfig {
    @Bean
    public Student student() {
      return new Student();
    }
  }
  ```
- Setter 메소드를 통해 의존 관계가 있는 빈을 주입할 수 있다.

  ```java
  @Configuration
  public class JavaConfig {
    @Bean
    public Student student() {
      Student student = new Student();

      student.setName("홍길동");
      student.setWallet(wallet());

      return student;
    }

    @Bean
    public Wallet wallet() {
      return new Wallet();
    }
  }
  ```

- 생성자를 통해 의존 관계가 있는 빈을 주입할 수 있다.

  ```java
  @Configuration
  public class JavaConfig {
    @Bean
    public Student student() {
      return new Student("홍길동", wallet());
    }

    @Bean
    public Wallet wallet() {
      return new Wallet();
    }
  }
  ```

- @Import 어노테이션을 사용하여 다른 Java 설정 파일을 가져올 수 있다.
  ```java
  @Configuration
  @Import(Config.class)
  public class JavaConfig {
  }
  ```

### 3.3. 어노테이션 방식

- 스프링 컨테이너 구동 시 생성해야 하는 객체(Bean)들과 의존 관계를 어노테이션을 사용하여 구성하는 방식이다.
- 어노테이션으로 빈을 선언하기 위해서는 빈으로 생성하고 싶은 클래스에 @Component을 작성해야 한다.
  ```java
  @Component
  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public class Student {
    private String name;
    private Wallet wallet;
  }
  ```
- @Component 어노테이션이 작성된 클래스를 빈으로 생성하기 위해서는 컴포넌트 스캐닝(Component Scannig)을 통해서 스프링 컨테이너 구동 시 해당 클래스를 찾아 빈으로 등록하도록 설정해야 한다.
  ```xml
  <!-- XML 방식 -->
  <beans>
    <context:component-scan base-package="com.kh.spring" />
  </beans>
  ```
  ```java
  // Java 방식
  @Configuration
  @ComponentScan("com.kh.spring")
  public class JavaConfig {
  }
  ```
- @Autowired 어노테이션을 사용하여 스프링 컨테이너에서 빈을 찾아 자동으로 의존성 주입을 할 수 있다.
- @Autowired 어노테이션은 필드, 메소드, 생성자에 적용할 수 있다.
- @Value 어노테이션을 사용하여 빈이 아닌 값을 주입할 수 있다.
  ```java
  @Component
  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public class Student {
    @Value("홍길동")
    private String name;
    @Autowired
    private Wallet wallet;
  }
  ```
