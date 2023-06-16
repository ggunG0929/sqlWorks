-- 회원 테이블 생성
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

-- 게시판 생성(글번호(자동순번-SEQUENCE), 글제목, 글내용, 작성일, 수정일, 조회수, 아이디(외래키))
CREATE TABLE t_board(
    bnum        NUMBER(4) PRIMARY KEY,
    title       VARCHAR2(100) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate  TIMESTAMP,
    hit         NUMBER DEFAULT 0,
    memberid    VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_MemberBoard FOREIGN KEY(memberid)
    REFERENCES t_member(memberid) ON DELETE CASCADE
);

-- 자동순번 전체 코드(CACHE 기본값 20 - 사용안함)
CREATE SEQUENCE b_seq;
--    INCREMENT BY 1
--    START WITH 1
--    MINVALUE 1
--    MAXVALUE 9999
--    NOCYCLE
--    NOCACHE;

-- 파일 업로드 칼럼 추가
ALTER TABLE t_board ADD fileupload VARCHAR2(100);

INSERT INTO t_member(memberid, passwd, name, gender) VALUES ('cloud', 'm12345', '김기용', '남');
INSERT INTO t_board(bnum, title, content, memberid) VALUES (b_seq.NEXTVAL, '가입인사', '안녕하세요. 반갑습니다.', 'cloud');

SELECT * FROM t_member;
SELECT * FROM t_board;

-- id 중복 체크
SELECT DECODE(COUNT(*), 1, 'true', 'false') AS result
FROM t_member WHERE memberid = 'cloud';

-- 임의로 추가
--ALTER SEQUENCE b_seq NOCACHE;

DROP SEQUENCE b_seq;
DROP TABLE t_board;
