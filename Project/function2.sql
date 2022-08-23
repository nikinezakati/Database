CREATE FUNCTION PlaceRecordsCount(@p_name NVARCHAR(50))
RETURNS TABLE
RETURN
    SELECT p.p_name , p.p_address , COUNT(*) AS 'records_count'
    FROM [Place] p INNER JOIN  Record r ON r.r_name = p.p_name
    WHERE p.p_name = @p_name
    GROUP BY p.p_name , p.p_address
;