


USE [Success];
GO

IF OBJECT_ID('dbo.zzz_JUNK_Month') IS NOT NULL
    DROP TABLE dbo.zzz_JUNK_Month
----------------------- Local Variables
   DECLARE @LineNumber int
   DECLARE @Source nvarchar(100)
   DECLARE @Title nvarchar(255)
----------------------------------------

--Line: [67] , Source: [A-021] , ______________________________ Description: [Total Unduplicated Individuals Served (JeffCare)]  ,  Bill_Provider_Specialty [FQHC - PSYCHIATRY. PSYCHIATRY]

SELECT @LineNumber = 67
SELECT @Source = '[A-021]'
SELECT @Title = '[Total Unduplicated Individuals Served (JeffCare)]'
;

WITH cte_Line_67
AS
(
	SELECT distinct
		  --t3.[LOC],
		  --t3.[Bill_Provider_Name],
		  t3.[Patient_No]
		  --t3.svc,
		  --t3.[Check-In_Day]

	  FROM [Success].[dbo].[zzz_p0021_4_for_Analysis_of_Part_A] t3
	  --Where (
			--	upper(rtrim(ltrim(t3.TYPE))) = 'BH'
			--	--AND
			--	--upper(rtrim(ltrim(t3.[LOC]))) = 'WJ'
			--	AND 
			--	t3.Adult = 1
			--)
)


select Patient_No, '2016_07' as YYYY_MM
into zzz_JUNK_Month
from cte_Line_67
order by Patient_No

select top(10) *
 from zzz_JUNK_Month



--SELECT * 
--From cte_Line_14

--INSERT INTO [Success].[dbo].[zzz_p0021_1_IDR_part_A_results] 
--		(
--		[LineNumber],
--		[Source],
--		[Line_Title],
--		[Result]
--		)
--VALUES
--		(
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_67)
--		)




--SELECT
--			@LineNumber 
--			,@Source
--			,@Title 
--			, (SELECT Count(*) FROM cte_Line_67)