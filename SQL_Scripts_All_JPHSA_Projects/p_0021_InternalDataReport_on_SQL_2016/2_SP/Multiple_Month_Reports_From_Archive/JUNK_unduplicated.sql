
--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_67_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  Where xxxxxx
),

cte_Line_67_b
AS
(
	SELECT 
		  [YYYY_MM]
		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

	  FROM cte_Line_67_a
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
			,YYYY_MM
			,[Result]
FROM cte_Line_67_b
order by YYYY_MM
