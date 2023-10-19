
-- 작업 전에 사용 db 실행해야 함
use mydb;

create table test(
	no int,				-- 숫자형
    msg varchar(100)	-- 문자자료형
);

insert into test values (1, '좋은 하루 되세요~');
insert into test values (2, 'Good Luck!!');

select * from test;
commit;