-- clauses
create table team(team_id int,name  varchar(83),city varchar(74),state varchar(87));
insert into team(team_id,name,city,state) values(1,'Sunrisers Hyderabad', 'Hyderabad', 'Telangana'),
(2,'Royal Challengers Banglore', 'Banglore', 'Karnataka'),
(3,'Mumbai Indians', 'Mumbai', 'Maharashtra'),
(4,'Kolkata Knight Riders', 'Kolkata', 'West Bengal'),
(5,'Raising Pune SuperGaints', 'Pune', 'Maharashtra'),
(6,'Delhi Daredevils', 'Delhi', 'New Delhi'),
(7,'Kings XI Punjab', 'Mohali', 'Punjab'),
(8,'Gujarat Lions', 'Rajkot', 'Gujarat');
select * from team;
/*List names of teams in alphabetical order from team table.*/
select name from team order by name ;
/*list names of teams from state 'telgana';*/
select name from team where state='Telangana';
  /*List name of team from city 'hydrabad';*/
  select name from team where city='Hyderabad';
   /*list name of team from city ="pune" and state="maharastra";*/
select name from team where city='pune' and state='Maharashtra';
/*list of state,city,name of team order by state (desc) */
select state,city,name from team order by state desc;
select state,count(name) from team group by state; -- group by
create table Player(player_id int,name varchar(55),country varchar(55),dob varchar(55),team_id int,auction_price double,total_matches int);
insert into Player values(1,'G Gambhir','India','1981-10-14',4,12.50,15),
(2,'PP Chawla','India','1988-12-24',4,4.25,12),
(3,'JW Hastings','Australia','1985-11-04',4,1.30,2),
(4,'GB Hogg','Australia','1971-02-04',4,0.50,5),
(5,'JO Holder','West Indies','1991-11-05',4,0.70,4),
(6,'Kuldeep Yadav','India','1994-12-14',4,0.40,3),
(7,'CA Lynn','Australia','1990-04-10',4,1.30,2),
(8,'M Morkel','South Africa','1984-10-06',4,2.80,10),
(9,'C Munro','New Zealand','1987-03-11',4,0.30,4),
(10,'SP Narine','West Indies','1988-07-26',4,9.50,11);
select * from Player;
/*-- 6. List the country and number of players from each country.*/
 select country,count(name) from player  group by country;
 -- 7. List the country and total money spent on buying players.
 select country,sum(auction_price) from player group by country;
 /*-- 8. List the team_id and total money spent on buying players.*/
 select team_id,sum(auction_price) from player group by team_id;
/*-- 9. List the states and number of teams only when we have more than 1 team.*/
 select state,count(team_id) from team group by state having count(team_id)>1;
 /*-- 10.List the country and number of players only when we have more than 2.*/
  select country,count(name) from player group by country having count(name)>2;
/*-- 11.List the country along with total spent on buying players only when total spent is greater than 10.00 crores.*/
select country,sum(auction_price) from player group by country having sum(auction_price)>10;
select country,sum(auction_price) from player group by country having sum(auction_price)>50;
/*-- 12.List the team_id and total money spent on buying player only when total spend greater than 20.00 crores*/
select team_id,sum(auction_price) from player group by team_id having sum(auction_price)>20.00;
