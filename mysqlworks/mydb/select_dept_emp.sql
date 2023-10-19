use mydb;

select * from department;
select * from employee;

-- 삽입 오류 : 부서 테이블에 아이디가 30이 없으므로 에러
insert into employee values (106, '양신입', 25, null, 30);

-- 급여가 400만원 이상이고 부서번호가 10인 사원을 검색하시오
select * from employee
where sal >= 4000000 and deptid = 10;

-- 급여가 많은 순으로 정렬하시오
select * from employee
order by sal desc;

-- 급여가 없는 사원을 검색하시오
select * from employee
where sal is null;

-- 사원의 총인원, 급여 총액과 급여 평균을 구하시오
select count(*) 총인원,
	   sum(sal) 급여총액,
       round(avg(sal), 0) 급여평균
from employee;

-- 부서별 급여 총액을 구하시오
select deptid,
	   sum(sal) 급여총액,
       round(avg(sal), -2) 급여평균
from employee
group by deptid;

-- 부서이름, 부서별 급여 총액을 구하시오(조인)
select a.deptid,
	   b.deptname,
	   sum(a.sal) 급여총액,
       round(avg(a.sal), -2) 급여평균
from employee a, department b
where b.deptid = a.deptid
group by a.deptid, b.deptid;

-- 부서이름, 부서별 급여 소계, 총계 (조인)
select b.deptid,
	   b.deptname,
	   sum(a.sal) 급여총액,
       round(avg(a.sal), -2) 급여평균
from employee a join department b
on b.deptid = a.deptid
group by deptid, deptname with rollup;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오(조인)
-- 동등 조인
select a.deptid,
	   a.deptname,
	   b.*
from department a, employee b
where a.deptid = b.deptid
order by b.empid;

-- 내부 조인 join ~ on
select a.deptid,
	   a.deptname,
	   b.*
from department a join employee b
on a.deptid = b.deptid
order by b.empid;

-- 내부 조인 join ~ using
select a.deptid,
	   a.deptname,
	   b.*
from department a join employee b
using (deptid)
order by b.empid;

-- 최고 급여와 최저 급여를 받는 사원의 정보를 검색하시오
select * from employee
where sal = (select max(sal) from employee)
or sal = (select min(sal) from employee);

-- '백두산' 사원의 급여를 430만원으로 수정하시오
update employee set sal = 4300000
where empid = 102;	-- 기본키로만 변경이 가능함

-- 사원의 급여 순위를 구하시오
select a.*,
	   rank() over(order by sal desc) 급여순위1,
	   dense_rank() over(order by sal desc) 급여순위2
from employee a;