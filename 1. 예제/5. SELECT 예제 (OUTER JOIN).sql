-- 3개의 테이블 조인

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd
from tb_emp a, tb_dept b, tb_emp_certi c
where a.dept_cd = b.dept_cd
and a.addr like '%수원%'
and a.emp_no = c.emp_no
order by a.emp_no;

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
join tb_emp_certi c
on a.emp_no = c.emp_no
where a.addr like '%수원%';

-- 4개 테이블 조인
-- 위 3개 테이블 + tb_certi / 추가로 자격증 이름(certi_nm) 조회

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm, c.certi_cd, d.certi_nm
from tb_emp a, tb_dept b, tb_emp_certi c, tb_certi d
where a.dept_cd = b.dept_cd
and a.addr like '%수원%'
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
where a.addr like '%수원%';

-- # SELF JOIN
-- 1. SELF JOIN은 자기 자신의 테이블을 조인하는 개념
-- 2. 자기 테이블의 컬럼들을 매칭하여 조회하는 기법

select
a.emp_no, a.emp_nm, a.direct_manager_emp_no, b.emp_nm as "상사이름"
from tb_emp a, tb_emp b
where a.direct_manager_emp_no = b.emp_no and b.emp_nm = '김나라'
order by emp_no;

-- OUTER JOIN 실습환경 세팅

insert into tb_dept values ('100014', '4차산업혁명팀','999999');
insert into tb_dept values ('100015', '포스트코로나팀','999999');
commit;

select * from tb_dept;

alter table tb_emp drop CONSTRAINT fk_tb_emp01;

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000041', '이순신', '19811201','1','경기도 용인시 수지구 죽전1동 435', '010-5656-7878',null,'006','003','114-554-223433','000000','n');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000042', '정약용', '19820402','1','경기도 고양시 덕양구 화정동 231', '010-4054-6547',null,'004','001','110-223-553453','000000','y');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000043', '박지원', '19850611','1','경기도 수원시 팔달구 매탄동 553', '010-1254-1116',null,'004','001','100-233-664234','000000','n');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000044', '장보고', '19870102','1','경기도 성남시 분당구 정자동 776', '010-1215-8784',null,'004','002','180-345-556634','000000','y');

insert into tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
values('1000000045', '김종서', '19880824','1','경기도 고양시 일산서구 백석동 474', '010-3687-1245',null,'004','002','325-344-45345','000000','y');

commit;

select * from tb_emp;

-- OUTER JOIN
-- 1. 조인 조건을 만족하지 않는 행들도 조회하기 위해 사용
-- 2. outer 조인 연산자는 더하기 기호 (+)
-- 3. equi조인은 조인 조건을 만족하지 않으면 해당 행은 출력되지 않음
--    그러나 outer 조인은 방향(LEFT, RIGHT)에 맞게 조건에 매칭되지 않는
--    행들도 모두 null행을 생성해서 출력

-- # LEFT OUTER JOIN
-- 왼쪽 테이블 정보는 모두 조회, 오른쪽 테이블은 조인조건에 매칭된 것만 조회
SELECT
a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
from tb_emp a
join tb_dept b
on a.dept_cd = b. dept_cd(+)
where a.dept_cd in ('000000', '100003');

-- # RIGHT OUTER JOIN
-- 오른쪽 테이블 정보는 모두 조회, 왼쪽 테이블은 조인조건에 매칭된 것만 조회

select * from tb_dept;

-- 모든 부서를 조회할 때 해당 부서에 사원정보가 있으면 그 정보까지 조회

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

-- 실습 종료 후 처리
delete from tb_dept where dept_cd in ('100014', '100015');

delete from tb_emp where emp_no in('1000000041', '1000000042', '1000000043', '1000000044', '1000000045');

commit;

alter table tb_emp add CONSTRAINT fk_tb_emp foreign key (dept_cd) REFERENCES tb_dept (dept_cd);