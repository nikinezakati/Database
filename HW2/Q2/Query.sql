use [School]
GO
create procedure ClassesCount
as
select COUNT( distinct class_id ) as [ClassesCount]
from Class;


GO
create procedure ClassesCountWGrades
as
select grade, COUNT(distinct class_id) as [Count]
from Class
group by grade;


GO
create procedure StudentsCount
as
select COUNT( distinct student_id ) as [StudentsCount]
from Student;


GO
create procedure FindScores
    @c_id int,
    @hw_id int 
as 
select min(hws.score) as minimume, max(hws.score) as maximume, avg(hws.score) as average, var(hws.score) as variance
from Class as c 
    join [Home Work] as hw on c.class_id=hw.class_id
    join [Home Work Score] as hws on hw.home_work_id=hws.home_work_id
where c.class_id=@c_id and hw.home_work_id=@hw_id;


GO
create procedure FindSocresHW
    @hw_id int 
as 
select hwa.student_id, hws.score
from [Home Work Answer] as hwa
    join [Home Work Score] as hws on hwa.home_work_id=hws.home_work_id
where hwa.home_work_id=@hw_id;


GO
create procedure WeeklySchedule
    @c_id int
as 
select s.student_id, ws.subject, ws.class_day_1, ws.class_day_2, ws.start_time, ws.end_time
from [Weekly Schedule] as ws 
    join Class as c on ws.class_id=c.class_id
    join Student as s on c.class_id=s.class_id
where c.class_id=@c_id
order by ws.class_day_1, ws.class_day_2, ws.start_time 
