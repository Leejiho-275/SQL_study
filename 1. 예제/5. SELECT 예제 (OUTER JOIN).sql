-- 3���� ���̺� ����

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd
from tb_emp a, tb_dept b, tb_emp_certi c
where a.dept_cd = b.dept_cd
and a.addr like '%����%'
and a.emp_no = c.emp_no
order by a.emp_no;

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
join tb_emp_certi c
on a.emp_no = c.emp_no
where a.addr like '%����%';

-- 4�� ���̺� ����
-- �� 3�� ���̺� + tb_certi / �߰��� �ڰ��� �̸�(certi_nm) ��ȸ

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd, d.certi_nm
from tb_emp a, tb_dept b, tb_emp_certi c, tb_certi d
where a.dept_cd = b.dept_cd
and a.addr like '%����%'
and a.emp_no = c.emp_no
and c.certi_cd = d.certi_cd
order by a.emp_no;

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd, d.certi_nm
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
join tb_emp_certi c
on a.emp_no = c.emp_no
join tb_certi d
on c.certi_cd = d.certi_cd
where a.addr like '%����%';

-- # SELF JOIN
-- 1. SELF JOIN�� �ڱ� �ڽ��� ���̺��� �����ϴ� ����
-- 2. �ڱ� ���̺��� �÷����� ��Ī�Ͽ� ��ȸ�ϴ� ���

select
a.emp_no, a.emp_nm, a.direct_manager_emp_no, b.emp_nm as "����̸�"
from tb_emp a, tb_emp b
where a.direct_manager_emp_no = b.emp_no and b.emp_nm = '�質��'
order by emp_no;

-- OUTER JOIN �ǽ�ȯ�� ����

insert into tb_dept values ('100014', '4�����������','999999');
insert into tb_dept values ('100015', '����Ʈ�ڷγ���','999999');
commit;

select * from tb_dept;

alter table tb_emp drop CONSTRAINT fk_tb_emp01;

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000041', '�̼���', '19811201','1','��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',null,'006','003','114-554-223433','000000','n');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000042', '�����', '19820402','1','��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',null,'004','001','110-223-553453','000000','y');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000043', '������', '19850611','1','��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',null,'004','001','100-233-664234','000000','n');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000044', '�庸��', '19870102','1','��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',null,'004','002','180-345-556634','000000','y');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000045', '������', '19880824','1','��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',null,'004','002','325-344-45345','000000','y');

commit;

select * from tb_emp;

-- OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�ϱ� ���� ���
-- 2. outer ���� �����ڴ� ���ϱ� ��ȣ (+)
-- 3. equi������ ���� ������ �������� ������ �ش� ���� ��µ��� ����
--    �׷��� outer ������ ����(LEFT, RIGHT)�� �°� ���ǿ� ��Ī���� �ʴ�
--    ��鵵 ��� null���� �����ؼ� ���

-- # LEFT OUTER JOIN
-- ���� ���̺� ������ ��� ��ȸ, ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ
SELECT
a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
from tb_emp a
join tb_dept b
on a.dept_cd = b. dept_cd(+)
where a.dept_cd in ('000000', '100003');

-- # RIGHT OUTER JOIN
-- ������ ���̺� ������ ��� ��ȸ, ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ

select * from tb_dept;

-- ��� �μ��� ��ȸ�� �� �ش� �μ��� ��������� ������ �� �������� ��ȸ

select
a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
from tb_emp a
right outer join tb_dept b
on a.dept_cd = b.dept_cd;

-- FULL OUTER JOIN
select
a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
from tb_emp a
full outer join tb_dept b
on a.dept_cd = b.dept_cd
order by b.dept_cd desc, a.emp_no desc;

-- �ǽ� ���� �� ó��
delete from tb_dept where dept_cd in ('100014', '100015');

delete from tb_emp where emp_no in('1000000041', '1000000042', '1000000043', '1000000044', '1000000045');

commit;

alter table tb_emp add CONSTRAINT fk_tb_emp foreign key (dept_cd) REFERENCES tb_dept (dept_cd);