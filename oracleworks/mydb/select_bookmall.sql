
SELECT * FROM orders;

-- �ֹ� ���̺��� Į��, �ڷ��� �˻�
DESC orders;

-- ����(�׷�) �Լ� - ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
-- COUNT(*) : '*' - ���� ��� Į���� �����ö� ����
-- COUNT(Į����) :  
SELECT COUNT(*) AS ���ǸŰǼ� FROM orders;

SELECT SUM(saleprice) AS ���Ǹž�,
       AVG(saleprice) AS ����վ�
FROM orders;

-- ���� �ֹ��� ������ ���Ǹž� ���
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders;

-- ������ �ֹ��� ������ ���Ǹžװ� ���������� ���
-- ���������� 3�� �̻��� �ڷ� �˻�
-- GROUP BY Į����
SELECT COUNT(*) ��������, SUM(saleprice) ���Ǹž� FROM orders
GROUP BY custid;

-- ������ �ֹ��� ������ ���Ǹžװ� ���������� ���
-- ���������� 3�� �̻��� �ڷ� �˻�
-- GROUP BY Į����
-- HAVING �� ��� - GROUP BY������ ������ ������ ���
SELECT custid,
       COUNT(*) AS ��������,
       SUM(saleprice) AS ���Ǹž�   -- custid�� ��������, ���Ǹž� ���
FROM orders                               -- ������ ���̺�
GROUP BY custid                           -- �׷�ȭ ��ų Į��
HAVING COUNT(*) >= 3;                     -- ���������� 3���̻���
    --AND SUM(saleprice) > 35000;

SELECT COUNT(*) AS �Ѱ���, COUNT(phone) ��ȭ��ȣ��  -- AS��������
FROM customer;

-- �����߿��� �ִ밡��, �������� �˱�
SELECT MAX(price) �ְ���, MIN(price) ��������
FROM book;

-- 
SELECT * FROM customer;

-- '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž� ���ϱ�
SELECT SUM(saleprice) as ���Ǹž�
FROM orders
WHERE custid = 3;

-- ����(Join)
-- ��������(EQUI JOIN) : equal(=)�� ����ϴ� ����
-- ���̺�A.Į���� = ���̺�B.Į���� (Į�� - �⺻Ű�� �ܷ�Ű)
-- ���� �̸��� ���� �ֹ��� ���������� �˻��Ͻÿ�(customer, oreders ����)
SELECT customer.name, orders.saleprice      -- ����ϰ���� ����
FROM customer, orders                       -- �ʿ��� ���̺�
WHERE customer.custid = orders.custid;      -- ���� �������� ���̺��� Į��(�⺻Ű�� �ܷ�Ű)

-- ��Ī ��� ����
-- �� �̸��� 1�� ����(��������), �ֹ� ���ݺ� �������� 2�� ����
SELECT cus.name, ord.saleprice      -- 2. ������ ��Ī ���
FROM customer cus, orders ord       -- 1. ��Ī ����
WHERE cus.custid = ord.custid       -- 3. ��Ī����Ͽ� ����
ORDER BY cus.name, ord.saleprice desc;

-- 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻�
SELECT custid, bookname, saleprice 
FROM orders, book
WHERE book.bookid = orders.bookid AND orders.custid = 3;

SELECT customer.custid, book.bookname, orders.saleprice
FROM orders, customer, book
WHERE customer.custid = orders.custid
    AND book.bookid = orders.bookid
    AND customer.name = '�Ȼ�';

COMMIT;