-- test ���̺� ����
CREATE TABLE test(
    action  VARCHAR2(100)
);

INSERT INTO test VALUES ('���� ���� �� ���Ѻο��� �����մϴ�.');

SELECT * FROM test;

COMMIT;

DROP TABLE test;