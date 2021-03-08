select * from employees;
select * from departments;

-- # 실습 문제
-- 1. employees, departments 테이블을 INNER JOIN해서
-- first_name, department_id, department_name을 조회

select
a.first_name,
a.department_id,
b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- 2. employees, departments 테이블을 NATURAL JOIN해서
--    FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME을 조회

select
first_name,
department_id,
department_name
from employees natural join departments;

select
a.first_name,
a.department_id,
b.department_name
from employees a, departments b
where a.department_id = b.department_id
and a.manager_id = b.manager_id;

select
a.first_name,
department_id,
b.department_name
from employees a
join departments b using (department_id);

select
a.first_name,
department_id,
b.department_name,
manager_id
from employees a
join departments b using (department_id, manager_id);

-- 3. employees, departments 테이블을 JOIN ON을 사용해서
-- first_name, department_id, department_name을 조회

select
a.first_name,
a.department_id,
b.department_name
from employees a join departments b
on a.department_id = b.department_id;