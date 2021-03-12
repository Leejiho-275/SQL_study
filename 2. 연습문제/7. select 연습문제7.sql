-- # 다중행 서브쿼리 연산자 정리
-- 1. IN : 목록의 어떤값과 같은지 확인
-- 2. ANY : 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 하나라도 만족하면 됨
-- 3. ALL : 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 모든 값을 만족해야 함
-- 4. EXISTS : 결과를 만족하는 값이 존재하는지의 여부를 확인

-- ## ALL과 ANY의 차이점
-- * < ANY : 가장 큰 값보다 작으면 됨
-- * > ANY : 가장 작은 값보다 크면 됨
-- * < ALL : 가장 작은 값보다 작으면 됨
-- * > ALL : 가장 큰 값보다 크면 됨
-- * = ANY : IN과 같은 역할

-- 스칼라 서브쿼리 추가예제
-- 모든 사원의 이름과 부서이름을 조회
select e.first_name, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

select e.first_name,
(select d.department_name from departments d where e.department_id = d.department_id) as dept_name
from employees e;

-- # 실습 문제
-- 1. employees 테이블에서 Nancy보다 많은 급여를 받는 사원의 first_name과 salary를 조회

select first_name, salary
from employees
where salary < any
(
select salary
from employees
where first_name = 'David'
);

-- 2. employees 테이블에서 David와 같은 부서에 근무하는 사원의 first_name과 department_id, job_id 조회

select first_name, department_id, job_id
from employees
where department_id = any
(
select department_id
from employees
where first_name = 'David'
);