SELECT * FROM book;

-- bookid�� 11�� ���� ����
DELETE FROM book
WHERE bookid = 11;

-- ���� ����(���� ��ø)
-- å�� �� ������ ���Ͻÿ�
SELECT COUNT(*) �Ѽ���
FROM book;

-- ���� ���� ������ å�� ���Ͻÿ�
SELECT MAX(price) �ְ�
FROM book;

-- ���� ��� ������ �̸��� ���Ͻÿ�
SELECT price, bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- ���� ���� �ֹ��� ���� �����͸� ��� �˻��Ͻÿ�

SELECT * FROM customer;
SELECT * FROM orders;

SELECT *
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ���� �ֹ������� �˻��Ͻÿ�
SELECT cus.name, SUM(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- �迬�� ���� �� �ֹ� ������ �˻��Ͻÿ�
SELECT cus.name, SUM(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
HAVING cus.name = '�迬��';