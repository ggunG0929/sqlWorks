-- 날짜 자료형
CREATE TABLE ex2(
    col_date DATE,
    col_timestamp TIMESTAMP
);

-- hire_date VARCHAR2(20)
-- INSERT INTO ex2 VALUES ('2023-01-25');

-- 자료 삽입
INSERT INTO ex2 VALUES (SYSDATE,SYSTIMESTAMP);
INSERT INTO ex2 VALUES (SYSDATE,SYSTIMESTAMP);

-- 자료 검색
SELECT * FROM ex2;