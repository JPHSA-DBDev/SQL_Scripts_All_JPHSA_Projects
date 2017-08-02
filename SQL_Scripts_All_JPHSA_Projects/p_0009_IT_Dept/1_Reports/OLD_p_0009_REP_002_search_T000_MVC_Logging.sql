--p_0009_REP_002_search_T000_MVC_Logging.sql

/*
	************************************************************************************
	NOTE: 
	Uses: 
	Created: 09/1/2016
	By: glenn garson
	************************************************************************************
*/

use d1_IT
go

----================================================	
DECLARE @BeginDate date
SELECT @BeginDate = '02-08-2017'

DECLARE @EndDate date
SELECT @EndDate = '02-11-2017'


DECLARE @SearchString nvarchar(100)
DECLARE @use_ApplicationAssemblyName as BIT
DECLARE @use_Browser as BIT
DECLARE @use_Create_Update_Delete_Read as BIT
DECLARE @use_Note as BIT
DECLARE @use_UserLogIn as BIT
DECLARE @use_IP as BIT
DECLARE @use_ComputerName as BIT


SET @SearchString = ' '		
SET @use_ApplicationAssemblyName = 0	
SET @use_Browser = 0
SET @use_Create_Update_Delete_Read = 0	
SET @use_Note = 0
SET @use_UserLogIn = 0
SET @use_IP = 0
SET @use_ComputerName = 0

----================================================
  
  
--create Procedure p_0009_REP_002_search_T000_MVC_Logging(
		 --@BeginDate date,
		 --@EndDate,
--		 @SearchString as NVARCHAR(100),
--         @use_ApplicationAssemblyName as BIT,	
--         @use_Browser as BIT,
--         @use_Create_Update_Delete_Read as BIT,
--         @use_Note as BIT,
--         @use_UserLogIn as BIT,
--         @use_IP as BIT,
--         @use_ComputerName as BIT                 	
--	)

--	as
	
-- START DEBUGGING SECTION -------------------		
	-- Get rid of any spaces the user may have left in there:
	select @SearchString = LTRIM(RTRIM(@SearchString))
	PRINT '2] Input @SearchString: [' + @SearchString + ']'
-- END DEBUGGING SECTION -------------------		

IF (LEN(@SearchString) > 0) OR (@SearchString IS NOT NULL)			--Must also set the PARM to allow Nulls in SSRS

		BEGIN
				--=============WITH THE WHERE STATEMENT===================================


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

  FROM [d1_IT].[dbo].[T000_MVC_Logging]
			WHERE 
			  (		
					(
							(
								(upper(rtrim(ltrim([ApplicationAssemblyName]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
								AND
								(@use_ApplicationAssemblyName = 1)
							)		
							OR 
							(
								(
									(upper(rtrim(ltrim([Browser]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%')				
								)
								AND
								(@use_Browser = 1)
							)				  
							OR 
								(
									(upper(rtrim(ltrim([Create_Update_Delete_Read]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 
									AND
									(@use_Create_Update_Delete_Read = 1)								
								)
							OR  (
									(upper(rtrim(ltrim([Note]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
									AND
									(@use_Note = 1)									
								)
							OR  (
									(upper(rtrim(ltrim([UserLogIn]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
									AND
									(@use_UserLogIn = 1)									
								)	
							OR  (
									(upper(rtrim(ltrim([IP]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
									AND
									(@use_IP = 1)									
								)
							OR  (
									(upper(rtrim(ltrim([ComputerName]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
									AND
									(@use_ComputerName = 1)									
								)																												

						)	
						AND
						(
							([DateTimeCreated] >= @BeginDate)
							AND
							([DateTimeCreated] <=  DATEADD(dd, 1, @EndDate))
						)
									
					
			  ) 
			ORDER BY [DateTimeCreated] desc
		--========================================================================
		END
ELSE
		BEGIN

				--=============WITH THE WHERE STATEMENT===================================


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

  FROM [d1_IT].[dbo].[T000_MVC_Logging]
			WHERE 
			  (		
					--(
					--		(
					--			(upper(rtrim(ltrim([ApplicationAssemblyName]))) like '%' +  UPPER(RTRIM(LTRIM(@SearchString))) + '%')
					--			AND
					--			(@use_ApplicationAssemblyName = 1)
					--		)		
					--		OR 
					--		(
					--			(
					--				(upper(rtrim(ltrim([Browser]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%')				
					--			)
					--			AND
					--			(@use_Browser = 1)
					--		)				  
					--		OR 
					--			(
					--				(upper(rtrim(ltrim([Create_Update_Delete_Read]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 
					--				AND
					--				(@use_Create_Update_Delete_Read = 1)								
					--			)
					--		OR  (
					--				(upper(rtrim(ltrim([Note]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
					--				AND
					--				(@use_Note = 1)									
					--			)
					--		OR  (
					--				(upper(rtrim(ltrim([UserLogIn]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
					--				AND
					--				(@use_UserLogIn = 1)									
					--			)	
					--		OR  (
					--				(upper(rtrim(ltrim([IP]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
					--				AND
					--				(@use_IP = 1)									
					--			)
					--		OR  (
					--				(upper(rtrim(ltrim([ComputerName]))) like '%' +  (upper(rtrim(ltrim(@SearchString)))) + '%') 	
					--				AND
					--				(@use_ComputerName = 1)									
					--			)																												

					--	)	
					--	AND

						(
							([DateTimeCreated] >= @BeginDate)
							AND
							([DateTimeCreated] <=  DATEADD(dd, 1, @EndDate))
						)
									
					
			  ) 
			ORDER BY [DateTimeCreated] desc
		--========================================================================
		END		
GO