-- �б� �����ͺ��̽� ����
-- �а� ���̺� ����
CREATE TABLE major(
    mname       VARCHAR2(20) PRIMARY KEY,
    mphone      VARCHAR2(20) NOT NULL,  -- NOT NULL(�ʼ� �Է�)
    mlocation   VARCHAR2(30) NOT NULL
);

-- �а� �߰�
INSERT INTO major(mname, mphone, mlocation)
VALUES ('����Ʈ�����а�', '02-1234-5678', 'B�� 3��');
INSERT INTO major(mname, mphone, mlocation)
VALUES ('ȭ�а��а�', '02-2222-7777', 'B�� 4��');
INSERT INTO major(mname, mphone, mlocation)
VALUES ('�������ڰ��а�', '02-4444-7777', 'B�� 5��');

-- �а��� �ڷ��� ũ�� ����
ALTER TABLE major MODIFY mname VARCHAR2(30);

-- ��ü ������ ��ȸ
SELECT * FROM major;

--�а���� ��ȭ��ȣ�� ���(��Ī(���̺���) - as(��������))
SELECT mname as �а���, mphone ��ȭ��ȣ FROM major;

COMMIT;



