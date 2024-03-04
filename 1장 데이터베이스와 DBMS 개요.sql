/*
    날짜 : 2024/03/04
    이름 : 김선광
    내용 : 1장 데이터베이스와 DBMS 개요
*/

-- 실습하기 1-1 데이터베이스 사용자 생성
-- NUMBER(p, s) p는 최대 유효숫자 자릿수, s는 소수점 자릿수
-- NUMBER(6,2) 12345.6 -> 오류 왜? => 총 6자리 중, 실수 부분은 2자리(정수는 4자리) 12345.6은 정부부분이 5자리
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER kc5353 IDENTIFIED BY "1234";
GRANT CONNECT, RESOURCE TO kc5353;
GRANT UNLIMITED TABLESPACE TO kc5335;

-- 실습하기 1-2 NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER (
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3,1),
    num4 NUMBER(4,2),
    num5 NUMBER(5,6)
    );
    
    // num1 NUMBER
    insert into TYPE_TEST_NUMBER (num1) values(1);
    INSERT INTO TYPE_TEST_NUMBER (num1) values(123);
    INSERT INTO TYPE_TEST_NUMBER (num1) VALUES(123.74);
    INSERT INTO TYPE_TEST_NUMBER (num1) VALUES(123.12345);
    
    // num2 NUMBER(2)
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (12);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (123);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (1.2);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (1.23);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (12.34567);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (12.56789);
    INSERT INTO TYPE_TEST_NUMBER (num2) VALUES (123.56789);
    
    // num3 NUMBER(3,1)
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (12);
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (123);
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (12.1);
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (12.1234);
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (12.56789);
    INSERT INTO TYPE_TEST_NUMBER (num3) VALUES (123.56789);
    
    -- 실습하기 1-3. 문자형 자료형 이해
    -- VARCHAR2 자료형은 영문, 숫자는 1Byte 크기, 한글은 3Byte크기
    -- NVARCHAR2 자료형은 영문/숫자/한글(UTF-8) 1Byte크기
    
    -- CHAR(s) 고정 길이 문자열 데이터, 1byte ~ 4000byte
    -- VARCHAR2 가변길이 문자열 데이터, 1byte ~ 4000byte
    -- NVARCHAR2(s) 가변길이 국가별 문자열 데이터, 1byte ~ 4000byte
    
    CREATE TABLE TYPE_TEST_CHAR(
        char1 CHAR(1),
        char2 CHAR(2),
        char3 CHAR(3),
        vchar1 VARCHAR(1),
        vchar2 VARCHAR(2),
        vchar3 VARCHAR(3),
        nvchar1 NVARCHAR2(1),
        nvchar2 NVARCHAR2(2),
        nvchar3 NVARCHAR2(3)
);

// CHAR
INSERT INTO TYPE_TEST_CHAR (char1) values ('A');
INSERT INTO TYPE_TEST_CHAR (char1) VALUES ('가');
INSERT INTO type_test_char (char2) VALUES ('가');

//VARCHAR2
INSERT INTO TYPE_TEST_CHAR (vchar1) VALUES ('A');
INSERT INTO TYPE_TEST_CHAR (vchar2) VALUES ('AB');
INSERT INTO TYPE_TEST_CHAR (vchar3) VALUES ('가');
INSERT INTO TYPE_TEST_CHAR (vchar3) VALUES ('가나');

//NVARCHAR2
INSERT INTO TYPE_TEST_CHAR (nvchar1) VALUES ('A');
INSERT INTO TYPE_TEST_CHAR (nvchar2) VALUES ('AB');
INSERT INTO TYPE_TEST_CHAR (nvchar3) VALUES ('가나다');
    