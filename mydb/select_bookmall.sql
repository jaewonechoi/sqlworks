
SELECT * FROM orders;

-- 주문 테이블의 칼럼, 자료형 검색
DESC orders;

-- 집계(그룹) 함수 - 개수(COUNT), 합계(SUM), 평균(AVG), 최대값(MAX), 최소값(MIN)
-- COUNT(*) : '*' - 보통 모든 칼럼을 가져올때 쓰임
-- COUNT(칼럼명) :  
SELECT COUNT(*) AS 총판매건수 FROM orders;

SELECT SUM(saleprice) AS 총판매액,
       AVG(saleprice) AS 총평균액
FROM orders;

-- 고객이 주문한 도서의 총판매액 계산
SELECT SUM(saleprice) AS 총판매액
FROM orders;

-- 고객별로 주문한 도서의 총판매액과 도서수량을 계산
-- 도서수량이 3권 이상인 자료 검색
-- GROUP BY 칼럼명
SELECT COUNT(*) 도서수량, SUM(saleprice) 총판매액 FROM orders
GROUP BY custid;

-- 고객별로 주문한 도서의 총판매액과 도서수량을 계산
-- 도서수량이 3권 이상인 자료 검색
-- GROUP BY 칼럼명
-- HAVING 절 사용 - GROUP BY절에서 조건이 있을때 사용
SELECT custid,
       COUNT(*) AS 도서수량,
       SUM(saleprice) AS 총판매액   -- custid와 도서수량, 총판매액 출력
FROM orders                               -- 참조할 테이블
GROUP BY custid                           -- 그룹화 시킬 칼럼
HAVING COUNT(*) >= 3;                     -- 도서수량이 3개이상인
    --AND SUM(saleprice) > 35000;

SELECT COUNT(*) AS 총고객수, COUNT(phone) 전화번호수  -- AS생략가능
FROM customer;

-- 도서중에서 최대가격, 최저가격 알기
SELECT MAX(price) 최고가격, MIN(price) 최저가격
FROM book;

-- 
SELECT * FROM customer;

-- '3번 고객(안산)'이 주문한 도서의 총 판매액 구하기
SELECT SUM(saleprice) as 총판매액
FROM orders
WHERE custid = 3;

-- 조인(Join)
-- 동등조인(EQUI JOIN) : equal(=)을 사용하는 조인
-- 테이블A.칼럼명 = 테이블B.칼럼명 (칼럼 - 기본키와 외래키)
-- 고객의 이름과 고객이 주문한 도서가격을 검색하시오(customer, oreders 조인)
SELECT customer.name, orders.saleprice      -- 출력하고싶은 내용
FROM customer, orders                       -- 필요한 테이블
WHERE customer.custid = orders.custid;      -- 둘이 겹쳐지는 테이블의 칼럼(기본키와 외래키)

-- 별칭 사용 조인
-- 고객 이름별 1차 정렬(오름차순), 주문 가격별 내림차순 2차 정렬
SELECT cus.name, ord.saleprice      -- 2. 설정한 별칭 사용
FROM customer cus, orders ord       -- 1. 별칭 설정
WHERE cus.custid = ord.custid       -- 3. 별칭사용하여 조인
ORDER BY cus.name, ord.saleprice desc;

-- 3번 고객의 아이디와 도서이름과 주문 가격을 검색
SELECT custid, bookname, saleprice 
FROM orders, book
WHERE book.bookid = orders.bookid AND orders.custid = 3;

SELECT customer.custid, book.bookname, orders.saleprice
FROM orders, customer, book
WHERE customer.custid = orders.custid
    AND book.bookid = orders.bookid
    AND customer.name = '안산';

COMMIT;