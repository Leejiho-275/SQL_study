-- # ������ ���� �߰� ����
select employee_id, first_name, manager_id
from employees;

select
employee_id, lpad(' ', 4*(level-1)) || first_name || ' ' || last_name as "NAME",
level
from employees
start with manager_id is null
-- connect by prior �ڽ� = �θ�
connect by prior employee_id = manager_id
-- order siblings by ���� ���� ���̿��� ���ı���
order siblings by first_name;

-- # �ǽ�����
-- 1. employees ���̺��� �Ի���(hire_date)�� 04���̰ų�
--    �μ���ȣ(department_id)�� 20���� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ
-- UNION

select employee_id, first_name
from employees
where hire_date like '04%'
union
select employee_id, first_name
from employees
where department_id = '20';

-- 2. employees ���̺��� �Ի���(hire_date)�� 04���̰�
--    �μ���ȣ(department_id)�� 20���� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ
-- INTERSECT

select employee_id, first_name
from employees
where hire_date like '04%'
intersect
select employee_id, first_name
from employees
where department_id = '20';

-- 3. employees ���̺��� �Ի���(hire_date)�� 04�⿡ �Ի��Ͽ�����
--    �μ���ȣ(department_id)�� 20���� �ƴ� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ
-- MINUS

select employee_id, first_name
from employees
where hire_date like '04%'
minus
select employee_id, first_name
from employees
where department_id = '20';