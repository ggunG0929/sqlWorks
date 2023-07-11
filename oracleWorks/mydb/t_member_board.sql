-- ȸ�� ���̺� ����
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

-- �Խ��� ����(�۹�ȣ(�ڵ�����-SEQUENCE), ������, �۳���, �ۼ���, ������, ��ȸ��, ���̵�(�ܷ�Ű))
CREATE TABLE t_board(
    bnum        NUMBER(4) PRIMARY KEY,
    title       VARCHAR2(100) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate  TIMESTAMP,
    hit         NUMBER DEFAULT 0,
    memberid    VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_MemberBoard FOREIGN KEY(memberid)
    REFERENCES t_member(memberid) ON DELETE CASCADE
);

-- �ڵ����� ��ü �ڵ�(CACHE �⺻�� 20 - ������)
CREATE SEQUENCE b_seq
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE;

-- ���� ���ε� Į�� �߰�
ALTER TABLE t_board ADD fileupload VARCHAR2(100);

INSERT INTO t_member(memberid, passwd, name, gender) VALUES ('cloud', 'm12345', '����', '��');
INSERT INTO t_board(bnum, title, content, memberid) VALUES (b_seq.NEXTVAL, '�����λ�', '�ȳ��ϼ���. �ݰ����ϴ�.', 'cloud');

SELECT * FROM t_member;
SELECT * FROM t_board;

-- id �ߺ� üũ
SELECT DECODE(COUNT(*), 1, 'true', 'false') AS result
FROM t_member WHERE memberid = 'cloud';

-- ������ ó��1
SELECT ROWNUM, t_board.*
FROM t_board
WHERE ROWNUM >= 1 AND ROWNUM <= 10
--WHERE ROWNUM >= 11 AND ROWNUM <= 20   -- rownum�� 1�� �� ���ԵǾ�� �ϱ� ������ �������� �Ѿ�� �ȵ�. ��Īó���� �ؾ� ��.
ORDER BY bnum DESC;

SELECT ROWNUM as rn, t_board.*
FROM t_board
WHERE rn >= 1 AND rn <= 10  -- WHERE���� SELECT ���� ���� ó���Ǳ� ������ ��Īó���� ���� �ȵ� - ����x
ORDER BY bnum DESC;

    -- �ζ��κ�� �ذ� - ��ø����(��������) - �����۱��� ������ó���ϰ� ������ �ֽű� (rn �������� bnum ��������)
SELECT *
FROM (SELECT ROWNUM rn, t_board.*
FROM t_board ORDER BY bnum DESC)    -- ���� �����ϰ� ��������
WHERE rn >= 11 AND rn <= 20;    -- ��Īó�� ��

-- ������ ó��2  - 2������ó�� ��(rn �������� bnum ��������)
SELECT * 
FROM (SELECT ROWNUM rn, board.* 
            FROM(SELECT * 
FROM t_board ORDER BY bnum DESC)
board)
WHERE rn >= 11 AND rn <= 20; -- ��Ī rn�� ����ؾ� ����

-- �� ���� ��
SELECT COUNT(*) FROM t_board;

-- ���Ƿ� �߰�
--ALTER SEQUENCE b_seq NOCACHE;

DROP SEQUENCE b_seq;
DROP TABLE t_board;
