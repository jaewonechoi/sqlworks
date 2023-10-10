-- 부서와 사원 테이블 생성
CREATE TABLE department(
    deptid    NUMBER PRIMARY KEY,   -- 기본키
    deptname  VARCHAR2(20) NOT NULL, -- NULL 불허
    location  VARCHAR2(20) NOT NULL
);

/* 부서 자료 추가 */
INSERT INTO department(deptid, deptname, location)
VALUES(10, '전산팀', '서울');
INSERT INTO department(deptid, deptname, location)
VALUES(20, '관리팀', '인천');
INSERT INTO department(deptid, deptname, location)
VALUES(30, '마케팅팀', '수원');

-- 자료 검색 (특정 칼럼 검색)
SELECT deptid, deptname FROM department;

-- 모든 칼럼 검색('*' 사용)
SELECT * FROM department;

-- 특정한 데이터(행:로우) 검색
-- 부서이름이 전산팀인 row(레코드) 검색
SELECT * FROM department 
WHERE deptname = '전산팀';

-- 자료 수정(부서번호가 20번인 로우의 부서이름을 변경 관리팀 -> 경영팀)
UPDATE department SET deptname = '경영팀'
WHERE deptid = 20;

-- 자료 삭제(부서번호가 30번인 마케팅팀 삭제)
-- 삭제 이상(자식이 참조하고 있으므로 삭제 불가능)
DELETE FROM department
WHERE deptid = 10;

ROLLBACK;   -- 실행취소 COMMIT 전에 실행해야 적용됨

COMMIT; -- 영구 저장
