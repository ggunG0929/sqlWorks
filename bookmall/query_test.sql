--연습 문제
SELECT name, address
FROM customer;

SELECT name, address, phone
FROM customer;

SELECT *
FROM customer
WHERE address LIKE '영국%';

--SELECT *
--FROM customer
--WHERE name='김연아' OR name='안산';
SELECT *
FROM customer
WHERE name IN('김연아','안산');

SELECT *
FROM customer
WHERE address NOT LIKE '대한민국%';

SELECT *
FROM customer
WHERE phone IS NULL;

SELECT *
FROM customer
ORDER BY name;

SELECT COUNT(*) 총인원수
FROM customer;