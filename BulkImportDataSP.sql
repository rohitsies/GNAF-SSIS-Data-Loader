create procedure ImportData
@filePath nvarchar(1000)
AS
BEGIN
DECLARE @tableName nvarchar(500)
DECLARE @bulkinsert NVARCHAR(2000)
SET @tableName=REVERSE(LEFT(REVERSE(@filePath),CHARINDEX('\', REVERSE(@filePath), 1) - 1)) 
SET @tableName=REPLACE(@tableName,'.psv','')
SET @tableName=REPLACE(@tableName,'_psv','')
SET @tableName=REPLACE(@tableName,'Authority_Code_','')
SET @tableName=REPLACE(@tableName,'ACT_','')
SET @tableName=REPLACE(@tableName,'NSW_','')
SET @tableName=REPLACE(@tableName,'NT_','')
SET @tableName=REPLACE(@tableName,'OT_','')
SET @tableName=REPLACE(@tableName,'QLD_','')
SET @tableName=REPLACE(@tableName,'SA_','')
SET @tableName=REPLACE(@tableName,'TAS_','')
SET @tableName=REPLACE(@tableName,'VIC_','')
SET @tableName=REPLACE(@tableName,'WA_','')

SET @bulkinsert = 
       N'BULK INSERT '+@tableName+' FROM ''' + 
       @filepath + 
       N''' WITH (FIRSTROW = 2, FIELDTERMINATOR = ''|'', ROWTERMINATOR = ''\n'')'
EXEC sp_executesql @bulkinsert
END