create table student1(Name varchar(78),marks int);
insert into student1(Name,marks)values('hardik',79),('jolly',65),('shuzan',70);
select * from student1;
-- rollback
SET autocommit=0;
update student1 set Name='kalai' where Name='hardik';
select * from student1;
rollback;
-- commit
update student set Name='kalai' where Name='hardik' ;
commit;
select * from student1;
rollback ;
-- savepoint
start Transaction;
UPDATE student1 
SET NAME= 'gayathri' 
WHERE marks= 70;
SAVEPOINT A;
rollback ;
ROLLBACK TO SAVEPOINT samplesavepoint;