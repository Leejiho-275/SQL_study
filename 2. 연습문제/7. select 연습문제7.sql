-- # ������ �������� ������ ����
-- 1. IN : ����� ����� ������ Ȯ��
-- 2. ANY : ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� �ϳ��� �����ϸ� ��
-- 3. ALL : ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� ��� ���� �����ؾ� ��
-- 4. EXISTS : ����� �����ϴ� ���� �����ϴ����� ���θ� Ȯ��

-- ## ALL�� ANY�� ������
-- * < ANY : ���� ū ������ ������ ��
-- * > ANY : ���� ���� ������ ũ�� ��
-- * < ALL : ���� ���� ������ ������ ��
-- * > ALL : ���� ū ������ ũ�� ��
-- * = ANY : IN�� ���� ����

-- ��Į�� �������� �߰�����
-- ��� ����� �̸��� �μ��̸��� ��ȸ
select e.first_name, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

select e.first_name,
(select d.department_name from departments d where e.department_id = d.department_id) as dept_name
from employees e;

-- # �ǽ� ����
-- 1. employees ���̺��� Nancy���� ���� �޿��� �޴� ����� first_name�� salary�� ��ȸ

select first_name, salary
from employees
where salary < any
(
select salary
from employees
where first_name = 'David'
);

-- 2. employees ���̺��� David�� ���� �μ��� �ٹ��ϴ� ����� first_name�� department_id, job_id ��ȸ

select first_name, department_id, job_id
from employees
where department_id = any
(
select department_id
from employees
where first_name = 'David'
);