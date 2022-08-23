use [HW2 Company];
GO

DROP PROCEDURE IF EXISTS ChangeRoleAndPosition
GO

CREATE PROCEDURE ChangeRoleAndPosition(@id1 INT, @id2 INT)
AS
    DECLARE @role1 NVARCHAR(50)
    DECLARE @role2 NVARCHAR(50)
    DECLARE @boss1 INT = NULL
    DECLARE @boss2 INT

    IF (@id1=@id2)
        PRINT 'IDs are equal. Try again.'
    ELSE
        BEGIN
            SET @role1 = (SELECT Role FROM Employee WHERE ID=@id1)
            SET @role2 = (SELECT Role FROM Employee WHERE ID=@id2)
            SET @boss1 = (SELECT Boss FROM Employee WHERE ID=@id1)
            SET @boss2 = (SELECT Boss FROM Employee WHERE ID=@id2)
            IF @boss1=@id2
                SET @boss1=@id1

            IF @boss2=@id1
                SET @boss2=@id2
                
            UPDATE Employee
            SET Boss=@boss2, Role=@role2
            WHERE ID=@id1

            UPDATE Employee
            SET Boss=@boss1, Role=@role1
            WHERE ID=@id2

        END
GO

DROP PROCEDURE IF EXISTS AdvancedDelete;
GO

CREATE PROCEDURE AdvancedDelete(@id1 INT, @id2 INT)
AS
BEGIN
    DECLARE @idx INT = 1
    DECLARE @len INT
    
    SELECT @len = COUNT([Employee ID])
    FROM Tree
    WHERE [Boss ID]=@id1
    
    IF @len=0
        DELETE FROM Employee WHERE ID=@id1
    ELSE
        BEGIN
            WHILE @idx <= @len
                BEGIN
                    DECLARE @id INT
                    SELECT @id=[Employee ID] FROM subalterns(@id1) WHERE Row#=@idx

                    UPDATE Employee
                    SET Boss=@id2
                    WHERE ID=@id

                    SET @idx += 1
                END
            DELETE FROM Employee WHERE ID=@id1
        END
END

DROP PROCEDURE IF EXISTS InsertRecord;
GO

CREATE PROCEDURE InsertRecord
    (@FName NVARCHAR(50),
     @LName NVARCHAR(50),
     @SSN BIGINT,
     @Role NVARCHAR(50),
     @Boss INT
)
AS
    INSERT INTO Employee (SSN, FName, LName, Role, Boss)
    VALUES (@SSN, @FName, @LName, @Role, @Boss)
GO