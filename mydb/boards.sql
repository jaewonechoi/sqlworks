-- �Խ��� ���̺� ����
CREATE TABLE boards(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100) NOT NULL,
    bcontent    CLOB NOT NULL,      -- CLOB(Character Large Of Byte) / 4GB
    bwriter     VARCHAR2(50) NOT NULL,  --VARCHAR2 4000byte
    bdate       DATE DEFAULT SYSDATE,
    bfilename   VARCHAR2(50),
    bfiledata   BLOB                -- BLOB(Binary Large Of Byte) / 4GB
);

-- ������ ����(NOCACHE - �������� ����, �ʱ�ȭ�Ǹ� 1���� ������)
CREATE SEQUENCE seq_bno NOCACHE;

-- �Խñ� �߰�
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '�Ｚ ������ s21�Դϴ�', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '�Ｚ ������ s21�Դϴ�', 'today', 
            SYSDATE, null, null);

-- ��ü �˻�
SELECT * FROM boards ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'cloud'
ORDER BY bno DESC;

-- �۹�ȣ 5���� ������ '������ 15'�� ����
UPDATE boards 
SET btitle = '������ 15',
    bcontent = '������ 15 ��ǰ�Դϴ�'
WHERE bno = 5;

-- �۹�ȣ 5���� �ڷ� ����
DELETE FROM boards
WHERE bno = 5;

ROllBACK;

COMMIT;