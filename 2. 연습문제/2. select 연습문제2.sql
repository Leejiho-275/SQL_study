

SELECT * FROM employees WHERE LOWER(first_name) ='david';

-- # 실습문제 1

-- 1. employees 테이블에서 모든 사원의 first_name과 first_name의 글자 수를 조회

-- 2. employees 테이블에서 first_name과 last_name과 이 둘을 연결한 이름을 조회

-- 3. employees 테이블에서 job_id가 it_prog인 사원의 first_name과 salary를 출력
-- 조건1) 비교하기 위한 값은 소문자로 입력
-- 조건2) 이름은 앞 3글자까지만 출력하고 나머지는 *로 마킹할 것. 이 열의 별칭은 name
-- 조건3) 급여는 전체 10자리로 출력하되 나머지자리는 *로 출력. 이 열의 별칭은 salary

SELECT
first_name,
LENGTH (first_name)
FROM employees;

SELECT
CONCAT(first_name,last_name)
FROM employees;

SELECT
RPAD(SUBSTR(first_name, 1, 3),LENGTH(first_name),'*') AS name,
LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER(job_id)='it_prog';