SHOW USER;

--����� ���� �����
--DB�̸�, ��й�ȣ, ���̺� ���� ����
CREATE USER C##mydb IDENTIFIED BY mydb
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

--���� ����
GRANT CONNECT, DBA TO C##mydb;