--p_0021_SP_005_MultipleMonths_A_B_and_C_report_v0.sql
/*
	************************************************************************************
	YOU Have to go down to the last SELECT/PIVOT statement to hardcode the YYYY_MM columns


	Description: This deletes and creates table [zzz_p0021_5_A_B_C_IDR_Report]

	Created: 03/14/2017
	Modified: 4/27/2017 output to  [zzz_p0021_1_IDR_MultiMonthly_part_B_and_C_Results]
	By: glenn garson
	************************************************************************************
*/
USE Success
GO

IF OBJECT_ID('dbo.zzz_p0021_27_MultiMonth_A_B_C_IDR_Results') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_27_MultiMonth_A_B_C_IDR_Results
--==============================================================

;WITH CTE_A_B_C
AS
(
	SELECT 
			[LineNumber],
			[Source],
			[Line_Title],
			[Result],
			YYYY_MM
	FROM zzz_p0021_25_MultipleMonths_IDR_part_A_results

	UNION ALL

	SELECT 
			[LineNumber],
			[Source],
			[Line_Title],
			[Result],
			YYYY_MM
	FROM zzz_p0021_21_IDR_MultiMonth_part_B_and_C_RESULTS

)
SELECT * 
into dbo.zzz_p0021_27_MultiMonth_A_B_C_IDR_Results
FROM CTE_A_B_C
ORDER BY [LineNumber]

--This shows you the results
Select * from zzz_p0021_27_MultiMonth_A_B_C_IDR_Results

--This is for cutting and Pasting
SELECT LineNumber, [2016_07], [2016_08]
  FROM
(
  SELECT LineNumber, YYYY_MM, Result
    FROM zzz_p0021_27_MultiMonth_A_B_C_IDR_Results
) s
PIVOT
(
  MAX(Result) FOR YYYY_MM IN ([2016_07], [2016_08])
) p


