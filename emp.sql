--사원 테이블
CREATE TABLE emp(
    --칼럼 이름 자료형
    empno   NUMBER(3) PRIMARY KEY,    -- 사원번호  --콤마 다음에는 소수점자리
    ename   VARCHAR2(20) NOT NULL,    -- 사원이름  --한글 1글자당 3바이트라 7자이상되면 에러
    sal     NUMBER(10),               -- 급여
    createdate DATE DEFAULT SYSDATE   -- 등록일
);

-- 사원의 성별 칼럼 추가(ALTER ~ ADD)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- 사원의 성별 자료형을 변경(MODIFY) VARCHAR2(10)
ALTER TABLE emp MODIFY gender VARCHAR2(10);

-- 사원 추가
INSERT INTO emp VALUES (100, '이강', 2500000, SYSDATE);
INSERT INTO emp VALUES (101, '김산', 3000000, SYSDATE);
INSERT INTO emp VALUES (102, '오상식', 5000000, SYSDATE);
INSERT INTO emp VALUES (103, '박신입', '', SYSDATE);
INSERT INTO emp VALUES (104, '서울시', 1500000, SYSDATE, '여'); -- 홑따옴표로

-- 사원 조회
SELECT * FROM emp;

-- 사원번호, 사원이름, 급여를 검색하시오
SELECT empno as 사번, ename as 사원명, sal as 급여 FROM emp;

-- 급여가 없는 사람을 검색하시오
SELECT * 
FROM emp 
WHERE sal IS NULL; -- null이 아닌 구문(is not null)  -- true인 값을 보여준다

-- 급여가 300만원 이하인 사람을 검색하시오
SELECT *
FROM emp
WHERE sal <= 3000000
ORDER BY sal DESC; -- 맨 끝에만 세미콜론 붙이기

-- 급여가 많은 순으로 정렬하시오
SELECT *
FROM emp
ORDER BY sal DESC;

-- 사원의 수를 구하시오
SELECT COUNT(*) as 사원수
FROM emp;

-- 사원의 급여의 합계와 평균을 구하시오
SELECT SUM(sal) 급여합계, AVG(sal) 급여평균
FROM emp;

-- 성별이 '여'인 사원을 '여자'로 변경하시오
UPDATE emp
SET gender='여자'
WHERE empno = 104;
/*
-- 이름이 서울시인 사원을 검색하시오
SELECT * FROM emp
WHERE ename = '서울시'; -- 사원번호로 찾는 것이 제일 좋음
*/

-- 이름이 서울시인 사원 삭제
DELETE FROM emp
WHERE ename='서울시';

COMMIT;

ROLLBACK; -- commit전이면 복원(취소) 가능