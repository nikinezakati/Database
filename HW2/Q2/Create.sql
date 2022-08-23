create table Class (
	[class_id] INT primary key,
	[class_name] VARCHAR(20) not null,
	[description] TEXT,
    [subject] NVARCHAR(1) not null,
	[status] VARCHAR(10) not null,
	[start_date] DATE not null,
	[end_date] DATE not null,
	[grade] INT not null,
	[teacher_name] VARCHAR(20) not null,

	CONSTRAINT [check_subject]
    CHECK ( upper([subject]) in ('M', 'P', 'C', 'B', 'F', 'E', 'A', 'R')),

	constraint check_end_date
	check ( [end_date] > [start_date]),

	Constraint check_status 
	CHECK ([status] in ('A', 'NA', 'AR')),

    Constraint check_grade
    CHECK (grade>=1 and grade<=12)
);

CREATE TABLE [Student](
  [student_id] INT PRIMARY KEY, 
  [username] NVARCHAR(20) NOT NULL, 
  [password] NVARCHAR(20) NOT NULL, 
  [fname] NVARCHAR(20) NOT NULL, 
  [lname] NVARCHAR(20) NOT NULL, 
  [email] NVARCHAR(20), 
  [class_id] INT NOT NULL REFERENCES [Class]([class_id]) ON DELETE NO ACTION, 
  [birth_date] DATE NOT NULL, 
  [SSN] INT NOT NULL, 
  [address] NVARCHAR(100) NOT NULL, 
  [home_pn] INT NOT NULL,

  CONSTRAINT pn
  CHECK (home_pn>=10000000 and home_pn<=99999999),

  CONSTRAINT sn
  CHECK (SSN>=1000000000 and home_pn<=9999999999)
);

create table  [Weekly Schedule] (
	[weekly_schedule_id] INT PRIMARY key,
	[class_id] INT NOT NULL REFERENCES [Class]([class_id]) ON DELETE CASCADE,
	[class_day_1] INT not null,
	[class_day_2] INT not null,
	[start_time] NVARCHAR(50) not null,
	[end_time] NVARCHAR(50) not null,

    CONSTRAINT different_days
    CHECK (class_day_1 <> class_day_2),

    CONSTRAINT end_time
    CHECK (end_time > start_time)
);

create table [Home Work] (
	[home_work_id] INT primary KEY,
	[description] TEXT,
	[file_url] NVARCHAR(1000) not null,
	[class_id] INT not null REFERENCES [Class] ([class_id]) ON DELETE CASCADE,
	[create_time] DATE not null,
	[deadline] DATE not null,

    CONSTRAINT [check_deadline]
    CHECK ([deadline] > [create_time])

);

CREATE TABLE [Home Work Answer](
  [answer_id] INT PRIMARY KEY, 
  [description] TEXT, 
  [file_url] NVARCHAR(1000) NOT NULL, 
  [home_work_id] INT NOT NULL REFERENCES [Home Work]([home_work_id]) ON DELETE CASCADE, 
  [student_id] INT NOT NULL REFERENCES [Student]([student_id]) ON DELETE CASCADE, 
  [deadline] DATE not null , 
  [subject] VARCHAR(1) NOT NULL, 
  [create_time] DATE NOT NULL, 
  CONSTRAINT [check_subject_answer] CHECK(UPPER ([subject]) IN ('M', 'P', 'C', 'B', 'F', 'E', 'A', 'R')), 
  CONSTRAINT [unique_hw_and_student] UNIQUE([home_work_id], [student_id]),

    CONSTRAINT [check_create]
    CHECK ([deadline] > [create_time])
  );
GO

create table [Home Work Score](
    [score_id] int IDENTITY(1,1) PRIMARY key, 
    [home_work_id] int REFERENCES [Home Work]([home_work_id]) ON DELETE NO ACTION,
    [home_work_answer_id] int not null REFERENCES [Home Work Answer]([answer_id]) on DELETE CASCADE,
    [score] int,

    CONSTRAINT check_score
    CHECK ((score >=0 and score <= 100) or score=null),

    CONSTRAINT unique_score
    UNIQUE ([home_work_id], [home_work_answer_id])
);
GO

CREATE TRIGGER [insert_score]
ON [Home Work Answer]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
 
       DECLARE @hw_id INT,
               @hwa_id INT
       SELECT @hw_id = INSERTED.home_work_id, @hwa_id = INSERTED.answer_id       
       FROM INSERTED
       INSERT into [Home Work Score] (home_work_id, home_work_answer_id, score) VALUES (@hw_id, @hwa_id, null)
END 
GO

CREATE TRIGGER [Trig_Protect_Answer] 
ON DATABASE
    FOR DROP_DATABASE
    AS
        RAISERROR('Dropping of databases has been disabled on this server.', 16,1);
        ROLLBACK;

    GO


