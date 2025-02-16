use W3Resource
--Q1
select * from
Inventory.Orders o
where o.salesman_id = (
select salesman_id from Inventory.Salesman s
where s.name = 'Paul Adam'
)

--Q2
select * from
Inventory.Orders o
where o.salesman_id = (
select s.salesman_id from Inventory.Salesman s
where s.city = 'London'
)
--Q3
select 
o.*
from
Inventory.Salesman s, Inventory.Orders o
where s.salesman_id = o.salesman_id
and o.customer_id = 3007
--Q4
select
*
from Inventory.Orders o1
where o1.purch_amt > (
select AVG(o.purch_amt) from Inventory.Orders o
where o.ord_date = '2012-10-10'
)
--Q5
select 
o.*
from
Inventory.Salesman s, Inventory.Orders o
where s.salesman_id = o.salesman_id
and s.city = 'New York'
--Q6
select
s.commission
from
Inventory.Salesman s
where s.salesman_id in(
select
c.salesman_id
from
Inventory.Customer c
where c.city = 'Paris'
)
--Q7
select
*
from Inventory.Customer c
where c.customer_id = (
select
s.salesman_id - 2001
from Inventory.Salesman s
where s.name = 'Mc Lyon'
)
--Q8
select
c.grade, COUNT(*) as count
from
Inventory.Customer c
where grade > (
select
avg(c.grade)
from
Inventory.Customer c
where c.city = 'New York'
)
group by c.grade
--Q9

