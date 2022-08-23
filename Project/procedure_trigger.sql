--Procedure----------------------------------------------------------------------------------
	-- Send alerts to users in contact with a red user
	GO 
	CREATE PROCEDURE SendAlertToContacts @user_id NUMERIC(10,0) AS
	BEGIN
		INSERT INTO [Alert] (user_id)
		SELECT DISTINCT u2.user_id
		FROM [User] u1 
			JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
			JOIN [HasUser] hu2 ON hu1.record_id=hu2.record_id
			JOIN [User] u2 ON u2.user_id=hu2.user_id
		WHERE u1.user_id=@user_id AND u1.user_id <> u2.user_id AND u1.covid_status='RED';
	END;

	-- Set covid status of users in contact with a red user to red
	GO
	CREATE PROCEDURE SendContactsToRed @user_id NUMERIC(10,0) AS
	BEGIN
		UPDATE u2 SET u2.covid_status='RED'
		FROM [User] u1
			JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
			JOIN [HasUser] hu2 ON hu1.record_id=hu2.record_id
			JOIN [User] u2 ON u2.user_id=hu2.user_id
		WHERE u1.user_id=@user_id AND u1.user_id <> u2.user_id AND u1.covid_status='RED';
	END;

	-- Update a user covid-status based on records and places (RED)
	GO 
	CREATE PROCEDURE UpdateUserStatus_RED @user_id NUMERIC(10,0) AS
	BEGIN
		UPDATE u SET u.covid_status='RED', u.test_needed=1
		FROM [User] u
		WHERE EXISTS(
			SELECT DISTINCT p_address, p_name FROM [User] u1 
				JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
				JOIN [Record] r1 ON hu1.record_id=r1.record_id
				JOIN [Place] ON r_address=p_address AND r_name=p_name
			WHERE u1.user_id=@user_id AND duration >= DATEADD(DAY, -14, getDate())
			INTERSECT
			SELECT DISTINCT p_address, p_name FROM [User] u2 
				JOIN [HasUser] hu2 ON u2.user_id=hu2.user_id
				JOIN [Record] r2 ON hu2.record_id=r2.record_id
				JOIN [Place] ON r_address=p_address AND r_name=p_name
			WHERE u2.covid_status='RED' AND duration >= DATEADD(DAY, -14, getDate())	
		);
	END;

	-- Update a user covid-status based on records and places (YELLOW)
	GO 
	CREATE PROCEDURE UpdateUserStatus_YELLOW @user_id NUMERIC(10,0) AS
	BEGIN
		UPDATE u3 SET u3.covid_status='YELLOW'
		FROM [User] u3 
		WHERE EXISTS(
			SELECT 1 FROM [User] u4 
				JOIN [HasUser] hu3 ON u4.user_id=hu3.user_id
				JOIN [Record] r3 ON hu3.record_id=r3.record_id
				JOIN [Place] p3 ON r_address=p_address AND r_name=p_name
			WHERE u4.user_id=@user_id AND (p3.covid_status='RED' OR p3.covid_status='YELLOW')
		);
	END;

--Trigger----------------------------------------------------------------------------------
	-- A user gets a positive result on the covid test
	GO
	CREATE TRIGGER OnPositiveTest ON [User] AFTER UPDATE
	AS IF (UPDATE(last_test_result)) BEGIN
		DECLARE @test_result BIT = (SELECT last_test_result FROM inserted);
		IF(@test_result=1) BEGIN
			DECLARE @user_id NUMERIC(10,0) = (SELECT user_id FROM inserted);
			EXEC SendAlertToContacts @user_id=@user_id;
		END
	END;

	-- A user covid status is set to RED
	GO
	CREATE TRIGGER OnUserStatusRed ON [User] AFTER UPDATE
	AS IF (UPDATE(covid_status)) BEGIN
		UPDATE p1 SET p1.covid_status='RED'
		FROM inserted u1
			JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
			JOIN [Record] r1 ON hu1.record_id=r1.record_id
			JOIN [Place] p1 ON r_address=p_address AND r_name=p_name
		WHERE u1.covid_status='RED' AND duration >= DATEADD(DAY, -14, getDate());

		UPDATE p1 SET p1.covid_status='YELLOW'
		FROM inserted u1
			JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
			JOIN [Record] r1 ON hu1.record_id=r1.record_id
			JOIN [Place] p1 ON r_address=p_address AND r_name=p_name
		WHERE u1.covid_status='RED' AND duration < DATEADD(DAY, -14, getDate());
	END;