use 10247capgemini;
show tables;
CREATE USER sujitha@localhost IDENTIFIED BY 'jtp12345';  
SHOW GRANTS FOR sujitha@localhost;  
grant all  on 10247capgemini.* to sujitha@localhost;
grant delete on 10247capgemini.empdetails to  sujitha@localhost;

GRANT SELECT (ename), INSERT (id, address), UPDATE (address)
ON 10247capgemini.empdetails
TO sujitha@localhost;

REVOKE ALL, GRANT OPTION FROM sujitha@localhost;

SHOW GRANTS FOR sujitha@localhost; 

REVOKE DELETE
ON 10247capgemini.empdetails
FROM sujitha@localhost;

REVOKE SELECT (ename), INSERT (id, address), UPDATE (address) ON 10247capgemini.empdetails
FROM sujitha@localhost;

select * from empdetails;