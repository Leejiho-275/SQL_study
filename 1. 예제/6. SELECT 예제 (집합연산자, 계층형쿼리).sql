-- # ���� ������
-- ## UNION
-- 1. ���п����� �����հ� ���� �ǹ�
-- 2. ù ��° ������ �� ��° ������ �ߺ��� ������ �ѹ��� ������
-- 3. ù ��° ������ ���� ������ Ÿ���� �� ��° ������ ���� ������ Ÿ���� �����ؾ� ��

select emp_no, emp_nm, birth_de
from tb_emp
where birth_de between '19600101' and '19691231'
union
select emp_no, emp_nm, birth_de
from tb_emp
where birth_de between '19700101' and '19791231';

select emp_nm, birth_de
from tb_emp
where birth_de between '19600101' and '19691231'
union
select emp_nm, birth_de
from tb_emp
where birth_de between '19700101' and '19791231';

-- ## UNION ALL
-- 1. ù ��° ������ �� ��° ������ �ִ� ��� �����͸� ���ļ� ������
-- 2. �ߺ��� ������ ��� ������
-- 3. UNION���� �޸� �ڵ� ���ı���� �������� ����

select emp_no, emp_nm, birth_de
from tb_emp
where birth_de between '19600101' and '19691231'
union all
select emp_no, emp_nm, birth_de
from tb_emp
where birth_de between '19700101' and '19791231';

select emp_nm, birth_de
from tb_emp
where birth_de between '19600101' and '19691231'
union all
select emp_nm, birth_de
from tb_emp
where birth_de between '19700101' and '19791231';

-- ## INTERSECT
-- 1. ù ��° ������ �� ��° �������� �ߺ��� �ุ�� ���
-- 2. ���п����� �����հ� ���� �ǹ�

select
a.emp_no, a.emp_nm, a.addr, b.certi_cd, c.certi_nm
from tb_emp a, tb_emp_certi b, tb_certi c
where a.emp_no = b.emp_no
and b.certi_cd = c.certi_cd
and c.certi_nm = 'SQLD'
intersect
select
a.emp_no, a.emp_nm, a.addr, b.certi_cd, c.certi_nm
from tb_emp a, tb_emp_certi b, tb_certi c
where a.emp_no = b.emp_no
and b.certi_cd = c.certi_cd
and a.addr like '%����%';

select
a.emp_no, a.emp_nm, a.addr, b.certi_cd, c.certi_nm
from tb_emp a, tb_emp_certi b, tb_certi c
where a.emp_no = b.emp_no
and b.certi_cd = c.certi_cd
and c.certi_nm = 'SQLD'
and a.addr like '%����%';

-- ## MINUS (EXCEPT)
-- 1. ���п����� �����հ� ���� �ǹ�
-- 2. �� ��° �������� ���� ù ��° �������� �ִ� �����͸� ������

select emp_no, emp_nm, sex_cd, dept_cd 
from tb_emp
MINUS
select emp_no, emp_nm, sex_cd, dept_cd 
from tb_emp
where dept_cd = '100001'
MINUS
select emp_no, emp_nm, sex_cd, dept_cd 
from tb_emp
where dept_cd = '100002'
MINUS
select emp_no, emp_nm, sex_cd, dept_cd 
from tb_emp
where sex_cd = '1';

-- # ������ ����
-- 1. �������̶�� �ǹ̴� �����Ͱ� ���� ����ϰ� �������� ���Ը� �ǹ��ϴ� �ݸ�
--    �������� ������̰� �������� ���踦 �ǹ�
-- 2. ������Ʈ���� ����ϴ� �亯�� �Խ����̳� ī�װ� �������� ������ ������ �ش�

-- ������ ���� Ű����
-- 1. START WITH top_level_condition
--  : ��Ʈ��带 �����ϴ� ����, �� ������ �����ϴ� ��� ����� ��Ʈ��尡 ��
-- 2. CONNECT BY [PRIOR] connect_condition
--  : �� ���ǿ��� �θ�� �ڽ� ������ ������ ���踦 ���, �� ���ǿ� ���� �θ�� �ڽ� ������ ���̸� ����
--    PRIOR�� �θ� ��� �÷��� �ĺ��ϴµ� ���

select level lvl, LPAD(' ', 4*(level-1)) || emp_no || '(' || emp_nm || ')' as "�����ο�",
a.dept_cd, b.dept_nm, CONNECT_BY_ISLEAF
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
start with a.direct_manager_emp_no is null
connect by prior a.emp_no = a.direct_manager_emp_no;