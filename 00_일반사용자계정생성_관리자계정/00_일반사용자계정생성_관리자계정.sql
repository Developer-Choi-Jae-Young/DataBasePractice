-- 한줄 수적

/*
여러줄 주석
*/

select * from dba_users; --현재 모든 계정들에 대하여 조회하는 명령어.

--명령어 실행 단축키는 ctrl + enter 혹은 orcale sql developer 프로그램에 워크시트에서 "▶" 아이콘 버튼 클릭
--일반 사용자 계정 생성 구문 (관리자 계정으로만 생성이 가능)
--[표현법 - (조작어 DDL)] create user "계정명@%" IDENTIFIED BY 비밀번호; (외부접속)
--[표현법 - (조작어 DDL)] create user "계정명@localhost" IDENTIFIED BY 비밀번호; (내부접속)

create User "C##KH" IDENTIFIED BY KH;

--생성한 사용자 계정에 최소한의 권한을 추가 (데이터 관리, 접속 관리 등등)
-- [표현법] GRANT 권한1, 권한2 .... to 계정명;
-- 권한 옵션 : CONNECT (접속관련) , RESOURCE (데이터 관련)
GRANT CONNECT, RESOURCE TO "C##KH";

-- 테이블 스페이스 관련 설정
ALTER USER "C##KH" DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
