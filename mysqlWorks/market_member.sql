use javaweb;

-- Market: member 테이블 생성
create table member(
	mid			varchar(20),
    passwd		varchar(20) not null,
    mname		varchar(30) not null,
    gender		varchar(10),
    birth		varchar(20),
    email		varchar(30),
    phone		varchar(20),
    address	varchar(50),
    regDate		timestamp default now(),
    primary key(mid)
);

insert into member(mid, passwd, mname, gender, birth, email, phone, address)
 values('cloud', 'm123456#', '구름이', '여', '1995/12/1', 'cloud@sky.com', '010/1234/5678', '서울시 강남구 청담동');
 insert into member(mid, passwd, mname, gender, birth, email, phone, address)
 values('today', 'm123456#', '투데이', '남', '2001/7/24', 'today@today.com', '010/4321/5678', '경기도 용인시 처인구');
 
 select * from member;