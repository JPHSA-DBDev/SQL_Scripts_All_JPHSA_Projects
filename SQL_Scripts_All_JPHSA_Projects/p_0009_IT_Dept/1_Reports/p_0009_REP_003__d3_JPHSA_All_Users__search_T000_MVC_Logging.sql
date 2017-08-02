--p_0009_REP_003__d3_JPHSA_All_Users__search_T000_MVC_Logging.sql

/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 2/10/2017
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


create Procedure p_0009_REP_003__d3_JPHSA_All_Users__search_T000_MVC_Logging(
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


SELECT TOP (1000) 
	   [T000_PK]
      ,[ApplicationAssemblyName]
      ,[Browser]
      ,[Create_Update_Delete_Read]
      ,[DateTimeCreated]
      ,[Note]
      ,[UserLogIn]
      ,[IP]
      ,[ComputerName]

  FROM [d3_JPHSA_All_Users].[dbo].[T000_MVC_Logging]
  WHERE
					(
						(
							(LEN(@SearchString) = 0) 
							OR 
							(@SearchString IS NULL)							
						)
						OR
						(
								(RTRIM(LTRIM(UPPER([ApplicationAssemblyName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')		
								OR (RTRIM(LTRIM(UPPER([Browser]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%')			
								OR (RTRIM(LTRIM(UPPER([Create_Update_Delete_Read]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([Note]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([UserLogIn]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([IP]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
								OR (RTRIM(LTRIM(UPPER([ComputerName]))) like '%' +  RTRIM(LTRIM(UPPER(@SearchString))) + '%' )	
						)
					)
					AND
					(
						([DateTimeCreated] >= @BeginDate)
						AND
						([DateTimeCreated] <=  DATEADD(dd, 1, @EndDate))
					)
	ORDER BY [DateTimeCreated] desc