create database 10247capgemini;
use 10247capgemini;
create table employee(id int,ename varchar(55),address varchar(67));
select * from employee;
insert into employee values(1001,'gayathri','mumbai');
insert into employee values(1002,'sujitha','chennai');
update employee set address='pune' where id=1001;
delete from employee where id=1001;
alter table employee add salary int;
update employee set salary=35000 where id=1001;
update employee set id=1001 where name='sujitha';
alter table employee modify column address text(78);
desc employee;
alter table  employee drop column salary;
insert into employee values(1001,'sujitha','chennai');
rename table employee to empdetails;
select * from empdetails;
insert into empdetails values(1,'sujitha','pondy');
insert into empdetails values(2,'madhu','vpm');
delete from empdetails where address='chennai';
truncate table empdetails;
insert into empdetails values(3,'madhu','vpm');
drop table empdetails;
create table empdetails(id int, ename varchar(55),address varchar(55));
insert into empdetails(id,ename,address)values(101,'gayathri','mumbai'),(102,'ravi','pune');-- bulk query
select * from empdetails;
alter table empdetails add column salary int;
update empdetails set salary=34000 where id=101;
update empdetails set salary=90000 where id=102;
insert into empdetails(id,address)values(100,'mumbai');
update empdetails set salary=89000 where id=100;
update empdetails set ename='gowri' where id=100;
-- aggregate functions
select max(salary) from empdetails;
select min(salary) from empdetails;
select sum(salary) from empdetails;
select count(salary) from empdetails;
select avg(salary) from empdetails;
select ename,max(salary) from empdetails;  -- wrong name five but crt salary give so use inner query
select ename from empdetails where salary=(select max(salary) from empdetails);-- inner query highest max salary
SELECT MAX(salary) 
FROM employees 
WHERE salary NOT IN ( SELECT Max(salary) FROM employees);-- second max salary
-- date and time
select current_timestamp();
select month('2023-10-20');
select monthname('2023-10-20');
select week('2023-10-20');
select year('2023-10-20');