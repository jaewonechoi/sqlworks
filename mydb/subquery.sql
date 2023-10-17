-- 서브 쿼리(Sub Query) : 부속질의(중첩 쿼리)
-- SELECT문 안에 또 SELECT문이 존재함

-- 도서중에서 가격이 가장 높은 가격을 검색하시오
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- 단일행 서브쿼리 (결과가 한개일 경우)
-- 도서중에서 가장 비싼 도서의 이름을 검색하시오
SELECT bookname, price
FROM book
WHERE price = 
     (SELECT MAX(price) FROM book);
     
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;

SELECT name FROM customer
WHERE custid = 3;

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/
-- 다중행 서브쿼리 (결과가 여러개일 경우)
-- 도서를 구매한 적이 있는 고객의 이름 출력
SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);     -- IN이 아닌 =를 쓰면 에러발생

-- 다중행 서브쿼리 (결과가 여러개일 경우)
-- 도서를 구매한 적이 없는 고객의 이름 출력
SELECT name FROM customer
WHERE custid NOT IN(SELECT custid FROM orders);

-- 조인 방식 : customer, orders
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT DISTINCT cus.name
FROM customer cus INNER JOIN orders ord
ON cus.custid = ord.custid
ORDER BY cus.name;

-- FROM절에 있는 서브쿼리 - 인라인뷰라고도 함
-- 고객의 이름과 그 고객의 판매액 검색(customer, saleprice)
-- 그룹별 : GROUP BY
-- 단, 고객 번호가 2이하임

-- 동등 조인
SELECT cus.name, SUM(ord.saleprice) total
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
  AND cus.custid <= 2
GROUP BY cus.name
  HAVING SUM(ord.saleprice) >= 30000;
  --HAVING total >= 30000;
/*
  실행 순서
  1. FROM절 테이블명
  2. WHERE, GROUP BY
  3. SELECT 절
  4. ORDER BY
*/

-- 서브 쿼리
SELECT cus.name, SUM(ord.saleprice)
FROM (SELECT * FROM customer
      WHERE customer.custid <= 2) cus, 
     orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

SELECT * FROM product;
SELECT * FROM product_review;
-- 스칼라 서브쿼리 : SELECT절에 있는 SELECT문
-- 상품 리뷰 테이블에 있는 상품 이름 검색
-- product_review에 없는 product_name을 쓰기위해 SELECT문안에 SELECT, FROM, WHERE
-- 을 사용하여 동등 조인하여 product_name을 가져옴
SELECT a.product_code,
       (SELECT b.product_name
        FROM product b
        WHERE a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review a;

COMMIT;
