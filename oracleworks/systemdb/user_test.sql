-- user ���� : test, ��й�ȣ pwtest
CREATE USER c##test IDENTIFIED BY pwtest;
-- CREATE SESSION ������ ������ ���� �ʽ��ϴ�.

-- SESSION ����(�α���-����) �ο�
GRANT CREATE SESSION TO c##test;

-- DB�� ���̺� ���� ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##test;

-- ������ ������ ��� ���� �ο� - DML(����, ��ȸ, ����, ����)
GRANT CONNECT, DBA TO c##test;


