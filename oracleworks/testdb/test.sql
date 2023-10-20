-- test 테이블 생성
CREATE TABLE test(
    action  VARCHAR2(100)
);

INSERT INTO test VALUES ('계정 생성 및 권한부여를 수행합니다.');

SELECT * FROM test;

COMMIT;

DROP TABLE test;