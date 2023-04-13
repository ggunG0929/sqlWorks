--���� Ÿ�� �Լ�
--������ ���̺� : dual
SELECT ABS(-10), ABS(10) FROM dual;

--�ݿø� : ROUND(��, �ڸ���)
SELECT ROUND(3.875, 2) FROM dual;

--sal�� 30�Ϸ� ���� �� �Ҽ� �ڸ����� ���� �ݿø��� �� ���
SELECT sal �޿�,
       sal/30 �ϱ�,
       ROUND(sal/30,1) ���1,
       ROUND(sal/30,0) ���2,
       ROUND(sal/30,-1) ���3
FROM employee;

--sal�� 30�Ϸ� ���� �� �Ҽ� �ڸ����� ���� ����(����)�� �� ���
SELECT sal �޿�,
       sal/30 �ϱ�,
       TRUNC(sal/30,1) ���1,
       TRUNC(sal/30,0) ���2,
       TRUNC(sal/30,-1) ���3
FROM employee;

--���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
SELECT custid ����ȣ, ROUND(AVG(saleprice),-2) ����ֹ��ݾ�
FROM orders
GROUP BY custid;

SELECT custid ����ȣ, COUNT(*) �ֹ���, SUM(saleprice) �Ѿ�
FROM orders
GROUP BY custid;

SELECT custid ����ȣ, ROUND(SUM(saleprice)/COUNT(*),-2) ��ձݾ�
FROM orders
GROUP BY custid;

SELECT * FROM customer;

--���� Ÿ�� �Լ�
SELECT LOWER('ABCD') FROM dual;

--SUBSTR(����,�ε���,���ڼ�)
SELECT SUBSTR('ABC',1,2) RESULT FROM dual;
--REPLACE(����, ��������, ���ο��) --�ڷắ��x 
SELECT REPLACE('ABC','A','E') RESULT FROM dual;
--CONCAT(����1, ����2) - ���� ����
SELECT CONCAT('A','B') RESULT FROM dual;
--���Ῥ���� - '||'
SELECT '�ȳ�' || '�ϼ���' RESULT FROM dual;
--LPAD(����, ���ڼ�, ��ȣ) - ��ȣ�� ���ʺ��� ä��
SELECT LPAD('cloud',10,'*') RESULT FROM dual;
SELECT RPAD('cloud',10,'*') RESULT FROM dual;

--�μ��̸����� ó������ �����ؼ� 2���� ���� ���
SELECT SUBSTR(deptname,1,2) �μ���
FROM dept;

--���� ���� '�߱�'�� ���Ե� ������ '��'�� �����Ͽ� �˻�
SELECT * FROM book;

SELECT bookid,
    REPLACE(bookname,'�߱�','��') bookname
FROM book;

--�½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� �˻�
SELECT bookname,
       LENGTH(bookname) ���ڼ�,
       LENGTHB(bookname) ����Ʈ��
FROM book
WHERE publisher = '�½�����';

--��¥ �Լ�
--20�� ���� ��¥ ���
SELECT SYSDATE - 20 FROM dual;
--3���� ���� ��¥ ���
SELECT ADD_MONTHS(SYSDATE,3) ���
FROM dual;
--3���� ���� ��¥ ���
SELECT ADD_MONTHS(SYSDATE,-3) ���
FROM dual;
--Ư������ 3���� ���� ��¥ ��� (- / : ��¥��ȣ �������)
SELECT ADD_MONTHS('2023-4-1',-3) ���
FROM dual;
--��¥�� �ð�
SELECT SYSTIMESTAMP FROM dual;

--�ֹ���ȣ�� 6~10 ������ ������ �ֹ��Ͽ� 3������ ���� ���� ���Ͻÿ�
--1. �ֹ���ȣ�� 6~10�� ���� �˻�
--2. �ֹ��Ͽ� 3���� ���ϱ�
SELECT orderid �ֹ���ȣ,
       ADD_MONTHS(orderdate,3) ���ϱ���,
       ADD_MONTHS(orderdate,-3) ������
FROM orders
WHERE orderid >=6 AND orderid <=10;

SELECT orderid, ADD_MONTHS(orderdate,3) --�ؿ��� ���̴ϱ� orderid �� ���� ����־�� ��
FROM orders
WHERE orderid BETWEEN 6 AND 10;

--�ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ����� �� ���� ���� ���Ͻÿ�
--MONTHS_BETWEEN(���ĳ�¥, ������¥)
SELECT orderid �ֹ���ȣ, orderdate �ֹ���,
    TRUNC(MONTHS_BETWEEN(SYSDATE,orderdate),0) �Ѱ�����
FROM orders
WHERE orderid = 10;

--������ �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
SELECT orderid �ֹ���ȣ,
        orderdate �ֹ���,
        orderdate +10 Ȯ����
FROM orders;

--�ڵ� Ÿ�� ��ȯ
SELECT 1+'2' FROM dual;

--���� Ÿ�� ��ȯ
--���ڸ� ���� �������� ��ȯ
SELECT TO_NUMBER('120') ��� FROM dual;

--��¥ ����
SELECT TO_DATE('2022-06-30','YY-MM-DD') FROM dual;

--��¥ ���� ��ȯ
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') ��¥,
       TO_CHAR(SYSDATE,'YYYY') ����,
       TO_CHAR(SYSDATE,'MM') ��,
       TO_CHAR(SYSDATE,'DD') ��
FROM dual;

--�ð� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS AM') �ð�����, --���� ���ĸ� am���� �Է��ص� ���Ķ�� ǥ��
       TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS AM') ��¥�ͽð�
FROM dual;


--�� �̸����� ���� ���� ���� ����� �ο����� ���Ͻÿ�
--��Ʈ: GROUP BY��, SUBSTR(), COUNT(*)
SELECT SUBSTR(name,1,1), COUNT(*) �ο�
FROM customer
GROUP BY SUBSTR(name,1,1);
