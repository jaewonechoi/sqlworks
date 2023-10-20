
SELECT * FROM drink2;

-- ���̺� ����
CREATE TABLE drink2 AS
SELECT * FROM drink;

-- ��ͺ���(INSERT INTO ~ SELECT) : VALUES�� ������
INSERT INTO drink2
(SELECT * FROM drink2);

-- ROWNUM (SUDO COLUMN - ������ ������ Į��)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;
--WHERE ROWNUM >= 2 AND ROWNUM <= 10; -- ������ 1�� ���ԵǾ�� �˻��� ��

-- FROM �� �������� ��� - �ζ��� ��
-- �� rn�� ����ϴ°�? ROWNUM�� 1�� �־�� �˻��̵ǹǷ� rn�̶�� ����(��Ī) ���
SELECT ROWNUM, drink_code, drink_name 
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
--WHERE ROWNUM >= 11 AND ROWNUM <= 20;  -- ROWNUM ���� �˻��� �ȵ�
WHERE rn >= 21 AND rn <= 30;

drop table drink2;