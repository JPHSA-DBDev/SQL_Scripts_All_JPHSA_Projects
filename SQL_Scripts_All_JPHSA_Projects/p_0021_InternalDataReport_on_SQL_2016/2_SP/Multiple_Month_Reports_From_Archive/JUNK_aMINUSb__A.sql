--JUNK_aMINUSb__A.sql


;WITH CTE_67minus68
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 67
						   THEN [Result] 
						WHEN [LineNumber] = 68 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 67
		or 
		[LineNumber] = 68
)

--SELECT * FROM CTE_67minus68

,CTE_67minus68_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_67minus68

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
FROM CTE_67minus68_RESULTS 
ORDER BY YYYY_MM

