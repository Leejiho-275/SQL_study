-- OUTER JOIN 추가 예제
select * from job_history; -- 직무 변동 이력
select * from employees;

-- 모든 사원을 조회할 때 직무 변동이력이 있다면 해당 내역도 같이 조회
-- 직무 변동 이력이 있는 사원만 조회
select
e.employee_id, e.first_name, e.hire_date, e.job_id as "cur_job_id", j.start_date, j.end_date, j.job_id, j.department_id
from employees e, job_history j
where e.employee_id = j.employee_id
order by j.employee_id;

select
e.employee_id, e.first_name, e.hire_date, e.job_id as "cur_job_id", j.start_date, j.end_date, j.job_id, j.department_id
from employees e, job_history j
where e.employee_id = j.employee_id(+)
order by j.employee_id;

select
e.employee_id, e.first_name, e.hire_date, e.job_id as "cur_job_id", j.start_date, j.end_date, j.job_id, j.department_id
from employees e
left outer join job_history j
on e.employee_id = j.employee_id
order by j.employee_id;

-- 실습문제
-- 1. 사원번호가 103번인 사원의 이름(employee_name)과 매니저 이름(manager_name)을 출력

select
a.first_name, b.first_name
from employees a, employees b
where a.manager_id = b.employee_id and a.employee_id = '103';

select
a.first_name, b.first_name
from employees a
join employees b
on a.manager_id = b.employee_id
where a.employee_id = '103';

-- 2. 모든 사원의 first_name과 department_name,
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 조회

select * from employees;
select * from departments;
select * from locations;

select
e.first_name, d.department_name, l.street_address || ',' || l.city || ',' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- 3. 103 사원의 first_name과 department_name,
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 지정해 조회

select
e.first_name, d.department_name, l.street_address || ',' || l.city || ',' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.employee_id = 103;

-- 4. 부서 이름이 IT로 시작하는 사원의 first_name과 department_name,
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 지정해 조회

select
e.first_name, d.department_name, l.street_address || ',' || l.city || ',' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where d.department_name like 'IT%';