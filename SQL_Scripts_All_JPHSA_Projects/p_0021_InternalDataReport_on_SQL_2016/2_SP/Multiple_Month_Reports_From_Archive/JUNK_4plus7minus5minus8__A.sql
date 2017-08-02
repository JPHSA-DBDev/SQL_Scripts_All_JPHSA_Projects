--JUNK_4plus7minus5minus8__A.sql


;WITH CTE_46plus49minus47minus50
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 46 
						   THEN [Result] 
						WHEN [LineNumber] = 49 
						   THEN [Result] 
						WHEN [LineNumber] = 47 
						   THEN -[Result] 
						WHEN [LineNumber] = 50 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results]
    WHERE 
		[LineNumber] = 46
		or 
		[LineNumber] = 49
		or 
		[LineNumber] = 47
		or 
		[LineNumber] = 50
)


,CTE_46plus49minus47minus50_RESULTS
AS
(
SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_46plus49minus47minus50

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
FROM CTE_46plus49minus47minus50_RESULTS 
ORDER BY YYYY_MM