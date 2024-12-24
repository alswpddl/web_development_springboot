package me.choiminje.springbootdeveloper;
/*
    New project 생성시 주의점 :
        1. build system -> Gradle 설정
        2. DLS -> Groovy 설정
        3. name = ArtifactId
        4. build.gradle 설정 복사하는데, 복사 후에 -> sync를 꼭꼭 눌러주셔야 합니다.
            -> SpringBootDeveloperApplication에서 @SpringBootApplication 애너테이션에 빨간줄이 가있다면
                새로고침 안했을 확률이 거의 90%
        5. resources 내에 static 내에 index.html이라고 하는데, 해당 폴더명의 경우 대부분의 개발자들이 합의한 형태
        6. 앞으로의 수업 시간에는 new project 생성시에 이렇게 자세히 풀이할 일은 자주 있지 않을 예정이니 꼭
            익혀두시기 바랍니다. -> github 본다고 되는 부분이 아닌만큼 신경써주시면 감사하겠습니다.
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
/*
    1. Spring vs Springboot

        Enterprise Apllication : 대규모의 복잡한 데이터를 관리하는 애플리케이션
            많은 사용자의 요청을 동시에 처리해야 하므로 서버 성능과 안정성, 보안 이슈 등
            모든 걸 시녁ㅇ쓰면서 사이트 가능, 즉 '비지니스 로직'을 개발하기가 매우 어려워서
            등장하게 된 것이 Spring

        SpringBoot의 등장
            스프링을 매우 많은 장점을 지니고 있지만 설정이 복잡하다는 단점이 있음.
            이런 단점을 보완하고자 등장한 것이 스프링 부트

            특징 :
                1) 톰캣, 제티, 언더토우 같은 웹 애플리케이션서버가 내장돼있어 따로 설치하지
                    않아도 독립적으로 실행가능
                2) 빌드 구성을 단순화하는 스프링 부트 스타터를 제공
                3) XML 설정을 하지 않고 자바 코드로 작성 가능
                4) JAR를 이용해서 자바 옵션만으로 배포가 가능
                5) 애플리케이션 모니터링 및 관리 도구인 스프링 액츄에이터(Spring Actuator) 제공

            즉, 스프링부트라는 것은 기본적으로 스프링에 속해있는 도구

            차이점 :
                1) 구성의 차이 -> 스프링은 애플리케이션 개발에 필요한 환경을 수동으로 구성하고 정의
                    하지만 스프링부트는 스링코어와 스프링 MVC의 모든 기능을 자동으로 로드
                    수동으로 개발 환경을 구성할 필요가 없음

                2) 내장 WAS 유무 -> 스프링 애플리케이션은 일반적으로 톰캣과 같은 WAS에서 배포
                WAS : Web Application Server의 약자
                하지만 스프링 부트는 자체적으로 WAS를 가지고 있어 JAR 파일만 만들면 별도로
                WAS 설정을 하지 않아도 애프리케이션을 실행할 수 있음
 */

@SpringBootApplication
public class SpringBootDeveloperApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringBootDeveloperApplication.class, args);
    }
}