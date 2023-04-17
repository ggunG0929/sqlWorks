SELECT * FROM emp;

--NVL(�μ�1, �μ�2): �μ�1�� NULL�� �ƴϸ� �μ�1�� ���, NULL�̸� �μ�2�� ���
--�޿��� ���� ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE sal IS NULL;

SELECT ename, NVL(sal,0) --sal�� �������̹Ƿ� ���� ���������� �μ�2 �Է��������
FROM emp;

--���� �ڷ� �����ϱ�
UPDATE emp SET gender='����'
WHERE empno=100 OR empno=101;
UPDATE emp SET gender='����'
WHERE empno=102 OR empno=103;

--DECODE(Į��, ����, ��, ����) �Լ� -IF�Լ��� ����
--���ǿ� Ư������ ���� ������ �� �� ����
SELECT ename,
       sal,
       DECODE(gender,'����','M','F') gender
FROM emp;

--CASE WHEN ���� -����IF��
/* 
CASE
    WHEN ����1 THEN ���1
    WHEN ����2 THEN ���2
    ELSE ���3
END
*/
SELECT ename,
       sal,
       CASE
        WHEN gender='����' THEN 'M'
        ELSE 'F'
       END gender
FROM emp;

--�޿��� 350���� �̻��̸� '����'���� ǥ���ϰ�,
--250���� �̻��̸� ������ '�븮'��, �������� ������� ǥ���Ͻÿ�
SELECT ename,
       sal,
       CASE
        WHEN sal>=3500000 THEN '����'
        WHEN sal>=2500000 THEN '�븮'
        ELSE '���'
       END �޿�����
FROM emp;

--DECODE()�� �ۼ�
/*
SELECT ename,
       sal,
       DECODE(sal,5000000,'����',3000000,'�븮','���') �޿�����
FROM emp;
*/


