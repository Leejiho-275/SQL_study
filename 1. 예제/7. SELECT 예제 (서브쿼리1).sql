-- # ���� ����
-- ## ���� ������ ����� �� �ִ� ��
-- [ select��(��Į�� ��������), from��(�ζ��� ��)
-- where, having, order by��, insert�� value��, update set��]

-- ## �������� ��� ������
-- 1. �ݵ�� ��ȣ�� ���� ��
-- 2. �񱳿����� �����ʿ� ��ġ��ų ��
-- 3. ���������� order by�� ��� �Ұ�
-- 4. ���� �� ������������ ���� �� �����ڸ�, ���� �� ������������ ���� �� �����ڸ� ���

-- # ���� �� ��������

select emp_no, emp_nm, dept_cd
from tb_emp
where dept_cd =
(
 select dept_cd
 from tb_emp
 where emp_no = '1000000005');

select a.emp_no, b.emp_nm, a.pay_de, a.pay_amt
from tb_sal_his a
inner join tb_emp b
on a.emp_no = b.emp_no
where a.pay_de = '20200525'
and a.pay_amt >=
(
select avg(s.pay_amt)
from tb_sal_his s
where s.pay_de = '20200525'
);

-- # ���� �� ��������
-- �������� ��ȸ �Ǽ��� ���� ���� �� (IN, ANY, ALL, EXISTS)

select emp_no, count(*) cnt
from tb_emp_certi
where certi_cd in
(
select certi_cd
from tb_certi
where issue_insti_nm = '�ѱ������ͺ��̽������'
)
group by emp_no
order by emp_no;

select a.emp_no, a.emp_nm, a.dept_cd, b.dept_nm, a.birth_de
from tb_emp a
inner join tb_dept b
on a.dept_cd = b.dept_cd
where (a.dept_cd, a.birth_de)
in (
select e.dept_cd, min(e.birth_de) as min_brith_de
from tb_emp e
group by e.dept_cd
having count(*) > 1)
order by a.emp_no;

-- �ּҰ� ������ �������� �μ������� ��ȸ

select a.dept_cd, a.dept_nm
from tb_dept a
where exists (
select 1 from tb_emp k where k.dept_cd = a.dept_cd
and k.addr like '%����%'
);

-- # ��Į�� ��������

select * from tb_emp_certi;

select a.emp_no,
(select emp_nm from tb_emp L where L.emp_no = a.emp_no) as emp_nm,
a.certi_cd,
(select C.certi_nm from tb_certi C where C.certi_cd = a.certi_cd) as certi_nm
from tb_emp_certi a
where a.certi_cd in
(
select K.certi_cd
from tb_certi K
where issue_insti_nm = '�ѱ������ͺ��̽������'
)
order by certi_nm;