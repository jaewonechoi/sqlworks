-- ���̺� ����(CREATE)
CREATE TABLE ex2(
    col_date  DATE,     -- ��¥ �ڷ���(�ý����� ���� ��¥)
    col_timestamp TIMESTAMP  --��¥�� �ð� �ڷ���
);

INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);
INSERT INTO ex2(hire_date) VALUES ('2023-09-01');  -- �Ѱ��� �������Ҷ� ex2()��ȣ�ȿ� �־����

COMMIT;

SELECT * FROM ex2;  -- * FROM ex2 ex2�� ���� ���

-- ���̺� ����(ALTER) : �Ի��� Į�� �߰�
ALTER TABLE ex2 ADD hire_date VARCHAR2(20);

-- ���̺� ����
DROP TABLE ex2; --��Ÿ���ų� �߸����������� ���̺��� �����ϰ� �ٽ� �������� Ŀ���� ���� ���� ����