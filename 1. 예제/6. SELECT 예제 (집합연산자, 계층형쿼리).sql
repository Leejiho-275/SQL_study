-- # 집합 연산자
-- ## UNION
-- 1. 수학에서의 합집합과 같은 의미
-- 2. 첫 번째 쿼리와 두 번째 쿼리의 중복된 정보는 한번만 보여줌
-- 3. 첫 번째 쿼리의 열의 개수와 타입이 두 번째 쿼리의 열의 개수와 타입이 동일해야 함

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
-- 1. 첫 번째 쿼리와 두 번째 쿼리에 있는 모든 데이터를 합쳐서 보여줌
-- 2. 중복된 정보도 모두 보여줌
-- 3. UNION과는 달리 자동 정렬기능을 제공하지 않음

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
-- 1. 첫 번째 쿼리와 두 번째 쿼리에서 중복된 행만을 출력
-- 2. 수학에서의 교집합과 같은 의미

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
and a.addr like '%용인%';

select
a.emp_no, a.emp_nm, a.addr, b.certi_cd, c.certi_nm
from tb_emp a, tb_emp_certi b, tb_certi c
where a.emp_no = b.emp_no
and b.certi_cd = c.certi_cd
and c.certi_nm = 'SQLD'
and a.addr like '%용인%';

-- ## MINUS (EXCEPT)
-- 1. 수학에서의 차집합과 같은 의미
-- 2. 두 번째 쿼리에는 없고 첫 번째 쿼리에만 있는 데이터를 보여줌

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

-- # 계층형 질의
-- 1. 관계형이라는 의미는 데이터가 서로 평등하고 수평적인 관게를 의미하는 반면
--    계층형은 계급적이고 수직적인 관계를 의미
-- 2. 웹사이트에서 사용하는 답변형 게시판이나 카테고리 정보들이 계층형 구조에 해당

-- 계층형 전용 키워드
-- 1. START WITH top_level_condition
--  : 루트노드를 지정하는 조건, 이 조건을 만족하는 모든 행들은 루트노드가 됨
-- 2. CONNECT BY [PRIOR] connect_condition
--  : 이 조건에는 부모와 자식 노드들의 사이의 관계를 명시, 이 조건에 따라 부모와 자식 노드들의 사이를 연결
--    PRIOR는 부모 노드 컬럼을 식별하는데 사용

select level lvl, LPAD(' ', 4*(level-1)) || emp_no || '(' || emp_nm || ')' as "조직인원",
a.dept_cd, b.dept_nm, CONNECT_BY_ISLEAF
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
start with a.direct_manager_emp_no is null
connect by prior a.emp_no = a.direct_manager_emp_no;