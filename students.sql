-- operators
use 10247capgemini;
create table students(s_id int,sname  varchar(83),address varchar(74),phone varchar(87),age int);
insert into students(s_id,sname,address,phone,age) values(1,'ram','delhi',8110000238,18),
(2,'ramesh','gurgaon',9047740149,18),
(3,'sujit','rohtak',8056664288,20),
(4,'suresh','delhi',9894971928,18),
(3,'sujit','rohtak',8489242053,20),
(2,'ramesh','gurgaon',9551078886,18);
select * from students;
truncate table students;
select sname from students where address='delhi' and age=18;
select sname from students where address='delhi' or address='gurgaon';
select sname from students where not address = 'rohtak';
select sname from students where sname like 's%';
select sname from students where sname like '%h';
select sname from students where sname like '_a%';
select sname from students where sname like '__r%';
select sname from students where age between 20 and 23;
select sname from students where age in(20,18,23);
select sname from students where Exists (select address where address='delhi');
insert into students values(12,'prabha','gurgaon',9551078886,23);
update students set sname=null where age=23;
SELECT *  
FROM students  
WHERE sname IS NULL;
select sname from students where age= any(select age from students where age>17);
select sname from students where age in(18,20,23);

-- scalar functions
select UCASE(sname) from Students;
select LCASE(sname) from Students;
select MID(sname,1,4) from Students;
select ROUND(auction_price) from player;

-- auto increment
create table admin(aid int primary key not null auto_increment,name varchar(78),location varchar(67));
insert into admin(name,location)values('gayathri','CBE');
select * from admin;

-- union
select sname,address from Students where sname='ram' union select sname,address from studentdet where sname='Ram';
select sname,address from Students union select sname,address from studentdet;



-- task for Union
CREATE TABLE customerss (ID INT PRIMARY KEY NOT NULL,NAME VARCHAR(255),AGE INT,ADDRESS VARCHAR(255),SALARY DECIMAL(10, 2));
INSERT INTO customerss (ID, NAME, AGE, ADDRESS, SALARY) VALUES(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);
SELECT * FROM customerss;

CREATE TABLE Orders (OID INT PRIMARY KEY,DATE DATETIME,CUSTOMER_ID INT,AMOUNT DECIMAL(10, 2));
INSERT INTO Orders (OID, DATE, CUSTOMER_ID, AMOUNT) VALUES(102, '2009-10-08 00:00:00', 3, 3000.00),
(100, '2009-10-08 00:00:00', 3, 1500.00),
(101, '2009-11-20 00:00:00', 2, 1560.00),
(103, '2008-05-20 00:00:00', 4, 2060.00);
SELECT * FROM orders;
SELECT ID , SALARY AS AMOUNT FROM customerss UNION SELECT CUSTOMER_ID AS ID ,AMOUNT FROM Orders;
SELECT ID , SALARY AS AMOUNT FROM customerss UNION ALL SELECT CUSTOMER_ID AS ID ,AMOUNT FROM Orders;