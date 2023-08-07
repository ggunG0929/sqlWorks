create table arts(
	id	int auto_increment primary key,
    name	varchar(50),
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