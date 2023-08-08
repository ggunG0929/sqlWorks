create table arts(
	id	int auto_increment primary key,
    name	varchar(50),
    pw		varchar(50),
    age 	int,
    height	int,
    weight	int,
    agency	varchar(100),
    arts	varchar(200),
    content	varchar(200),
    awards	varchar(9999),
    edit_date	timestamp,
	photo1	varchar(100),
	photo2	varchar(100),
	bfile1	varchar(100),
	bfile2	varchar(100)
);

select * from arts;

insert into arts (id, name, pw, age, content, edit_date) 
	values 
    (1, "빈", "1111", "20", "첫글이다", '2023-08-05'),
    (2, "원빈", "1111", "22", "두글이다", '2023-08-05'),
    (3, "투빈", "1111", "24", "삼글이다", '2023-08-06'),
    (4, "골빈", "1111", "26", "사글이다", '2023-08-06'),
    (5, "장희빈", "1111", "28", "오글이다", '2023-08-07');

drop table arts;