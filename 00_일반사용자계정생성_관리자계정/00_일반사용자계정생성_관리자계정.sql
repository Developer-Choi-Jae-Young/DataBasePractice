-- ���� ����

/*
������ �ּ�
*/

select * from dba_users; --���� ��� �����鿡 ���Ͽ� ��ȸ�ϴ� ��ɾ�.

--��ɾ� ���� ����Ű�� ctrl + enter Ȥ�� orcale sql developer ���α׷��� ��ũ��Ʈ���� "��" ������ ��ư Ŭ��
--�Ϲ� ����� ���� ���� ���� (������ �������θ� ������ ����)
--[ǥ���� - (���۾� DDL)] create user "������@%" IDENTIFIED BY ��й�ȣ; (�ܺ�����)
--[ǥ���� - (���۾� DDL)] create user "������@localhost" IDENTIFIED BY ��й�ȣ; (��������)

create User "C##KH" IDENTIFIED BY KH;

--������ ����� ������ �ּ����� ������ �߰� (������ ����, ���� ���� ���)
-- [ǥ����] GRANT ����1, ����2 .... to ������;
-- ���� �ɼ� : CONNECT (���Ӱ���) , RESOURCE (������ ����)
GRANT CONNECT, RESOURCE TO "C##KH";

-- ���̺� �����̽� ���� ����
ALTER USER "C##KH" DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
