
;WITH CTE_36plus39
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 36 
						   THEN [Result] 
						WHEN [LineNumber] = 39 
						   THEN [Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 36
		or 
		[LineNumber] = 39
)


,CTE_36plus39_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_36plus39

)


INSERT INTO [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C] 
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
FROM CTE_36plus39_RESULTS 
ORDER BY YYYY_MM