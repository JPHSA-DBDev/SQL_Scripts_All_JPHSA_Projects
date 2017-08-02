
;WITH CTE_14plus17plus46plus49
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 14 
						   THEN [Result] 
						WHEN [LineNumber] = 17 
						   THEN [Result] 
						WHEN [LineNumber] = 46 
						   THEN [Result] 
						WHEN [LineNumber] = 49 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 14
		or 
		[LineNumber] = 17
		or 
		[LineNumber] = 46
		or 
		[LineNumber] = 49
)


,CTE_14plus17plus46plus49_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_14plus17plus46plus49

)


INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
		(
		[LineNumber],
		[Source],
		[Line_Title],
		[YYYY_MM],
		[Result]
		)
SELECT DISTINCT
			@LineNumber as [LineNumber]
			,@Source as [Source]
			,@Title as [Title]
			,[YYYY_MM]
			,[Result]
FROM CTE_14plus17plus46plus49_RESULTS 
ORDER BY YYYY_MM