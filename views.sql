create table studentdet(sid int primary key not null,sname varchar(23),address varchar(23));
insert into studentdet(sid,sname,address)values(1,'Harsha','kolkata'),(2,'Ashish','Durgapur'),(3,'Pratik','Delhi'),(4,'Dhanaraj','Bihar'),(5,'Ram','Rajasthan');
select * from studentdet;
create table studentmarks(id int primary key not null,name varchar(23),marks int,age int);
insert into studentmarks(id,name,marks,age)values(1,'Harsha',90,19),(2,'suresh',50,20),(3,'Pratik',80,19),(4,'Dhanaraj',95,21),(5,'Ram',85,18);
select * from studentmarks;
drop view detailsofstudent;
create view detailsofstudent
as select name,marks,age from studentmarks where marks<90;
select * from detailsofstudent;
alter view detailsofstudent as select name,marks,age,address from studentdet s join studentmarks s1 on s.sid=s1.id;
/*------------UPDATE VIEW----------------*/
CREATE OR REPLACE VIEW MarksView AS
SELECT studentdet.sname, studentdet.address, studentmarks.marks, studentmarks.age
FROM studentdet, studentmarks
WHERE studentdet.sname = studentmarks.name;
SELECT * FROM MarksView;

/*------------DELETE VIEW----------------*/
create view studentnames as
select sname,address from studentdet order by sname ;
select * from studentnames;
delete  from studentnames where sname='Pratik';

-- check in views
select * from Students;
CREATE VIEW SampleView AS
SELECT s_id, sname
FROM  Students
WHERE sname IS NOT NULL
WITH CHECK OPTION;

INSERT INTO SampleView(s_id,sname)
VALUES(7,'gayathri');
desc Students;
select * from SampleView;
INSERT INTO SampleView(s_id)
VALUES(7);


/* stored procedures*/
CREATE TABLE studentMarks1 (stud_id SMALLINT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, total_marks INT, grade VARCHAR(5));

INSERT INTO studentMarks1(total_marks, grade) VALUES(450, 'A'), (480, 'A+'), (490, 'A++'), (440, 'B+'),(400, 'C+'),(380,'C')
,(250, 'D'),(200,'E'),(100,'F'),(150,'F'),(220, 'E');
select * from studentmarks1;

DELIMITER $$
CREATE PROCEDURE GetStudentData()
BEGIN
    SELECT * FROM studentMarks1;
END$$
DELIMITER ;
call GetStudentData;
drop procedure detailsstudent;
DELIMITER $$
create procedure detailsstudent(IN  studentid int)
begin
select * from studentmarks1 where stud_id=studentid;
end$$
DELIMITER ;
call detailsstudent(2);
-- stored procudure
DELIMITER $$
CREATE PROCEDURE spGetStudentClass(IN studentId INT, OUT class VARCHAR(20))
BEGIN
    DECLARE marks INT DEFAULT 0;
    SELECT total_marks INTO marks FROM studentMarks1 WHERE stud_id = studentId;
        IF marks >= 400 THEN
        SET class = "First Class";
    ELSEIF marks >=300 AND marks < 400 THEN
        SET class = "Second Class";
    ELSE
        SET class = "Failed";
    END IF;
END$$
DELIMITER ;

call spGetStudentClass(2,@class);
select * from studentmarks1;
select @class;

/*------------------------------INDEXES----------------------*/
/*---------------------------SINGLE COLUMN INDEXES----------------------*/
create index studentindex on studentdet(sid);
show index from studentdet;
create index marksindex on studentmarks1(total_marks);
show index from studentmarks1;
/*------------------------------UNIQUE INDEXES----------------------*/
create unique index sm on studentmarks1(total_marks);
create unique index sm on studentmarks1(stud_id);
/*------------------------------COMPOSITE INDEXES----------------------*/
create  index sm1 on Students(s_id,sname,address,age);
show index from Students;


/*----------task--------------*/
CREATE TABLE Employee (empid INT PRIMARY KEY,empname VARCHAR(255),managerid INT,deptid INT,salary int,DOB DATE);
INSERT INTO Employee (empid, empname, managerid, deptid, salary, DOB)VALUES(1, 'Emp 1', 0, 1, 6000, '1982-08-06'),
(2, 'Emp 2', 0, 5, 6000, '1982-07-11'),
(3, 'Emp 3', 1, 1, 2000, '1983-11-21'),
(13, 'Emp 13', 5, 5, 2000, '1984-03-09'),
(7, 'Emp 7', 5, 5, NULL, NULL);
select * from Employee;
create table department(deptid int,deptname varchar(55));
insert into department values(1,'IT');
insert into department values(2,'Admin');
select * from department;
-- Find the second highest salary.
select max(salary) from employee where salary not in (select max(salary) from employee);
-- Write a query to get employees who’s ID is an odd number.
select * from employee where empid %2 !=0;
-- Create view of the Employee table having empid, empname, salary columns only
Create view employeesal
As select empid, empname, salary From employee;
select * from employeesal;
-- Write an SQL Query to print the name of the distinct employees whose DOB is between 01/01/1960 to 31/12/1987
SELECT DISTINCT empname
FROM Employee
WHERE DOB BETWEEN '1960-01-01' AND '1987-12-31';
-- Can you write a query to find employees with age greater than 30?
SELECT *
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, DOB, CURDATE()) > 30;

