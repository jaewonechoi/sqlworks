-- ���� ����
-- product, product_review
SELECT * FROM product;
SELECT * FROM product_review;

-- ���䰡 �ִ� ��ǰ�� ������ �˻��Ͻÿ�
-- ���� ���̺� product_name Į���� ���
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;


SELECT a.product_name,
       b.*       
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(�̱�ǥ����ȸ) ���� - STANDARD JOIN(ǥ������)
-- ��������(INNER JOIN ~ ON)
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- ������ ������ ������� ��� ��ǰ�� ������ �˻��Ͻÿ�
-- �ܺ����� (LEFT OUTER, RIGHT ����) - OUTER ��������
SELECT a.product_name,
       b.review_no,
       b.product_code,
       b.content,
       b.regdate
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code;

-- ���䰡 ���� ��ǰ�� ������ �˻��Ͻÿ�
SELECT a.product_name "��ǰ�ıⰡ ���� ��ǰ" -- ��Ī�� �����Ҷ� �ֵ���ǥ
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code
WHERE b.review_no IS NULL;

-- ��ǰ �������̺� product_name Į�� �߰�
-- ��Į�� �������� : �� Į���� ��ȯ��, SELECT ������ ���
SELECT a.review_no,
       a.product_code,
      (SELECT b.product_name   -- SELECT���� �� Į���� ��ȯ
       FROM product b
       WHERE b.product_code = a.product_code) product_name,
       a.content,
       a.member_id,
       a.regdate
FROM product_review a;
