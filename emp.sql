--사원 테이블
CREATE TABLE emp(
    --칼럼 이름 자료형
    empno   NUMBER(3) PRIMARY KEY,    -- 사원번호  --콤마 다음에는 소수점자리
    ename   VARCHAR2(20) NOT NULL,    -- 사원이름  --한글 1글자당 3바이트라 7자이상되면 에러
    sal     NUMBER(10),               -- 급여
    createdate DATE DEFAULT SYSDATE   -- 등록일
);

-- 사원 추가
INSERT INTO emp VALUES (100, '이강', 2500000, SYSDATE);
INSERT INTO emp VALUES (101, '김산', 3000000, SYSDATE);
INSERT INTO emp VALUES (102, '오상식', 5000000, SYSDATE);
INSERT INTO emp VALUES (103, '박신입', '', SYSDATE);

-- 사원 조회
SELECT * FROM emp;

-- 사원번호, 사원이름, 급여 검색
SELECT empno as 사번, ename as 사원명, sal as 급여 FROM emp;

-- 급여가 없는 사람을 검색하시오
SELECT * 
FROM emp 
WHERE sal IS NULL; -- null이 아닌 구문(is not null)  -- true인 값을 보여준다

-- 급여가 300만원 이하인 사람을 검색하시오
SELECT *
FROM emp
WHERE sal <= 3000000;
ORDER BY sal DESC;

-- 급여가 많은 순으로 정렬하시오
SELECT *
FROM emp
ORDER BY sal DESC;

COMMIT;