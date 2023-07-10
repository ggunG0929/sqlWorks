-- ROWNUM : 순번을 정해놓은 SUDO COLUMN이다.
-- 조회되는 행의 수를 제한할 때 사용
SELECT ROWNUM, bno, title, writer, content
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10
-- WHERE ROWNUM > 10 AND ROWNUM <= 20 -> 조회 X, 1을 포함해야 조회됨
ORDER BY bno;

-- 11 ~ 20번까지 검색
SELECT * FROM
(SELECT ROWNUM RN, bno, title, writer, content
FROM board)
WHERE RN > 10 AND RN <= 20;     -- 별칭(RN)을 사용해야 함

-- ROWNUM의 올바른 사용
CREATE TABLE ex_score(
    name    VARCHAR2(10),
    score   NUMBER
);

INSERT INTO ex_score VALUES ('김하나', 94);
INSERT INTO ex_score VALUES ('이하나', 100);
INSERT INTO ex_score VALUES ('박하나', 97);
INSERT INTO ex_score VALUES ('정하나', 87);
INSERT INTO ex_score VALUES ('조하나', 87);
INSERT INTO ex_score VALUES ('안하나', 91);
INSERT INTO ex_score VALUES ('유하나', 66);
INSERT INTO ex_score VALUES ('오하나', 80);
INSERT INTO ex_score VALUES ('한하나', 80);
INSERT INTO ex_score VALUES ('성하나', 95);

SELECT * FROM ex_score;

-- 점수가 높은 순으로 5명 검색(잘못된 검색)
SELECT ROWNUM, name, score
    FROM ex_score
    WHERE ROWNUM <= 5
    ORDER BY score DESC;
    
-- 올바른 검색(서브 쿼리 방식 - 인라인 뷰)
SELECT ROWNUM, name, score FROM
(SELECT ROWNUM, name, score
    FROM ex_score
    ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- 성적 순위
SELECT name, score,
    -- COUNT(*) 학생수
    RANK() OVER(ORDER BY score DESC) RANK,
    DENSE_RANK() OVER(ORDER BY score DESC) DENSE_RANK
FROM ex_score;

DROP TABLE ex_score;
