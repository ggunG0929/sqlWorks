--board ���̺�
--���̺� �̸�: board / Į��: �۹�ȣ(����), ������, �ۼ���, �۳���, �����(��¥)

CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE
);
--������(�Ϸù�ȣ, �ڵ�����)
CREATE SEQUENCE seq;

--��õ�� Į���� �߰��Ͻÿ�(Į����: cnt, �ڷ���: NUMBER DEFAULT 0)
ALTER TABLE ���̺��̸� ADD Į���� �ڷ���
ALTER TABLE board
ADD cnt NUMBER DEFAULT 0;

DESC board;

--�Խñ� �߰�
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'�����λ�','����','�ȳ��ϼ���, �����λ� �����');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'���������Դϴ�.','������','�����λ縦 �����ּ���');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'�����λ��Դϴ�.','�̰�','�ȳ��ϼ���~');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL,'���� �Ϸ�','���Ϸ�','���� �Ϸ� �Ǽ���~');

----3�� �Խñ��� �����Ͻÿ�
--DELETE
--FROM board
--WHERE bno = 3;

--������ ����
--DROP SEQUENCE seq;

--���̺� ����
--DROP TABLE board;


SELECT * FROM board;

--�ۼ��ڰ� �������� �Խñ��� �˻��Ͻÿ�
SELECT * FROM board
WHERE writer = '������'; --�������� bno=2�� �˻�

--�Խñ��� �ۼ��ڸ� '������'���� 'admin'���� �����Ͻÿ�
--UPDATE ���̺��̸� SET Į�� = ���氪 WHERE��
UPDATE board SET writer = 'admin'
WHERE writer = '������';