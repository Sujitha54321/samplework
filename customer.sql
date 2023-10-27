-- constraints
use 10247capgemini;
create table customer(cid int primary key not null,cname varchar(78),address varchar(77));
insert into customer values(1001,'gayathri','CBE');
insert into customer(cname,address)values('sethupathy','chennai');-- not null for cid
insert into customer values(1001,'gayathri','CBE');-- duplicate key because cid is primary key
select * from customer;
alter table customer modify column cid int default 0;-- default
desc customer;
insert into customer(cname,address)values('sethupathy','chennai');
select * from customer;
alter table customer add salary int;
update customer set salary=300000 where cid=1001;
update customer set  cid=1002 where salary=500000;
insert into customer values(1003,'raj','banglore',400000);
ALTER TABLE customer RENAME COLUMN salary TO annualincome;-- rename column name salary to annual income
alter table customer add check  (annualincome>400000);-- check constraint show waning error






-- check constraint
create table products(pid int primary key not null,pname varchar(77),noofproducts int,check(noofproducts>10));
insert into products values(1001,'chair',1);