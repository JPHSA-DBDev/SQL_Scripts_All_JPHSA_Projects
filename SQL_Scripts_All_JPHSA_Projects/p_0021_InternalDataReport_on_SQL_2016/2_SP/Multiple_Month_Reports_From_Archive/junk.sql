




USE [Success];
GO

IF OBJECT_ID('dbo.zzz_JUNK_MultiMonth') IS NOT NULL
    DROP TABLE dbo.zzz_JUNK_MultiMonth
----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------

SELECT @LineNumber = 67
SELECT @Source = '[A-021]'
SELECT @Title = '[Total Unduplicated Individuals Served (JeffCare)]'
;



--The first CTE is required b/c DISTINCT and SELECT OVER do  not play nice together
;WITH cte_Line_67_a
AS
(
	SELECT distinct
		  t3.[Patient_No],
		  [YYYY_MM]

	  FROM [Success].[dbo].[zzz_p0021_24_MultipleMonths_for_Analysis_of_Part_A] t3
	  --Where (
			--	upper(rtrim(ltrim(t3.TYPE))) = 'BH'
			----	--AND
			----	--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
			----	--AND 
			----	--t3.Adult = 1
			--)
)

select * 
into zzz_JUNK_MultiMonth
from cte_Line_67_a
order by Patient_No, YYYY_MM

select top(10) *
 from zzz_JUNK_MultiMonth

----\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--cte_Line_67_b
--AS
--(
--	SELECT 
--		  [YYYY_MM]
--		  , Count(*) OVER(PARTITION BY [YYYY_MM]) as Result

--	  FROM cte_Line_67_a
--)

----INSERT INTO [Success].[dbo].[zzz_p0021_25_MultipleMonths_IDR_part_A_results] 
----		(
----		[LineNumber],
----		[Source],
----		[Line_Title],
----		[YYYY_MM],
----		[Result]
----		)

--SELECT DISTINCT
--			@LineNumber as [LineNumber]
--			,@Source as [Source]
--			,@Title as [Title]
--			,YYYY_MM
--			,[Result]
--FROM cte_Line_67_b
--order by YYYY_MM