
;WITH CTE_38minus39
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 38 
						   THEN [Result] 
						WHEN [LineNumber] = 39 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 38
		or 
		[LineNumber] = 39
)

--SELECT * FROM CTE_38minus39

,CTE_38minus39_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_38minus39

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
FROM CTE_38minus39_RESULTS 
ORDER BY YYYY_MM

