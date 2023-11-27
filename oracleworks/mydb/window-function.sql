-- �� ���� ���� �Լ�
-- LEAD(Į����, ���) : ���� ���� ���� ���� �࿡ �����
-- LAG(Į����, ���) : ���� ���� ���� ���� �࿡ �����
CREATE TABLE EMP_INFO(
    EMP_NO  VARCHAR2(3),    -- �����ȣ
    NAME    VARCHAR2(20),   -- ����̸�
    SAL     NUMBER          -- �޿�(�޷�����)
);

INSERT INTO EMP_INFO VALUES('100', '���ϳ�', 24000);
INSERT INTO EMP_INFO VALUES('101', '���ϳ�', 7000);
INSERT INTO EMP_INFO VALUES('102', '���ϳ�', 8000);
INSERT INTO EMP_INFO VALUES('103', '���ϳ�', 12000);
INSERT INTO EMP_INFO VALUES('104', '���ϳ�', 6000);
INSERT INTO EMP_INFO VALUES('105', '���ϳ�', 15000);
INSERT INTO EMP_INFO VALUES('106', '���ϳ�', 21000);
INSERT INTO EMP_INFO VALUES('107', '���ϳ�', 16000);
INSERT INTO EMP_INFO VALUES('108', '���ϳ�', 9000);
INSERT INTO EMP_INFO VALUES('109', '���ϳ�', 13000);

COMMIT;
SELECT * FROM EMP_INFO;

-- SAL2 - 3�� ���� �����
-- SAL3 - NULL�� ��� 0���� ǥ����
SELECT EMP_NO,
       NAME,
       SAL,
       LEAD(SAL, 3) OVER(ORDER BY SAL DESC) SAL2,
       LEAD(SAL, 3, 0) OVER(ORDER BY SAL DESC) SAL3
FROM EMP_INFO;

-- LAG() OVER()
-- SAL2 - 3�� �Ʒ��� �����
SELECT EMP_NO,
       NAME,
       SAL,
       LAG(SAL, 3) OVER(ORDER BY SAL DESC) SAL2,
       LAG(SAL, 3, 0) OVER(ORDER BY SAL DESC) SAL3
FROM EMP_INFO;

TRUNCATE TABLE EMP_INFO;