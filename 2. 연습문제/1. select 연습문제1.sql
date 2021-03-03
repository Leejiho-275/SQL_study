-- �ǽ�
-- 1. employees ���̺��� first_name, last_name, salary�� ��ȸ

-- 2. departments ���̺��� department_id, department_name, manager_id, location_id�� ��ȸ

-- 3. employees ���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ

-- 4. employees ���̺��� ��������� first_name + last_name + '�� �޿���' + salary + '$�Դϴ�.'
-- �� ���·� �����Ͽ� '�������'��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ

-- 5. employees ���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ
SELECT
first_name,last_name,salary
FROM employees;

SELECT
department_id, department_name,manager_id,location_id
FROM departments;

SELECT
first_name AS �̸�,
salary AS �޿�
FROM employees;

SELECT
first_name || last_name || '�� �޿���' || salary || '�Դϴ�.' AS �������
FROM employees;

SELECT DISTINCT
department_id
FROM employees;

-- �ǽ� 2
-- 1. employees ���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ

-- 2. employees ���̺��� last_name�� 'King'�� ����� first_name, job_id, hire_date�� ��ȸ

-- 3. employees ���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ

-- 4. employees ���̺��� salary�� 10000�� 12000 ���̿� �ִ� ����� first_name, salary�� ��ȸ

-- 5. employees ���̺��� manager_id�� 101, 102, 103�߿� ���ϴ� ����� first_name, salary, manager_id�� ��ȸ

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