/*
    날짜 : 2024/03/04
    이름 : 김선광   
    내용 : 2장 SQL 기본 실습
*/

-- 실습하기 1-1 테이블 생성
CREATE TABLE USER1 (
    ID      VARCHAR2(20),
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER
);

-- 실습하기 1-2 데이터 추가
INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO USER1 (id, name, age) VALUES ('A104', '강감찬', 45);
INSERT INTO USER1 (id, name, hp) VALUES ('A105', '이순신', '010-1234-5555');

-- 실습하기 1-3 데이터 조회
SELECT * FROM USER1;
SELECT * FROM USER1 WHERE id='A101';
SELECT * FROM USER1 WHERE name ='김춘추';
SELECT * FROM USER1 WHERE age > 30;
SELECT id, name, age FROM USER1;

-- 실습하기 1-4 데이터 수정
UPDATE USER1 SET hp='010-1234-4444' WHERE id='A104';
UPDATE USER1 SET age=51 WHERE id='A105';
UPDATE USER1 SET hp='010-1234-1001', age=27 WHERE id='A101';

-- 실습하기 1-5 데이터 삭제
DELETE FROM USER1 WHERE id='A101';
DELETE FROM USER1 WHERE id='a102' AND age=25;
DELETE FROM USER1 WHERE age >=30;


-- 실습하기 2-1 기본키 실습
CREATE TABLE USER2 (
    ID      VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER(2)
);

-- 실습하기 2-2 고유키 실습
CREATE TABLE USER3 (
    ID      VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR(20),
    HP      CHAR(13) UNIQUE,
    AGE     NUMBER(3)
);

-- 실습하기 2-3 외래키
CREATE TABLE PARENT (
    PID     VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE
);

CREATE TABLE CHILD(
    CID     VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE,
    PARENT  VARCHAR(20),
    FOREIGN KEY (PARENT) REFERENCES PARENT (PID)
);

INSERT INTO PARENT VALUES ('P101', '김서현', '010-1234-1001');
INSERT INTO PARENT VALUES ('P102', '이성계', '010-1234-1002');
INSERT INTO PARENT VALUES ('P103', '신사임당', '010-1234-1003');

INSERT INTO CHILD VALUES ('C101', '김유신', '010-1234-2001', 'P101');
INSERT INTO CHILD VALUES ('C102', '이방우', '010-1234-2002', 'P102');
INSERT INTO CHILD VALUES ('C103', '김방원', '010-1234-2003', 'P102');
INSERT INTO CHILD VALUES ('C104', '이이', '010-1234-2004', 'P103');

-- 실습하기 2-4 DEFAULT와 NULL
CREATE TABLE USER4(
    NAME        VARCHAR2(20) NOT NULL,
    GENDER      CHAR(1) NOT NULL,
    AGE         INT DEFAULT 1,
    ADDR        VARCHAR2(255)
);

INSERT INTO USER4 VALUES ('김유신', 'M', 23, '김해시');
INSERT INTO USER4 VALUES ('김춘추', 'M', 21, '경주시');
INSERT INTO USER4 (NAME, GENDER, ADDR) VALUES ('신사임당', 'F', '강릉시');
INSERT INTO USER4 (NAME, GENDER) VALUES ('이순신', 'M');
INSERT INTO USER4 (NAME, AGE) VALUES ('정약용', 33);

-- 실습하기 2-5 CHECK 제약조건
CREATE TABLE USER5(
    NAME    VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) NOT NULL, CHECK(GENDER IN('M', 'F')),
    AGE     INT DEFAULT 1 CHECK(AGE > 0 AND AGE < 100),
    ADDR    VARCHAR2(255)
);

INSERT INTO USER5 VALUES ('김유신', 'M', 23, '김해시');
INSERT INTO USER5 VALUES ('김춘추', 'M', 21, '경주시');
INSERT INTO USER5 (NAME, GENDER, ADDR) VALUES ('신사임당', 'F', '강릉시');
INSERT INTO USER5 (NAME, GENDER) VALUES ('이순신', 'M');
INSERT INTO USER5 (NAME, AGE) VALUES ('정약용', 33);


/*
    날짜 : 2024/03/06
    이름 : 김선광
    내용 : 3. 데이터베이스 개체 실습하기
*/

--실습 3-1 데이터 사전 조회(system 접속)
select * from DIC;

-- 테이블 조회(현재 사용자 기준)
SELECT TABLE_NAME FROM USER_TABLES;

-- 전체 테이블 조회(현재 사용자 기준)
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- 전체 테이블 조회(system 관리자만 가능)
SELECT * FROM DBA_TABLES;

-- 전체 사용자 조회(system 관리자만 가능)
SELECT * FROM DBA_USERS;

-- 실습하기 3-2 인덱스 조회/생성/삭제

-- 현재 사용자 인덱스 조회
SELECT * FROM USER_INDEXES;

-- 현재 사용자 인덱스 정보 조회
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 생성
CREATE INDEX IDX_USER1_UID ON USER1(id);
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 삭제
DROP INDEX IDX_USER1_UID;
SELECT * FROM USER_IND_COLUMNS;


-- 실습하기 3-4 뷰 생성/조회/삭제

-- 뷰 생성
CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM user1);
CREATE VIEW VW_USER2_AGE_UNDER30 AS (SELECT * FROM user2 WHERE AGE < 30);
SELECT * FROM USER_VIEWS;

-- 뷰 조회
SELECT * FROM vw_user1;
SELECT * FROM vw_user2_age_under30;

-- 뷰 삭제
DROP VIEW VW_USER1;
DROP VIEW vw_user2_age_under30;

-- 실습하기 3-5 시퀀스 적용 테이블 생성
CREATE TABLE USER6 (
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20),
    GENDER  CHAR(1),
    AGE     NUMBER,
    ADDR    VARCHAR2(225)
    );
    
-- 실습하기 3-6 시퀀스 생성
CREATE SEQUENCE SEQ_UESR6 INCREMENT BY 1 START WITH 1;

-- 실습하기 3-7 시퀀스값 생성
INSERT INTO user6 VALUES (SQL_USER6.NEXTVAL, '김유신', 'M', 25, '김해시');
INSERT INTO user6 VALUES (seq_USER6.NEXTVAL, '김춘추', 'M', 23, '경주시');
INSERT INTO user6 VALUES (SEQ_USER6.NEXTVAL, '신사임당', 'F', 25, '강릉시');

-- 실습하기 4-1 사용자 생성
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER user1 IDENTIFIED BY abcd1234;

-- 실습하기 4-2 사용자 조회(system 접속)
SELECT * FROM ALL_USERS;

-- 실습하기 4-3 사용자 변경(system 접속)
-- 사용자 비밀번호 변경
ALTER USER user1 IDENTIFIED BY 1234;

-- 사용자 삭제
DROP USER user1;

-- 사용자와 해당 사용자 객체(테이블 등) 모두 삭제
DROP USER user1 CASCADE;

-- 실습하기 4-4 Role 부여
-- 접속 및 생성 권한 부여
GRANT CONNECT, RESOURCE TO user1;

-- 테이블 스페이스(테이블 파일 생성 공간) 할당량 권한 부여
GRANT UNLIMITED TABLESPACE TO user1;