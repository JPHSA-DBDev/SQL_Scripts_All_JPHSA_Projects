--p_0009_REP_008__d4_IIS_Logs__search_IIS_Logs_CONTACTS.sql

/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 3/30/2017
	By: glenn garson
	************************************************************************************
*/


use d1_IT
go

------================================================	
--DECLARE @BeginDate date
--SELECT @BeginDate = '02-08-2017'

--DECLARE @EndDate date
--SELECT @EndDate = '03-30-2017'

--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''		


------================================================


create Procedure p_0009_REP_008__d4_IIS_Logs__search_IIS_Logs_CONTACTS(
	@BeginDate as date,
	@EndDate as date,
	@SearchString as NVARCHAR(25)
	)

	as
	
-- START DEBUGGING SECTION -------------------	
	

	PRINT 'Input @BeginDate: ' + LEFT(CONVERT(VARCHAR, @BeginDate, 120), 10) 
	PRINT 'Input @EndDate: ' + LEFT(CONVERT(VARCHAR, @EndDate, 120), 10)
	PRINT '1] Input @SearchString: [' + @SearchString + ']'
	
	-- Get rid of any spaces the user may have left in there:
	select @SearchString = LTRIM(RTRIM(@SearchString))
	PRINT '2] Input @SearchString: [' + @SearchString + ']'
-- END DEBUGGING SECTION -------------------	


SELECT TOP(1000)
      [LogFilename]
      ,[LogRow]
      ,[EntryTime]
      ,[SiteName]
      ,[Client_IP]
      ,[csUsername]
      ,[ServerIpAddress]
      ,[sPort]
      ,[csMethod]
      ,[csUriStem]
      ,[csUriQuery]
      ,[scStatus]
      ,[scSubstatus]
      ,[scWin32Status]
      ,[BytesFromServerToClient]
      ,[BytesFromClientToServer]
      ,[timeTaken]
      ,[csUserAgent]
      ,[csReferer]
  FROM [d4_IIS_Logs].[dbo].[T002_W3SVC2_FE_Contacts]

  WHERE
					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([LogFilename]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([Client_IP]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([csUriStem]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([csUserAgent]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([csReferer]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([csUsername]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						)
					)
					AND
					(
						([EntryTime] >= @BeginDate)
						AND
						([EntryTime] <=  DATEADD(dd, 1, @EndDate))
					)
					AND 
					csUriStem   NOT IN (
											--'/',
											'/bkg-gry.jpg',
											'/browserconfig.xml',
											'/bundles/bootstrap',
											'/bundles/jquery',
											'/bundles/modernizr',
											'/Content/css',
											'/favicon.ico',
											'/iis-8.png',
											'/msweb-brand.png',
											'/ws8-brand.png'
																	)
						and  
						[csUserAgent]  not like  '%rubyforge.org%'
						AND 
						[csUriStem] NOT LIKE '%.js'
						AND
						[csUriStem] NOT LIKE '%.gif'
						AND
						[csUriStem] NOT LIKE '%.css'
						AND
						[csUriStem] NOT LIKE '%.woff2'
						AND
						[csUriStem] NOT LIKE '%.woff'
						AND
						[csUriStem] NOT LIKE '%.eot'
	ORDER BY [EntryTime] desc