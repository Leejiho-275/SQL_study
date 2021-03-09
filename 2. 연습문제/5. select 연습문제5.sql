-- OUTER JOIN �߰� ����
select * from job_history; -- ���� ���� �̷�
select * from employees;

-- ��� ����� ��ȸ�� �� ���� �����̷��� �ִٸ� �ش� ������ ���� ��ȸ
-- ���� ���� �̷��� �ִ� ����� ��ȸ
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

-- �ǽ�����
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ���

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

-- 2. ��� ����� first_name�� department_name,
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ

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

-- 3. 103 ����� first_name�� department_name,
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ������ ��ȸ

select
e.first_name, d.department_name, l.street_address || ',' || l.city || ',' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.employee_id = 103;

-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name,
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ������ ��ȸ

select
e.first_name, d.department_name, l.street_address || ',' || l.city || ',' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where d.department_name like 'IT%';