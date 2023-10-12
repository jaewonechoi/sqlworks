-- ���� : �� ���̺��� �����Ͽ� ����ϴ� ���
-- ��������(equi join) : ���� ������ ��Ȯ�� ��ġ�ϴ� ��쿡 ��� ���
-- �ܺ�����(outer join) : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ����� ���

-- ��(customer)�� ���� �ֹ�(orders)�� ���� �����͸� ��� �˻��Ͻÿ�
-- ���� �ֹ� �ݾ��� �Ѿ��� ����Ͻÿ�(Group by ���)
-- '�迬��' ���� �ֹ� �ѱݾ��� ���(HAVING���� ������ ��)
SELECT cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name       -- GROUP BY�� �����ϸ� ���� SELECT�� Į�������� �������
 HAVING cus.name = '�迬��'
ORDER BY cus.name;

-- �ֹ����� ���� �����͵� ��� �˻�
-- ������ ��ġ���� ���� ���̺� +�� �־���
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)    -- (+)�� ���Ͻ� �ܺ�����
ORDER BY cus.name;

-- ���� �̸�, �ֹ��� �����̸�, �ֹ���, �ֹ��ݾ�
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid   -- �⺻Ű = �ܷ�Ű
  AND bk.bookid = ord.bookid;
  
-- ǥ�� ����(ANSI SQL)**
-- ���� ����(INNER JOIN)
-- ��(customer)�� ���� �ֹ�(orders)�� ���� ������ �� ���� �̸���
-- ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice 
FROM customer cus INNER JOIN orders ord
  ON cus.custid = ord.custid
ORDER BY cus.name;

-- �ܺ� ����(OUTER JOIN)
-- JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϿ��� ����ϴ� ���
-- ��(customer)�� ���� �ֹ�(orders)�� ���� ������ ��
-- �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ���
-- ������ �ǸŰ����� �˻��Ͻÿ�

SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
  ON cus.custid = ord.custid
ORDER BY cus.name;

COMMIT;
