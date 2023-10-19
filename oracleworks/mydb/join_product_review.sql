-- 조인 연습
-- product, product_review
SELECT * FROM product;
SELECT * FROM product_review;

-- 리뷰가 있는 상품의 정보를 검색하시오
-- 리뷰 테이블에 product_name 칼럼을 출력
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;


SELECT a.product_name,
       b.*       
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(미국표준협회) 조인 - STANDARD JOIN(표준조인)
-- 내부조인(INNER JOIN ~ ON)
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 리뷰의 유무와 상관없이 모든 상품의 정보를 검색하시오
-- 외부조인 (LEFT OUTER, RIGHT 조인) - OUTER 생략가능
SELECT a.product_name,
       b.review_no,
       b.product_code,
       b.content,
       b.regdate
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code;

-- 리뷰가 없는 상품의 정보를 검색하시오
SELECT a.product_name "상품후기가 없는 상품" -- 별칭에 띄어쓰기할때 쌍따옴표
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code
WHERE b.review_no IS NULL;

-- 상품 리뷰테이블에 product_name 칼럼 추가
-- 스칼라 서브쿼리 : 한 칼럼만 반환함, SELECT 절에서 사용
SELECT a.review_no,
       a.product_code,
      (SELECT b.product_name   -- SELECT절의 한 칼럼만 반환
       FROM product b
       WHERE b.product_code = a.product_code) product_name,
       a.content,
       a.member_id,
       a.regdate
FROM product_review a;
