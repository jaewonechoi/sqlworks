-- bookmall ����
-- book ���̺� ����
CREATE TABLE book(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(60) NOT NULL,
    publisher   VARCHAR2(60) NOT NULL,
    price       NUMBER NOT NULL
);

-- ���� �ڷ� �߰�
INSERT INTO book VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES (4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES (5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES (6, '����� ����', '�½�����', 6000);
INSERT INTO book VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES (10, 'Olympic Chmpions', 'Person', 13000);

SELECT * FROM book;

-- ��� ������ ��ȣ�� �̸��� ������ �˻��Ͻÿ�
SELECT bookid, bookname, price FROM book;

-- ���� ���̺��� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ� ���� - DISTINCT)
-- DISTINCT�� �ߺ��� �����ִ� ���ɾ�
SELECT DISTINCT publisher FROM book;    -- �ߺ� ����

-- ������ 20000�� �̸��� ������ �˻��Ͻÿ�(�������� ����)
SELECT * FROM book
WHERE price < 20000
ORDER BY price;

-- ������ 10000�� �̻��̰� 20000�� ������ ������  �˻��Ͻÿ�
-- Į���� BETWEEN A AND B;(>=, <=)
SELECT * FROM book
--WHERE price >= 10000 AND price <= 20000;  
WHERE price BETWEEN 10000 AND 20000;    -- ���� �񱳱����� ���� ����

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher FROM book
WHERE bookname = '�౸�� ����';

SELECT publisher FROM book
WHERE bookname LIKE '�౸�� ����';

-- �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
SELECT bookname, publisher FROM book
WHERE bookname LIKE '%�౸%';

-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE price >= 20000 AND bookname LIKE '%�౸%';

-- ����
-- ������ �̸������� �����Ͻÿ�(��������)
SELECT * FROM book
ORDER BY bookname;

-- ������ ���ݼ����� �˻��ϰ� �����Ͻÿ�(��������)
-- ������ ������ �̸��� ������������ �����Ͻÿ�
SELECT * FROM book
ORDER BY price ASC, bookname DESC;  -- �տ��ִ� ������ 1������ �ڿ� å�̸��� 2������

COMMIT;