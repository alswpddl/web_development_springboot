import org.junit.jupiter.api.*;

public class JUnitCycleQuiz {
    /*
        문제 03
        각각의 테스트를 시작하기 전에 "Hello!"를 출력하는 메서드와 모든 테스트를 끝마치고
        "Bye!"를 출력하는 메서드를 추가해주세요. 다음에 테스트가 있다고 가정합니다.
     */
    @Test
    public void junitQuiz3(){
        System.out.println("this is the first test.");
    }
    @Test
    public void junitQuiz4(){
        System.out.println("this is the second test.");
    }
    /*
        여기에서 JUnitCycleQuiz 클래스를 전체 실행하면 콘솔에 다음과 같이 출력되려면 어떻게 할지 작성해보시기 바랍니다.
        실행 예

        Hello!
        this is the first test.
        Hello!
        this is the second test.
        Bye!
     */
    @BeforeEach
    public void beforeach(){
        System.out.println("Hello!");
    }

    @AfterAll
    static void afterAll(){
        System.out.println("Bye!");
    }
    /*
        src/main/java에 있는 TestController.java파일을 엽니다.
     */
}
