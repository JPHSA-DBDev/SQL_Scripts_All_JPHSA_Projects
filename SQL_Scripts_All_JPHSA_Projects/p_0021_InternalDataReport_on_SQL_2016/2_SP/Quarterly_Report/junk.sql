/****** Script for SelectTopNRows command from SSMS  ******/

WITH CTE_4minus5
AS 
(
SELECT  
      [LineNumber]
      ,[Source]
      ,[Line_Title]
      ,[DateTime_Created]
      ,(SELECT     'TheCalculation' = 
			 CASE 
						WHEN [LineNumber] = 4 
						   THEN [Result] 
						WHEN [LineNumber] = 5 
						   THEN -[Result] 
						ELSE 0 
				   END) as [Result] 	  	  		  
	  
      ,[YYYY_MM]

  FROM [Success].[dbo].[zzz_p0021_21_IDR_part_B_and_C]
    WHERE 
		[LineNumber] = 4
		or 
		[LineNumber] = 5
)

--SELECT * FROM CTE_4minus5


SELECT DISTINCT
      SUM([Result]) OVER(PARTITION BY [YYYY_MM]) AS RESULT
      ,[YYYY_MM]
FROM CTE_4minus5
Order by YYYY_MM
