-- product_review 테이블 생성
-- CLOB(character large object) - 매우 큰 문자열 자료형(4GB)
CREATE TABLE product_review(
    review_no       NUMBER PRIMARY KEY,         -- 리뷰번호
    product_code    CHAR(6) NOT NULL,           -- 상품코드   
    member_id       VARCHAR2(20) NOT NULL,      -- 회원아이디
    content         CLOB NOT NULL,              -- 리뷰내용
    regdate         DATE DEFAULT SYSDATE,       -- 작성일
    FOREIGN KEY (product_code) REFERENCES product(product_code)
);

-- 자동 순번(nocache - 초기화하면 1부터 시작)
CREATE SEQUENCE seq_rno NOCACHE;

INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.NEXTVAL, '100001', 'today10', '무소음인데 소음이 조금 있는 듯...');
INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.NEXTVAL, '100001', 'cloud100', '무선이라 정말 편하네요!');
INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.NEXTVAL, '100002', 'sky123', '게임할 맛 납니다');

COMMIT;

SELECT * FROM product_review;

-- 테이블은 유지하고 데이터 전체 삭제
TRUNCATE TABLE product_review;
-- 시퀀스 삭제
DROP SEQUENCE seq_rno;

-- 상품코드가 '100001'이고, 회원아이디가 'cloud100'인
-- 상품의 리뷰를 출력하시오
SELECT * FROM product_review
WHERE product_code = '100001' AND member_id = 'cloud100';

-- 상품 아이템 - 3개, 리뷰있는 아이템 - 2개
-- 리뷰가 있는 상품을 검색하시오(동등 조인)
-- 조건일치 : a테이블의 기본키 = b테이블의 외래키
SELECT *
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 표준 방식 - 내부조인(INNER JOIN ~ ON)
SELECT *
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 내부조인(INNER JOIN ~ USING)
SELECT *
FROM product a JOIN product_review b
USING (product_code);   -- USING 사용시엔 SELECT문에서 별칭 사용x

-- 리뷰 유무에 관계없이 상품의 정보를 검색하시오
-- 동등조인 방식(product의 상품은 모두 출력되고,
-- 리뷰는 있든 없는 관계없음, 리뷰가 없으면 NULL로 출력됨)
SELECT *
FROM product a, product_review b
WHERE a.product_code = b.product_code(+);   -- (+)를붙인 반대편의 데이터를 다 가져옴

-- 표준 방식(외부조인 - OUTER JOIN)
-- OUTER 생략 가능
SELECT *
FROM product a LEFT OUTER JOIN product_review b     -- 왼쪽(LEFT)데이터(product)를 다 가져옴
ON a.product_code = b.product_code;