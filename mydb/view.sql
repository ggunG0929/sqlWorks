-- ��ø ���� - ��ȣ ���� ���� ������, FROM�� - �ζ��κ�
SELECT ROWNUM, name, score FROM
(SELECT ROWNUM, name, score
FROM ex_score
ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- JOB_INFO ���̺�
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

-- ���� �Լ� - COUNT(), SUM(), AVG()
SELECT COUNT (*) �Ѱ���,
        ROUND(AVG(min_salary), -1) �����޿����,
        AVG(max_salary) �ִ�޿����
FROM job_info;

-- ���� �޿��� 5000�޷� �̻��� ���� ���̵� �˻��Ͻÿ�
SELECT job_id, min_salary "min_sal"     -- �ֵ���ǥ�� ���� ��ũ��Ʈ������ �ҹ��ڷ� ����
FROM job_info
WHERE min_salary >= 5000;
--WHERE min_sal >= 5000;    -- ��������� SELECT ���̹Ƿ� ��Ī ��� �Ұ�

-- ���� �޿��� 5000 �޷� �̻��� ���� ���̵� �˻��� �並 �ۼ��Ͻÿ�
-- CREATE VIEW ���̸� AS ����
CREATE VIEW v_job_info
AS SELECT *
    FROM job_info
    WHERE min_salary >= 5000;
    
SELECT * FROM v_job_info;

-- �ְ�޿��� �����޿��� ���� 8000 �̻��� �������̵��� ���� �˻��Ͻÿ�
SELECT COUNT(job_id)
FROM v_job_info
WHERE max_salary-min_salary >= 8000;

-- �ְ�޿��� �����޿��� ���� 8000 �̻��� �������̵� �˻��Ͻÿ�
SELECT job_id
FROM v_job_info
WHERE max_salary-min_salary >= 8000;

-- �������̵��� �̸��� AD�� �����ϴ� �ڷḦ �˻��Ͻÿ�
SELECT *
FROM v_job_info
WHERE job_id LIKE 'AD%';

-- �� ����
DROP VIEW v_job_info;
