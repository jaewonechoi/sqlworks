-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �л��� ��� ���������� �˻��Ͻÿ�
SELECT b.sid,
       b.subject,
       a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- ���� ������ �հ踦 ���Ͻÿ�
SELECT b.subject,
       SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- ROLLUP(), CUBE()
-- NVL(����, '�Ѱ�') : ������ NULL�� �ƴϸ� ������ ����ϰ� NULL�� ��� '�Ѱ�'�� ���
SELECT NVL(b.subject, '�Ѱ�'),
       SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- ���� ������ �հ�
SELECT subject, 
       SUM(price)
FROM summer_price
GROUP BY subject; --SELECT���� Į�������� ���ƾ� ��