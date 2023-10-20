
SELECT * FROM drink2;

-- 테이블 복사
CREATE TABLE drink2 AS
SELECT * FROM drink;

-- 재귀복사(INSERT INTO ~ SELECT) : VALUES를 사용안함
INSERT INTO drink2
(SELECT * FROM drink2);

-- ROWNUM (SUDO COLUMN - 제공된 관리자 칼럼)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;
--WHERE ROWNUM >= 2 AND ROWNUM <= 10; -- 무조건 1이 포함되어야 검색이 됨

-- FROM 절 서브쿼리 사용 - 인라인 뷰
-- 왜 rn을 사용하는가? ROWNUM은 1이 있어야 검색이되므로 rn이라는 변수(별칭) 사용
SELECT ROWNUM, drink_code, drink_name 
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
--WHERE ROWNUM >= 11 AND ROWNUM <= 20;  -- ROWNUM 사용시 검색이 안됨
WHERE rn >= 21 AND rn <= 30;

drop table drink2;