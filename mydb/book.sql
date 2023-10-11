-- bookmall 구축
-- book 테이블 생성
CREATE TABLE book(
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(60) NOT NULL,
    publisher   VARCHAR2(60) NOT NULL,
    price       NUMBER NOT NULL
);

-- 도서 자료 추가
INSERT INTO book VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '양궁의 실제', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Chmpions', 'Person', 13000);

SELECT * FROM book;

-- 모든 도서의 번호와 이름과 가격을 검색하시오
SELECT bookid, bookname, price FROM book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오(중복 제거 - DISTINCT)
-- DISTINCT는 중복을 없애주는 명령어
SELECT DISTINCT publisher FROM book;    -- 중복 제거

-- 가격이 20000원 미만인 도서를 검색하시오(오름차순 정렬)
SELECT * FROM book
WHERE price < 20000
ORDER BY price;

-- 가격이 10000원 이상이고 20000원 이하인 도서를  검색하시오
-- 칼럼명 BETWEEN A AND B;(>=, <=)
SELECT * FROM book
--WHERE price >= 10000 AND price <= 20000;  
WHERE price BETWEEN 10000 AND 20000;    -- 위에 비교구문과 같은 역할

-- '축구의 역사'를 출간한 출판사를 검색하시오
SELECT publisher FROM book
WHERE bookname = '축구의 역사';

SELECT publisher FROM book
WHERE bookname LIKE '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오
SELECT bookname, publisher FROM book
WHERE bookname LIKE '%축구%';

-- 축구에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
SELECT * FROM book
WHERE price >= 20000 AND bookname LIKE '%축구%';

-- 정렬
-- 도서를 이름순으로 정렬하시오(오름차순)
SELECT * FROM book
ORDER BY bookname;

-- 도서를 가격순으로 검색하고 정렬하시오(오름차순)
-- 가격이 같으면 이름을 내림차순으로 정렬하시오
SELECT * FROM book
ORDER BY price ASC, bookname DESC;  -- 앞에있는 가격이 1차조건 뒤에 책이름이 2차조건

COMMIT;