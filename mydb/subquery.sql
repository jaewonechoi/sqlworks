-- 서브 쿼리(Sub Query) : 부속질의(중첩 쿼리)
-- SELECT문 안에 또 SELECT문이 존재함

-- 도서중에서 가격이 가장 높은 가격을 검색하시오
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- 도서중에서 가장 비싼 도서의 이름을 검색하시오
SELECT bookname, price
FROM book
WHERE price = 
     (SELECT MAX(price) FROM book);
     
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/

SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- 조인 방식 : customer, orders
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT DISTINCT cus.name
FROM customer cus INNER JOIN orders ord
ON cus.custid = ord.custid
ORDER BY cus.name;

COMMIT;

