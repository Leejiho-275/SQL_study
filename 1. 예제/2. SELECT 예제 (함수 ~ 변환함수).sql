-- ���ڿ� ��
CREATE TABLE CHAR_COMPARE(
SN CHAR(10),
CHAR_COMPARE_4 CHAR(4),
CHAR_COMPARE_6 CHAR(6)
);

INSERT INTO CHAR_COMPARE VALUES('10001','SQLD','SQLD');
INSERT INTO CHAR_COMPARE VALUES('10002','SQLD','SQLA');

COMMIT;

SELECT * FROM CHAR_COMPARE;

SELECT
REPLACE(CHAR_COMPARE_4,' ','_') AS CHAR_COMPARE_4,
REPLACE(CHAR_COMPARE_6,' ','_') AS CHAR_COMPARE_6
FROM CHAR_COMPARE;

SELECT
REPLACE(CHAR_COMPARE_4,' ','_') AS CHAR_COMPARE_4,
REPLACE(CHAR_COMPARE_6,' ','_') AS CHAR_COMPARE_6
FROM CHAR_COMPARE
WHERE SN='10001'
AND CHAR_COMPARE_4=CHAR_COMPARE_6
;

SELECT
REPLACE(CHAR_COMPARE_4,' ','_') AS CHAR_COMPARE_4,
REPLACE(CHAR_COMPARE_6,' ','_') AS CHAR_COMPARE_6
FROM CHAR_COMPARE
WHERE SN='10002'
AND CHAR_COMPARE_4>CHAR_COMPARE_6
;

CREATE TABLE VARCHAR_COMPARE(
SN CHAR(10),
CHAR_COMPARE_4 CHAR(4),
VARCHAR_COMPARE_6 VARCHAR2(6)
);

INSERT INTO VARCHAR_COMPARE VALUES('10001','SQLD','SQLD  ');
INSERT INTO VARCHAR_COMPARE VALUES('10002','SQLD','SQLA  ');

COMMIT;

SELECT
REPLACE(CHAR_COMPARE_4,' ','+') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','+') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE;

SELECT
REPLACE(CHAR_COMPARE_4,' ','+') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','+') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE
WHERE SN='10001'
AND CHAR_COMPARE_4=VARCHAR_COMPARE_6
;

SELECT
REPLACE(CHAR_COMPARE_4,' ','+') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','+') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE
WHERE SN='10001'
AND CHAR_COMPARE_4<>VARCHAR_COMPARE_6
;

SELECT
REPLACE(CHAR_COMPARE_4,' ','_') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','_') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE
WHERE CHAR_COMPARE_4=TRIM(VARCHAR_COMPARE_6)
;

-- ������� ��
SELECT
REPLACE(CHAR_COMPARE_4,' ','+') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','+') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE
WHERE SN='10001'
AND CHAR_COMPARE_4='SQLD     '
;

SELECT
REPLACE(CHAR_COMPARE_4,' ','+') AS CHAR_COMPARE_4,
REPLACE(VARCHAR_COMPARE_6,' ','+') AS VARCHAR_COMPARE_6
FROM VARCHAR_COMPARE
WHERE SN='10001'
AND VARCHAR_COMPARE_6='SQLD'
;

-- # ������ �Լ�
-- ## ���ڿ� �Լ�

SELECT
LOWER('SQL Developoer') AS "LOWER('SQL Developoer')", -- �ҹ��� ��ȯ
UPPER('SQL Developoer') AS "UPPER('SQL Developoer')", -- �빮�� ��ȯ
ASCII('A') AS "ASCII('A')", -- ���ڸ� �ƽ�Ű�ڵ�� ��ȯ
CHR('65') AS "CHR('65')", -- �ƽ�Ű�ڵ带 ���ڷ� ��ȯ
CONCAT('SQL', 'Developoer') AS "CONCAT('SQL', 'Developoer')", -- ���ڿ��� ����
SUBSTR('SQL Developoer', 1, 3) AS "SUBSTR('SQL Developoer', 1, 3)", -- ��ġ���� ������ŭ �ڸ�
LENGTH('SQL') AS "LENGTH('SQL')", -- ���ڿ� ���� ��ȯ
LTRIM('SQL') AS "LTRIM('  SQL')", -- ���� ���� ����
RTRIM('SQL') AS "RTRIM('SQL  ')", -- ������ ���� ����
RPAD('Steve',10,'-') AS "RPAD('Steve',10,'-')", -- �����ʿ� �־��� ���ڸ� ä��
LPAD('Steve',10,'*') AS "LPAD('Steve',10,'*')", -- ���ʿ� �־��� ���ڸ� ä��
REPLACE('Java Programmer','Java','BigData') AS "REPLACE" -- ���ڸ� ��ü
FROM DUAL;

-- ## ������ �Լ�
SELECT
MOD(27,5) AS MOD, -- ������ �� ��ȯ
CEIL(38.678) as CEIL, -- �ø��� ��ȯ
FLOOR(38.678) AS floor, -- ������ ��ȯ
ROUND(38.678, 2) AS round,
TRUNC(38.678, 2) AS trunc
FROM dual;

-- ## ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE
FROM dual;

-- ���� ��¥�� �ð� ��ȸ
SELECT SYSTIMESTAMP
FROM dual;

-- ��¥ ����
-- ��¥ + ���� = ��¥ => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥ => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ� => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥ => ��¥�� �ð��� ����

SELECT
SYSDATE -1 AS "SYSDATE-1",
(SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
SYSTIMESTAMP - 1/24 AS "1�ð� ����",
SYSTIMESTAMP - 100/24/60 AS "100�� ����",
SYSTIMESTAMP - 30/24/60/60 AS "30�� ����"
FROM dual;

-- ## ��ȯ �Լ�

-- ��¥�� ���ڷ� ��ȯ (TO_CHAR �Լ�)
-- ��¥�� ���� ���� ���� : Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð��� ���� ���� ���� : HH12 - (1~12), HH24 - (0~24), MI - ��, ss - ��, AM PM - ���� ����
SELECT
TO_CHAR(SYSDATE,'MM - DD') as "��¥(��,��)",
TO_CHAR(SYSDATE,'YYYY/MM/DD') as "��¥(��,��,��)",
TO_CHAR(SYSDATE,'YYYY"��" MM"��" DD"��"') as "��¥ �ѱ�����",
TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') as "��¥�� �ð�",
TO_CHAR(SYSDATE,'YYYY/MM/DD PM HH12:MI:SS') as "��¥�� �ð�2"
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
-- ���� ���� ����
-- $ : �޷���ȣ, L : ����ȭ���ȣ, . : �Ҽ��� ǥ��, , : �޸� ǥ��
SELECT
TO_CHAR(9500,'$999,999') as "�޷�",
TO_CHAR(1350000,'999,999,999L') as "��ȭ"
FROM dual;

-- # ���� ��ȯ �Լ� TO_NUMBER
SELECT
TO_NUMBER('$5,500', '$999,999') -4000 as "�����"
FROM dual;