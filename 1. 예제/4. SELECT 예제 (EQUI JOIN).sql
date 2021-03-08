-- ORDER BY ����

SELECT
CERTI_CD, CERTI_NM, ISSUE_INSTI_NM
FROM TB_CERTI
ORDER BY issue_insti_nm desc;

SELECT
CERTI_CD, CERTI_NM, ISSUE_INSTI_NM
FROM TB_CERTI
ORDER BY 3;

SELECT
EMP_NO,
emp_nm,
birth_de,
ADDR,
TEL_NO,
direct_manager_emp_no
FROM TB_EMP
WHERE BIRTH_DE LIKE '196%'
ORDER BY DIRECT_MANAGER_EMP_NO DESC;

SELECT
CERTI_CD,
issue_insti_nm
FROM TB_CERTI
ORDER BY CERTI_NM DESC;

-- JOIN ����

SELECT
A.EMP_NO,
A.EMP_NM,
A.DEPT_CD,
B.DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
AND B.DEPT_NM='��ȹ��';

SELECT
A.EMP_NO,
A.EMP_NM,
B.DEPT_NM,
C.CERTI_CD
FROM TB_EMP A, TB_DEPT B, TB_EMP_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD
AND A.EMP_NO = C.EMP_NO
AND B.DEPT_NM = '��������';

SELECT
A.EMP_NO,
A.EMP_NM,
B.DEPT_NM,
C.CERTI_CD,
D.CERTI_NM
FROM TB_EMP A, TB_DEPT B, TB_EMP_CERTI C, TB_CERTI D
WHERE A.DEPT_CD = B.DEPT_CD
AND A.EMP_NO = C.EMP_NO
AND c.certi_cd = D.CERTI_CD
AND B.DEPT_NM = '��������';

select
a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
from tb_emp a, tb_dept b
where a.dept_cd = b.dept_cd
order by birth_de;

-- # INNER JOIN = EQUI JOIN
-- 1. 2�� �̻��� ���̺��� ����Ǵ� �÷��� ���� �������� ���յǴ� ���α��
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� �񱳵�

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm
from tb_emp a,tb_dept b
where a.dept_cd = b.dept_cd
order by a.emp_no;

-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� ������ ��
-- 2. �ڵ����� �� ���̺��� ���� �̸��� ���� �÷��� ���� INNER������ ������
-- 3. �� �� ���� �÷��� ������ Ÿ���� ���ƾ� �ϸ� ALIAS�̳� ���̺� ��� ���� ���λ縦 ���� �� ����
-- 4. SELECT * ������ ����ϸ� �����÷���� �ڵ� �����ϸ�, ���� �÷����� ��� ���տ��� �� ���� ǥ����

select
*
from tb_emp a natural join tb_dept b;

select
emp_no, emp_nm, dept_cd, dept_nm
from tb_emp natural join tb_dept;

select
emp_no, emp_nm, dept_nm
from tb_emp natural join tb_dept;

-- # USING �� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��鿡 ���� ������ �̷��������
--    USING ���� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� EQUI ������ ����
-- 2. USING�������� ���� �÷��� ���ؼ� ALIAS�� ���̺� ��� ���� ���λ縦 ���� �� ����

select
a.emp_no,
a.emp_nm,
a.addr,
b.dept_nm,
dept_cd
from tb_emp a join tb_dept b using (dept_cd)
where a.addr like '%����%';

-- # JOIN ON ��
-- 1. ���� ���� ������(ON��) �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϱ� ���� ���
-- 2. ON���� ����ϸ� JOIN ���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� ����

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm
from tb_emp a
join tb_dept b on a.dept_cd = b.dept_cd
where a.addr like '%�ϻ�%'
order by a.emp_no;