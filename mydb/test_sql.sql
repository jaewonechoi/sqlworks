-- �ǽ� ����

-- 1. ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�
SELECT customer.name, customer.address FROM customer;

-- 2. ��� ���� �̸�, �ּ�, ��ȭ��ȣ�� �˻��Ͻÿ�
SELECT customer.name, customer.address, customer.phone FROM customer;

-- 3. �ּҰ� '����'�� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE customer.address LIKE '%����%';

-- 4. ���� �̸��� '�迬��' Ȥ�� '�Ȼ�'�� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE customer.name IN('�迬��', '�Ȼ�');

SELECT * FROM customer
WHERE customer.name = '�迬��' or name = '�Ȼ�';

-- 5. �ּҰ� '���ѹα�'�� �ƴ� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE customer.address NOT LIKE '%���ѹα�%';

-- 6. ��ȭ��ȣ�� ���� ���� �˻��Ͻÿ�
SELECT * FROM customer
WHERE phone IS NULL;

-- ��ȭ��ȣ�� �ִ� ��
SELECT * FROM customer
WHERE phone IS NOT NULL;

-- 7. ���� �̸������� �����Ͻÿ�(��������)
SELECT * FROM customer
ORDER BY customer.name;

-- 8. ���� �� �ο����� ���Ͻÿ�
SELECT COUNT(*) ���ο��� FROM customer;