-- �μ� ���̺�� ��� ���̺� ����(JOIN)
-- JOIN - 1�� �̻��� ���̺��� �����Ͽ� ����ϴ� ���

-- �����ȣ, �����, �μ���ȣ, �μ����� ����Ͻÿ�
SELECT emp.empno, emp.ename, emp.deptno, emp.sal, dep.deptname
FROM employee emp, dept dep -- as���� ������
WHERE emp.deptno =dep.deptno; -- �μ��ڵ�� ����