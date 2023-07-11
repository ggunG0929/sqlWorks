-- 부서와 사원 테이블
use mydb;

-- 부서 테이블
create table department(
	deptid int primary key,			-- 부서번호
    deptname varchar(30) not null,	-- 부서이름
    location varchar(20) not null	-- 부서위치
);
-- 사원 테이블
CREATE TABLE employee(
	empid INT PRIMARY KEY,			-- 사원번호
    empname VARCHAR(30) NOT NULL,	-- 사원이름
    age INT,						-- 사원나이
    deptid INT NOT NULL,			-- 부서번호(외래키)
    constraint fk_dept_employee FOREIGN KEY(deptid)		-- foreign key 앞부분에 constraint fk_dept_employee 생략해도 됨
    REFERENCES department(deptid)	-- 관계 설정(외래키)
);

-- 부서 추가
insert into department values(10, '개발팀', '서울');
INSERT INTO	 department VALUES(20, '디자인팀', '성남');
-- 사원 추가
insert into employee values(101, '한라산', 27, 10);
insert into employee values(102, '동해', 30, 20);
insert into employee values(103, '서해', 23, 30);	-- 부모키가 없음(제약 위배)

-- 부서 삭제(부서번호가 20인 디자인팀을 삭제)
delete from department where deptid = 20;			-- 자식 row가 있음(제약 위배) -> on delete cascade 제약조건 추가시 삭제 가능

-- 부서 검색
select * from department;
-- 사원 검색
select * from employee;
-- 사원이름이 '한라산'인 사원의 사원아이디와 부서아이디를 출력하시오
select empid, deptid from employee where empname='한라산';
-- 부서이름이 '개발팀'인 부서의 위치를 출력하시오
select location from department where deptname='개발팀';

-- 사원번호가 102인 사원의 이름을 '독도'로 변경하고 나이를 40세로 변경하시오
update employee set empname='독도', age=40
where empid=102;

-- 트랜잭션(실행-commit, 취소-rollback)
rollback;	-- 초기값:롤백이 안됨(Query>오토커밋이 체크되어있음)
commit;