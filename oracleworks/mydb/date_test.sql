-- 날짜 칼럼
-- 1. create_date DATE DEFAULT SYSDATE (현재 날짜와 시간)
-- 2. hire_date DATE (특정 날짜)
-- 날짜
SELECT SYSDATE FROM DUAL;

-- 날짜와 시간
SELECT SYSTIMESTAMP FROM DUAL;

-- 20일전의 날짜 출력
SELECT SYSDATE -20 FROM DUAL;

-- 특정한 날에서 20일전의 날짜 출력
SELECT TO_DATE('2023-10-25') -20 FROM DUAL;

-- 서점의 주문 확정일자
SELECT orderid 주문번호,
       orderdate 주문일,
       TO_DATE(orderdate) + 10 확정일
FROM orders;


CREATE TABLE date_test1(
    reg_date    DATE,
    hire_date   DATE
);

-- 추가1 (DATE일 경우)
INSERT INTO date_test1 VALUES (SYSDATE, '2023-11-01');
INSERT INTO date_test1 VALUES (SYSDATE, TO_DATE('2023-11-01'));


-- 자바와 클래스와 연동할 때 사용
CREATE TABLE date_test2(
    reg_date    DATE DEFAULT SYSDATE,
    hire_date   DATE
);

-- 추가2 (DATE DEFAULT SYSDATE일 경우 자동으로 들어감)
INSERT INTO date_test2(hire_date) VALUES ('2023-11-01');
INSERT INTO date_test2(hire_date) VALUES (TO_DATE('2023-11-01'));

COMMIT;

SELECT * FROM date_test1;
SELECT * FROM date_test2;

DROP TABLE date_test;