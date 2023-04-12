--��� ���̺�
CREATE TABLE emp(
    --Į�� �̸� �ڷ���
    empno   NUMBER(3) PRIMARY KEY,    -- �����ȣ  --�޸� �������� �Ҽ����ڸ�
    ename   VARCHAR2(20) NOT NULL,    -- ����̸�  --�ѱ� 1���ڴ� 3����Ʈ�� 7���̻�Ǹ� ����
    sal     NUMBER(10),               -- �޿�
    createdate DATE DEFAULT SYSDATE   -- �����
);

-- ����� ���� Į�� �߰�(ALTER ~ ADD)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- ����� ���� �ڷ����� ����(MODIFY) VARCHAR2(10)
ALTER TABLE emp MODIFY gender VARCHAR2(10);

-- ��� �߰�
INSERT INTO emp VALUES (100, '�̰�', 2500000, SYSDATE);
INSERT INTO emp VALUES (101, '���', 3000000, SYSDATE);
INSERT INTO emp VALUES (102, '�����', 5000000, SYSDATE);
INSERT INTO emp VALUES (103, '�ڽ���', '', SYSDATE);
INSERT INTO emp VALUES (104, '�����', 1500000, SYSDATE, '��'); -- Ȭ����ǥ��

-- ��� ��ȸ
SELECT * FROM emp;

-- �����ȣ, ����̸�, �޿��� �˻��Ͻÿ�
SELECT empno as ���, ename as �����, sal as �޿� FROM emp;

-- �޿��� ���� ����� �˻��Ͻÿ�
SELECT * 
FROM emp 
WHERE sal IS NULL; -- null�� �ƴ� ����(is not null)  -- true�� ���� �����ش�

-- �޿��� 300���� ������ ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE sal <= 3000000
ORDER BY sal DESC; -- �� ������ �����ݷ� ���̱�

-- �޿��� ���� ������ �����Ͻÿ�
SELECT *
FROM emp
ORDER BY sal DESC;

-- ����� ���� ���Ͻÿ�
SELECT COUNT(*) as �����
FROM emp;

-- ����� �޿��� �հ�� ����� ���Ͻÿ�
SELECT SUM(sal) �޿��հ�, AVG(sal) �޿����
FROM emp;

-- ������ '��'�� ����� '����'�� �����Ͻÿ�
UPDATE emp
SET gender='����'
WHERE empno = 104;
/*
-- �̸��� ������� ����� �˻��Ͻÿ�
SELECT * FROM emp
WHERE ename = '�����'; -- �����ȣ�� ã�� ���� ���� ����
*/

-- �̸��� ������� ��� ����
DELETE FROM emp
WHERE ename='�����';

COMMIT;

ROLLBACK; -- commit���̸� ����(���) ����