use [HW2 Company];

DROP TABLE IF EXISTS [Employee];
CREATE TABLE [Employee] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY,
    [SSN] BIGINT NOT NULL,
    [FName] NVARCHAR(50) NOT NULL,
    [LName] NVARCHAR(50) NOT NULL,
    [Role] NVARCHAR(20) NOT NULL,
    [Boss] INT NULL FOREIGN KEY REFERENCES [Employee]([ID]) ON DELETE NO ACTION
);

insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1234567890, 'Ali', 'Jafari', 'CEO', NULL);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1236547524, 'Zahra', 'Kazemi', 'HRM', 1);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1236523654, 'Saleh', 'Akbari', 'FM', 1);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1246578125, 'Reza', 'Bagheri', 'TM', 1);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (4512547856, 'Sina', 'Ahmadi', 'E', 3);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (2365478941, 'Melika', 'Zare', 'E', 4);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1230212015, 'Maryam', 'Askari', 'E', 4);
insert into [Employee] (SSN, FName, LName, [Role], [Boss]) values (1203201458, 'Mehrdad', 'Moradi', 'E', 4);

SELECT *
FROM Employee;
GO

DROP VIEW IF EXISTS [Tree];
GO

CREATE VIEW [Tree] AS
WITH [Parent] AS (
    SELECT  [ID],
            [SSN],
            [FName],
            [LName],
            [Role],
            [Boss],
            0 AS [Level]
    FROM [Employee]
    WHERE Role='CEO'

    UNION ALL

    SELECT  e.[ID],
            e.[SSN],
            e.[FName],
            e.[LName],
            e.[Role],
            e.[Boss],
            [Level] + 1
    FROM [Employee] AS e
    JOIN [Parent] AS p
    ON e.Boss = p.ID
)
    SELECT p.ID AS [Employee ID],
           p.SSN AS [Employee SSN],
           p.FName AS [Employee First Name],
           p.LName AS [Employee Last Name],
           p.Role AS [Employee Role],
           p.ID AS [Boss ID],
           p.SSN AS [Boss SSN],
           p.FName AS [Boss First Name],
           p.LName AS [Boss Last Name],
           p.Role AS [Boss Role],
           p.Level
    FROM [Parent] AS p
    LEFT JOIN [Employee] AS e
    ON p.Boss = e.ID;
GO

