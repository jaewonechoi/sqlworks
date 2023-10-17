-- 은행 계좌 테이블 생성
CREATE TABLE account(
    ano     VARCHAR2(20) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '최재원', 10000);

ROLLBACK;
COMMIT;

SELECT * FROM account;

UPDATE account SET balance = (balance + 50000), owner = '박대박'
WHERE ano = '33-33-333';

DELETE FROM account
WHERE ano = '33-33-333';

SELECT * FROM account
WHERE ano = '22-22-222';