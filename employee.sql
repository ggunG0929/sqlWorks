-- 사원 테이블(부서와 관계를 맺은)
CREATE TABLE employee(
    empno   NUMBER(3) PRIMARY KEY,    -- 사원번호
    ename   VARCHAR2(20) NOT NULL,    -- 사원이름
    sal     NUMBER(10),               -- 급여
    createdate DATE DEFAULT SYSDATE,   -- 등록일
    gender VARCHAR2(10),
    deptno VARCHAR2(4),
    -- 외래키(FOREIGN KEY) 제약조건
    CONSTRAINT emp_fk FOREIGN KEY(deptno)
    REFERENCES dept(deptno)
    -- ON DELETE CASCADE(부서를 삭제하면 참조하고 있는(종속된) 사원도 자동삭제)
);

-- 참조 무결성 제약 위배
-- 1. 사원이 소속된 부서를 삭제할 때 '자식 레코드가 발견되었습니다' 오류 발생
-- 2. 부서번호가 없는 사원 자료를 추가할 때 '부모 키가 없습니다' 오류 발생

INSERT INTO employee VALUES (100, '이강', 2500000, SYSDATE, '남자', '1000'); -- 숫자는 따옴표 X 문자는 따옴표 O
INSERT INTO employee VALUES (101, '이산', 2000000, SYSDATE, '여자', '1001');
INSERT INTO employee VALUES (102, '박달', 1500000, SYSDATE, '남자', '1002');
INSERT INTO employee VALUES (103, '강하늘', 3500000, SYSDATE, '', '1003');
INSERT INTO employee VALUES (104, '양우주', 4500000, SYSDATE, '여자', '1004');

-- 사원 자료 검색
SELECT * FROM employee;

-- 성별이 남자이면서 급여가 250만원 이상인 사원을 검색하시오
SELECT * FROM employee
WHERE gender='남자'
AND sal>=2500000;

-- 급여가 200만원이상 300만원이하인 사원을 검색하시오
SELECT * FROM employee
WHERE sal>=2000000
AND sal<=3000000;

-- BETWEEN ~ AND (사이값 포함)
SELECT *
FROM employee
WHERE sal
BETWEEN 2000000 AND 3000000;

-- 문자열 검색: 일부 문자 포함 LIKE %문자%
-- 성이 '이'인 사원을 검색하시오
SELECT * FROM employee
WHERE ename LIKE '이%'; -- '이'로 시작하는 경우

-- 사원 총 인원수를 구하시오 -- 괄호 꼭 넣기
SELECT COUNT(*) as 사원수
FROM employee;
