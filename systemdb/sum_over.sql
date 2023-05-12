SELECT * FROM employee;

-- �޿� �Ѿ�
SELECT SUM(sal)
FROM employee;

-- �μ��� �޿� �Ѿ�
SELECT deptno, SUM(sal)
FROM employee
GROUP BY deptno;

-- �μ��� �޿� �Ѿ��� 500���� �̻��� �ڷ� �˻�
SELECT deptno, SUM(sal)
FROM employee
GROUP BY deptno
HAVING SUM(sal) > 5000000;

-- �μ��� �޿� �Ұ�� �Ѱ�
SELECT deptno, SUM(sal)
FROM employee
GROUP BY ROLLUP(deptno);

-- �޿� ������ ���
-- SUM(Į����) OVER(ORDER BY Į����)
SELECT empno,
        ename,
        sal,
        SUM(sal) OVER(ORDER BY empno) sal_sum,  -- �������� ����
        SUM(sal) OVER(ORDER BY empno 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) sal_sum2,     -- �������� ����(���� ��� ������ ���ϱ�)
        SUM(sal) OVER(ORDER BY empno
            ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) sal_sum3      -- �������� ����(�������� ������ ���ϱ�)
FROM employee;
