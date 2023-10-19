-- ex4 테이블 생성
CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY, --기본키 제약조건
    passwd VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'u1234');
INSERT INTO ex4 VALUES ('sky2003', 'u54321'); --무결성 제약조건 위배(아이디 중복)
INSERT INTO ex4 VALUES ('today123', 'u2345', 25); 
INSERT INTO ex4(id, passwd, age) VALUES ('today321', 'u23456', 35); --칼럼수와 벨류개수는 맞춰야함
-- 자료형의 크기보다 큰 데이터 입력 불가
INSERT INTO ex4(id, passwd) VALUES ('today4321', 'u2345678910'); --비밀번호가 10자리가 넘음

COMMIT;

-- 나이(age) 칼럼 추가
ALTER TABLE ex4 ADD age NUMBER(3);

-- 자료형의 크기 변경(varchar2의 크기를 10 -> 12)
ALTER TABLE ex4 MODIFY passwd VARCHAR2(12);

SELECT * FROM ex4;