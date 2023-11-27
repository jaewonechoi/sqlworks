-- bookmall

select * from book;

-- 도서를 이름순으로 정렬
select * from book
order by bookname;

-- 도서를 가격이 높은순으로 정렬
select * from book
order by price desc;

-- 도서이름에 '축구'가 포함된 출판사를 검색
select publisher
from book
where bookname like '%축구%';

-- 도서이름에 '축구'가 포함되고 가격이 10,000원 이상인 도서 검색
select * from book
where price >= 10000 
and bookname like '%축구%';

-- 도서 테이블에 있는 중복된 이름은 제외하고 모든 출판사를 검색
select distinct publisher from book;

-- 도서 가격이 10,000원 이상 20,000원 이하인 도서 검색
select * from book
where price >= 10000 and price <= 20000;

select * from book
where price between 10000 and 20000;

-- 도서 가격이 13,000원이 아닌 도서 검색
select * from book
where not price = 13000;

select * from book
where price <> 13000;

select * from book
where price != 13000;

-- 고객을 이름순으로 정렬하시오(오름차순)
select * from customer
order by name asc;

-- 전화번호가 없는 고객을 검색하시오
select * from customer
where phone = '';

-- 주소가 대한민국인 고객을 검색하시오
select * from customer
where address like '%대한민국%';

-- 주소가 대한민국이 아닌 고객을 검색하시오
select * from customer
where address not like '%대한민국%';

-- 고객의 총인원을 구하시오
select count(*) 총인원
from customer;

-- 도서 가격이 가장 높은 도서를 검색하시오
-- 서브쿼리를 메인 쿼리에 접목
select max(price) 
from book;

select *
from book
where price = (select max(price) from book);

-- 주문 테이블에서 주문가격에 총판매액과 총평균액을 구하시오
select sum(saleprice) 총판매액,
	   round(avg(saleprice), 0) 평균금액
from orders;

-- 고객별로 주문한 도서의 총 판매액을 계산
-- 출력 - 고객아이디, 도서수량, 총판매액
select custid,
	   count(*) 도서수량,
	   sum(saleprice) 총판매액
from orders
group by custid;

-- 고객별(custid)로 주문한 도서의 총판매액을 계산
-- 3권 이상 주문한 자료를 검색
select custid,
	   count(*) 도서수량,
	   sum(saleprice) 총판매액
from orders
group by custid
   having count(*) >= 3;

