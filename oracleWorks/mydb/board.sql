--board 테이블
--테이블 이름: board / 칼럼: 글번호(숫자), 글제목, 작성자, 글내용, 등록일(날짜)

CREATE TABLE board(
    bno     NUMBER(5) PRIMARY KEY,
    title   VARCHAR2(200) NOT NULL,
    writer  VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE
);
--시퀀스(일련번호, 자동순번)
CREATE SEQUENCE seq;

--추천수 칼럼을 추가하시오(칼럼명: cnt, 자료형: NUMBER DEFAULT 0)
ALTER TABLE 테이블이름 ADD 칼럼명 자료형
ALTER TABLE board
ADD cnt NUMBER DEFAULT 0;

DESC board;

--게시글 추가
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'가입인사','강남','안녕하세요, 가입인사 드려요');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'공지사항입니다.','관리자','가입인사를 남겨주세요');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'가입인사입니다.','이강','안녕하세요~');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'좋은 하루','긴하루','좋은 하루 되세요~');

----3번 게시글을 삭제하시오
--DELETE
--FROM board
--WHERE bno = 3;

--시퀀스 삭제
--DROP SEQUENCE seq;

--테이블 삭제
--DROP TABLE board;

--게시글 검색
SELECT * FROM board;

SELECT * FROM board
ORDER BY regdate DESC;

--재귀 복사(자료 삽입)
--INSERT INTO 테이블이름(칼럼) VALUES(X)(SELECT 칼럼 FROM 테이블이름)
INSERT INTO board(bno, title, writer, content)
(SELECT seq.nextval, title, writer, content FROM board);

SELECT ROWNUM, bno, title, content
FROM board
WHERE ROWNUM >0 AND ROWNUM <=10;
--WHERE ROWNUM >10 AND ROWNUM <=20; --ROWNUM은 1을 포함해야 함

--페이지 처리
SELECT *
FROM
    (SELECT ROWNUM rn, bno, title, content
    FROM board)
WHERE rn >10 AND rn <=20; --ROWNUM의 별칭을 사용하면 가능함

--ROWID
--데이터를 구분하는 유일한 값
--ROWID를 통해서 데이터 파일, 어느 블럭에 저장되어있는지 알 수 있음
SELECT ROWID, bno, title, content
FROM board
WHERE ROWID='AAAS1JAAHAAAAFrAAA'; 

--작성자가 관리자인 게시글을 검색하시오
SELECT * FROM board
WHERE writer = '관리자'; --선생님은 bno=2로 검색

--게시글의 작성자를 '관리자'에서 'admin'으로 변경하시오
--UPDATE 테이블이름 SET 칼럼 = 변경값 WHERE절
UPDATE board SET writer = 'admin'
WHERE writer = '관리자';