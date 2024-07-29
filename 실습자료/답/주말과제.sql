-- �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" ���� ǥ���ϵ��� �Ѵ�.
select DEPARTMENT_NAME "�а� ��", CATEGORY "�迭" FROM TB_DEPARTMENT;
-- �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
select DEPARTMENT_NAME ||'�� ������ '|| CAPACITY ||'�� �Դϴ�.' AS "�а��� ����" FROM TB_DEPARTMENT;
-- "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�. �����ΰ�? 
-- (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)
select STUDENT_NAME from TB_STUDENT WHERE DEPARTMENT_NO = 
(select DEPARTMENT_NO from TB_DEPARTMENT where department_name = '������а�') 
AND ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN,INSTR(STUDENT_SSN, '-') + 1, 1) = 2;
--  ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. �� ����ڵ����й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
-- (A513079, A513090, A513091, A513110, A513119)
SELECT STUDENT_NAME FROM TB_STUDENT WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
-- ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME, CATEGORY FROM TB_DEPARTMENT WHERE CAPACITY >= 20 AND CAPACITY <= 30;
-- �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT professor_name FROM tb_professor WHERE department_no is null;
-- Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�. ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
select * from TB_STUDENT where department_no is null;
-- ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
select distinct class_no from tb_class where PREATTENDING_CLASS_NO is not null;
-- �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
select distinct CATEGORY from tb_department;
-- 02 �й� ���� �����ڵ��� ������ ������� �Ѵ�. ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
select STUDENT_NO, STUDENT_NAME, STUDENT_SSN from TB_STUDENT 
where ABSENCE_YN = 'N' 
AND SUBSTR(STUDENT_ADDRESS,0,2) = '����'
AND SUBSTR(STUDENT_NO,0,2) = 'A2';
--������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
--������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
--ǥ�õǵ��� �Ѵ�.)
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", ENTRANCE_DATE "���г⵵" FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002' ORDER BY STUDENT_NO, STUDENT_NAME, ENTRANCE_DATE DESC;
-- �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. �� ������
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL 
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor WHERE PROFESSOR_NAME NOT LIKE '___';
--  �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
-- �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
-- 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
-- ����Ѵ�.)
SELECT PROFESSOR_NAME,
CASE 
WHEN SYSDATE > TO_DATE(EXTRACT(YEAR FROM SYSDATE)||SUBSTR(PROFESSOR_SSN, 3, 4),'YYYYMMDD') 
THEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(PROFESSOR_SSN, 1, 6),'YYYYMMDD'))
ELSE (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(PROFESSOR_SSN, 1, 6),'YYYYMMDD'))) - 1
END ���� FROM tb_professor ORDER BY ����;
--�������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
--"�̸�" �� �������� �Ѵ�. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME, 2, 3) �̸� FROM tb_professor WHERE PROFESSOR_NAME LIKE '___';
-- �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�? �̶�, 
-- 19 �쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE (EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(STUDENT_SSN,1,6), 'YYYYMMDD'))) != 19;
-- 2020 �� ũ���������� ���� �����ΰ�?
SELECT  TO_CHAR(TO_DATE('2020/12/25', 'YYYY-MM-DD'), 'DY')||'����' "ũ��������"  FROM DUAL;
-- TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
-- �� �� ���� �ǹ��ұ�? �� TO_DATE('99/10/11','RR/MM/DD'), 
-- TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
SELECT TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD'), TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD')
FROM DUAL;
/*
������ �������ڸ�, 'YY'�� 2000��븦 ��Ÿ���� 'RR'�� 1900��븦 �����Ѵٰ� ���ø� �� �� �����ϴ�.
'RR'�� 50���� �������� 50 �̻��̸� 1900���, 50 �̸��̸� 2000��븦 ��Ÿ���ϴ�.
*/
--�� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
--���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE STUDENT_NO NOT LIKE 'A%';
--�й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
--�̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
--�ڸ������� ǥ���Ѵ�.
SELECT ROUND(AVG(POINT),1) FROM TB_GRADE WHERE STUDENT_NO = 'A517178';
--�а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
--��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO �а���ȣ, COUNT(*) "�л���(��)" FROM TB_STUDENT GROUP BY DEPARTMENT_NO;
-- ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ����
-- �ۼ��Ͻÿ�.
SELECT COUNT(*) FROM TB_STUDENT WHERE COACH_PROFESSOR_NO IS NULL;
--�й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
--�̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
--�Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT EXTRACT(YEAR FROM TO_DATE(TERM_NO, 'YYYYMM')) �⵵, ROUND(AVG(POINT),1) "�⵵ �� ����" FROM TB_GRADE WHERE STUDENT_NO = 'A112113' GROUP BY EXTRACT(YEAR FROM TO_DATE(TERM_NO, 'YYYYMM'));
--�а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������
--�ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO �а��ڵ��, COUNT(DECODE(ABSENCE_YN, 'Y', 1)) "���л� ��" FROM TB_STUDENT GROUP BY (DEPARTMENT_NO);
-- �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL 
-- ������ ����ϸ� �����ϰڴ°�?
SELECT �����̸�, "������ ��" FROM (
SELECT STUDENT_NAME �����̸�, COUNT(*) "������ ��" FROM TB_STUDENT GROUP BY STUDENT_NAME) WHERE "������ ��" > 1;
--�й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
--������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ�
--ǥ���Ѵ�.)
SELECT �⵵, �б�, ROUND(AVG(����), 1) ���� FROM (
SELECT 
EXTRACT(YEAR FROM TO_DATE(TERM_NO, 'YYYYMM')) �⵵,
EXTRACT(MONTH FROM TO_DATE(SUBSTR(TERM_NO, 5,2), 'MM')) �б�, 
POINT ����
FROM TB_GRADE WHERE STUDENT_NO = 'A112113') GROUP BY ROLLUP(�⵵,�б�) ORDER BY 1;
-- �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
-- ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME "�л� �̸�", STUDENT_ADDRESS "�ּ���" FROM TB_STUDENT ORDER BY 1;
-- �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�
SELECT STUDENT_NAME, STUDENT_SSN FROM TB_STUDENT WHERE ABSENCE_YN = 'Y' ORDER BY STUDENT_SSN DESC;
-- �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�, 
-- �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
-- "������ �ּ�" �� ��µǵ��� �Ѵ�.
SELECT STUDENT_NAME �л��̸�, STUDENT_NO �й�, STUDENT_ADDRESS "������ �ּ�" FROM TB_STUDENT WHERE (STUDENT_ADDRESS LIKE '���%' OR STUDENT_ADDRESS LIKE '����%') AND STUDENT_NO NOT LIKE 'A%'
ORDER BY 1;
--���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
--�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
--������ ����
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM TB_PROFESSOR WHERE DEPARTMENT_NO = '005' ORDER BY 2;
--2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�. ������
--���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
--�ۼ��غ��ÿ�.
SELECT STUDENT_NO, TO_CHAR(POINT, 'FM9999.00') "POINT" FROM TB_GRADE WHERE CLASS_NO = 'C3118100' AND TERM_NO = 200402 ORDER BY POINT DESC;
--�л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL 
--���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME FROM TB_STUDENT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO) ORDER BY 2 ASC;
-- �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME FROM TB_CLASS JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
--���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL ����
--�ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME FROM TB_CLASS
JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO);
-- 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�. �̿�
-- �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
WHERE CATEGORY = '�ι���ȸ';
-- �������а��� �л����� ������ ���Ϸ��� �Ѵ�. �����а� �л����� "�й�", "�л� �̸�", 
--"��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
--�ݿø��Ͽ� ǥ���Ѵ�.)
SELECT STUDENT_NO,STUDENT_NAME, ROUND(AVG(POINT),1) FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE DEPARTMENT_NAME = '�����а�' GROUP BY STUDENT_NO,STUDENT_NAME;
--�й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
--���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
--�ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
--��µǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';
--2007 �⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ�
--SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, TERM_NO "TERM_NAME" 
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_CLASS USING (CLASS_NO)
WHERE CLASS_NAME = '�ΰ������'
    AND SUBSTR(TERM_NO,1,4) = '2007';
--��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
--�̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME FROM TB_CLASS JOIN TB_DEPARTMENT USING (DEPARTMENT_NO) WHERE CATEGORY = '��ü��'
AND CLASS_NO IN (SELECT CLASS_NO FROM TB_CLASS_PROFESSOR
RIGHT JOIN TB_CLASS USING (CLASS_NO) WHERE PROFESSOR_NO IS NULL);
-- �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�. �л��̸���
-- �������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������?����
-- ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�л��̸�?, ?��������?��
-- ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.
SELECT STUDENT_NAME �л��̸�, NVL(COACH_PROFESSOR_NO,'�������� ������') �������� FROM TB_STUDENT WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = '���ݾƾ��а�') ORDER BY STUDENT_NO;
--���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�
--�̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME, AVG(POINT) FROM TB_STUDENT 
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE ABSENCE_YN = 'N' GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0;
--ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NO,CLASS_NAME,AVG(POINT) FROM TB_GRADE
JOIN TB_CLASS USING (CLASS_NO)
WHERE CLASS_NO IN (
SELECT CLASS_NO FROM TB_CLASS WHERE DEPARTMENT_NO = (
SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = 'ȯ�������а�') AND CLASS_TYPE = '��������') GROUP BY CLASS_NO,CLASS_NAME;
--�� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ�
--SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_STUDENT WHERE STUDENT_NAME = '�ְ���');
--������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL ����
--�ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE STUDENT_NO = (
SELECT STUDENT_NO FROM TB_GRADE WHERE CLASS_NO IN (
SELECT CLASS_NO FROM TB_CLASS WHERE DEPARTMENT_NO = (
SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = '������а�')) GROUP BY STUDENT_NO HAVING AVG(POINT) = 
(SELECT MAX(AVG(POINT)) FROM TB_GRADE WHERE CLASS_NO IN (
SELECT CLASS_NO FROM TB_CLASS WHERE DEPARTMENT_NO = (
SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = '������а�')) GROUP BY STUDENT_NO));
--�� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������
--�ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�. ��, �������� "�迭 �а���", 
--"��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ���
--�Ѵ�.
SELECT DEPARTMENT_NAME "�迭 �а���", ROUND(AVG(POINT),1) �������� FROM TB_GRADE
JOIN TB_CLASS USING(CLASS_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO IN (
SELECT DEPARTMENT_NO FROM TB_DEPARTMENT
WHERE CATEGORY = (SELECT CATEGORY FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = 'ȯ�������а�')) AND (CLASS_TYPE = '��������' OR CLASS_TYPE = '�����ʼ�') GROUP BY DEPARTMENT_NO,DEPARTMENT_NAME;
--�迭 ������ ������ ī�װ� ���̺��� ������� �Ѵ�. ������ ���� ���̺���
--�ۼ��Ͻÿ�.
CREATE TABLE TB_CATEGORY (
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT('Y')
);
--���� ������ ������ ���̺��� ������� ����. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CLASS_TYPE (
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);
--TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
--(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� �Ѵٸ� �̸��� ������
--�˾Ƽ� ������ �̸��� ����Ѵ�.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);
--TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;
--�� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷�����
--NAME �� ���� ���������� ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(20);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);
--�� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_ �� ������ ���̺� �̸��� �տ�
--���� ���·� �����Ѵ�.
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
--TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ����
--�����Ͻÿ�. Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C008385 TO PK_CLASS_TYPE_NO;
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C008386 TO PK_CATEGORY_NAME;
--������ ���� INSERT ���� �����Ѵ�.
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;
--TB_DEPARTMENT�� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ�
--������ �����ϵ��� FOREIGN KEY �� �����Ͻÿ�. �� �� KEY �̸���
--FK_���̺��̸�_�÷��̸����� �����Ѵ�. (ex. FK_DEPARTMENT_CATEGORY )
ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY(CATEGORY) REFERENCES TB_CATEGORY(CATEGORY_NAME);
--�� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� �Ѵ�. 
--�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.
CREATE VIEW VW_�л��Ϲ����� AS (
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT);
--�� ������б��� 1 �⿡ �� ���� �а����� �л��� ���������� ���� ����� �����Ѵ�. 
--�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW �� ����ÿ�.
--�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ� SELECT 
--���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)
CREATE VIEW VW_������� AS (
SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO));
--��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����.
CREATE VIEW VW_�а����л��� AS (
SELECT DEPARTMENT_NAME, COUNT(*) "STUDENT_COUNT" FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO) GROUP BY DEPARTMENT_NO,DEPARTMENT_NAME);
--������ ������ �л��Ϲ����� View �� ���ؼ� �й��� A213046 �� �л��� �̸��� ����
--�̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
UPDATE VW_�л��Ϲ����� SET STUDENT_NAME = '���翵' WHERE STUDENT_NO = 'A213046';
--13 �������� ���� VIEW �� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW ��
--��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.
/*
WITH READ ONLY �ɼ��� ����Ͽ� VIEW�� �����Ѵ�.
�ۼ������ �Ʒ��� ����.
CREATE [OR REPLACE] [FORCE|(NOFORCE)] VIEW ���
    AS ��������
    [WITH CHECK OPTION]
    [WITH READ ONLY];
*/
--�� ������б��� �ų� ������û �Ⱓ�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ����
--������ �ǰ� �ִ�. �ֱ� 3 ���� �������� �����ο��� ���� ���Ҵ� 3 ������ ã�� ������
--�ۼ��غ��ÿ�.
SELECT *  FROM (
SELECT CLASS_NO �����ȣ, CLASS_NAME �����̸�, COUNT(*) "������������(��)" FROM TB_GRADE
JOIN TB_CLASS USING (CLASS_NO)
WHERE EXTRACT(YEAR FROM TO_DATE(TERM_NO, 'YYYYMM')) >= (2009 - 3) GROUP BY CLASS_NO, CLASS_NAME ORDER BY COUNT(*) DESC) WHERE ROWNUM <= 3;

-- �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�.
INSERT INTO TB_CLASS_TYPE VALUES (01, '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES (02, '��������');
INSERT INTO TB_CLASS_TYPE VALUES (03, '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES (04, '���缱��');
INSERT INTO TB_CLASS_TYPE VALUES (05, '������');
-- �� ������б� �л����� ������ ���ԵǾ� �ִ� �л��Ϲ����� ���̺��� ������� ����. 
--�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�)
CREATE TABLE TB_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
    FROM TB_STUDENT
    WHERE 1 = 0;
--������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� �Ѵ�. 
--�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ�
--�ۼ��Ͻÿ�)
CREATE TABLE TB_������а� 
AS SELECT STUDENT_NO �й�, STUDENT_NAME �л��̸�, '19'||SUBSTR(STUDENT_SSN,1,2) ����⵵, PROFESSOR_NAME �����̸�
    FROM TB_STUDENT S
        JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
    WHERE S.DEPARTMENT_NO = '001';
--�� �а����� ������ 10% ������Ű�� �Ǿ���. �̿� ����� SQL ���� �ۼ��Ͻÿ�. (��, 
--�ݿø��� ����Ͽ� �Ҽ��� �ڸ����� ������ �ʵ��� �Ѵ�)
UPDATE TB_DEPARTMENT
    SET CAPACITY = ROUND(CAPACITY * 1.1);
--�й� A413042 �� �ڰǿ� �л��� �ּҰ� "����� ���α� ���ε� 181-21 "�� ����Ǿ��ٰ�
--�Ѵ�. �ּ����� �����ϱ� ���� ����� SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_STUDENT
    SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
    WHERE STUDENT_NO = 'A413042';
--�ֹε�Ϲ�ȣ ��ȣ���� ���� �л����� ���̺��� �ֹι�ȣ ���ڸ��� �������� �ʱ��
--�����Ͽ���. �� ������ �ݿ��� ������ SQL ������ �ۼ��Ͻÿ�.
UPDATE TB_STUDENT
    SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);
--���а� ����� �л��� 2005 �� 1 �б⿡ �ڽ��� ������ '�Ǻλ�����' ������
--�߸��Ǿ��ٴ� ���� �߰��ϰ�� ������ ��û�Ͽ���. ��� ������ Ȯ�� ���� ��� �ش�
--������ ������ 3.5 �� ����Ű�� �����Ǿ���. ������ SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_GRADE
    SET POINT = 3.5
    WHERE STUDENT_NO = 'A331101'
        AND TERM_NO = '200501'
        AND CLASS_NO = 'C3843900';
--���� ���̺�(TB_GRADE) ���� ���л����� �����׸��� �����Ͻÿ�
DELETE 
FROM (SELECT POINT
        FROM TB_GRADE
         JOIN TB_STUDENT USING(STUDENT_NO)
         WHERE ABSENCE_YN  = 'Y');