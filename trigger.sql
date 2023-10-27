
	CREATE TABLE employees(  
	    name varchar(45) NOT NULL,    
	    occupation varchar(35) NOT NULL,    
	    working_date date,  
	    working_hours varchar(10)  
	);  
	INSERT INTO employees VALUES    
	('Robin', 'Scientist', '2020-10-04', 12),  
	('Warner', 'Engineer', '2020-10-04', 10),  
	('Peter', 'Actor', '2020-10-04', 13),  
	('Marco', 'Doctor', '2020-10-04', 14),  
	('Brayden', 'Teacher', '2020-10-04', 12),  
	('Antonio', 'Business', '2020-10-04', 11);  
select * from employees;
-- before insert trigger
	 DELIMITER //  
 Create Trigger before_insert_empworkinghours   
	BEFORE INSERT ON employees FOR EACH ROW  
	BEGIN  
	IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
	END IF;  
	END //  
    
   INSERT INTO employees VALUES    
	('Gayathri', 'Trainer', '2022-10-04', -12);
    -- after insert trigger
     drop trigger after_insert_details ;
drop table student_info;
    CREATE TABLE student_info (  
      stud_id int NOT NULL,  
      stud_code varchar(15) DEFAULT NULL,  
      stud_name varchar(35) DEFAULT NULL,  
      subject varchar(25) DEFAULT NULL,  
      marks int DEFAULT NULL,  
      phone varchar(15) DEFAULT NULL,  
      PRIMARY KEY (stud_id)  
    )
    
    CREATE TABLE student_detail (  
      stud_id int NOT NULL,  
  stud_code varchar(15) DEFAULT NULL,  
      stud_name varchar(35) DEFAULT NULL,  
      subject varchar(25) DEFAULT NULL,  
      marks int DEFAULT NULL,  
      phone varchar(15) DEFAULT NULL,  
      Lasinserted Time,  
      PRIMARY KEY (stud_id)  
    );  

 DELIMITER //  
     Create Trigger after_insert_details  
    AFTER INSERT ON student_info FOR EACH ROW  
    BEGIN  
    INSERT INTO student_detail VALUES (new.stud_id, new.stud_code,   
    new.stud_name, new.subject, new.marks, new.phone, CURTIME());  
    END //  
INSERT INTO student_info VALUES   
    (10, 110, 'Alexandar', 'Biology', 67, '2347346438');  
select * from student_detail;
select * from student_info;
-- after update trigger
CREATE TABLE studentsss(    
    id int NOT NULL AUTO_INCREMENT,    
	    name varchar(45) NOT NULL,    
    class int NOT NULL,    
    email_id varchar(65) NOT NULL,    
	    PRIMARY KEY (id)    
	);  

INSERT INTO studentsss (name, class, email_id)     
	VALUES ('Stephen', 6, 'stephen@javatpoint.com'),   
	('Bob', 7, 'bob@javatpoint.com'),   
	('Steven', 8, 'steven@javatpoint.com'),   
	('Alexandar', 7, 'alexandar@javatpoint.com');  
select * from studentsss;
CREATE TABLE students_log(    
	    user varchar(45) NOT NULL,    
	    descreptions varchar(65) NOT NULL  
	);  

DELIMITER $$  
	CREATE TRIGGER after_update_studentsInfo1  
	AFTER UPDATE  
	ON studentsss FOR EACH ROW  
	BEGIN  
	    INSERT into students_log VALUES (user(),   
	    CONCAT('Update Student Record ', OLD.name, ' Previous Class :',  
	    OLD.class, ' Present Class ', NEW.class));  
	END $$  
	DELIMITER ;  
UPDATE studentsss SET class = class + 1;  
select * from studentsss;
select * from students_log;
-- after delete trigger
	CREATE TABLE salaries (  
	    emp_num INT PRIMARY KEY,  
	    valid_from DATE NOT NULL,  
	    amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
	);  
	INSERT INTO salaries (emp_num, valid_from, amount)  
	VALUES  
	    (102, '2020-01-10', 45000),  
    (103, '2020-01-10', 65000),  
    (105, '2020-01-10', 55000),  
	    (107, '2020-01-10', 70000),  
	    (109, '2020-01-10', 40000); 
        
	CREATE TABLE total_salary_budget(  
	    total_budget DECIMAL(10,2) NOT NULL  
	);  
    INSERT INTO total_salary_budget (total_budget)  
	SELECT SUM(amount) FROM salaries;  
    drop trigger after_delete_salaries;
	DELIMITER $$  
	CREATE TRIGGER after_delete_salaries  
	AFTER DELETE  
	ON salaries FOR EACH ROW  
	BEGIN  
	   UPDATE total_salary_budget SET total_budget = total_budget - old.amount;  
	END$$   
	DELIMITER ;  
    DELETE FROM salaries WHERE emp_num = 105;  
    select * from salaries;
    SELECT * FROM total_salary_budget;
    
    
    
    
    

    
-- cursor    
        CREATE TABLE tutorials (
   ID INT PRIMARY KEY,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);
insert into tutorials values(1, 'Java', 'Krishna', '2019-09-01');
insert into tutorials values(2, 'JFreeCharts', 'Satish', '2019-05-01');
insert into tutorials values(3, 'JavaSprings', 'Amit', '2019-05-01');
insert into tutorials values(4, 'Android', 'Ram', '2019-03-01');
insert into tutorials values(5, 'Cassandra', 'Pruthvi', '2019-04-06');

CREATE TABLE backup (
   ID INT,
   TITLE VARCHAR(100),
   AUTHOR VARCHAR(40),
   DATE VARCHAR(40)
);

DELIMITER //
CREATE PROCEDURE ExampleProc()
   BEGIN
      DECLARE done INT DEFAULT 0;
      DECLARE tutorialID INTEGER;
      DECLARE tutorialTitle, tutorialAuthor, tutorialDate VARCHAR(20);
      DECLARE cur CURSOR FOR SELECT * FROM tutorials;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO tutorialID, tutorialTitle, tutorialAuthor, tutorialDate;
      INSERT INTO backup VALUES(tutorialID, tutorialTitle, tutorialAuthor, tutorialDate);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
   END//
DELIMITER ;

CALL ExampleProc;
select * from tutorials;
select * from backup;
/*-----------------------------------cursor example-------*/
drop table table1;
create table table1(id int,name varchar(67),class varchar(67));
insert into table1(id ,name,class)values(1,'shristee','MCA'),(2,'Ajay','BCA'),(3,'sheweta','MCA'),(4,'Dolly','BCA'),(5,'Heena','MCA'),(6,'kiran','BCA'),(7,'sonal','MCA'),(8,'dimple','BCA'),(9,'shyam','MCA'),(10,'Mohit','BCA');
select * from table1;
drop procedure list_name;
Delimiter $$
create procedure list_name(inout name_list varchar(4000))
begin
declare is_done integer default 0;
DECLARE is_name varchar(67) default "";
DECLARE  stud_cur  cursor for select name from table1;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done = 1;
 open stud_cur;
 get_list:loop
 fetch stud_cur into is_name;
 if is_done =1 then
 leave  get_list ;
 end if;
 set name_list=concat(is_name,";",name_list);
 end loop get_list;
 close stud_cur;
 end$$
    SET @name_list ="";  
    CALL list_name(@name_list);  
    SELECT @name_list; 
    
  /* Array in mysql is not work ==============================*/
  SELECT ARRAY
  (SELECT 1, 
   SELECT 2,
   SELECT 3) AS new_array;
SELECT ARRAY_cat([1, 2], [3, 4], [5, 6]) as count_to_six;
create table arraydata(id int,name json);
insert into arraydata values(1,'["gayathri","ravi"]');
select * from arraydata;
-- work in array in mysql with json
create table arraydata(id int,name json);
insert into arraydata values(1,'["gayathri","ravi"]');
select * from arraydata;