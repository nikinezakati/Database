-- Places Records count 
SELECT p.p_name , p.p_address , COUNT(*) AS records_count
FROM [Place] p INNER JOIN  Record r ON r.r_name = p.p_name
GROUP BY p.p_name , p.p_address

-- Users with RED covid status
SELECT * FROM [User] WHERE covid_status = 'RED'

-- Users with unread alerts 
SELECT user_id FROM [Alert] GROUP BY user_id

-- Users unread alerts count 
SELECT user_id, COUNT(*) AS unread_alerts_count FROM [Alert] GROUP BY user_id

-- Records with more than 1 users 
SELECT record_id, COUNT(*) as users_count FROM HasUser GROUP BY record_id 

-- Places with with covid status 
SELECT p_name, p_address FROM Place WHERE covid_status = 'WHITE'

-- Places with records 
SELECT DISTINCT r_name FROM Record 

-- Lewes Baudou situation 
SELECT * FROM [User] WHERE firstname = 'Lewes' AND lastname = 'Baudou'

-- Test needed users
SELECT DISTINCT firstname , lastname FROM [User] WHERE test_needed = 1 

-- Count of users with records in places 
SELECT r.r_name , r.r_address , COUNT(*) AS user_count 
FROM Record r INNER JOIN HasUser h ON r.record_id = h.record_id
GROUP BY r.r_name , r.r_address

	-- Find users in contact with red-status users
	SELECT DISTINCT u2.firstname + ' ' + u2.lastname AS [User]
	FROM [User] u1 
		JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
		JOIN [HasUser] hu2 ON hu1.record_id=hu2.record_id
		JOIN [User] u2 ON u2.user_id=hu2.user_id
	WHERE u1.user_id <> u2.user_id AND u1.covid_status='RED';

	-- List places and covid statuses
	SELECT p_name, p_address, covid_status
	FROM [Place]

	-- List places with active restrictions
	SELECT DISTINCT p_name, p_address
	FROM [Place] p JOIN [Restriction] r ON re_address=p_address AND re_name=p_name
	WHERE r.d_date >= getDate();

	-- List dangerous places
	SELECT p_name, p_address
	FROM [Place]
	WHERE covid_status='RED'

	-- List users in contact with each other
	SELECT DISTINCT u1.firstname + ' ' + u1.lastname AS [User],
		u2.firstname + ' ' + u2.lastname AS [InRelationWith]
	FROM [User] u1 
		JOIN [HasUser] hu1 ON u1.user_id=hu1.user_id
		JOIN [HasUser] hu2 ON hu1.record_id=hu2.record_id
		JOIN [User] u2 ON u2.user_id=hu2.user_id
	WHERE u1.user_id <> u2.user_id;
	
	-- List places with no active restrictions
	SELECT DISTINCT p_name, p_address
	FROM [Place] pl
	EXCEPT
	SELECT DISTINCT p_name, p_address
	FROM [Place] p JOIN [Restriction] r ON re_address=p_address AND re_name=p_name
	WHERE r.d_date >= getDate();

	-- List good! users with no alerts
	SELECT DISTINCT u1.firstname + ' ' + u1.lastname AS [User]
	FROM [User] u1
	WHERE u1.user_id NOT IN(
		SELECT u2.user_id
		FROM [User] u2 JOIN [Alert] a ON u2.user_id=a.user_id
	);

	-- List red users with positive test results
	SELECT DISTINCT firstname + ' ' + lastname AS [User]
	FROM [User]
	WHERE covid_status='RED' AND last_test_result=1;

	-- List all active restrictions
	SELECT * FROM [Restriction]
	WHERE d_date >= getDate() AND s_date <= getDate();

	-- List red users having unread alerts
	SELECT DISTINCT firstname + ' ' + lastname AS [User]
	FROM [User] u JOIN [Alert] a ON u.user_id=a.user_id
	WHERE a.is_read=0

	select * from [Alert]

	select * from [User]