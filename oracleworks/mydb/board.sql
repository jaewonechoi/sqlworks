-- 자바 게시판 구현할 board 테이블 생성
CREATE TABLE board(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,      -- CLOB(Character Large Of Byte) / 4GB
    bwriter     VARCHAR2(50) NOT NULL,  --VARCHAR2 4000byte
    bdate       DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq NOCACHE;

INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다.', 'today10');
INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다.', 'admin0000');

-- 재귀 복사
INSERT INTO board(bno, btitle, bcontent, bwriter)
(SELECT seq.NEXTVAL, btitle, bcontent, bwriter FROM board);

SELECT * FROM board ORDER BY bno DESC;

-- ROWNUM을 이용한 페이지처리
SELECT ROWNUM, bno, btitle, bcontent, bwriter, bdate 
FROM board
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- ROWNUM은 1을 포함해야하므로 rn을 사용하여 페이지 처리함
SELECT rn, bno, btitle, bcontent, bwriter, bdate 
FROM (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate 
       FROM board)
WHERE rn >= 11 AND rn <= 20
ORDER BY bno DESC;

-- ROWID : 데이터를 구분할 수 있는 유일한 값
--         데이터 파일의 저장 블록을 확인할 수 있음
-- ROWID 데이터 검색을 할 수 있음
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATo1AAHAAAASVAAB';


COMMIT;

DROP SEQUENCE seq;

TRUNCATE TABLE board;