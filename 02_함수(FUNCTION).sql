/*
    * 함수 (FUNCTION) 
    : 전달된 컬럼 또는 값들을 읽어서 함수를 실행한 결과를 반환
    
    - 단일행 함수 : N개의 값을 읽어서 N개의 결과 값을 반환 (행 마다 함수를 실행한 결과를 반환)
    - 그룹 함수 : N개의 값을 읽어서 1개의 결과 값을 리턴 (그룹을 지어 그룹별로 함수를 실행한 결과를 반환)
    
    + SELECT절에 단일행 함수랑 그룹함수를 함께 사용할수 없다.
        => 결과 행의 개수가 다르기 때문에
    + 함수식을 사용할수 있는 위치 : SELECT절, WHERE절, ORDER BY절, GROUP BY절, HAVING절
*/
--=============================단일행 함수=====================================================
/*
    * 문자타입의 데이터 처리 함수
        => VARCHAR2(n), CHAR(n)
        
    * LENGTH(컬럼명 | '문자열') : 해당 문자열의 글자수를 반환
      LENGTHB(컬럼명 | '문자열') : 해당 물자열의 Byte수를 반환
      
      => 영문자, 숫자, 특수문자 글자당 1Byte
         한글은 글자당 3Byte
*/
-- '오라클' 단어의 글자수와 바이트 수를 확인
SELECT LENGTH('오라클') 글자수, LENGTHB('오라클') 바이트수 FROM DUAL;

-- 'ORACLE' 단어의 글자수와 바이트수
SELECT LENGTH('ORACLE') 글자수, LENGTHB('ORACLE') 바이트수 FROM DUAL;

-- EMPLOYEE 테이블에서 사원명, 사원명(글자수), 사원명(바이트수), 이메일, 이메일(글자수), 이메일(바이트수)
SELECT EMP_NAME, LENGTH(EMP_NAME) "사원명(글자수)", LENGTHB(EMP_NAME) "사원명(바이트수)",
EMAIL, LENGTH(EMAIL) "이메일(글자수)", LENGTHB(EMAIL) "이메일(바이트수)" FROM EMPLOYEE;