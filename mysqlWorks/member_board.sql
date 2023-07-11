-- Members 프로젝트
use mydb;

-- 회원 테이블
create table t_member(
	memberid	varchar(20),
    passwd		varchar(20) not null,
    name		varchar(30) not null,
    gender		varchar(10),
    joindate	timestamp default now(),
    primary key(memberid)
);

-- 게시판 테이블
create table t_board(
	bnum	int primary key auto_increment,		-- 자동순번
    title	varchar(100) not null,
    content 	text,
    regdate 	timestamp default now(),
    modifydate	timestamp,
    hit		int default 0,
    memberid	varchar(20),
    fileupload	varchar(50),
    constraint fk_member_board foreign key(memberid)
    references t_member(memberid) on delete cascade
);

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