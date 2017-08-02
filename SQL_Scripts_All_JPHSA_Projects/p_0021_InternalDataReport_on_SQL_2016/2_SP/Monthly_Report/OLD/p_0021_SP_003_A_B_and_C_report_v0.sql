--p_0021_SP_003_A_B_and_C_report_v0.sql
/*
	************************************************************************************
	Description: This deletes and creates table [zzz_p0021_5_A_B_C_IDR_Report]

	Created: 03/14/2017
	By: glenn garson
	************************************************************************************
*/
USE Success
GO

IF OBJECT_ID('dbo.zzz_p0021_5_A_B_C_IDR_Report') IS NOT NULL
    DROP TABLE dbo.zzz_p0021_5_A_B_C_IDR_Report
--==============================================================

;WITH CTE_A_B_C
AS
(
	SELECT 
			[LineNumber],
			[Source],
			[Line_Title],
			[Result]
	FROM zzz_p0021_1_IDR_part_A_results

	UNION ALL

	SELECT 
			[LineNumber],
			[Source],
			[Line_Title],
			[Result]
	FROM zzz_p0021_1_IDR_part_B_and_C

)
SELECT * FROM CTE_A_B_C
ORDER BY [LineNumber]


