--1
select title,type
from titles
where price<21 and price>17 and type != 'mod_cook'


--2
select au_id,phone, (au_fname+' '+au_lname) as Full_Name
from authors
where city = 'Oakland'

--3
SELECT *
FROM employee
WHERE hire_date = (SELECT MIN(hire_date) FROM employee);

--4
SELECT *
FROM titles
where 2022-cast(FORMAT(pubdate,'yyyy') as int)>30

--5
select a.au_fname ,a.address, COUNT(ta.title_id) as countOfSaledBooks
from sales s INNER JOIN 
			 titleauthor ta on s.title_id=ta.title_id INNER JOIN authors a on ta.au_id=a.au_id
group by a.au_fname,a.address