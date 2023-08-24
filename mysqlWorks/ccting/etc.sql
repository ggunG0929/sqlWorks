create table dist (
   did int auto_increment PRIMARY KEY,
    dname varchar(100) not null,
    dpw varchar(100),
    dtype varchar(100),
    dtitle varchar(100),
    dcontent varchar(9999),
    openDate  varchar(100),
    closeDate varchar(100),
    reg_date date,
    dist varchar(1000),
    dphone varchar(100),
    dfile1 varchar(100),
    dfile2 varchar(100),
    cnt int,
    gid int,
    lev int,
    seq int
);

select * from dist;

create table review(
   id int auto_increment primary key,
    rtype varchar(20),
   title varchar(100),
    nic varchar(100),
    pw varchar(100),
    upfile varchar(100),
    content varchar(9999),
    reg_date timestamp,
    cnt int,
   seq int,
    lev int,
    gid int
);

insert into review (rtype, title, nic, pw, content, reg_date, cnt, seq, lev, gid)
values
("사람", "안녕하세요", "유진", "1234", "인사합니다.", "2023-08-17", 0, 0, 0, 0);

select * from review;

create table member(
   mid         varchar(100) primary key,
    mname      varchar(100),
    mnic      varchar(100),
    mphone      varchar(100),
    memail      varchar(100),
    maddress   varchar(100) ,
    mbirth      datetime,
    mtype      varchar(100)
);
insert into member (mid, mname, mnic, mphone, memail, maddress, mbirth, mtype) 
values 
('min111', '김민정', '니꼴라스','010-0000-0000','kim@gmail.com','서울시 강남구','2000-01-01','모델'),
('min222', '이민정', '나꼴라스','010-1111-1111','lee@gmail.com','서울시 은평구','2001-02-02','영화배우'),
('min333', '박민정', '너꼴라스','010-2222-2222','park@gmail.com','서울시 강서구','2002-03-03','탈랜트'),
('min444', '최민정', '네꼴라스','010-3333-3333','cho@gmail.com','서울시 양천구','2003-04-04','보조출연'),
('min555', '여민정', '누꼴라스','010-4444-4444','ye@gmail.com','서울시 서초구','2004-05-05','아이돌');

select * from member;