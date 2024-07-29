/*
    * VIEW (��)
     : SELECT ���� ���� ����� ������� �����ص� �� �ִ� ��ü
      => ���� ����ϴ� �������� �����صθ� �Ź� �ٽ� �ش� �������� ����� �ʿ䰡 ����!
      �ӽ� ���̺�� ���� ���� (���� �����Ͱ� ����Ǵ°� �ƴ϶�, �������θ� ����Ǿ� ����!)
*/
--*���(EMPLOYEE), �μ�(DEPARTMENT), ����(LOCATION), ����(NATIONAL) *
--�ѱ����� �ٹ��ϴ� ��� ���� ��ȸ(���, �̸�, �μ���, �޿�, �ٹ�������)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE NATIONAL_NAME = '�ѱ�';

--���þƿ��� �ٹ��ϴ� ������� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE NATIONAL_NAME = '���þ�';

--�Ϻ����� �ٹ��ϴ� ������� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE NATIONAL_NAME = '�Ϻ�';
-------------------------------------------------------------------------------
/*
   VIEW �����ϱ�
   
   CREATE VIEW ���̸�
   AS ��������
*/
--(�������)
--  ���̺� : TB_XXX
--  �� : VW_XXX
CREATE VIEW VM_EMPLOYEE AS 
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE;
-- �並 �����Ҽ� �ִ� ���� �ο�
GRANT CREATE VIEW TO C##KH; --������ �������� ����

SELECT * FROM VM_EMPLOYEE;
-->�����δ� �Ʒ��� ���� ���� �ɰ��̴�.
SELECT * FROM(
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE NATIONAL_NAME = '�Ϻ�');

-- �ѱ����� �ٹ��ϴ� ��� ���� ��ȸ
SELECT * FROM VM_EMPLOYEE WHERE NATIONAL_NAME = '�ѱ�';

-- ���þƿ��� �ٹ��ϴ� ��� ���� ��ȸ
SELECT * FROM VM_EMPLOYEE WHERE NATIONAL_NAME = '���þ�';

-- (����) ���� �������� ������ �� ��� ��ȸ --> TEXT �÷��� ����� �������� ������ ����!
SELECT * FROM USER_VIEWS;

-- ������ �䰡 ������ �ش� �信 �Ʒ� ������ �����
CREATE OR REPLACE VIEW VM_EMPLOYEE AS 
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, BONUS FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN LOCATION L ON LOCATION_ID = LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE;
-------------------------------------------------------------------------------
-- * ���, �����, ���޸�, ����(��|��), �ٹ���� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO, INSTR(EMP_NO,'-') + 1,1), 1, '��', 2, '��') "����(��|��)", EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) �ٹ���� 
FROM EMPLOYEE JOIN JOB USING (JOB_CODE);

-- ������ ��ȸ�� ������ �信 ����(VW_EMP_JOB)
-- �Լ��� �Ǵ� ������� �ִ� ��� ��Ī�� �ο��ؾ��� VIEW�� �� ������ �� ����
CREATE VIEW VW_EMP_JOB AS 
SELECT EMP_ID ���, EMP_NAME �����, JOB_NAME ���޸�, DECODE(SUBSTR(EMP_NO, INSTR(EMP_NO,'-') + 1,1), 1, '��', 2, '��') "����(��|��)", EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) �ٹ���� 
FROM EMPLOYEE JOIN JOB USING (JOB_CODE);

-- ���� ����� ��ȸ
SELECT * FROM VW_EMP_JOB WHERE "����(��|��)" = '��';

-- 20�� �̻� �ٹ��� ����� ��ȸ
SELECT * FROM VW_EMP_JOB WHERE �ٹ���� >= 20;

-- �� ����!
DROP VIEW VW_EMP_JOB;
-------------------------------------------------------------------------------
/*
    ������ �並 ���ؼ� DML(INSERT/UPDATE/DELETE)�� ����غ���
    --> �並 ���ؼ� DML�� �ۼ��ϰ� �Ǹ�, ���� �����Ͱ� ����Ǿ� �ִ� ���̺� �ݿ���!
*/

--JOB���̺��� VIEW�� ����
CREATE OR REPLACE VIEW VM_JOB
AS SELECT JOB_CODE, JOB_NAME FROM JOB;

SELECT * FROM VM_JOB; --������ ���̺�
SELECT * FROM JOB;

--VM_JOB �並 ����Ͽ� �����͸� �߰�(DML-INSERT)
INSERT INTO VM_JOB VALUES ('J8', '����');

-- VM_JOB �並 ����Ͽ� �����͸� ���� (DML-UPDATE)
UPDATE VM_JOB SET JOB_NAME = '�˹�' WHERE JOB_CODE = 'J8';

-- VM_JOB �並 ����Ͽ� �����͸� ���� (DML-DELETE)
DELETE FROM VM_JOB WHERE JOB_CODE = 'J8';
-------------------------------------------------------------------------------
/*
    * DML ��ɾ�� ������ �Ұ����� ��찡 ����!
    
    1) �信 ���ǵ��� ���� �÷��� �����Ϸ��� �ϴ� ���
    2) �信 ���ǵǾ� ���� �ʰ� ���̽����̺��� NOT NULL ���������� �����Ǿ� �ִ� ���
    3) �������� �Ǵ� �Լ������� ���ǰ� �Ǿ� �ִ� ���
    4) DISTINCT������ ���ԵǾ� �ִ� ���
    5) JOIN�� �̿��Ͽ� ���� ���̺��� �����Ų ���
    
    => ��� ��κ� ��ȸ�� �뵵�� ����Ѵ�. �׷��⶧���� �ǵ����̸� DML�� ������� ����..!
*/
-------------------------------------------------------------------------------
/*
    * VIEW �ɼ� *
    
    CREATE [OR REPLACE] [FORCE|(NOFORCE)] VIEW ���
    AS ��������
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    
    - OR REPLACE : �⺻�� ������ �̸��� �䰡 ������� �������ְ� �������� ������� ���� ����
    - FORCE|(NOFORCE)
        + FORCE : ���������� �ۼ��� ���̺��� �������� �ʾƵ� �並 ����
        + NOFORCE : ���������� �ۼ��� ���̺��� �����ؾ����� �並 ���� (�⺻��)
    - WITH CHECK OPTION : DML(�߰�/����/����) ���� ���������� �ۼ��� ���ǿ� �´� �����θ� ����ǵ��� �ϴ� �ɼ�
    - WITH READ ONLY : �並 ��ȸ�� �����ϵ��� �ϴ� �ɼ�
*/

--* FORCE | NOFORCE
CREATE OR REPLACE VIEW VM_TEMP AS SELECT TCODE, TNAME, TCONTENT FROM TT; --> ���� TT��� ���̺��� �����Ƿ� �䵵 �����Ұ� (NOFORCE)
CREATE OR REPLACE FORCE VIEW VM_TEMP AS SELECT TCODE, TNAME, TCONTENT FROM TT; --> ������ �Բ� �䰡 ������! (FORCE)

SELECT * FROM VM_TEMP; --> �信 ������ �ִٰ���!!

CREATE TABLE TT (
    TCODE NUMBER,
    TNAME VARCHAR2(20),
    TCONTENT VARCHAR2(100)
);

--* WITH CHECK OPTION
CREATE OR REPLACE VIEW VM_EMP AS SELECT * FROM EMPLOYEE WHERE SALARY >= 3000000;

SELECT * FROM VM_EMP;

-- 204 ����� �޿��� 200�������� ����
UPDATE VM_EMP SET SALARY = 2000000 WHERE EMP_ID = 204;

ROLLBACK;

--> WITH CHECK OPTION�� �߰��Ͽ� �����
CREATE OR REPLACE VIEW VM_EMP AS SELECT * FROM EMPLOYEE WHERE SALARY >= 3000000 WITH CHECK OPTION;

SELECT * FROM VM_EMP;

UPDATE VM_EMP SET SALARY = 2000000 WHERE EMP_ID = 204; --> ���������� �ۼ��� ���ǿ� ���յ��� �ʱ� ������ ���� �Ұ� (=> �����߻�!)
UPDATE VM_EMP SET SALARY = 4000000 WHERE EMP_ID = 204; --> ���������� �ۼ��� ���ǿ� �����ϴ°�쿡�� ���� �����ϴ�
-------------------------------------------------------------------------------
-- WITH READ ONLY
CREATE OR REPLACE VIEW VM_EMP AS SELECT * FROM EMPLOYEE WHERE SALARY >= 3000000 WITH READ ONLY;

SELECT * FROM VM_EMP;

DELETE FROM VM_EMP WHERE EMP_ID = '200'; --> READ ONLY �ɼǿ� ���Ͽ� DML ���Ұ�!