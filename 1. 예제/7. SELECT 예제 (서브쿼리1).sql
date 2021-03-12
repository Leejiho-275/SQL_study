-- # 서브 쿼리
-- ## 서브 쿼리를 사용할 수 있는 곳
-- [ select절(스칼라 서브쿼리), from절(인라인 뷰)
-- where, having, order by절, insert의 value절, update set절]

-- ## 서브쿼리 사용 유의점
-- 1. 반드시 괄호로 감쌀 것
-- 2. 비교연산자 오른쪽에 위치시킬 것
-- 3. 서브쿼리에 order by를 사용 불가
-- 4. 단일 행 서브쿼리에는 단일 행 연산자만, 다중 행 서브쿼리에는 다중 행 연산자를 사용

-- # 단일 행 서브쿼리

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

-- # 다중 행 서브쿼리
-- 서브쿼리 조회 건수가 다중 행인 것 (IN, ANY, ALL, EXISTS)

select emp_no, count(*) cnt
from tb_emp_certi
where certi_cd in
(
select certi_cd
from tb_certi
where issue_insti_nm = '한국데이터베이스진흥원'
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

-- 주소가 강남인 직원들의 부서정보를 조회

select a.dept_cd, a.dept_nm
from tb_dept a
where exists (
select 1 from tb_emp k where k.dept_cd = a.dept_cd
and k.addr like '%강남%'
);

-- # 스칼라 서브쿼리

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
where issue_insti_nm = '한국데이터베이스진흥원'
)
order by certi_nm;