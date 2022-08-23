--Update Table
ALTER TABLE [Place]
ADD [is_open] [bit] NOT NULL;

ALTER TABLE [Alert]
ADD [duration] [timestamp] NOT NULL;

--Update row
UPDATE [User]
SET [test_needed] = 1
WHERE [user_id] = 1234567890;

UPDATE [Alert]
SET [is_read]= 0
WHERE [user_id]=1234567890;

-- Add constraint
ALTER TABLE [User]
ADD CONSTRAINT check_result CHECK (last_test_result = 0)

ALTER TABLE [User]
ADD CONSTRAINT check_needed CHECK (test_needed = 0)


--Update constraint
ALTER TABLE [User]
ALTER COLUMN [updated_at] [date] NOT NULL;

ALTER TABLE [User]
ALTER COLUMN [test_needed] [BIT] NOT NULL;

--Delete constraint
ALTER TABLE [User]
DROP CONSTRAINT check_result;

ALTER TABLE [User]
DROP CONSTRAINT check_needed;


