--1
select Phone
from Suppliers
where ContactName like 'S%'

--2
select E.FirstName , E.LastName 
from Employees E join Orders O on E.EmployeeID=O.EmployeeID
group by E.FirstName, E.LastName 
having 3<count(*)

--3
select LastName, HireDate
from Employees
where not Title='Sales Representative'

--4
select c.CustomerID,c.ContactName
from Orders o,Customers c
where o.CustomerID=c.CustomerID and o.OrderID in (  select od.OrderID
													from [Order Details] od
													group by od.OrderID
													having 6000< sum(od.UnitPrice*od.Quantity))

--5
select COUNT(*) as orderCount
from Orders O 
where O.ShipCountry='France'