-- 중첩 쿼리 - 괄호 안을 먼저 실행함, FROM절 - 인라인뷰
SELECT ROWNUM, name, score FROM
(SELECT ROWNUM, name, score
FROM ex_score
ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- JOB_INFO 테이블
CREATE TABLE job_info(
    job_id VARCHAR(10),
    min_salary NUMBER,
    max_salary NUMBER
);

INSERT INTO job_info VALUES ('AD_PRES', 20080, 40000);
INSERT INTO job_info VALUES ('AD_VP', 15000, 30000);
INSERT INTO job_info VALUES ('AD_ASST', 3000, 6000);
INSERT INTO job_info VALUES ('FI_MGR', 8200, 16000);
INSERT INTO job_info VALUES ('FI_ACCOUNT', 4200, 9000);
INSERT INTO job_info VALUES ('AC_MGR', 8200, 16000);
INSERT INTO job_info VALUES ('AC_ACCOUNT', 4200, 9000);

COMMIT;

-- 집계 함수 - COUNT(), SUM(), AVG()
SELECT COUNT (*) 총개수,
        ROUND(AVG(min_salary), -1) 최저급여평균,
        AVG(max_salary) 최대급여평균
FROM job_info;

-- 최저 급여가 5000달러 이상인 직업 아이디를 검색하시오
SELECT job_id, min_salary "min_sal"     -- 쌍따옴표를 쓰면 스크립트에서도 소문자로 나옴
FROM job_info
WHERE min_salary >= 5000;
--WHERE min_sal >= 5000;    -- 실행순서가 SELECT 전이므로 별칭 사용 불가

-- 최저 급여가 5000 달러 이상인 직업 아이디를 검색한 뷰를 작성하시오
-- CREATE VIEW 뷰이름 AS 구문
CREATE VIEW v_job_info
AS SELECT *
    FROM job_info
    WHERE min_salary >= 5000;
    
SELECT * FROM v_job_info;

-- 최고급여와 최저급여의 차가 8000 이상인 직업아이디의 수를 검색하시오
SELECT COUNT(job_id)
FROM v_job_info
WHERE max_salary-min_salary >= 8000;

-- 최고급여와 최저급여의 차가 8000 이상인 직업아이디를 검색하시오
SELECT job_id
FROM v_job_info
WHERE max_salary-min_salary >= 8000;

-- 직업아이디의 이름이 AD로 시작하는 자료를 검색하시오
SELECT *
FROM v_job_info
WHERE job_id LIKE 'AD%';

-- 뷰 삭제
DROP VIEW v_job_info;
