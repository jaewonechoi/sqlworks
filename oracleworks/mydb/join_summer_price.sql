-- 계절학기 수강료, 등록 테이블
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 학생의 모든 수강정보를 검색하시오
SELECT b.sid,
       b.subject,
       a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 과목별 수강료 합계를 구하시오
SELECT b.subject,
       SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- 과목별 수강료 합계 및 전체 총계를 구하시오
-- ROLLUP(), CUBE()
-- NVL(과목, '총계') : 과목이 NULL이 아니면 과목을 출력하고 NULL일 경우 '총계'로 출력
SELECT NVL(b.subject, '총계'),
       SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- 과목별 수강료 합계
SELECT subject, 
       SUM(price)
FROM summer_price
GROUP BY subject; --SELECT절의 칼럼개수와 같아야 함