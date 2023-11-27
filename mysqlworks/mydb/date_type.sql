-- 날짜
select now() from dual;

create table date_test1(
	reg_date DATE,
    hire_date DATE
);

INSERT INTO date_test1 VALUES (now(), '2023-10-01');
INSERT INTO date_test1 VALUES (now(),  STR_TO_DATE('2023-10-11', '%Y-%m-%d'));

create table date_test2(
	reg_date DATE DEFAULT (current_date()),		-- 날짜
    create_date TIMESTAMP default now(),		-- 날짜와 시간
    hire_date DATE								-- 특정한 날짜
);
-- 날짜 입력시 '-'를 사용함
INSERT INTO date_test2(hire_date) VALUES ('2023-07-31');
INSERT INTO date_test2(hire_date) VALUES ('2023-10-05');

select * from date_test1;
select * from date_test2;

drop table date_test2;