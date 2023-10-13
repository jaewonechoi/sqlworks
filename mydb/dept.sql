-- dept 테이블
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,
    deptname  VARCHAR2(20) NOT NULL,
    location  VARCHAR2(20) NOT NULL
);

/* 부서 자료 추가 */
INSERT INTO dept(deptid, deptname, location)
VALUES(10, '전산팀', '서울');
INSERT INTO dept(deptid, deptname, location)
VALUES(20, '관리팀', '인천');
INSERT INTO dept(deptid, deptname, location)
VALUES(30, '마케팅팀', '수원');

SELECT * FROM dept;

-- 부서이름에서 팀을 제외한 이름을 출력하시오
SELECT SUBSTR(deptname, 1, (LENGTH(deptname)-1)) 팀명
FROM dept;

SELECT REPLACE(deptname, '팀', '') 팀명 FROM dept;

COMMIT;