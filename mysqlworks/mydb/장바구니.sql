-- 먼저 db를 선택함
use mydb;

create table 장바구니(
	번호	int primary key auto_increment,
    아이템 varchar(20),
	가격 int
);

insert into 장바구니(아이템, 가격) values ('두부', 2000);
insert into 장바구니(아이템, 가격) values ('두부', 2000);
insert into 장바구니(아이템, 가격) values ('두부', 2000);

create table 주문테이블(
	주문번호	 varchar(20) primary key,
    고객번호	 varchar(20),
    주문일	 varchar(20),
    주문가격	 int,
    배송도시	 varchar(20),
    배송완료일	 varchar(20),
    결제금액	 int,
    할인금액	 int
);