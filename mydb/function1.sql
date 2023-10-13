-- ���� Ÿ�� ���� �Լ�
-- ���밪 ���ϱ� : ABS()
-- ���� ���̺� : dual
SELECT ABS(-10) FROM dual;

-- �ݿø� : ROUND(����, �ڸ���)
SELECT ROUND(127.66, 1) FROM dual;  -- �Ҽ� ù° �ڸ����� ���
SELECT ROUND(127.66, 0) FROM dual;  -- �Ҽ� 0�� �ڸ�(����)
SELECT ROUND(127.66, -1) FROM dual; -- 1�� �ڸ����� �ݿø�
SELECT ROUND(127.66, -2) FROM dual; -- 10�� �ڸ����� �ݿø�

-- ����(����) : TRUNC(����, �ڸ���)
SELECT TRUNC(127.66, 1) FROM dual; -- �Ҽ� ù°�ڸ����� ǥ��
SELECT TRUNC(127.66, 0) FROM dual; -- �Ҽ� 
SELECT TRUNC(127.66, -1) FROM dual;  -- 1�� �ڸ����� ����
SELECT TRUNC(127.66, -2) FROM dual;  -- 10�� �ڸ����� ����

-- ����(����) : TRUNC(����) - �Ҽ��� �� ����
SELECT FLOOR(127.66) FROM dual;
SELECT FLOOR(127.6) FROM dual;

-- �ŵ����� : POWER(��, ����)
SELECT POWER(2, 3) FROM dual;


-- ���� Ÿ��
-- �ҹ��ڷ� �����ϱ� : LOWER('ABCD')
-- �빮�ڷ� �����ϱ� : UPPER('abcd')
SELECT LOWER('ABCD') FROM dual;
SELECT UPPER('abcd') FROM dual;

-- ���ڿ��� �Ϻκ��� ���� : SUBSTR(���ڿ�, �ε���, �ڸ���)
-- �ε����� 1������ ����
SELECT SUBSTR('abcd', 1, 2) FROM dual;

-- ���ڿ��� ã�� �ٲٱ� : REPLACE(���ڿ�, ����������, �����Ĺ���)
SELECT REPLACE('abcd', 'c', 'e') FROM dual;

-- ���ڿ��� ���� : LENGTH(���ڿ�)
SELECT LENGTH('abcd') FROM dual;

-- ����ŷ ó��
-- ����ŷ : LPAD(���ڿ�, ��ü����, Ư������) - ���ʺ��� Ư�����ڷ� ä��
-- ����ŷ : RPAD(���ڿ�, ��ü����, Ư������) - �����ʺ��� Ư�����ڷ� ä��
SELECT LPAD('today', 10, '*') FROM dual;
SELECT RPAD('today', 10, '*') FROM dual;

-- �ֹ� ���̺�
-- ���� ��� �ֹ� �ݾ��� ��������� �ݿø��ϱ�
SELECT custid AS ����ȣ,
       SUM(saleprice) AS �հ�ݾ�,
       COUNT(saleprice) AS �ֹ��Ǽ�,
       ROUND(AVG(saleprice), -2) AS ����ֹ��ݾ�
FROM orders
GROUP BY orders.custid;

-- ���� ���̺�
-- å ������ ���ڼ�
-- å ������ ����Ʈ�� : �ѱ� - 3byte, ����,Ư������ - 1byte
SELECT bookname,
       LENGTH(bookname) AS ���ڼ�,
       LENGTHB(bookname) AS ����Ʈ��
FROM book;

-- '�౸'�� '��'�� �ٲٱ�
SELECT REPLACE(bookname, '�౸', '��') 
FROM book;

SELECT bookname,
       REPLACE(bookname, '�౸', '��') as bookname
FROM book;

-- �� ���̺�
-- �� �̸��� ���� ���� ���� ���� �ο���
SELECT SUBSTR(name, 1, 1) ��,
       COUNT(*) �ο�
FROM customer
GROUP BY SUBSTR(name, 1, 1);