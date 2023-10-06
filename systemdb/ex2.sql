-- 테이블 생성(CREATE)
CREATE TABLE ex2(
    col_date  DATE,     -- 날짜 자료형(시스템의 현재 날짜)
    col_timestamp TIMESTAMP  --날짜와 시간 자료형
);

INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);
INSERT INTO ex2(hire_date) VALUES ('2023-09-01');  -- 한개만 나오게할땐 ex2()괄호안에 넣어야함

COMMIT;

SELECT * FROM ex2;  -- * FROM ex2 ex2의 모든걸 출력

-- 테이블 변경(ALTER) : 입사일 칼럼 추가
ALTER TABLE ex2 ADD hire_date VARCHAR2(20);

-- 테이블 삭제
DROP TABLE ex2; --오타나거나 잘못만들었을경우 테이블을 삭제하고 다시 위에부터 커서를 끝에 놓고 실행