-- ORDER BY 정렬

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

-- JOIN 기초

SELECT
A.EMP_NO,
A.EMP_NM,
A.DEPT_CD,
B.DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
AND B.DEPT_NM='기획팀';

SELECT
A.EMP_NO,
A.EMP_NM,
B.DEPT_NM,
C.CERTI_CD
FROM TB_EMP A, TB_DEPT B, TB_EMP_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD
AND A.EMP_NO = C.EMP_NO
AND B.DEPT_NM = '빅데이터팀';

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
AND B.DEPT_NM = '빅데이터팀';

select
a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
from tb_emp a, tb_dept b
where a.dept_cd = b.dept_cd
order by birth_de;

-- # INNER JOIN = EQUI JOIN
-- 1. 2개 이상의 테이블이 공통되는 컬럼에 의해 논리적으로 결합되는 조인기법
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 비교됨

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm
from tb_emp a,tb_dept b
where a.dept_cd = b.dept_cd
order by a.emp_no;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 조인을 함
-- 2. 자동으로 두 테이블에서 같은 이름을 가진 컬럼에 대해 INNER조인을 수행함
-- 3. 이 때 조인 컬럼은 데이터 타입이 같아야 하며 ALIAS이나 테이블 명과 같은 접두사를 붙일 수 없음
-- 4. SELECT * 문법을 사용하면 공통컬럼들로 자동 조인하며, 공통 컬럼들은 결과 집합에서 한 번만 표현됨

select
*
from tb_emp a natural join tb_dept b;

select
emp_no, emp_nm, dept_cd, dept_nm
from tb_emp natural join tb_dept;

select
emp_no, emp_nm, dept_nm
from tb_emp natural join tb_dept;

-- # USING 절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼들에 대해 조인이 이루어지지만
--    USING 절을 사용하면 원하는 컬럼에 대해서만 선택적으로 EQUI 조인이 가능
-- 2. USING절에서도 조인 컬럼에 대해서 ALIAS나 테이블 명과 같은 접두사를 붙일 수 없음

select
a.emp_no,
a.emp_nm,
a.addr,
b.dept_nm,
dept_cd
from tb_emp a join tb_dept b using (dept_cd)
where a.addr like '%수원%';

-- # JOIN ON 절
-- 1. 조인 조건 서술부(ON절) 일반 조건 서술부(WHERE절)을 분리해서 작성하기 위한 방법
-- 2. ON절을 사용하면 JOIN 이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있음

select
a.emp_no, a.emp_nm, a.addr, b.dept_cd, b.dept_nm
from tb_emp a
join tb_dept b on a.dept_cd = b.dept_cd
where a.addr like '%일산%'
order by a.emp_no;