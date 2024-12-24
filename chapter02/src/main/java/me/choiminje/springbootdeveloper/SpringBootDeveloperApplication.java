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
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringBootDeveloperApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringBootDeveloperApplication.class, args);

        /*
            처음으로 SpringBootDeveloperApplication 파일을 실행시키면 whiteLabel error page가 뜹니다.
            현재 요청에 해당하는 페이지가 존재하지 않기 때문에 생격난 문제입니다.
            -> 하지만 스프링 애플리케이션은 실행됨

            그래서 error 페이지가 기분 나쁘니까 기본적으로 실행될 때의 default 페이지를 하나 생성하겠습니다.

            20241223 MON.
                1. IntelliJ Community Version 설치 -> bin.PATH 체크하고 나머지는 전부 디폴트
                2. Git 설치
                3. GItHub 연동 -> web_development_springboot -> 현재 문제가 좀 있음
                4. IntelliJ에 Gradle 및 SpringBoot 프로젝트를 생성
                5. POSTMAN을 설치
         */


    }
}