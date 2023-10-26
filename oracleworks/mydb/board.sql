-- �ڹ� �Խ��� ������ board ���̺� ����
CREATE TABLE board(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,      -- CLOB(Character Large Of Byte) / 4GB
    bwriter     VARCHAR2(50) NOT NULL,  --VARCHAR2 4000byte
    bdate       DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq NOCACHE;

INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '���� �λ�', '�ȳ��ϼ���~ ������ �ݰ����ϴ�.', 'today10');
INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '���� ����', 'õ�� ������ û���մϴ�.', 'admin0000');

-- ��� ����
INSERT INTO board(bno, btitle, bcontent, bwriter)
(SELECT seq.NEXTVAL, btitle, bcontent, bwriter FROM board);

SELECT * FROM board ORDER BY bno DESC;

-- ROWNUM�� �̿��� ������ó��
SELECT ROWNUM, bno, btitle, bcontent, bwriter, bdate 
FROM board
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- ROWNUM�� 1�� �����ؾ��ϹǷ� rn�� ����Ͽ� ������ ó����
SELECT rn, bno, btitle, bcontent, bwriter, bdate 
FROM (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate 
       FROM board)
WHERE rn >= 11 AND rn <= 20
ORDER BY bno DESC;

-- ROWID : �����͸� ������ �� �ִ� ������ ��
--         ������ ������ ���� ����� Ȯ���� �� ����
-- ROWID ������ �˻��� �� �� ����
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATo1AAHAAAASVAAB';


COMMIT;

DROP SEQUENCE seq;

TRUNCATE TABLE board;