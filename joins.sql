create table dept(deptid int primary key not null,deptname varchar(78),noofemp int);
insert into dept(deptid,deptname,noofemp)values(1001,'IT',34),(1002,'HR',12),(1003,'Admin',89);
select * from dept;
create table office(officeid int primary key not null,officename varchar(78),city varchar(88),state varchar(77));
insert into office values(8001,'XYZ','banglore','karnataga');
insert into office values(8002,'XYZ','chennai','Tamilnadu');
insert into office values(8003,'XYZ','Mumbai','Maharastra');
select * from office;
alter table dept add column officeid int;
alter table dept add foreign key(officeid) references office(officeid);-- foreign key
update dept set officeid=8003 where deptid=1003;
update dept set officeid=8002 where deptid=1002;
update dept set officeid=8001 where deptid=1001;
desc dept;
alter table dept add unique(deptname);
insert into dept values(1004,'IT',44,8002);-- unique  show duplicate entry because IT is already there
alter table dept modify column deptname varchar(78) not null;

/*--------------------joins----------------------------------*/
select deptname,city,state,officename ,noofemp from dept join office on office.officeid=dept.officeid;
select deptname,city,state,officename ,noofemp from dept inner join office on office.officeid=dept.officeid;-- join and inner join same

select * from dept;
select * from office;
insert into dept(deptid,deptname,noofemp)values(1004,'Testing',88);
select deptname,city,state,officename ,noofemp from dept left join office on office.officeid=dept.officeid;
select deptname,city,state,officename ,noofemp from dept right join office on office.officeid=dept.officeid;


/*--------------------joins----------------------------------*/
create table customers(cid int,cname varchar(67),address varchar(89));
insert into customers values(1003,'saran','banglore');
insert into customers values(1001,'divya','pune');
insert into customers values(1002,'saran','mumbai');

alter table customers modify column cid int primary key not null;
select * from customers;
drop table products;
create table productss(pid int primary key not null,pname varchar(67),numoforder int,cid int);
alter table productss add foreign key(cid)references customers(cid);
insert into productss(pid,pname,numoforder,cid)values(8001,'chair',78,1001),(8002,'kidschaiir',100,1002),(8003,'tablemate',200,1001);
select * from productss;
insert into productss(pid,pname,numoforder)values(8004,'swing',45);
select * from customers;
select cname,address,pname from customers inner join productss on customers.cid=productss.cid;
select cname,address,pname from customers left join productss on customers.cid=productss.cid;
select cname,address,pname from customers right join productss on customers.cid=productss.cid;
select cname,address,pname from customers cross join productss ;

-- self join
select * from team;
select a.city,b.state from team a,team b where a.name='Mumbai Indians';
select a.city,b.state from team a,team b where a.name='Mumbai Indians' and b.name='Mumbai Indians';













/*--------------------task for constraints----------------------------------*/
create table studentss(stid int primary key not null,stname varchar(55) ,staddress varchar(55),marks int);
insert into studentss values(101,'kavi','chennai',455),
(102,'pavi','chennai',480),
(103,'meena','bangalore',430);
select * from studentss;
desc studentss;

create table teacher(tid int primary key not null,tname varchar(55), taddress varchar(55),year int default 2023,salary int,check(salary>20000));
insert into teacher values(155,'kalai','chennai',2022,25000);
insert into teacher values(150,'mani','pondy',2021,21000);
insert into teacher values(151,'madhu','chennai',2023,23000);
insert into teacher(tid,tname,taddress,salary)values(108,'sam','madurai',27000);
select * from teacher;
desc teacher;

