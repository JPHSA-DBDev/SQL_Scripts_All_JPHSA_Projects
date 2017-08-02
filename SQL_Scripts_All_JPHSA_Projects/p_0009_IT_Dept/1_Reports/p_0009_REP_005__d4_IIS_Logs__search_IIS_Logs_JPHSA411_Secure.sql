--p_0009_REP_005__d4_IIS_Logs__search_IIS_Logs_JPHSA411_Secure.sql

/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 3/23/2017
	By: glenn garson
	************************************************************************************
*/


use d1_IT
go

------================================================	
--DECLARE @BeginDate date
--SELECT @BeginDate = '02-08-2017'

--DECLARE @EndDate date
--SELECT @EndDate = '02-11-2017'

--DECLARE @SearchString nvarchar(100)
--SET @SearchString = ''		


------================================================


alter Procedure p_0009_REP_005__d4_IIS_Logs__search_IIS_Logs_JPHSA411_Secure(
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
  FROM [d4_IIS_Logs].[dbo].[T004_W3SVC4_JPHSA_Secure]

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
	ORDER BY [EntryTime] desc