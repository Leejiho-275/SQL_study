select * from employees;
select * from departments;

-- # �ǽ� ����
-- 1. employees, departments ���̺��� INNER JOIN�ؼ�
-- first_name, department_id, department_name�� ��ȸ

select
a.first_name,
a.department_id,
b.department_name
from employees a, departments b
where a.department_id = b.department_id;

-- 2. employees, departments ���̺��� NATURAL JOIN�ؼ�
--    FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME�� ��ȸ

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

-- 3. employees, departments ���̺��� JOIN ON�� ����ؼ�
-- first_name, department_id, department_name�� ��ȸ

select
a.first_name,
a.department_id,
b.department_name
from employees a join departments b
on a.department_id = b.department_id;