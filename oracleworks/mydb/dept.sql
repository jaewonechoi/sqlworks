-- dept ���̺�
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,
    deptname  VARCHAR2(20) NOT NULL,
    location  VARCHAR2(20) NOT NULL
);

/* �μ� �ڷ� �߰� */
INSERT INTO dept(deptid, deptname, location)
VALUES(10, '������', '����');
INSERT INTO dept(deptid, deptname, location)
VALUES(20, '������', '��õ');
INSERT INTO dept(deptid, deptname, location)
VALUES(30, '��������', '����');

SELECT * FROM dept;

-- �μ��̸����� ���� ������ �̸��� ����Ͻÿ�
SELECT SUBSTR(deptname, 1, (LENGTH(deptname)-1)) ����
FROM dept;

SELECT REPLACE(deptname, '��', '') ���� FROM dept;

COMMIT;