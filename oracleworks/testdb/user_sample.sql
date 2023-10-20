-- user sample
DROP USER c##sample CASCADE;

-- user 및 비밀번호 생성
CREATE USER c##sample IDENTIFIED BY pw1234;

-- user 비밀번호 변경
ALTER USER c##sample IDENTIFIED BY pw1234;

-- 인증(접속) 권한 부여
GRANT CREATE SESSION TO c##sample;

-- 테이블 생성 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##sample;

-- 데이터 조작(삽입, 조회, 수정, 삭제) 권한 부여
GRANT CONNECT, DBA TO c##sample;