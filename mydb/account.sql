--은행 계정 테이블 생성
CREATE TABLE account(
    ano     VARCHAR2(10) PRIMARY KEY,
    owner   VARCHAR2(20) NOT NULL,
    balance NUMBER(10) NOT NULL
);

INSERT INTO account VALUES ('1111', '김기용', 10000);

COMMIT;

SELECT * FROM account;