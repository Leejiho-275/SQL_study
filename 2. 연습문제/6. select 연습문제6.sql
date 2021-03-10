-- # 계층형 쿼리 추가 예제
select employee_id, first_name, manager_id
from employees;

select
employee_id, lpad(' ', 4*(level-1)) || first_name || ' ' || last_name as "NAME",
level
from employees
start with manager_id is null
-- connect by prior 자식 = 부모
connect by prior employee_id = manager_id
-- order siblings by 형제 노드들 사이에서 정렬기준
order siblings by first_name;

-- # 실습문제
-- 1. employees 테이블에서 입사일(hire_date)가 04년이거나
--    부서번호(department_id)가 20번인 사람의 사원아이디(employee_id)와 이름(first_name)을 조회
-- UNION

select employee_id, first_name
from employees
where hire_date like '04%'
union
select employee_id, first_name
from employees
where department_id = '20';

-- 2. employees 테이블에서 입사일(hire_date)가 04년이고
--    부서번호(department_id)가 20번인 사람의 사원아이디(employee_id)와 이름(first_name)을 조회
-- INTERSECT

select employee_id, first_name
from employees
where hire_date like '04%'
intersect
select employee_id, first_name
from employees
where department_id = '20';

-- 3. employees 테이블에서 입사일(hire_date)가 04년에 입사하였지만
--    부서번호(department_id)가 20번이 아닌 사람의 사원아이디(employee_id)와 이름(first_name)을 조회
-- MINUS

select employee_id, first_name
from employees
where hire_date like '04%'
minus
select employee_id, first_name
from employees
where department_id = '20';