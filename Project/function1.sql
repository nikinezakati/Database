CREATE FUNCTION UserAlertsCount(@user_id numeric(10,0))
RETURNS TABLE
RETURN
    SELECT u.firstname , u.lastname , COUNT(*) AS 'alerts_count'
    FROM [User] u INNER JOIN  Alert a ON a.user_id = u.user_id
    WHERE u.user_id = @user_id
    GROUP BY u.firstname , u.lastname
;