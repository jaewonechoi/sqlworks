-- ���� ����(Sub Query) : �μ�����(��ø ����)
-- SELECT�� �ȿ� �� SELECT���� ������

-- �����߿��� ������ ���� ���� ������ �˻��Ͻÿ�
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- ������ �������� (����� �Ѱ��� ���)
-- �����߿��� ���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = 
     (SELECT MAX(price) FROM book);
     
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT custid FROM orders;

SELECT name FROM customer
WHERE custid = 3;

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/
-- ������ �������� (����� �������� ���)
-- ������ ������ ���� �ִ� ���� �̸� ���
SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);     -- IN�� �ƴ� =�� ���� �����߻�

-- ������ �������� (����� �������� ���)
-- ������ ������ ���� ���� ���� �̸� ���
SELECT name FROM customer
WHERE custid NOT IN(SELECT custid FROM orders);

-- ���� ��� : customer, orders
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT DISTINCT cus.name
FROM customer cus INNER JOIN orders ord
ON cus.custid = ord.custid
ORDER BY cus.name;

-- FROM���� �ִ� �������� - �ζ��κ��� ��
-- ���� �̸��� �� ���� �Ǹž� �˻�(customer, saleprice)
-- �׷캰 : GROUP BY
-- ��, �� ��ȣ�� 2������

-- ���� ����
SELECT cus.name, SUM(ord.saleprice) total
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
  AND cus.custid <= 2
GROUP BY cus.name
  HAVING SUM(ord.saleprice) >= 30000;
  --HAVING total >= 30000;
/*
  ���� ����
  1. FROM�� ���̺��
  2. WHERE, GROUP BY
  3. SELECT ��
  4. ORDER BY
*/

-- ���� ����
SELECT cus.name, SUM(ord.saleprice)
FROM (SELECT * FROM customer
      WHERE customer.custid <= 2) cus, 
     orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

SELECT * FROM product;
SELECT * FROM product_review;
-- ��Į�� �������� : SELECT���� �ִ� SELECT��
-- ��ǰ ���� ���̺� �ִ� ��ǰ �̸� �˻�
-- product_review�� ���� product_name�� �������� SELECT���ȿ� SELECT, FROM, WHERE
-- �� ����Ͽ� ���� �����Ͽ� product_name�� ������
SELECT a.product_code,
       (SELECT b.product_name
        FROM product b
        WHERE a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review a;

COMMIT;
