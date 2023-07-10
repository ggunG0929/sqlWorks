SELECT * FROM employee;

-- 급여 총액
SELECT SUM(sal)
FROM employee;

-- 부서별 급여 총액
SELECT deptno, SUM(sal)
FROM employee
GROUP BY deptno;

-- 부서별 급여 총액이 500만원 이상인 자료 검색
SELECT deptno, SUM(sal)
FROM employee
GROUP BY deptno
HAVING SUM(sal) > 5000000;

-- 부서별 급여 소계와 총계
SELECT deptno, SUM(sal)
FROM employee
GROUP BY ROLLUP(deptno);

-- 급여 누적값 계산
-- SUM(칼럼명) OVER(ORDER BY 칼럼명)
SELECT empno,
        ename,
        sal,
        SUM(sal) OVER(ORDER BY empno) sal_sum,  -- 오름차순 누적
        SUM(sal) OVER(ORDER BY empno 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) sal_sum2,     -- 오름차순 누적(이전 행과 현재형 더하기)
        SUM(sal) OVER(ORDER BY empno
            ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) sal_sum3      -- 내림차순 누적(현재형과 다음행 더하기)
FROM employee;
