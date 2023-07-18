use mydb;

select * from t_board;

-- 제목이 '가입인사'인 게시글 검색
select * from t_board
where title like '가입인사';

-- 제목에 '가입'이 포함된 게시글 검색
select * from t_board
where title like '%가입%';

-- 작성자가 'today'인 게시글 검색
select * from t_board
where memberid like 'today';

-- 작성자가 'today'인 게시글 검색, 내림차순 정렬
select * from t_board
where memberid like 'today'
order by bnum desc;

-- 작성자가 'today'인 게시글 검색, 내림차순 정렬, 1행부터 5개
select * from t_board
where memberid like 'today'
order by bnum desc limit 0, 5;