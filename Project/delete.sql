--Delete----------------------------------------------------------------------------------
	-- Delete restrictions with passed due_date
	DELETE FROM [Restriction] WHERE d_date < getDate();

	-- Delete records created more than a year before
	DELETE FROM [Restriction] WHERE d_date < getDate();

	-- Delete alerts that are read
	DELETE FROM [Alert] WHERE is_read=1;
