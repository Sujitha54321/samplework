
SET autocommit=0;
CREATE TABLE EMP(
   FIRST_NAME CHAR(20) NOT NULL,
   LAST_NAME CHAR(20),
   AGE INT,
   SEX CHAR(1),
   INCOME FLOAT);
   
   INSERT INTO EMP VALUES
   ('Krishna', 'Sharma', 19, 'M', 2000),
   ('Raj', 'Kandukuri', 20, 'M', 7000),
   ('Ramya', 'Ramapriya', 25, 'F', 5000);
   
   START TRANSACTION;

SELECT * FROM EMP;
UPDATE EMP SET AGE = AGE + 2;

SAVEPOINT samplesavepoint;

INSERT INTO EMP values ('Mac', 'Mohan', 26, 'M', 2000);

ROLLBACK TO SAVEPOINT samplesavepoint;
COMMIT;