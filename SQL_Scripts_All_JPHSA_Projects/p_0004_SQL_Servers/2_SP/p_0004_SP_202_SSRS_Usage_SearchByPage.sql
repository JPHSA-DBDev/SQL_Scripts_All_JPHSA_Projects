-- p_0004_SP_202_SSRS_Usage_SearchByPage.sql


use d1_IT
go


create Procedure p_0004_SP_202_SSRS_Usage_SearchByPage(
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



IF LEN(@SearchString) > 0 
		BEGIN

		--========================================================================

			SELECT 
				[UserName]
				,[ItemPath]
				,[Format]
				,[Parameters]
				,[ItemAction]
				,[TimeStart]
				,[Status]
				,[RowCount]
				,[Name] as [NameOfReport]
				,[CreationDate]
				,[ModifiedDate]

			FROM [d1_IT].[dbo].[p_0004_vw_003_SSRS_ExecutionLog3]
			WHERE 
			  (		
					(
							([ItemPath] like '%' +  @SearchString + '%') 	
					)	
					AND
					(
						([TimeStart] >= @BeginDate)
						AND
						([TimeStart] <=  DATEADD(dd, 1, @EndDate))
					)									
					
			   ) 
			order by timestart desc
			
			print 'LEN(@SearchString) > 0'
		--========================================================================
		END
ELSE
		BEGIN

		--========================================================================

			SELECT 
				[UserName]
				,[ItemPath]
				,[Format]
				,[Parameters]
				,[ItemAction]
				,[TimeStart]
				,[Status]
				,[RowCount]
				,[Name] as [NameOfReport]
				,[CreationDate]
				,[ModifiedDate]

			FROM [d1_IT].[dbo].[p_0004_vw_003_SSRS_ExecutionLog3]
			WHERE 
			  (		
					(
						([TimeStart] >= @BeginDate)
						AND
						([TimeStart] <=  DATEADD(dd, 1, @EndDate))
					)									
					
			   ) 
			order by timestart desc 
			
			
			print 'NOT: LEN(@SearchString) > 0'
		--========================================================================
		END		
GO
