-- user 계정 : test, 비밀번호 pwtest
CREATE USER c##test IDENTIFIED BY pwtest;
-- CREATE SESSION 권한을 가지고 있지 않습니다.

-- SESSION 권한(로그인-인증) 부여
GRANT CREATE SESSION TO c##test;

-- DB의 테이블 생성 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##test;

-- 데이터 조작할 모든 권한 부여 - DML(삽입, 조회, 수정, 삭제)
GRANT CONNECT, DBA TO c##test;


