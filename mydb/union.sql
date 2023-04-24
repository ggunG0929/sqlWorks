-- ���� ����
CREATE TABLE job(
    job_id  VARCHAR2(10),
    salary  NUMBER(5)   -- �޷��� �Է�
);

INSERT INTO job VALUES ('manager',1300);
INSERT INTO job VALUES ('manager',1500);
INSERT INTO job VALUES ('manager',1900);
INSERT INTO job VALUES ('helper',1000);
INSERT INTO job VALUES ('helper',1500);
INSERT INTO job VALUES ('helper',2500);

-- job ��ü�� ������ �޿��� ���հ� ���ϱ�
SELECT COUNT(*) ����, SUM(salary) ���հ�
FROM job;

-- ���� ���̵� ������ �޿��� ���հ� ���ϱ�
SELECT job_id, COUNT(job_id) ����, SUM(salary) ���հ�    -- ī��Ʈ�ȿ� *�̾ ������
FROM job
GROUP BY job_id;

-- ���� ���̵� ������ �޿��� �ִ밪 ���ϱ�
SELECT job_id, COUNT(*) ����, MAX(salary) �ִ�޿�
FROM job
GROUP BY job_id;

-- ���� ���̵� ������ �޿��� �ּҰ� ���ϱ�
SELECT job_id, COUNT(*) ����, MIN(salary) �ּұ޿�
FROM job
GROUP BY job_id;

-- ���� ���̵� ������ �޿��� �ִ밪�� �ּҰ� ���ϱ�
-- ����
SELECT job_id, COUNT(*) ����, MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM job
GROUP BY job_id;
-- �����Դ�
SELECT job_id, COUNT(*) ����, MAX(salary) RESULT
FROM job
GROUP BY job_id
UNION
SELECT job_id, COUNT(*) ����, MIN(salary) RESULT
FROM job
GROUP BY job_id;

COMMIT;

SELECT * FROM job;
