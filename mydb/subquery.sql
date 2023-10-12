-- ���� ����(Sub Query) : �μ�����(��ø ����)
-- SELECT�� �ȿ� �� SELECT���� ������

-- �����߿��� ������ ���� ���� ������ �˻��Ͻÿ�
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- �����߿��� ���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = 
     (SELECT MAX(price) FROM book);
     
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT custid FROM orders;

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/

SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- ���� ��� : customer, orders
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT DISTINCT cus.name
FROM customer cus INNER JOIN orders ord
ON cus.custid = ord.custid
ORDER BY cus.name;

COMMIT;

