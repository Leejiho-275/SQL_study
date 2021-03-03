-- 실습
-- 1. employees 테이블에서 first_name, last_name, salary를 조회

-- 2. departments 테이블에서 department_id, department_name, manager_id, location_id를 조회

-- 3. employees 테이블에서 first_name의 별칭을 '이름', salary의 별칭을 '급여'로 조회

-- 4. employees 테이블의 사원정보를 first_name + last_name + '의 급여는' + salary + '$입니다.'
-- 의 형태로 연결하여 '사원정보'라는 별칭을 부여하여 하나의 컬럼으로 조회

-- 5. employees 테이블에서 department_id의 중복을 제거하여 조회
SELECT
first_name,last_name,salary
FROM employees;

SELECT
department_id, department_name,manager_id,location_id
FROM departments;

SELECT
first_name AS 이름,
salary AS 급여
FROM employees;

SELECT
first_name || last_name || '의 급여는' || salary || '입니다.' AS 사원정보
FROM employees;

SELECT DISTINCT
department_id
FROM employees;

-- 실습 2
-- 1. employees 테이블에서 job_id가 'IT_PROG'인 사원의 first_name, job_id, department_id를 조회

-- 2. employees 테이블에서 last_name이 'King'인 사원의 first_name, job_id, hire_date를 조회

-- 3. employees 테이블에서 salary가 15000보다 크거나 같은 사원의 first_name, salary, hire_date를 조회

-- 4. employees 테이블에서 salary가 10000과 12000 사이에 있는 사원의 first_name, salary를 조회

-- 5. employees 테이블에서 manager_id가 101, 102, 103중에 속하는 사원의 first_name, salary, manager_id를 조회

SELECT --1
first_name,
job_id,
department_id
FROM employees
WHERE job_id LIKE 'IT_PROG';

SELECT --2
first_name,
last_name,
hire_date
FROM employees
WHERE last_name LIKE 'KING';

SELECT --3
first_name,
salary,
department_id
FROM employees
WHERE salary >=15000;

SELECT --4
first_name,
salary
FROM employees
WHERE salary BETWEEN '10000' AND '12000';

SELECT --5
first_name,
salary,
manager_id
FROM employees
WHERE manager_id IN ('101','102','103');

SELECT --6
first_name,
job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_MGR');

SELECT --7
first_name,
last_name,
job_id
FROM employees
WHERE job_id LIKE 'IT%';

SELECT --8
first_name,
email
FROM employees
WHERE email LIKE '_A%';

SELECT --9
first_name,
manager_id
FROM employees
WHERE manager_id is null;

SELECT --10
first_name,
job_id,
commission_pct
FROM employees
WHERE commission_pct is not null;

SELECT --11
first_name,
job_id,
salary
FROM employees
WHERE job_id LIKE 'IT_PROG' AND salary>=5000;

SELECT --12
first_name,
job_id,
salary
FROM employees
WHERE job_id LIKE 'IT_PROG' OR salary>=5000;

SELECT --13
first_name,
job_id,
salary
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_MGR') AND salary>=5000;