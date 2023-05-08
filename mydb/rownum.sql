-- ROWNUM : ������ ���س��� SUDO COLUMN�̴�.
-- ��ȸ�Ǵ� ���� ���� ������ �� ���
SELECT ROWNUM, bno, title, writer, content
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10
-- WHERE ROWNUM > 10 AND ROWNUM <= 20 -> ��ȸ X, 1�� �����ؾ� ��ȸ��
ORDER BY bno;

-- 11 ~ 20������ �˻�
SELECT * FROM
(SELECT ROWNUM RN, bno, title, writer, content
FROM board)
WHERE RN > 10 AND RN <= 20;     -- ��Ī(RN)�� ����ؾ� ��

-- ROWNUM�� �ùٸ� ���
CREATE TABLE ex_score(
    name    VARCHAR2(10),
    score   NUMBER
);

INSERT INTO ex_score VALUES ('���ϳ�', 94);
INSERT INTO ex_score VALUES ('���ϳ�', 100);
INSERT INTO ex_score VALUES ('���ϳ�', 97);
INSERT INTO ex_score VALUES ('���ϳ�', 87);
INSERT INTO ex_score VALUES ('���ϳ�', 87);
INSERT INTO ex_score VALUES ('���ϳ�', 91);
INSERT INTO ex_score VALUES ('���ϳ�', 66);
INSERT INTO ex_score VALUES ('���ϳ�', 80);
INSERT INTO ex_score VALUES ('���ϳ�', 80);
INSERT INTO ex_score VALUES ('���ϳ�', 95);

SELECT * FROM ex_score;

-- ������ ���� ������ 5�� �˻�(�߸��� �˻�)
SELECT ROWNUM, name, score
    FROM ex_score
    WHERE ROWNUM <= 5
    ORDER BY score DESC;
    
-- �ùٸ� �˻�(���� ���� ��� - �ζ��� ��)
SELECT ROWNUM, name, score FROM
(SELECT ROWNUM, name, score
    FROM ex_score
    ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- ���� ����
SELECT name, score,
    -- COUNT(*) �л���
    RANK() OVER(ORDER BY score DESC) RANK,
    DENSE_RANK() OVER(ORDER BY score DESC) DENSE_RANK
FROM ex_score;

DROP TABLE ex_score;
