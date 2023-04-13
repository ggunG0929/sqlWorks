--function
--null값 처리하기

SELECT *
FROM customer
WHERE phone IS NULL;

--NVL(칼럼값, 특정값) : 칼럼이름 NULL인 경우에 특정값을 출력(입력값 수정이 X), NULL이 아니면 칼럼값 출력
SELECT custid, name, address, NVL(phone, '010-1234-5678') phone
FROM customer;


CREATE TABLE K1(
    ID VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('가',5);
INSERT INTO K1 VALUES('나',NULL);
INSERT INTO K1 VALUES('다',5);
INSERT INTO K1 VALUES('라',NULL);
INSERT INTO K1 VALUES('마',10);

SELECT * FROM K1;

--전체 개수, 합계, 평균, 최소값
SELECT COUNT(CNT) FROM K1; --3개
--NULL을 0으로 바꿔서 함께 계산
SELECT ID, COUNT(NVL(CNT,0)) COUNT FROM K1 --5개
GROUP BY ID;

SELECT SUM(NVL(CNT,0)) SUM FROM K1; -- 20

SELECT AVG(NVL(CNT,0)) AVERAGE FROM K1; --4

--NULL을 5로 바꿔서 계산
SELECT MIN(NVL(CNT,5)) MINIMAL FROM K1; --5

COMMIT;

--RANK()함수
SELECT ename,
       sal,
       RANK() OVER(ORDER BY sal DESC) 급여_RANK, --4등이 두명일때 그 다음 등수가 6등
       DENSE_RANK() OVER(ORDER BY sal DESC) 급여_DENSE_RANK --4등이 두명일때 그 다음 등수가 5등
FROM employee;
