--���� ����
SELECT name, address
FROM customer;

SELECT name, address, phone
FROM customer;

SELECT *
FROM customer
WHERE address LIKE '����%';

--SELECT *
--FROM customer
--WHERE name='�迬��' OR name='�Ȼ�';
SELECT *
FROM customer
WHERE name IN('�迬��','�Ȼ�');

SELECT *
FROM customer
WHERE address NOT LIKE '���ѹα�%';

SELECT *
FROM customer
WHERE phone IS NULL;

SELECT *
FROM customer
ORDER BY name;

SELECT COUNT(*) ���ο���
FROM customer;