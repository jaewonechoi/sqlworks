-- 게시판 테이블 생성
CREATE TABLE boards(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,      -- CLOB(Character Large Of Byte) / 4GB
    bwriter     VARCHAR2(50) NOT NULL,  --VARCHAR2 4000byte
    bdate       DATE DEFAULT SYSDATE,
    bfilename   VARCHAR2(50),
    bfiledata   BLOB                -- BLOB(Binary Large Of Byte) / 4GB
);

-- 시퀀스 생성(NOCACHE - 저장하지 않음, 초기화되면 1부터 시작함)
CREATE SEQUENCE seq_bno NOCACHE;

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '삼성 갤럭시 s21입니다', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '삼성 갤럭시 s21입니다', 'today', 
            SYSDATE, null, null);

-- 전체 검색
SELECT * FROM boards ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'cloud'
ORDER BY bno DESC;

-- 글번호 5번의 제목을 '아이폰 15'로 변경
UPDATE boards 
SET btitle = '아이폰 15',
    bcontent = '아이폰 15 제품입니다'
WHERE bno = 5;

-- 글번호 5번의 자료 삭제
DELETE FROM boards
WHERE bno = 5;

ROllBACK;

COMMIT;