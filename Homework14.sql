--Homework for recursive cte. Find the hierarchial level of people

create table PostDef(postid int, definition varchar(25))
insert into PostDef values (0, 'Director'), (1, 'Deputy Director'), (2, 'Executive Director'), (3, 'Department head'), 
              (4, 'Manager'), (5, 'Senior officer'), (6, 'Junior Officer'), (7, 'Intern')
create table Hierarchy(id int, name varchar(100), manager_id int, manager varchar(100))

insert into Hierarchy values 
(150, 'John Ryden', 111, 'Jack Tarkowski'),
(165, 'Sara Miller', 111, 'Jack Tarkowski'), 
(180, 'Rebecca Carson', 211, 'Thomas Kim'), 
(107, 'Sean Sullivan', 180, 'Rebecca Carson'), 
(142, 'Floyd Kan', 122, 'Alex Pereira'), 
(122, 'Alex Pereira', 107, 'Sean Sullivan'), 
(111, 'Jack Tarkowski', 107, 'Sean Sullivan'), 
(211, 'Thomas Kim', 191, 'Nicolas Jackson'), 
(177, 'Michael Rim', Null, Null), 
(191, 'Nicolas Jackson', 177, 'Michael Rim')

--Answer

with cte as(
select 
cast(h.name as varchar(max)) as hy,
h.name,
h.id,
h.manager_id,
0 as n
from Hierarchy h 
where h.manager_id is null
union all
select 
cast(cte.hy + ' - ' + h2.name as varchar(max)) as Hirerarchy,
h2.name,
h2.id,
h2.manager_id,
cte.n + 1
from Hierarchy h2
join cte on h2.manager_id = cte.id
)
select cte.name, p.definition from cte
join PostDef p on p.postid = cte.n

--SQL Exercises, Practice, Solution - SUBQUERIES exercises on movie Database
use W3Resource

--Q1
select * from Movies.Actor
select * from Movies.Movie_cast
select * from Movies.Movie

select * from Movies.Actor
where act_id = (
select act_id from Movies.Movie_cast
where mov_id = (
select mov_id from Movies.Movie
where mov_title = 'Annie Hall'
))

--Q2 From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. 
--Return director first name, last name.

select * from Movies.Director
where dir_id = (
select dir_id from Movies.Movie_Direction
where mov_id = (
select mov_id from Movies.Movie_cast
where mov_id = (
select mov_id from Movies.Movie
where mov_title = 'Eyes Wide Shut')))

--Q3From the following table, write a  SQL query to find those movies that have been released in countries other than the United Kingdom. 
--Return movie title, movie year, movie time, and date of release, releasing country.

select * from Movies.Movie

select * from Movies.Movie
where mov_rel_country <> 'UK'
