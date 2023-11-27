-- addrbook table 생성
CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username    VARCHAR2(20) NOT NULL,
    tel         VARCHAR2(20),
    email       VARCHAR2(30) UNIQUE,
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE;  -- 자동 순번

INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '최재원', '010-1234-5678', 'test@test.com', '남'); 

-- 이메일 중복 체크
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '김이레', '010-1234-5678', 'test@test.com', '여'); 

COMMIT;

SELECT * FROM addrbook
ORDER BY bnum DESC;

-- 이메일이 khit@kh.kr인 이메일 찾기
SELECT email FROM addrbook
WHERE email = 'woo@kh.kr';

-- 주소 삭제
DELETE FROM addrbook WHERE bnum = 8;

-- 주소 수정
UPDATE addrbook 
SET username = '금강', tel='010-6666-7777', gender='여'
WHERE bnum = 5;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;