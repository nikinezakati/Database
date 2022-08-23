--1
select *
from dbo.final
where Cars_Count<(select AVG(Cars_Count)
				  from dbo.final)

--2
select id,Gender
from dbo.final
where Sood97>Sood96 and Sood96>Sood95

--3
select distinct SenfName
from dbo.final
where SenfName LIKE N'%ن%'

--4
select id, Daramad_Total_Rials
from dbo.final
where 2022-Year(BirthDate)=50 and ProvinceName=N'تهران'
order by Daramad_Total_Rials asc

--5
select id
from dbo.final
where Gender=N'مرد' and Bardasht97>30000000