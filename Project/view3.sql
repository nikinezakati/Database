CREATE VIEW [3+ Alert Users] AS
SELECT u.firstname , u.lastname , COUNT(*) AS alert_count 
FROM [User] u inner join [Alert] a on a.user_id = u.user_id
GROUP BY u.firstname, u.lastname
WHERE alert_count = 3;
