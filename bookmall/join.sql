--조인과 서브쿼리
SELECT * FROM customer;
SELECT * FROM book;
SELECT * FROM orders;

--고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT cus.custid, cus.name, ord.saleprice, ord.orderdate
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
AND cus.name = '김연아'; --김연아 고객의 주문내역(조인)
--AND saleprice >= 2000;    --판매가격이 20000원 이상인 주문내역
--AND orderdate = '2018-7-8'; --주문일이 2018-7-8 주문내역

--고객별로 주문한 모든 도서의 총 판매액을 구하시오
SELECT cus.name, SUM(saleprice) 판매금액,
        RANK() OVER(ORDER BY SUM(saleprice) DESC) 순위
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

--고객의 이름과 고객이 주문한 도서의 이름을 검색하시오
SELECT cus.name, boo.bookname
FROM customer cus, orders ord, book boo
WHERE cus.custid = ord.custid
    AND boo.bookid = ord.bookid
    ORDER BY cus.name; --정렬을 하면 그룹화도 됨

--가장 비싼 도서의 이름을 검색하시오
--SELECT bookname, MAX(price) FROM book; --오류 발생: 단일 그룹의 그룹 함수가 아닙니다
SELECT MAX(price) FROM book; --가장 비싼 도서 가격: 35000
SELECT bookname FROM book
WHERE price = 35000; --35000원짜리 도서의 이름: 골프바이블
--중첩 쿼리
SELECT bookname, price
FROM book
WHERE price= 
    (
    SELECT
    MAX(price)
    FROM book
    );
    
--도서를 구매한 적이 있는 고객의 이름을 검색하시오
--1. 주문테이블에서 고객아이디 검색
SELECT custid FROM orders;
--2. 고객아이디가 있는 고객이름 검색
SELECT name FROM customer
WHERE custid IN(1,2,3,4);
--3. 합치자
SELECT custid, name
FROM customer
WHERE custid IN(
                SELECT custid
                FROM orders
                );
                
--도서를 구매한 적이 없는 고객의 이름을 검색하시오
SELECT custid, name FROM customer
WHERE custid NOT IN(SELECT custid
                    FROM orders);

--'김연아' 고객의 주문내역을 검색하시오(서브쿼리)
--1. 김연아 고객의 아이디 검색
--2. 김연아 고객의 아이디로 주문테이블에서 검색
SELECT *
FROM orders
WHERE custid =(SELECT custid
               FROM customer
               WHERE name='김연아');
