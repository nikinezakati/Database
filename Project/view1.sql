CREATE VIEW [Yellow Users] AS
SELECT firstname, lastname
FROM [User]
WHERE covid_status = 'YELLOW';
