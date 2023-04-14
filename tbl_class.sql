CREATE TABLE tbl_class(
    cid       NUMBER(3) PRIMARY KEY,
    cname     VARCHAR2(30) NOT NULL,
    ctel      VARCHAR2(15) NOT NULL,
    clocation VARCHAR2(20) NOT NULL
);

INSERT INTO tbl_class VALUES (101,'소프트웨어학과','02-1234-1234','B동 3층');
INSERT INTO tbl_class VALUES (102,'전기전자공학과','02-1234-4567','B동 4층');
INSERT INTO tbl_class VALUES (103,'화학공학과','02-1234-5678','B동 5층');

SELECT * FROM tbl_class;