/*
������ ��ȸ : SELECT
SELECT ��ȸ�ϰ��� �ϴ� ���� FROM ���̺�;
SELECT * �Ǵ� �÷���1, �÷���2, �÷���3.... from ���̺�;
*/

--��� ��� ��ȸ
select * from EMPLOYEE;

--��� ����� �̸�, �ֹι�ȣ, �ڵ��� ��ȣ
select EMP_NAME, EMP_NO, PHONE from EMPLOYEE;

--JOB ���̺��� ���� �̸��� ��ȸ
SELECT job_name FROM JOB;

--DEPARTMENT ���̺��� ��� ������ ��ȸ
SELECT * FROM DEPARTMENT;

-- ���� ���̺� �����, �̸���, ����ó, �Ի���, �޿� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

-- �÷����� ��� �����ϱ�
-- SELECT���� �÷��� �ۼ��ο� ��������� �Ҽ� �ִ�.
-- ����̸�, ���� ���� ��ȸ
SELECT EMP_NAME, SALARY*12 FROM EMPLOYEE;

-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ���� ���� ��ȸ
SELECT EMP_NAME, SALARY, BONUS, SALARY*12, (SALARY + (SALARY * BONUS)) * 12 FROM EMPLOYEE;

/*
        -���� ��¥�ð� ���� : SYSDATE
        -���� ���̺�(�ӽ����̺�) : DUAL
*/
-- ���� �ð� ���� ��ȸ
SELECT SYSDATE FROM DUAL;

-- ����̸�, �Ի���, �ٹ��ϼ� ��ȸ
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE FROM EMPLOYEE;

-- �÷��� ��Ī ���� : ������� ����� ��� �ǹ��ľ��� ��Ʊ⶧����, ��Ī�� �ο��Ͽ� ��Ȯ�ϰ� ����ϰ� ��ȸ����!
-- 1) �÷��� ��Ī
-- 2) �÷��� AS ��Ī
-- 3) �÷��� "��Ī"
-- 4) �÷��� AS "��Ī"
-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ���� ���� ��ȸ ��Ī���
SELECT EMP_NAME, SALARY, BONUS, SALARY*12 ����, (SALARY + (SALARY * BONUS)) * 12 AS "���ʽ� ���Կ���" FROM EMPLOYEE;

/*
    * ���ͷ� : ���Ƿ� ������ ���ڿ�('')
    -> SELECT ���� ����ϴ� ��� ��ȸ�� ���(Result set)�� �ݺ������� ǥ�õ�
*/
-- �̸�, �޿�, '��' ���
SELECT EMP_NAME �̸�, SALARY �޿�, '��' ���� FROM EMPLOYEE;

/*
    ���� ������ : ||
*/
SELECT SALARY || '��' �޿� FROM EMPLOYEE;

-- ���, �̸�, �޿��� �� �÷��� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY FROM EMPLOYEE;

-- xxx�� �޿��� xxx���Դϴ�
SELECT EMP_NAME || '�� �޿���' || SALARY || '���Դϴ�.' �޿����� FROM EMPLOYEE;

-- ��� ���̺��� ���� �ڵ� ��ȸ
SELECT JOB_CODE FROM EMPLOYEE;

/*
    �ߺ����� : DISTINCT
    �÷��� �տ� �ۼ�
*/
-- ��� ���̺��� ���� �ڵ� �ߺ� �����Ͽ� ��ȸ
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;
-- ��� ���̺��� �μ� �ڵ� �ߺ� �����Ͽ� ��ȸ
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-- ��� ���̺��� �μ� �ڵ� �� ���� �ڵ� �ߺ� �����Ͽ� ��ȸ
SELECT DISTINCT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
--==============================================================================================================
/*
    Where�� : ��ȸ �ϰ����ϴ� �����͸� Ư�� ���ǿ� ���� �����͸� ��ȸ�ϰ��� �Ҷ� ���
    [ǥ����] : SELECT �÷���, �÷�|������ ���ؿ���� FROM ���̺� WHERE �÷��� �� ������
    - �񱳿�����
        * ��Һ� : >, <, >=, <=
        * ����� : 
            - ������ : =
            - �ٸ��� : !=, <>, ^=
*/
-- ��� ���̺��� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- ��� ���̺��� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- �μ��ڵ尡 D1�� �ƴ� ������� ���� ��ȸ (�����, �޿�, �μ� �ڵ�)
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE != 'D1';

-- �޿��� 400���� �̻��� ����� �����, �μ��ڵ�, �޿� ������ ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 4000000;
--=======================================================================
-------------------------�ǽ�--------------------------------------------
-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ���� ��ȸ(��Ī ����)
SELECT EMP_NAME �����, SALARY �޿�, HIRE_DATE �Ի���, SALARY*12 ���� FROM EMPLOYEE WHERE SALARY >= 3000000;
-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ (��Ī ����)
SELECT EMP_NAME �����, SALARY �޿�, SALARY*12 ����, DEPT_CODE FROM EMPLOYEE WHERE SALARY*12 >= 50000000;
-- 3. �����ڵ尡 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ( ��Ī ���� )
SELECT EMP_NO ���, EMP_NAME �����, JOB_CODE �����ڵ�, ENT_YN ��翩�� FROM EMPLOYEE WHERE JOB_CODE != 'J3';
-- 4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ (��Ī ����)
-- AND, OR�� ������ ������ �� ����
SELECT EMP_NAME �����, EMP_NO ���, SALARY �޿� FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
SELECT EMP_NAME �����, EMP_NO ���, SALARY �޿� FROM EMPLOYEE WHERE SALARY >= 3500000 OR SALARY <= 6000000;

-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT * FROM JOB;

-- 2. JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME "���� �̸�" FROM JOB;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT * FROM DEPARTMENT;

-- 4. EMPLOYEE���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME ������, EMAIL �̸���, PHONE ��ȭ��ȣ, HIRE_DATE ����� FROM EMPLOYEE;

-- 5. EMPLOYEE���̺��� �����, ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE �����, EMP_NAME "��� �̸�", SALARY ���� FROM EMPLOYEE;

-- 6. EMPLOYEE���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME �̸�, SALARY*12 ����, DECODE(BONUS, NULL, SALARY*12, (SALARY + (SALARY * BONUS)) * 12) �Ѽ��ɾ�, 
(DECODE(BONUS, NULL, SALARY, (SALARY + (SALARY * BONUS)) * 12) - ((SALARY*12)*0.03)) �Ǽ��ɾ� FROM EMPLOYEE;

-- 7. EMPLOYEE���̺��� �Ǽ��ɾ�(6�� ����)�� 5õ���� �̻��� ����� �̸�, ����, �Ǽ��ɾ�, ����� ��ȸ
SELECT EMP_NAME �̸�, SALARY ����, (DECODE(BONUS, NULL, SALARY, (SALARY + (SALARY * BONUS)) * 12) - ((SALARY*12)*0.03)) �Ǽ��ɾ�, HIRE_DATE �����
FROM EMPLOYEE WHERE (DECODE(BONUS, NULL, SALARY, (SALARY + (SALARY * BONUS)) * 12) - ((SALARY*12)*0.03)) >= 50000000;

-- 8. EMPLOYEE���̺� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

-- 9. EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE FROM EMPLOYEE WHERE HIRE_DATE < '2002-01-01' AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5');

-- ����Ŭ������ IF���� DECODE(�÷�, ���ǽ�, ���̸�, �����̸�)
-- DECODE(A, B, X, C, Y, Z) A = B�̸� X ���,A = C�̸� Y ���, A �� B �̰� A �� C�̸� Z ���
-- DECODE(A, B, X, Y)A = B �̸� X�� ���, A �� B �̸� Y�� ���
SELECT EMP_NAME, SALARY, BONUS, SALARY*12 ����, DECODE(BONUS, NULL, SALARY, (SALARY + (SALARY * BONUS)) * 12) AS "���ʽ� ���Կ���" FROM EMPLOYEE;
--==================================================================================================================================================================
/*
    *BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
    => ~�̻� ~������ ������ ���� ���ǿ� �����ϴ� ����
    
    [ǥ����]
        �񱳴���÷��� BETWEEN �ּڰ� AND �ִ밪
        => �ش� �÷��� ���� �ּڰ� �̻��̰� �ִ� ������ ���
*/
-- �޿��� 350���� �̻��̰� 600���� ������ ����� �����, ���, �޿��� ��ȸ
-- BETWEEN �� ���� ��
SELECT EMP_NAME, EMP_ID, SALARY FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
-- BETWEEN �� ���� ��
SELECT EMP_NAME, EMP_ID, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 3500000 AND 6000000;

/*
    * NOT : ����Ŭ������ ������ ������
*/
-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ(NOT ��� x)
SELECT EMP_NAME, EMP_ID, SALARY FROM EMPLOYEE WHERE SALARY < 3500000 OR SALARY > 6000000;
-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ(NOT ��� o)
-- NOT�� BETWEEN �տ� ���̰ų� �÷��� �տ� �ٿ��� ��밡��!
SELECT EMP_NAME, EMP_ID, SALARY FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
SELECT EMP_NAME, EMP_ID, SALARY FROM EMPLOYEE WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

/*
    * IN : �񱳴���÷����� ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��� ��ȸ�ϴ� ������
    
    [ǥ����]
        �񱳴���Î��� IN ('��1', '��2', '��3', .....)
*/
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ (IN ���x)
SELECT EMP_NAME, EMP_ID, SALARY FROM employee WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ (IN ���o)
SELECT EMP_NAME, EMP_ID, SALARY FROM employee WHERE DEPT_CODE IN ('D6', 'D8', 'D5');

-- EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE FROM EMPLOYEE WHERE HIRE_DATE < '2002-01-01' AND (DEPT_CODE IN ('D9', 'D5'));
--==================================================================================================================================================================
/*
    * LIKE : ���ϰ��� �ϴ� �÷��� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    => Ư�� ���� : '%', '_' �� ���ϵ�ī��� ���
        * '%' : 0���� �̻�
            ex) �񱳴���÷��� LINE '����%' => �񱳴���÷��� ���� ���ڷ� ���۵Ǵ� ���� ��ȸ
                �񱳴���÷��� LIKE '%����' => �񱳴���÷��� ���� ���ڷ� ������ ���� ��ȸ
                �񱳴���÷��� LIKE '%����%' => �񱳴���÷��� ���� ���ڰ� ���ԵǴ°��� ��ȸ
        * '_' : 1����
            ex) �񱳴���÷��� LIKE '_����' => �񱳴���÷��� ������ ���� �տ� ������ �ѱ��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LINKE '__����' => �񱳴���÷��� ������ ���� �տ� ������ �α��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LIKE '����_' => �񱳴���÷��� ������ ���� �ڿ� ������ �ѱ��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LIKE '����__' => �񱳴���÷��� ������ ���� �ڿ� ������ �α��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LIKE '_����_' => �񱳴���÷��� ������ ���� �յڿ� ������ �ѱ��ڰ� �� ��� ��ȸ
*/
-- ����� �߿� ������ ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, HIRE_DATE, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '��%';

-- ��� �̸��� �ϰ� ���Ե� ����� �����, �ֹι�ȣ, ����ó ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE FROM EMPLOYEE WHERE EMP_NAME LIKE '%��%';

-- ��� �̸��� ��� ���ڰ� ���� ����� �����, ����ó ��ȸ(�̸��� 3���ڸ� �ִٸ�...)
SELECT EMP_NAME, PHONE FROM EMPLOYEE WHERE EMP_NAME LIKE '_��_';

-- ����� �� ����ó�� 3��°�ڸ��� 1�� ����� ���, �����, ����ó, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL FROM EMPLOYEE WHERE PHONE LIKE '__1%';

-- ����� �߿� �̸��Ͽ� 4��° �ڸ���_�� ����� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '_____%';
--=> ���ϵ�ī��� ���Ǵ� ���ڿ� �÷��� ��� ���ڰ� �����ϱ� ������ ��� ���ϵ�ī��� �νĵ�!
-- ����, ������ �������(-> ������ ���ϵ�ī�� ����ϱ�! ESCAPE�� ����Ͽ� ����� ���)
SELECT EMP_ID, EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '___$_%' ESCAPE '$';
--==================================================================================================================================================================
/*
    * IS NULL / IS NOT NULL : �÷����� NULL�� ������� NULL���� ���Ҷ� ����ϴ� ������
*/
-- ���ʽ��� ���� �ʴ� ������� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NULL;

-- ���ʽ��� �޴� ���(BONUS�� ���� NULL�� �ƴ�!)���� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NOT NULL;
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE NOT BONUS IS NULL;

-- ����� ���� ���(MANAGER_ID�� ���� NULL)���� �����, ������, �μ��ڵ� ��ȸ
SELECT EMP_NAME, DEPT_CODE, MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NULL;

-- �μ� ��ġ�� �����ʾ�����, ���ʽ��� �ް��ִ� ����� �����, ���ʽ�, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
--==================================================================================================================================================================
/*
    * ������ �켱����
        (0) ()
        (1) ��������� : + - * /
        (2) ���Ῥ���� : ||
        (3) �񱳿����� : >, <, >=, <=, =, !=, ...
        (4) IS NULL / LIKE / IN
        (5) BETWEEN AND
        (6) NOT
        (7) AND
        (8) OR
*/
-- �����ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ����� ��� ������ ��ȸ
SELECT * FROM EMPLOYEE WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >= 2000000;
SELECT * FROM EMPLOYEE WHERE JOB_CODE IN ('J7', 'J2') AND SALARY >= 2000000;
--==================================================================================================================================================================
/*
    * ORDER BY : SELECT���� ���� ������ �ٿ� �ۼ�, ������� ���� �������� ����
    
    [ǥ����] 
        SELECT ��ȸ�� �÷� FROM ���̺� WHERE ���ǽ� ORDER BY [���ı����̵Ǵ��÷� | ��Ī | �÷�����] [ASC(��������) | DESC(��������)] [NULLS FIRST | NULLS LAST]
*/
-- ������� �����, ���� ��ȸ (������ �������� ����)
SELECT EMP_NAME, SALARY*12 ���� FROM EMPLOYEE ORDER BY ���� DESC;
SELECT EMP_NAME, SALARY*12 ���� FROM EMPLOYEE ORDER BY SALARY*12 DESC;
SELECT EMP_NAME, SALARY*12 ���� FROM EMPLOYEE ORDER BY 2 DESC;

-- ���ʽ� �������� �����غ���
SELECT * FROM EMPLOYEE ORDER BY BONUS; -- �⺻�� ASC & NULLS LAST
SELECT * FROM EMPLOYEE ORDER BY BONUS ASC; -- �⺻�� NULLS LAST
SELECT * FROM EMPLOYEE ORDER BY BONUS ASC NULLS LAST;
SELECT * FROM EMPLOYEE ORDER BY BONUS DESC; -- �⺻�� NULLS FIRST

-- ���ʽ��� �������� �޿��� ��������
SELECT * FROM EMPLOYEE ORDER BY BONUS DESC, SALARY ASC; -- ���ʽ� ���� �������� �����ϴµ�, ���� ���� ��� �޿��� ���� ������������ ����
--==================================================================================================================================================================
-- 1. EMPLOYEE ���̺� ������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
-- 2. EMPLOYEE ���̺��� �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%��';
-- 3. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ��ȸ
SELECT EMP_NAME, PHONE FROM EMPLOYEE WHERE NOT PHONE LIKE '010%';
-- 4. EMPLOYEE ���̺��� �����ּ� '_'�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰� 
--     ������� 90/01/01 ~ 00/12/01�̰�, �޿��� 270�� �̻��� ����� ��ü�� ��ȸ
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '____#_%' ESCAPE '#' AND DEPT_CODE IN('D9', 'D6') AND (HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND SALARY >= 2700000;