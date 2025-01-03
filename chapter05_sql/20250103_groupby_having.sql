-- 데이터를 그룹화하고, 함수로 게산하는 방법 학습 예정.
-- 그룹화(grouping)는 조건에 따라 데이터를 그룹으로 묶는 것으로(WHERE과는 차이가 있음),
-- 데이터를 그룹화하면 함수로 원하는 계산이 가능

-- 예를 들어 실습 데이터에서 회원 수를 구하려면 어떡해야할까, 전체 회원 수가 아니라,
-- 국가별 회원 수를 구하는 방법, 제품별 매출을 구하는 방법 등을 실제로 알아볼 수 있음.

-- SQL내에서 사용하는 함수들은 주로 평균, 개수, 합계 등을 구하는 '집계 함수',
-- 문자열을 원하는 만큼 잘라내거나 대/소문자를 변경하는 등의 기능을 수행하는 '일반 함수',
-- 등으로 나눌 수 있다.

-- 함수를 적용하기 위한 전체 조건 : GROUP BY
-- 전체 데이터를 째로 함수 적용하는 경우도 있지만, 그룹벼로 수치를 도출하는 일도 있는데,
-- 이럴 경우 사용하는 명령어가 GROUP BY
-- 이를 이용해 데이터를 그룹으로 묶은 후 필요 함수 적용 가능
-- 예를 들어 '국가별 회원 수를 구하라' 혹은 '일별 매출 계산하라'와 같은
-- 그룹화 기준을 지정해서 원하는 계산을 구행할 수 있음.

-- GROUP BY로 계산한 결과를 필터링하는 HAVING 명령어
-- GROUP BY를 적용해서 '구가별 회원 수를 구하고' 이후에 '그리고 회원 수가 10명 이상인'
-- '국가만 도출하라'는 등 집계 함수로 계산한 결과 중 조건에 맞는 데이터만 필요한 경우에는
-- WHERE을 쓰는 것이 아니라 'HAVING'을 사용합니다.

-- 집계 함수 예시
-- 예제 : users에서 모든 행 수를 세어봅니다 : COUNT
select *
	from users;

select count(*)				-- COUNT(컬럼명, 사실 *) 집계함수에 해당
	from users;				-- 대상 테이블 전체 행의 개수를 세는 역할
	
-- users에서 존재하는 country 컬럼의 데이터 개수
select count(country)	-- country 컬럼에서 null이 아닌 값의 개수
	from users;

select *
	from users
	where country is null;

-- country의 데이터값의 종류를 계산하고 싶다면 어떡해야할까?
select count(distinct country)		-- 중복을 제거하기 위해서는 distinct
	from users;

-- DISTINCT : 중복 값을 제거하여 고유한 값만 반환하는 키워드 / SELECT와 함께 사용

select count(1)		-- COUNT(컬럼숫자) 가능
	from users;

-- MIN / MAX / COUNT / SUM / AVG

-- products에서 최저가를 구하시오(price 컬럼 이용)
select min(price)
	from products;
-- products에서 최대가를 구하시오(price 컬럼 이용)
select max(price)
	from products;
-- products에서 전체 데이터 가격의 합 구하시오(price 컬럼 이용)
select sum(price)
	from products;
-- products에서 price의 평균(단, 결과값의 컬럼명을 avgPrice로 변경)
select round(avg(price),2) as avgPrice
	from products;
-- ROUND(집계함수결과, 소수점몇쨰자리까지인지)

집계 함수 예시

sum : 합계 : sum(컬럼명)
avg : 평균 : avg(컬럼명)
min : 최소값 : min(컬럼명)
max : 최대값 : max(컬럼명)
count : 개수 : count(컬럼명)

일반 함수 예시

round(컬럼명, 소수점자리수) : 소수점자리를 지정한 자릿수까지 반올림하며 반환
substr(컬럼명, 시작위치, 가져올문자개수) : 문자열을 지정한 시작 위치부터 지정한 문자 개수만큼 추출
length(컬럼명) : 문자열의 길이 반환
upper(컬럼명) : 알파벳 문자열을 대문자로 반환
lower(컬럼명) : 알파벳 문자열을 소문자로 반환

집계 함수는 여러 행의 데이터를 '하나의 결과값'으로 집계하는 반면,
일반 함수는 한 행의 데이터에 하나의 결과값을 반환한다.
이상을 이유로 집계 함수는 select에서 사용하능
일반 함수는 select뿐만 아니라 where에서도 사용 가능.
이상의 함수 예시들은 전부 다가 아니라 일부이므로 필요시마다 소개하도록 하겠습니다.

group by
-- 어떤 기준으로 묶어서 계산하느냐와 관련있는 키워드로,
-- 집계 함수만으로 원하는 결과를 얻을 수 없을 때(데이터 전체가 아니라, 원하는 기준으로
-- 그룹을 나눈 상태에서 계산을 해야할 떄ㄴ를 의미)가 있습니다.
-- 예를 들어, 전체 회원 수가 아닌 국가별 회원수를 나누어 계산하기도 하며,
-- 월별로 가입한 회원 수를 집계하기도 하기 때문.
-- 즉, 특정 조건으로 나눈 그룹별 계산을 수행할 때는 먼저 그룹화를 선행해야 합니다.
-- 그 후 집계 함수는 특정 컬럼을 기준으로 데이터를 그룹화 한 후에, 그룹별로 집계 함수를
-- 적용해야 합니다.
	
-- 에제 : users에서 country가 Korea인 회원 수를 출력
select COUNT(id)
	from users
	where country = "Korea";

-- 이상의 경우에 country = Korea인 경우는 출력할 수 있는데,
select count(distinct country)
	from users;

-- 를 확인해보면 count(DISTINCT country)의 결과값이 17이므로
-- 모든 국가를 대상으로 회원 수를 확인해보기 위해서는 국가별로 즉, 총 17번의
-- SQL문을 작성해야 합니다.
-- 국가 수는 적지도 않고, 실제 환경에서는 훨씬 더 많은 데이터를 다루는데, 조건을 일일이 적용하기에는 비효율적입니다.
-- 즉, where절에서 country = 의 값을 매번 바꾸는 방식은 사용하지 않습니다.

-- 다음 시간에 저희는 GROUP BY를 통해 어떻게 묶을지 학습하도록 하겠습니다.


// group by


-- users에서 국가(country) 내 도시(city)별 회원수를 구하여 출력.
--  단, 국가명은 앟파벳 순서대로 정렬, 같은 국가 내에서는 회원 수 기준이므로 내림 차순 정렬.
-- 표시 컬럼 country, city, uniqueUserCnt(where절 - x)
select country,city, count(distinct id) as uniqueUserCnt
	from users
	group by country, city
	order by country asc, uniqueUserCnt desc;


-- SUBSTR(컬럼명, 시작값, 글자개수)
-- users에서 월별(e.g. 2013-10) 가입 회원 수를 출력할 것.
-- 가입일시 컬럼 활용하고, 최신순으로 정렬할 것.

select substr(created_at, 1, 7) as month, count(distinct id) as uniqueUserCnt
	from users
	group by substr(created_at, 1, 7) -- (month로 사용 경우)
	order by month desc;
	
-- 1. orderdatails에서 order_id 별 주문 수량 quantity의 총합을 출력할 것.
	-- 주문 수량의 총합이 내림차순으로 정렬되도록 할 것(함수는 어제 수업에서 한 것 확인)
select order_id, sum(quantity)
	from orderdetails
	group by order_id
	order by sum(quantity) desc;

-- 2. orders에서 staff_id 별, user_id 별로 주문 건수(COUNT(*))를 출력할 것.
	-- 단, staff_id 기준 오름 차순하고 주문 건수 별 기준 내림 차순
select staff_id, user_id, count(*)
	from orders
	group by staff_id, user_id
	order by staff_id asc, count(*) desc;

-- 3. orders에서 월별로 주문한 회원 수 출력할 것(order_date 컬럼 이용, 최신순으로 정렬)
select substr(order_date, 1, 7), count(distinct user_id)
	from orders
	group by substr(order_date, 1, 7)
	order by substr(order_date, 1, 7) desc 
	
-- HAVING
-- group by를 이용해서 데이터를 그룹화하고, 해당 그룹별로 집계 연산을 수행하여,
-- 국가 별 회원 수를 도출해낼 수 있었습니다.(COUNT())
-- 예를 들어서, 회원 수가 n명 이상인 국가의 회원 수만 보는 등의 조건을 걸려면 어떡해야 할까?
	
-- WHERE절을 이용하는 방법이 있긴 하지만 추가적인 개념에 대해서 학습할 예정입니다.
-- 언제나 WHERE을 쓰는 것이 용이하지 않다는 점 부터 짚고 넘어가서 HAVING 학습을 할 예정
	
-- users에서 country가 Korea, USA, France인 회원 숫자를 도출할 것
select country, count(distinct id)
	from users
	where country in ('Korea','USA','France')
	group by country;

WHERE을 통해서 원하는 국가만 먼저 필터링하고, GROUP BY를 했습니다.
여기서 필터링 조건은 country 컬럼의 데이터 값에 해당합니다.
	
만약에 회원 수가 8명 이상인 국가의 회원 수만 필터링하려면 어떡할까?
select country, count(distict id)
	from users
	where country in ('Korea','USA','France') >= 8
	; 오류 나는 사례
	
-- user에서 회원 수가 8명 이상인 country 별 회원 수 출력(회원 수 기준 내림차순)
-- select country, count(distinct id)
-- 	from users
-- 	group by country
-- 	having count(distinct id)>=8
-- 	order by count(distinct id) desc;
	
select country, count(distinct id)
	from users
	group by country
	having count(distinct id)>=8
	order by 2 desc;						-- 두 번쨰 컬럼은 DESC순으로 정리
 
1. WHERE 에서 필터링을 시도할 때 오류가 발생하는 이유 :
	WHERE 은 GROUP BY 보다 먼저 실행되기 때문에 그룹화를 진행하기 전에 행을 필터링 함.
	하지만 집계 함수로 계산된 값의 경우에는 그룹화 이후에 이루어지기 때문에
	순서상으로 GROUP BY 보다 뒤에 있어야 해서 WHERE 절 도입이 불가능 함.
	
2. 즉 group by를 사용한 집계 값을 필터링할 때는 -> HAVING을 사용.

-- orders에서 담당 직원별 주문 건수와 주문 회원수를 계산하고, 주문 건수가 10건 이상이면서
-- 주문 회원 수가 40명 이하인 데이터만 출력(단, 주문 건수 기준으로 내림차순 정렬할 것)
-- staff_id, users_id, id 컬럼 이용

select staff_id, count(distinct id), count(distinct user_id)
	from orders
	group by staff_id
	having count(distinct id) >= 10 and count(distinct user_id) <= 40
	order by count(distinct id) desc;
	
-- HAVING 정리
-- 순서상 GROUP BY 뒤쪽에 위치하며, GROUP BY와 집계함수로 그룹별로 집계한 값을
-- 필터링할 때 사용

-- WHERE과 동일하게 피러링 기능을 수행하지만, 적용 영역의 차이 때문에 주의할 필요 있음.
-- WHERE은 'FROM'에서 불러온 데이터를 직접 필터링하는 반면에,
-- HAVING은 'GROUP BY가 실행된 이후의 집계 함수 값'을 필터링 함.
-- 따라서 HAVING은 GROUP BY가 SELECT문 내에 없다면 사용할 수가 없음

-- SELECT문의 실행 순서
select 컬럼명				- 5
from 테이블명				- 1
where 조건1				- 2
group by 컬러명			- 3
having 조건2				- 4
order by 컬럼명			- 6

-- 1. 컴퓨터는 가장 먼저 from 을 읽어 데이터가 저장된 위치에 접근하고, 
-- 테이블의 존재 유무를 따지고 테이블을 확인하는 작업을 실행하고,
-- 2. where 을 실행하여 가져올 데이터의 범위 확인.
-- 3. 데이터베이스에서 가져올 범위가 결정된 데이터에 한하여 집계 연산을 적용할 수 있게
-- 	그룹으로 데이터를 나눈다.
-- 4. having 은 바로 그 다음 실행되면서 이미 group by 를 통해 집계 연산 적용이 가능한 상태이기 
-- 	때문에 4의 단계에서 집계 연산을 수행함
-- 5. 이후 select 를 통해 특정 컬럼, 혹은 집계 함수 적용 컬럼을 조회하여 값을 보여주는데, 
-- 6. order by를 통해 특정 컬럼 및 연산결과를 통한 오름 차순 및 내림 차순으로 나열함.

연습 문제
1. orders 에서 회원별 주문 건수 추출하라(단 주문 건수가 7건 이상인 회원의 정보만 추출,
주문 건수 기준으로 내림차순 정렬, user_id와 주문 아이디(id)컬럼 활용 할 것)

select user_id, count(distinct id)
	from orders
	group by user_id
	having count(distinct id)>=7
	order by count(distinct id) desc;

2. users에서 country 별 city 수와 국가별 회원(id) 수를 추출.
	단, 도시 수가 5개 이상이고 회원 수가 3명 이상인 정보만 추출하고,
	도시 수, 회원수 기준으로 모두 내림차순할 것

select country, count(distinct city), count(distinct id)
	from users
	group by country 
	having count(distinct city)>=5 and count(distinct id)>=3
	order by count(distinct city) desc, count(distinct id) desc;
	
	
3. users에서 USA, Brazil, Korea, Argentina, Mexico에 거주 중인 회원 수를 
	국가별로 추출(단, 회원 수가 5명 이상인 국가만 추출하고, 회원 수 기준으로 내림차순)

select country, count(distinct id)
	from users
	where country in ('USA','Brazil','Korea','Argentina','Mexico')
	group by country
	having count(distinct id)>=5
	order by count(distinct id) desc;
	
-- SQL 실무 상황에서의 GROUP BY & HAVING 
-- 1. 2025-01-03에 음식 분류별 (한식, 중식, 분식, ...) 주문 건수 집계
select 음식분류, count(distinct 주문아이디) as 주문건수
	from 주문정보
	where 주문시간(월) = "2025-01"
	group by 음식분류
	order by 주문건수 desc;


	
	
	
	