create table gallery(
	id	int auto_increment primary key,
    title	varchar(100),
    pname	varchar(100),
    pw	varchar(100),
    upfile	varchar(100),
    description	varchar(9999),
    reg_date	timestamp,
    cnt	int
);

insert into gallery (id, title, pname, pw, description, reg_date, cnt) 
	values 
    (1, "첫글이다", "빈", "1111", "첫글내용", '2023-08-07', 0),
    (2, "두글이다", "원빈", "1111", "두글내용", '2023-08-07', 0),
    (3, "세글이다", "투빈", "1111", "세글내용", '2023-08-07', 0),
    (4, "네글이다", "골빈", "1111", "네글내용", '2023-08-07', 0),
    (5, "오글이다", "장희빈", "1111", "오글내용", '2023-08-07', 0);

select * from gallery;

drop table gallery;
