-- Members 프로젝트
use mydb;

-- 회원 테이블
create table t_member(
	memberid	varchar(20),				-- 회원 아이디(기본키)
    passwd		varchar(20) not null,		-- 비밀번호
    name		varchar(30) not null,		-- 이름
    gender		varchar(10),				-- 성별
    joindate	timestamp default now(),	-- 가입일
    primary key(memberid)
);

-- 게시판 테이블
create table t_board(
	bnum	int primary key auto_increment,		-- 게시글 번호(기본키)	-- 자동순번
    title	varchar(100) not null,				-- 글 제목
    content 	text,							-- 글 내용
    regdate 	timestamp default now(),		-- 작성일
    modifydate	timestamp,						-- 수정일
    hit		int default 0,						-- 조회수
    memberid	varchar(20),					-- 작성자(외래키)
    fileupload	varchar(50),					-- 첨부파일
    constraint fk_member_board foreign key(memberid)	-- 외래키 제약조건(회원 탈퇴시 게시글도 삭제됨)
    references t_member(memberid) on delete cascade
);

-- 댓글 테이블
create table t_reply(
	rno			int primary key auto_increment,		-- 댓글번호(기본키) 자동순번
    bnum		int not null,						-- 게시글 번호(외래키)
    rcontent	text not null,						-- 댓글 내용
    replyer		varchar(30) not null,				-- 작성자
    rdate		timestamp default now(),			-- 작성일
    rupdate		timestamp,							-- 수정일
	constraint fk_reply_board foreign key(bnum)		-- 외래키 제약조건(게시글 삭제시 댓글도 삭제됨)
    references t_board(bnum) on delete cascade
);

-- 댓글 추가
insert into t_reply(bnum, rcontent, replyer) values(1, '내용에 대한 댓글입니다.', 'sunny');

-- 댓글 검색
select * from t_reply;

-- 댓글 삭제
delete from t_reply where rno=7;

-- 특정 댓글 검색
select * from t_reply where rno = 8;

-- 댓글 수정
update t_reply set rcontent='내용수정' where rno = 8; 

-- 게시글 쓰기
insert into t_board(title, content, memberid) values('가입인사', '안녕하세요. 가입했습니다.', 'today');
insert into t_board(title, content, memberid) values('가입인사2', '안녕하세요. 가입했습니다.', 'today');
insert into t_board(title, content, memberid) values('가입인사3', '안녕하세요. 가입했습니다.', 'today');
insert into t_board(title, content, memberid) values('가입인사4', '안녕하세요. 가입했습니다.', 'today');
insert into t_board(title, content, memberid) values('가입인사5', '안녕하세요. 가입했습니다.', 'today');

-- 검색
select * from t_member;
select * from t_board;
select * from t_board order by bnum desc limit 0, 10;	-- limit 시작행(맨 첫번째인 bnum), 게시글 수

SELECT * FROM t_board ORDER BY bnum DESC limit 0,3;