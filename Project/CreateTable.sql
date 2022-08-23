drop table if exists [User];
create table [User] (
    [user_id] numeric (10,0) PRIMARY KEY ,
    [firstname] NVARCHAR(50) NOT NULL ,
    [lastname] NVARCHAR(50) NOT NULL ,
    [last_test_result] BIT NOT NULL, 
    [updated_at] date, 
    [test_needed] BIT, 
    [covid_status] varchar(6) CHECK (covid_status in ('WHITE' , 'YELLOW', 'RED'))

);

drop table if exists [Place];
create table [Place] (
    [p_address] NVARCHAR(200) NOT NULL UNIQUE, 
    [p_name] NVARCHAR(50) NOT NULL UNIQUE, 
    [covid_status] varchar(6) CHECK (covid_status in ('WHITE' , 'YELLOW', 'RED')),
);

drop table if exists [Record];
create table [Record] (
    [record_id] numeric(10,0) UNIQUE,
    [duration] date ,
    [r_address] NVARCHAR(200)FOREIGN KEY REFERENCES [Place]([p_address]) ON DELETE CASCADE,
    [r_name] NVARCHAR(50) FOREIGN KEY REFERENCES [Place](p_name) ON UPDATE NO ACTION,  
    
);
drop table if exists [Restriction];
create table [Restriction] (
    [re_number] numeric(10,0) PRIMARY KEY NOT NULL,
    [re_address] NVARCHAR(200) NOT NULL FOREIGN KEY REFERENCES [Place]([p_address]) ON DELETE CASCADE,
    [re_name] NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES [Place] ([p_name]) ON UPDATE NO ACTION,
    [s_date] date NOT NULL,
    [d_date] date NOT NULL,
    [created_at] date NOT NULL,
 
);

drop table if exists [Alert];
create table [Alert] (
    [alert_number] numeric(10,0) IDENTITY PRIMARY KEY , 
    [user_id] numeric(10,0) FOREIGN KEY REFERENCES [User]([user_id]) ON DELETE CASCADE, 
    [is_read] BIT NOT NULL DEFAULT 0
);
    
drop table if exists [HasUser];
create table [HasUser] (
    [user_id] numeric(10,0) FOREIGN KEY REFERENCES [User]([user_id]) ON DELETE CASCADE,
    [record_id] numeric(10,0) FOREIGN KEY REFERENCES [Record]([record_id]) ON DELETE CASCADE , 
    
);
