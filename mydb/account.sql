-- ���� ���� ���̺� ����
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '�����', 10000);

ROLLBACK;
COMMIT;

SELECT * FROM account;

UPDATE account SET balance = (balance + 50000), owner = '�ڴ��'
WHERE ano = '33-33-333';

DELETE FROM account
WHERE ano = '33-33-333';

SELECT * FROM account
WHERE ano = '22-22-222';